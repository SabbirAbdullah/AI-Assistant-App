import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/ai_assistant_bloc.dart';
import '../bloc/ai_assistant_event.dart';
import '../bloc/ai_assistant_state.dart';
import '../model/chat_massage_model.dart';
import '../model/voice_assistant_service.dart'; // Update with actual path

import 'dart:async';
     // Replace with your ChatMessage model import

class VoiceAssistantPage extends StatefulWidget {
  const VoiceAssistantPage({Key? key}) : super(key: key);

  @override
  State<VoiceAssistantPage> createState() => _VoiceAssistantPageState();
}

class _VoiceAssistantPageState extends State<VoiceAssistantPage> {
  final VoiceAssistantService _voiceService = VoiceAssistantService();

  bool _isListening = false;
  bool _isBangla = false; // language flag, false = English, true = Bangla

  final List<ChatMessage> _messages = [];

  StreamSubscription? _blocSubscription;

  @override
  void initState() {
    super.initState();
    _voiceService.initSpeech().then((_) {
      _startListening();
    });

    // Listen to AiChatBloc for AI response updates
    _blocSubscription = context.read<AiChatBloc>().stream.listen((state) {
      if (state is AiChatSuccess && state.messages.isNotEmpty) {
        final aiMsg = state.messages.last;
        // Only add if new AI message
        if (_messages.isEmpty || (_messages.last.content != aiMsg.content)) {
          setState(() {
            _messages.add(aiMsg);
          });
          _speak(aiMsg.content);
        }
      }
      if (state is AiChatError) {
        _speak("Sorry, something went wrong.");
      }
    });
  }

  @override
  void dispose() {
    _blocSubscription?.cancel();
    _voiceService.dispose();
    super.dispose();
  }

  void _addMessage({required String role, required String content}) {
    setState(() {
      _messages.add(ChatMessage(
        role: role,
        content: content,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _startListening() async {
    if (_isListening) return;

    setState(() => _isListening = true);

    await _voiceService.startListening((userQuery) async {
      setState(() => _isListening = false);
      _addMessage(role: 'user', content: userQuery);

      context.read<AiChatBloc>().add(SendUserMessage(userQuery));
    }, isBangla: _isBangla);
  }

  Future<void> _speak(String text) async {
    await _voiceService.speak(text, isBangla: _isBangla);
    // Do NOT restart listening after speaking, so no loop
  }

  void _toggleLanguage() {
    setState(() {
      _isBangla = !_isBangla;
    });
    // Optionally clear messages on language switch
    // setState(() => _messages.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Assistant'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            tooltip: _isBangla ? 'Switch to English' : 'Switch to Bangla',
            onPressed: _toggleLanguage,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[_messages.length - 1 - index];
                final isUser = msg.role == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[200] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(msg.content, style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(
                          "${msg.timestamp.hour}:${msg.timestamp.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Mic animation placeholder & button
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                // Mic/waveform animation placeholder
                Icon(
                  Icons.mic,
                  size: 64,
                  color: _isListening ? Colors.red : Colors.grey,
                ),
                const SizedBox(height: 12),
                Text(_isListening ? 'Listening...' : 'Tap mic to start listening'),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  icon: Icon(_isListening ? Icons.stop : Icons.mic),
                  label: Text(_isListening ? 'Stop Listening' : 'Start Listening'),
                  onPressed: () {
                    if (_isListening) {
                      _voiceService.stopListening();
                      setState(() => _isListening = false);
                    } else {
                      _startListening();
                    }
                  },
                ),
                const SizedBox(height: 12),
                Text('Current Language: ${_isBangla ? 'Bangla' : 'English'}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

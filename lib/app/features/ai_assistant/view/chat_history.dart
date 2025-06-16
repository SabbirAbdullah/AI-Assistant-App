import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/preference/preference_manager_impl.dart';
import '../bloc/ai_assistant_bloc.dart';
import '../bloc/ai_assistant_event.dart';

import '../model/chat_massage_model.dart';
import 'ai_assistant_view.dart';

class ChatHistoryPage extends StatelessWidget {
  final preferenceManager = PreferenceManagerImpl();

  Future<List<ChatSession>> _loadChatSessions() async {
    final sessions = await preferenceManager.getStringList('chat_sessions') ?? [];
    final decoded = sessions.map((e) => ChatSession.fromJson(jsonDecode(e))).toList();
    decoded.sort((a, b) => b.createdAt.compareTo(a.createdAt)); // Newest first
    return decoded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat History')),
      body: FutureBuilder<List<ChatSession>>(
        future: _loadChatSessions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final sessions = snapshot.data!;
          if (sessions.isEmpty) return const Center(child: Text('No chat history yet.'));

          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              final firstMsg = session.messages.firstOrNull?.content ?? '';
              final lastMsg = session.messages.lastOrNull?.content ?? '';

              return Card(
                child: ListTile(
                  title: Text("Chat on ${_formatDate(session.createdAt)}"),
                  subtitle: Text(
                    "$firstMsg\n...\n$lastMsg",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatSessionDetailPage(session: session),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return "${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
  }
}

class ChatSessionDetailPage extends StatelessWidget {
  final ChatSession session;

  const ChatSessionDetailPage({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Details')),
      body: ListView.builder(
        itemCount: session.messages.length,
        itemBuilder: (context, index) {
          final msg = session.messages[index];
          final isUser = msg.role == 'user';

          return Align(
            alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue[100] : Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(msg.content),
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
    );
  }
}


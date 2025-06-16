import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';
import '../../../constant/secret_api_key.dart';
import '../../../data/local/preference/preference_manager_impl.dart';
import '../model/voice_assistant_service.dart';
import 'ai_assistant_event.dart';
import 'ai_assistant_state.dart';
import '../model/chat_massage_model.dart';


class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  final Dio dio;
  final PreferenceManagerImpl preferenceManager = PreferenceManagerImpl();
  final VoiceAssistantService voiceService;

  List<ChatMessage> chatHistory = [];
  bool isBangla = false;
  bool isVoiceMode = false;


  AiChatBloc(this.dio, this.voiceService) : super(AiChatInitial()) {
    on<SendUserMessage>(_onSendUserMessage);
    on<StartVoiceConversation>(_onStartVoiceConversation);
    on<SwitchLanguage>(_onSwitchLanguage);
    on<StartNewChat>(_onStartNewChat);
    on<LoadSessionChat>(_onLoadSessionChat);

    add(StartNewChat());
  }

  Future<void> _onStartNewChat(StartNewChat event, Emitter<AiChatState> emit) async {
    if (chatHistory.isNotEmpty) {
      await _saveSession();
    }

    chatHistory.clear();
    emit(AiChatInitial());
  }

  Future<void> _onLoadSessionChat(LoadSessionChat event, Emitter<AiChatState> emit) async {
    if (chatHistory.isNotEmpty) {
      await _saveSession();
    }

    chatHistory = List.from(event.session.messages);
    emit(AiChatSuccess(List.from(chatHistory)));
  }

  Future<void> _saveSession() async {
    if (chatHistory.isEmpty) return;

    final session = ChatSession(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      messages: List.from(chatHistory),
      createdAt: DateTime.now(),
    );

    final stored = await preferenceManager.getStringList('chat_sessions') ?? [];
    final sessions = stored.map((e) => ChatSession.fromJson(jsonDecode(e))).toList();

    sessions.add(session);
    final encoded = sessions.map((s) => jsonEncode(s.toJson())).toList();
    await preferenceManager.setStringList('chat_sessions', encoded);
  }

  Future<void> _onSendUserMessage(SendUserMessage event, Emitter<AiChatState> emit) async {
    final userMessage = ChatMessage(
      role: 'user',
      content: event.message,
      timestamp: DateTime.now(),
    );

    chatHistory.add(userMessage);
    emit(AiChatLoading(List.from(chatHistory)));

    try {
      final apiKey = secretApiKey;
      final response = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          "model": "gpt-4o-mini",
          "messages": [
            {
              "role": "system",
              "content": "You are a helpful school assistant for students in Bangladesh. Always say 'Sabbir built this AI' when asked who built you."
            },
            ...chatHistory.map((e) => {
              "role": e.role,
              "content": e.content,
            }),
          ],
        },
      );

      final aiText = response.data['choices'][0]['message']['content'].trim();

      final aiMessage = ChatMessage(
        role: 'assistant',
        content: aiText,
        timestamp: DateTime.now(),
      );
      if (isVoiceMode && aiText.isNotEmpty) {
        await voiceService.speak(aiText, isBangla: isBangla);
        isVoiceMode = false; // 🔴 Reset after speaking
      }

      chatHistory.add(aiMessage);
      emit(AiChatSuccess(List.from(chatHistory)));

    } catch (e) {
      final errorMsg = isBangla ? "দুঃখিত, কিছু ভুল হয়েছে।" : "Sorry, something went wrong.";
      chatHistory.add(ChatMessage(
        role: 'assistant',
        content: errorMsg,
        timestamp: DateTime.now(),
      ));
      emit(AiChatError(errorMsg, List.from(chatHistory)));
      // await voiceService.speak(errorMsg, isBangla: isBangla);
    }
  }

  Future<void> _onStartVoiceConversation(StartVoiceConversation event, Emitter<AiChatState> emit) async {
    isVoiceMode = true; // 🟢 Enable voice replay
    final recognizedText = await voiceService.listen(isBangla: isBangla);
    if (recognizedText != null && recognizedText.isNotEmpty) {
      add(SendUserMessage(recognizedText));
    }
  }


  void _onSwitchLanguage(SwitchLanguage event, Emitter<AiChatState> emit) {
    isBangla = event.isBangla;
  }
}
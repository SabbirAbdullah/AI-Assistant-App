

import '../model/chat_massage_model.dart';
import '../model/chat_massage_model.dart';

abstract class AiChatState {}

class AiChatInitial extends AiChatState {}

class AiChatLoading extends AiChatState {
  final List<ChatMessage> messages;
  AiChatLoading(this.messages);
}

class AiChatSuccess extends AiChatState {
  final List<ChatMessage> messages;
  AiChatSuccess(this.messages);
}

class AiChatError extends AiChatState {
  final String error;
  final List<ChatMessage> messages;
  AiChatError(this.error, this.messages);
}

// abstract class AiChatState {
//   final List<ChatMessage> messages;
//   AiChatState(this.messages);
// }
//
// class AiChatInitial extends AiChatState {
//   AiChatInitial() : super([]);
// }
//
// class AiChatLoading extends AiChatState {
//   AiChatLoading(List<ChatMessage> messages) : super(messages);
// }
//
// class AiChatSuccess extends AiChatState {
//   AiChatSuccess(List<ChatMessage> messages) : super(messages);
// }
//
// class AiChatError extends AiChatState {
//   final String error;
//   AiChatError(this.error, List<ChatMessage> messages) : super(messages);
// }
//
//
// class AiChatVoiceListening extends AiChatState {
//   AiChatVoiceListening(List<ChatMessage> messages) : super(messages);
// }
//
// class AiChatVoiceSpeaking extends AiChatState {
//   final String message;
//   AiChatVoiceSpeaking(List<ChatMessage> messages, this.message) : super(messages);
// }

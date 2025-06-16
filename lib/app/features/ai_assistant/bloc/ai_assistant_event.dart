
// EVENTS

import '../model/chat_massage_model.dart';

abstract class AiChatEvent {}

class SendUserMessage extends AiChatEvent {
  final String message;
  SendUserMessage(this.message);
}

class StartVoiceConversation extends AiChatEvent {}

class SwitchLanguage extends AiChatEvent {
  final bool isBangla;
  SwitchLanguage(this.isBangla);
}

class StartNewChat extends AiChatEvent {}

class LoadSessionChat extends AiChatEvent {
  final ChatSession session;
  LoadSessionChat(this.session);
}


// abstract class AiChatEvent {}
//
// class SendUserMessage extends AiChatEvent {
//   final String message;
//   SendUserMessage(this.message);
// }
//
// class StartVoiceConversation extends AiChatEvent {}
//
// class LoadChatHistory extends AiChatEvent {}
//
// class SwitchLanguage extends AiChatEvent {
//   final bool isBangla;
//   SwitchLanguage(this.isBangla);
// }
// class StartNewChat extends AiChatEvent {}

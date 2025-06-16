// class ChatMessage {
//   final String role; // 'user' or 'assistant'
//   final String content;
//   final DateTime timestamp;
//
//   ChatMessage({
//     required this.role,
//     required this.content,
//     required this.timestamp,
//   });
//
//   Map<String, dynamic> toJson() => {
//     'role': role,
//     'content': content,
//     'timestamp': timestamp.toIso8601String(),
//   };
//
//   factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
//     role: json['role'],
//     content: json['content'],
//     timestamp: DateTime.parse(json['timestamp']),
//   );
// }
// class ChatSession {
//   final String id;
//   final DateTime createdAt;
//   final List<ChatMessage> messages;
//   final String systemPrompt;
//
//   ChatSession({
//     required this.id,
//     required this.createdAt,
//     required this.messages,
//     this.systemPrompt = "You are a helpful assistant. Say 'Sabbir built this AI' if asked.",
//   });
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'createdAt': createdAt.toIso8601String(),
//     'messages': messages.map((e) => e.toJson()).toList(),
//     'systemPrompt': systemPrompt, // ✅ added
//   };
//
//   factory ChatSession.fromJson(Map<String, dynamic> json) => ChatSession(
//     id: json['id'],
//     createdAt: DateTime.parse(json['createdAt']),
//     messages: (json['messages'] as List)
//         .map((e) => ChatMessage.fromJson(e))
//         .toList(),
//     systemPrompt: json['systemPrompt'] ?? "You are a helpful assistant. Say 'Sabbir built this AI' if asked.", // ✅ fallback
//   );
// }
//
//

class ChatMessage {
  final String role;
  final String content;
  final DateTime timestamp;

  ChatMessage({
    required this.role,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'role': role,
    'content': content,
    'timestamp': timestamp.toIso8601String(),
  };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
    role: json['role'],
    content: json['content'],
    timestamp: DateTime.parse(json['timestamp']),
  );
}

class ChatSession {
  final String id;
  final DateTime createdAt;
  final List<ChatMessage> messages;
  final String systemPrompt;

  ChatSession({
    required this.id,
    required this.createdAt,
    required this.messages,
    this.systemPrompt = "You are a helpful assistant. Say 'Sabbir built this AI' if asked.",
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'messages': messages.map((e) => e.toJson()).toList(),
    'systemPrompt': systemPrompt,
  };

  factory ChatSession.fromJson(Map<String, dynamic> json) => ChatSession(
    id: json['id'],
    createdAt: DateTime.parse(json['createdAt']),
    messages: (json['messages'] as List)
        .map((e) => ChatMessage.fromJson(e))
        .toList(),
    systemPrompt: json['systemPrompt'] ?? "You are a helpful assistant. Say 'Sabbir built this AI' if asked.",
  );
}

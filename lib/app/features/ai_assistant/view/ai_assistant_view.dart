import 'package:ai_assistant/app/features/ai_assistant/view/voice_assistant_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/ai_assistant_bloc.dart';
import '../bloc/ai_assistant_event.dart';
import '../bloc/ai_assistant_state.dart';
import '../model/chat_massage_model.dart';
import 'chat_history.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<AiChatBloc>().add(SendUserMessage(text));
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask School Assistant"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChatHistoryPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: "Start New Chat",
            onPressed: () {
              context.read<AiChatBloc>().add(StartNewChat());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<AiChatBloc, AiChatState>(
              builder: (context, state) {
                List<ChatMessage> messages = [];
                if (state is AiChatSuccess || state is AiChatLoading || state is AiChatError) {
                  messages = (state as dynamic).messages;
                }

                return ListView.builder(
                  itemCount: messages.length + (state is AiChatLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= messages.length) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("AI is typing..."),
                      );
                    }

                    final msg = messages[index];
                    final isUser = msg.role == 'user';

                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(msg.content),
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
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: "Ask your question..."),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
        IconButton(icon: const Icon(Icons.mic), onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const VoiceAssistantPage(),
            ),
          );
        }),


        IconButton(icon: const Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
// class AiChatPage extends StatefulWidget {
//   const AiChatPage({super.key});
//
//   @override
//   State<AiChatPage> createState() => _AiChatPageState();
// }
//
// class _AiChatPageState extends State<AiChatPage> {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Ensure a new chat starts when the page loads
//     context.read<AiChatBloc>().add(StartNewChat());
//   }
//
//   void _sendMessage() {
//     final text = _controller.text.trim();
//     if (text.isNotEmpty) {
//       context.read<AiChatBloc>().add(SendUserMessage(text));
//       _controller.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: const Text("Ask Assistant")),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.history),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) =>  ChatHistoryPage()));
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.add),
//             tooltip: "Start New Chat",
//             onPressed: () {
//               context.read<AiChatBloc>().add(StartNewChat());
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: BlocBuilder<AiChatBloc, AiChatState>(
//               builder: (context, state) {
//                 List<ChatMessage> messages = [];
//                 if (state is AiChatSuccess ||
//                     state is AiChatLoading ||
//                     state is AiChatError) {
//                   messages = (state as dynamic).messages;
//                 }
//
//                 return ListView.builder(
//                   itemCount: messages.length + (state is AiChatLoading ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index >= messages.length) {
//                       return const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text("AI is typing..."),
//                       );
//                     }
//
//                     final msg = messages[index];
//                     final isUser = msg.role == 'user';
//
//                     return Align(
//                       alignment: isUser
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 4, horizontal: 8),
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color:
//                           isUser ? Colors.blue[100] : Colors.grey[300],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(msg.content),
//                             const SizedBox(height: 4),
//                             Text(
//                               "${msg.timestamp.hour}:${msg.timestamp.minute.toString().padLeft(2, '0')}",
//                               style: const TextStyle(
//                                   fontSize: 10, color: Colors.black54),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: "Ask your question...",
//                     ),
//                     onSubmitted: (_) => _sendMessage(),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.mic),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) =>
//                           const VoiceAssistantPage()),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//


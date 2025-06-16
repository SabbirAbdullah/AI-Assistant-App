import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ai_assistant/bloc/ai_assistant_bloc.dart';
import '../../ai_assistant/view/ai_assistant_view.dart';
import '../../ai_assistant/model/voice_assistant_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: const Text("Ai Assistant")),backgroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton.icon(
          style: ButtonStyle(
          ),
          icon: const Icon(Icons.chat,color: Colors.black87,),
          label: const Text("Ask AI Assistant",style: TextStyle(color: Colors.black87),),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (_) => BlocProvider(
              create: (context) => AiChatBloc(Dio(),  VoiceAssistantService(), ),
              child: AiChatPage(),
            ),
            ));
          },
        ),
      ),
    );
  }
}


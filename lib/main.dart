import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/features/ai_assistant/bloc/ai_assistant_bloc.dart';
import 'app/features/ai_assistant/model/voice_assistant_service.dart';
import 'app/features/home/view/home_view.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AiChatBloc>(
          create: (_) => AiChatBloc(Dio(), VoiceAssistantService(), ),
        ),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shikkhayan App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
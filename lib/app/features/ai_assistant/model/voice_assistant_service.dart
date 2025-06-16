import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:speech_to_text/speech_to_text.dart';

class VoiceAssistantService {
  final SpeechToText _speech = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();

  bool speechAvailable = false;
  bool get isSpeechAvailable => speechAvailable;

  Future<void> initSpeech() async {
    speechAvailable = await _speech.initialize();
  }

  /// Start listening and call [onResult] with recognized text.
  /// Pass `isBangla: true` for Bangla recognition, otherwise English.
  Future<void> startListening(Function(String recognizedText) onResult,
      {bool isBangla = false}) async {
    if (!speechAvailable) return;

    await _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          onResult(result.recognizedWords);
          stopListening();
        }
      },
      localeId: isBangla ? 'bn_BD' : 'en_US',
      listenMode: ListenMode.confirmation,
      cancelOnError: true,
      partialResults: false,
    );
  }
  Future<String?> listen({bool isBangla = false}) async {
    if (!speechAvailable) return null;

    final completer = Completer<String?>();

    await startListening((recognizedText) {
      if (!completer.isCompleted) {
        completer.complete(recognizedText);
      }
    }, isBangla: isBangla);

    return completer.future;
  }

  /// Stop listening
  void stopListening() {
    if (_speech.isListening) {
      _speech.stop();
    }
  }

  /// Speak the [text] using TTS, language Bangla or English
  Future<void> speak(String text, {bool isBangla = false}) async {
    await _flutterTts.setLanguage(isBangla ? 'bn-BD' : 'en-US');
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  /// Dispose resources
  void dispose() {
    _speech.stop();
    _flutterTts.stop();
  }
}


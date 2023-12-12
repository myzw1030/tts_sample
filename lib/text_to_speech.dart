import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  // FlutterTtsのインスタンスを作成
  static FlutterTts tts = FlutterTts();

  // テキストを音声に変換するための初期化処理
  static Future<void> initTTS() async {
    // 言語を日本語に設定
    await tts.setLanguage("ja-JP");
    // 速度を設定
    await tts.setSpeechRate(0.5);
    // 音量を設定
    await tts.setVolume(1);
    // ピッチを設定
    await tts.setPitch(1);
    // テキスト読み上げが完了するのを待機するかどうかを制御する
    await tts.awaitSpeakCompletion(true);

    tts.setStartHandler(() {
      print("TTS STARTED");
    });

    tts.setCompletionHandler(() {
      print("COMPLETED");
    });

    tts.setErrorHandler((message) {
      print(message);
    });
  }

  // テキストを音声に変換して再生する
  static Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      print(text);
      await tts.speak(text);
    }
  }

  static void dispose() {
    tts.stop();
  }
}

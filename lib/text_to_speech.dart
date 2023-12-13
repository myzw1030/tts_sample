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

    // テキストの読み上げが開始したときに呼び出される
    tts.setStartHandler(() {
      print("TTS STARTED");
    });

    // テキストの読み上げが完了したときに呼び出される
    tts.setCompletionHandler(() {
      print("COMPLETED");
    });

    // エラーが発生したときに呼び出される
    tts.setErrorHandler((message) {
      print(message);
    });
  }

  // テキストを音声に変換して再生する
  static Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      await tts.speak(text);
    }
  }

  // テキスト読み上げを停止
  static void dispose() {
    tts.stop();
  }
}

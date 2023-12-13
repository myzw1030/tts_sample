import 'package:flutter/material.dart';
import 'package:tts_sample/text_to_speech.dart';

void main() {
  // Flutterフレームワークの初期化
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // テキストフィールドのコントローラーを作成
  late TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // テキストを音声に変換するための初期化処理
    TextToSpeech.initTTS();
  }

  @override
  void dispose() {
    TextToSpeech.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // テキスト読み上げ
              TextToSpeech.speak(textController.text);
              // フォーカス解除
              primaryFocus?.unfocus();
            },
            child: const Text('Speak'),
          ),
        ],
      ),
    );
  }
}

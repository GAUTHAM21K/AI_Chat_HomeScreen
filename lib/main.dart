import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/feature/chat/presentation/screens/jiji_chat_screen.dart';

void main() {
  runApp(
    // ProviderScope is required for Riverpod to work
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn with Jiji',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4DB6AC)),
      ),
      home: const JijiChatScreen(),
    );
  }
}

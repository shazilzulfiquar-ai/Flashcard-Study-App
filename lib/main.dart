
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const StudyFlashcardApp());
}

class StudyFlashcardApp extends StatelessWidget {
  const StudyFlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Flashcard App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6554D9),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F7FF),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

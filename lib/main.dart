
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
      title: 'Flashcard Study App',
      home: const SplashScreen(),
    );
  }
}

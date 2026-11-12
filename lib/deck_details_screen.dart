import 'package:flutter/material.dart';
import 'flashcard_study_screen.dart';

class DeckDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> deck;

  const DeckDetailsScreen({
    super.key,
    required this.deck,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        title: const Text('Deck Details'),
        backgroundColor: const Color(0xFF6554D9),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: deck['color'] as Color,
                child: Icon(
                  deck['icon'] as IconData,
                  size: 45,
                  color: const Color(0xFF6554D9),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Text(
                deck['name'].toString(),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6554D9),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              deck['description'].toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),
            const Text(
              'Total Flashcards',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${deck['count']} Flashcards',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF6554D9),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6554D9),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlashcardStudyScreen(
                        subject: deck['name'].toString(),
                      ),
                    ),
                  );
                },
                child: const Text('Start Studying'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
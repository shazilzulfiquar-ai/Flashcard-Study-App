
import 'package:flutter/material.dart';

class FlashcardStudyScreen extends StatefulWidget {
  final String subject;

  const FlashcardStudyScreen({
    super.key,
    required this.subject,
  });

  @override
  State<FlashcardStudyScreen> createState() =>
      _FlashcardStudyScreenState();
}

class _FlashcardStudyScreenState
    extends State<FlashcardStudyScreen> {

  int currentIndex = 0;
  bool showAnswer = false;

  final List<Map<String, String>> flashcards = [
    {
      'question': 'What is Flutter?',
      'answer':
      'Flutter is a UI toolkit by Google for building applications.',
    },
    {
      'question': 'What is Dart?',
      'answer':
      'Dart is the programming language used by Flutter.',
    },
    {
      'question': 'What is a Widget?',
      'answer':
      'A widget is a basic building block of Flutter UI.',
    },
    {
      'question': 'What is Scaffold?',
      'answer':
      'Scaffold provides the basic visual structure of an app.',
    },
    {
      'question': 'What is MaterialApp?',
      'answer':
      'MaterialApp provides Material Design app features.',
    },
  ];

  void nextCard() {
    if (currentIndex < flashcards.length - 1) {
      setState(() {
        currentIndex++;
        showAnswer = false;
      });
    }
  }

  void previousCard() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        showAnswer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),

      appBar: AppBar(
        title: Text(widget.subject),
        backgroundColor: const Color(0xFF6554D9),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(22),

        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              'Study Time!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6554D9),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Card ${currentIndex + 1} of ${flashcards.length}',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 15),

            LinearProgressIndicator(
              value: (currentIndex + 1) / flashcards.length,
              color: const Color(0xFF6554D9),
              backgroundColor: const Color(0xFFE5DEFF),
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 45),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showAnswer = !showAnswer;
                  });
                },

                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6554D9),
                        Color(0xFF9278F5),
                      ],
                    ),

                    borderRadius: BorderRadius.circular(25),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  padding: const EdgeInsets.all(25),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Icon(
                        showAnswer
                            ? Icons.lightbulb
                            : Icons.help_outline,
                        color: Colors.white,
                        size: 50,
                      ),

                      const SizedBox(height: 25),

                      Text(
                        showAnswer ? 'ANSWER' : 'QUESTION',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        showAnswer
                            ? flashcards[currentIndex]['answer']!
                            : flashcards[currentIndex]['question']!,

                        textAlign: TextAlign.center,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        'Tap to flip the card',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: currentIndex == 0
                        ? null
                        : previousCard,

                    child: const Text('Previous'),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6554D9),
                      foregroundColor: Colors.white,
                    ),

                    onPressed: currentIndex == flashcards.length - 1
                        ? null
                        : nextCard,

                    child: Text(
                      currentIndex == flashcards.length - 1
                          ? 'Completed'
                          : 'Next Card',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

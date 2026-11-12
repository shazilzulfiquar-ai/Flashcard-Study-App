import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool quizCompleted = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which language is used in Flutter?',
      'options': ['Java', 'Dart', 'Python', 'C++'],
      'answer': 1,
    },
    {
      'question': 'Who developed Flutter?',
      'options': ['Microsoft', 'Apple', 'Google', 'Amazon'],
      'answer': 2,
    },
    {
      'question': 'What is a Flutter widget?',
      'options': [
        'Database',
        'Building block of UI',
        'Operating system',
        'Compiler'
      ],
      'answer': 1,
    },
    {
      'question': 'Which widget creates a scrollable list?',
      'options': [
        'Container',
        'Column',
        'ListView',
        'Center'
      ],
      'answer': 2,
    },
  ];

  void nextQuestion() {
    if (selectedAnswer == null) return;

    if (selectedAnswer == questions[currentQuestion]['answer']) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F7FF),
      appBar: AppBar(
        title: Text('Quick Quiz'),
        backgroundColor: Color(0xFF6554D9),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(22),
        child: quizCompleted
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.emoji_events,
                size: 90,
                color: Color(0xFF9278F5),
              ),
              SizedBox(height: 20),
              Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6554D9),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Your Score: $score / ${questions.length}',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: restartQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6554D9),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 15,
                  ),
                ),
                child: Text('Try Again'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Back to Home'),
              ),
            ],
          ),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Test Your Knowledge',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6554D9),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Question ${currentQuestion + 1} of ${questions.length}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
              color: Color(0xFF6554D9),
              backgroundColor: Color(0xFFE5DEFF),
              minHeight: 8,
            ),
            SizedBox(height: 35),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                questions[currentQuestion]['question'],
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25),
            ...List.generate(4, (index) {
              bool isSelected = selectedAnswer == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnswer = index;
                  });
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 14),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFFE5DEFF)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isSelected
                          ? Color(0xFF6554D9)
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: isSelected
                            ? Color(0xFF6554D9)
                            : Colors.grey.shade200,
                        child: Text(
                          String.fromCharCode(65 + index),
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          questions[currentQuestion]['options'][index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle,
                          color: Color(0xFF6554D9),
                        ),
                    ],
                  ),
                ),
              );
            }),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed:
                selectedAnswer == null ? null : nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6554D9),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  currentQuestion == questions.length - 1
                      ? 'Finish Quiz'
                      : 'Next Question',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
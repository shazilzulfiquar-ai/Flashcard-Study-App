
import 'package:flutter/material.dart';

class CreateDeckScreen extends StatefulWidget {
  const CreateDeckScreen({super.key});

  @override
  State<CreateDeckScreen> createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends State<CreateDeckScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  final List<Color> colors = [
    const Color(0xFFE5DEFF),
    const Color(0xFFDDF5E8),
    const Color(0xFFFFE8D9),
    const Color(0xFFDDEEFF),
    const Color(0xFFFFDDE8),
  ];

  int selectedColor = 0;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createDeck() {
    final name = nameController.text.trim();
    final description = descriptionController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a deck name.')),
      );
      return;
    }

    Navigator.pop(context, {
      'name': name,
      'description': description.isEmpty
          ? 'Start learning with this deck'
          : description,
      'color': colors[selectedColor],
      'icon': Icons.auto_stories_rounded,
      'count': 0,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Deck'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: colors[selectedColor],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.auto_stories_rounded,
                  size: 65,
                  color: Color(0xFF6554D9),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Deck Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'e.g. Computer Science',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'What will you learn in this deck?',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Choose Deck Color',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 14,
              children: List.generate(colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child: Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: colors[index],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedColor == index
                            ? const Color(0xFF6554D9)
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: selectedColor == index
                        ? const Icon(
                      Icons.check,
                      color: Color(0xFF6554D9),
                    )
                        : null,
                  ),
                );
              }),
            ),
            const SizedBox(height: 35),
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: createDeck,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6554D9),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Create Deck',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

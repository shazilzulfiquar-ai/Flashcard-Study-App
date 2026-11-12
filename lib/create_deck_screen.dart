import 'package:flutter/material.dart';

class CreateDeckScreen extends StatefulWidget {
  const CreateDeckScreen({super.key});

  @override
  State<CreateDeckScreen> createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends State<CreateDeckScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  int selectedColor = 0;

  final List<Color> colors = [
    const Color(0xFFE5DEFF),
    const Color(0xFFDDF5E8),
    const Color(0xFFFFE8D9),
    const Color(0xFFDDEEFF),
    const Color(0xFFFFDDE8),
  ];

  void createDeck() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter deck name')),
      );
      return;
    }

    Navigator.pop(context, {
      'name': nameController.text.trim(),
      'description': descriptionController.text.trim(),
      'color': colors[selectedColor],
      'count': 0,
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        title: const Text('Create New Deck'),
        backgroundColor: const Color(0xFF6554D9),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deck Name',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter deck name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Description',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter deck description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Choose Deck Color',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 15,
              children: List.generate(colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: colors[index],
                    child: selectedColor == index
                        ? const Icon(Icons.check, color: Colors.black)
                        : null,
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6554D9),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: createDeck,
                child: const Text('Create Deck'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
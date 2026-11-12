
import 'package:flutter/material.dart';
import 'create_deck_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> decks = [
    {
      'name': 'Computer Science',
      'description': 'Programming and algorithms',
      'color': const Color(0xFFE5DEFF),
      'icon': Icons.computer_rounded,
      'count': 12,
    },
    {
      'name': 'Mathematics',
      'description': 'Formulas and concepts',
      'color': const Color(0xFFDDF5E8),
      'icon': Icons.calculate_rounded,
      'count': 8,
    },
    {
      'name': 'English',
      'description': 'Vocabulary and grammar',
      'color': const Color(0xFFFFE8D9),
      'icon': Icons.menu_book_rounded,
      'count': 15,
    },
  ];

  Future<void> openCreateDeck() async {
    final deck = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateDeckScreen(),
      ),
    );

    if (deck != null) {
      setState(() {
        decks.add({
          ...deck,
          'icon': Icons.style_rounded,
        });
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredDecks = decks.where((deck) {
      return deck['name']
          .toString()
          .toLowerCase()
          .contains(searchController.text.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        title: const Text(
          'Study Flashcards',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF8F7FF),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Hello, Shazil! 👋',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ready to learn something new?',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: searchController,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search your decks...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6554D9),
                    Color(0xFF9278F5),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.auto_stories_rounded,
                    size: 38,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Continue Studying',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Keep practicing and reach your goals.',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Study Now'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Decks',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: openCreateDeck,
                  icon: const Icon(Icons.add),
                  label: const Text('New Deck'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (filteredDecks.isEmpty)
              const Center(child: Text('No decks found.')),
            ...filteredDecks.map((deck) {
              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: deck['color'] as Color,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        deck['icon'] as IconData,
                        color: const Color(0xFF6554D9),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            deck['name'].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            deck['description'].toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${deck['count']} flashcards',
                            style: const TextStyle(
                              color: Color(0xFF6554D9),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

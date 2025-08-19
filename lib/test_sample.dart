import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Entry point widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Quizzes',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Inter',
      ),
      home: const YourQuizzesScreen(),
    );
  }
}

/// Data model
class Quiz {
  final String title;
  final int totalQuizzes;
  final String iconAsset;
  final Color iconBackground;
  final int participants;

  const Quiz({
    required this.title,
    required this.totalQuizzes,
    required this.iconAsset,
    required this.iconBackground,
    required this.participants,
  });
}

/// Screen
class YourQuizzesScreen extends StatelessWidget {
  const YourQuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = [
      Quiz(
        title: 'Integers Quiz',
        totalQuizzes: 10,
        iconAsset: 'assets/icons/fx_2.png',
        iconBackground: Colors.blue.shade100,
        participants: 437,
      ),
      Quiz(
        title: 'General Knowledge',
        totalQuizzes: 6,
        iconAsset: 'assets/icons/general.png',
        iconBackground: Colors.pink.shade100,
        participants: 437,
      ),
      Quiz(
        title: 'Statistics Math Quiz',
        totalQuizzes: 12,
        iconAsset: 'assets/icons/stat.png',
        iconBackground: Colors.blue.shade100,
        participants: 437,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6EDE3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Quizzes',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: QuizCard(quiz: quizzes[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class QuizCard extends StatelessWidget {
  final Quiz quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            decoration: BoxDecoration(
              color: quiz.iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(quiz.iconAsset, width: 50, height: 50),
            ),
          ),
          const SizedBox(width: 12),
          // Title & details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quiz.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${quiz.totalQuizzes.toString().padLeft(2, '0')} Quizzes',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.pinkAccent,
                    ),
                    const SizedBox(width: 4),
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.tealAccent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '+${quiz.participants} People join',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Result button
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bar_chart, color: Colors.purple),
            label: const Text(
              'Result',
              style: TextStyle(color: Colors.purple),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', true),
            _buildNavItem(Icons.grid_view, 'Quizzes', false),
            const SizedBox(width: 48),
            _buildNavItem(Icons.bar_chart, 'Leaderboard', false),
            _buildNavItem(Icons.people, 'Friends', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? Colors.purple : Colors.grey),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.purple : Colors.grey,
          ),
        ),
      ],
    );
  }
}

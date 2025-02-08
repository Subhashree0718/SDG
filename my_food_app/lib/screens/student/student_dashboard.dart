import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'calorie_tracker.dart';
import 'chatbot_screen.dart';
import 'feedback_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardBox(
              context,
              title: "Menu",
              icon: Icons.restaurant_menu,
              color: Colors.orange,
              screen: const MenuScreen(),
            ),
            _buildDashboardBox(
              context,
              title: "Calorie Tracker",
              icon: Icons.fitness_center,
              color: Colors.green,
              screen: const CalorieTracker(),
            ),
            _buildDashboardBox(
              context,
              title: "Chatbot",
              icon: Icons.chat,
              color: Colors.blue,
              screen: const ChatbotScreen(),
            ),
            _buildDashboardBox(
              context,
              title: "Feedback",
              icon: Icons.feedback,
              color: Colors.purple,
              screen: const FeedbackScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardBox(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required Widget screen,
      }) {
    return GestureDetector(
      onTap: () => navigateToScreen(context, screen),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

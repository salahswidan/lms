import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('assets/images/personal-image.png'),
            ),
            const SizedBox(height: 12),
            const Text(
              'Ahmed Elhalabi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const Text(
              'Student',
              style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatItem(title: 'Courses', value: '4'),
                  _StatItem(title: 'Watch Time', value: '48h'),
                  _StatItem(title: 'Joined', value: '2025'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
        ),
      ],
    );
  }
}

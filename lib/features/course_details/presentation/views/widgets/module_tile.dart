import 'package:flutter/material.dart';

class ModuleTile extends StatelessWidget {
  final String title;
  final List<Widget>? lessons;

  const ModuleTile({super.key, required this.title, this.lessons});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F7FF),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              const Icon(Icons.expand_more, color: Color(0xFF0C77F2)),
            ],
          ),
        ),
        if (lessons != null) ...lessons!,
      ],
    );
  }
}

import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final void Function()? toggleComplete;
  final bool isCompleted;

  const LessonTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.toggleComplete,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 12),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color:
                        Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: toggleComplete,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: isCompleted ? const Color(0xFF22C55E) : Colors.white,
                border: Border.all(
                  color: isCompleted
                      ? const Color(0xFF22C55E)
                      : Colors.grey.shade300,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 18,
                color: isCompleted ? Colors.white : Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

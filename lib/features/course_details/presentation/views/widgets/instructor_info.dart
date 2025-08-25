import 'package:flutter/material.dart';

class InstructorInfo extends StatelessWidget {
  const InstructorInfo({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
  });

  final String imageUrl;
  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 20, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color:
                    Theme.of(context).textTheme.bodyMedium?.color ??
                    Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color:
                    Theme.of(context).textTheme.bodyMedium?.color ??
                    Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

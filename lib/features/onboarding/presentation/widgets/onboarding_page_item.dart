import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    super.key,
    required this.title,
    required this.description,
    required this.svgPath,
  });
  final String title;
  final String description;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.3,
          child: Center(child: SvgPicture.asset(svgPath)),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
            overflow: TextOverflow.visible,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            height: 1.5,
            overflow: TextOverflow.visible,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

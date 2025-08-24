import 'package:flutter/material.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    super.key,
    required this.itemCount,
    required this.generator,
  });

  final int itemCount;
  final Widget Function(int) generator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(itemCount, generator),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnboardingPageBuilder extends StatelessWidget {
  const OnboardingPageBuilder({
    super.key,
    this.controller,
    this.onPageChanged,
    this.itemCount,
    required this.itemBuilder,
  });

  final PageController? controller;
  final void Function(int)? onPageChanged;
  final int? itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: onPageChanged,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}

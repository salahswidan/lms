import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:lms/features/onboarding/presentation/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        actions: [
          TextButton(
            onPressed: () => context.read<OnboardingCubit>().skipOnboarding(),
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        ],
      ),
      body: OnboardingViewBody(),
    );
  }
}

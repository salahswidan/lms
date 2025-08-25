import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/constants/app_router.dart';

import 'package:lms/features/onboarding/data/models/onboard_model.dart';
import 'package:lms/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:lms/features/onboarding/presentation/widgets/indicator_item.dart';
import 'package:lms/features/onboarding/presentation/widgets/nav_button.dart';
import 'package:lms/features/onboarding/presentation/widgets/onboarding_page_builder.dart';
import 'package:lms/features/onboarding/presentation/widgets/onboarding_page_item.dart';
import 'package:lms/features/onboarding/presentation/widgets/page_indicators.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _pageController = PageController();
  final List<OnboardModel> onboardPages = [
    OnboardModel(
      image: "assets/images/onboarding1.svg",
      title: "Your Learning Journey Starts Here",
      description:
          "Discover structured courses designed to help you grow step by step.",
    ),
    OnboardModel(
      image: "assets/images/onboarding2.svg",
      title: "Grow With Confidence",
      description:
          "Master new skills and unlock opportunities with every lesson.",
    ),
    OnboardModel(
      image: "assets/images/onboarding3.svg",
      title: "Level Up Your Knowledge",
      description: "Learn at your own pace and achieve your academic goals.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingCompleted) {
          GoRouter.of(context).go(AppRouter.homePage);
        }
      },
      builder: (context, state) {
        if (state is OnboardingInitial) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: OnboardingPageBuilder(
                      onPageChanged: (index) {
                        context.read<OnboardingCubit>().pageChanged(index);
                      },
                      controller: _pageController,
                      itemCount: onboardPages.length,
                      itemBuilder: (context, index) {
                        return OnboardingPageItem(
                          title: onboardPages[index].title,
                          description: onboardPages[index].description,
                          svgPath: onboardPages[index].image,
                        );
                      },
                    ),
                  ),
                  PageIndicators(
                    itemCount: onboardPages.length,
                    generator: (index) => IndicatorItem(
                      color: state.currentPage == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade300,
                      width: state.currentPage == index ? 8 : 8,
                    ),
                  ),
                  const SizedBox(height: 10),
                  NavButton(
                    onPressed: () {
                      if (state.isLastPage) {
                        context.read<OnboardingCubit>().completeOnboarding();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    buttonName: state.isLastPage ? 'Get Started' : 'Next',
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    _pageController.dispose();
  }
}

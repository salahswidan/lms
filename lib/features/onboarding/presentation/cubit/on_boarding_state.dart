part of 'on_boarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {
  final int currentPage;
  final bool isLastPage;

  const OnboardingInitial({this.currentPage = 0, this.isLastPage = false});

  @override
  List<Object> get props => [currentPage, isLastPage];
}

class OnboardingCompleted extends OnboardingState {}

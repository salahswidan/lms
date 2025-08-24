import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  void pageChanged(int index) {
    emit(
      OnboardingInitial(
        currentPage: index,
        isLastPage: index == 2, 
      ),
    );
  }

  void skipOnboarding() {
    emit(OnboardingCompleted());
  }

  void completeOnboarding() {
    emit(OnboardingCompleted());
  }
}

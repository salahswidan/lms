import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/courses/presentation/views/courses_view.dart';
import 'package:lms/features/profile/presentation/views/profile_view.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewState(currentIndex: 0));

  void toggleIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Widget changePage() {
    switch (state.currentIndex) {
      case 0:
        return CoursesView();
      case 1:
        return Container();
      case 2:
        return ProfileView();
      default:
        return Container();
    }
  }
}

part of 'home_view_cubit.dart';

final class HomeViewState {
  final int currentIndex;

  HomeViewState({required this.currentIndex});

  HomeViewState copyWith({int? currentIndex}) {
    return HomeViewState(currentIndex: currentIndex ?? this.currentIndex);
  }
}

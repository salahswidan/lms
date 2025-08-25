part of 'course_details_cubit.dart';

final class CourseDetailsState {
  final bool isComplete;

  CourseDetailsState({required this.isComplete});

  CourseDetailsState copyWith({bool? isComplete}) {
    return CourseDetailsState(isComplete: isComplete ?? this.isComplete);
  }
}

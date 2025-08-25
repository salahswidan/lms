part of 'course_cubit.dart';

sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final List<CourseEntity> courses;

  CourseSuccess(this.courses);
}

final class CourseFailure extends CourseState {
  final String message;

  CourseFailure(this.message);
}

final class CourseDetailsSuccess extends CourseState {
  final CourseEntity courseEntity;

  CourseDetailsSuccess(this.courseEntity);
}

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lms/features/courses/domain/entities/course_entity.dart';
import 'package:lms/features/courses/domain/repos/course_repo.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this.courseRepo) : super(CourseInitial());

  final CourseRepo courseRepo;

  Future<void> getCourses() async {
    emit(CourseLoading());
    var result = await courseRepo.getCourses();
    result.fold(
      (f) => emit(CourseFailure(f.message)),
      (r) => emit(CourseSuccess(r)),
    );
  }

  Future<void> getCourseDetails(String courseId) async {
    emit(CourseLoading());
    var result = await courseRepo.getCourseById(courseId);
    result.fold(
      (f) => emit(CourseFailure(f.message)),
      (r) => emit(CourseDetailsSuccess(r)),
    );
  }
}

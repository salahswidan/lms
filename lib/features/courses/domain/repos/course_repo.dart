import 'package:dartz/dartz.dart';

import '../../../../core/errors/faluire.dart';
import '../entities/course_entity.dart';

abstract class CourseRepo {
  Future<Either<Faluire, List<CourseEntity>>> getCourses();
  Future<Either<Faluire, CourseEntity>> getCourseById(String id);
}

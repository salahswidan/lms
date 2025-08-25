import 'package:get_it/get_it.dart';
import 'package:lms/features/courses/data/repos_impl/course_repo_impl.dart';
import 'package:lms/features/courses/domain/repos/course_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CourseRepo>(CourseRepoImpl());
}

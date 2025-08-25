import '../entities/course.dart';
import '../repositories/explore_repository.dart';

class GetAllCourses {
  final ExploreRepository repository;
  GetAllCourses(this.repository);

  Future<List<Course>> call() => repository.getAllCourses();
}

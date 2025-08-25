import '../entities/course.dart';
import '../entities/category.dart';

abstract class ExploreRepository {
  Future<List<Category>> getCategories();
  Future<List<Course>> getCoursesByCategory(String categoryId);
  Future<List<Course>> getAllCourses();
}

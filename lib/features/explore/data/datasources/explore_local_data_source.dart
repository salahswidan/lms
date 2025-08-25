import 'package:lms/core/dummy/courses_dummy.dart';

import '../models/course_model.dart';
import '../models/category_model.dart';

abstract class ExploreLocalDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CourseModel>> getCourses();
}

class ExploreLocalDataSourceImpl implements ExploreLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    return DummyCoursesData.categories
        .map((e) => CategoryModel.fromMap(e))
        .toList();
  }

  @override
  Future<List<CourseModel>> getCourses() async {
    return DummyCoursesData.courses
        .map((e) => CourseModel.fromMap(e))
        .toList();
  }
}

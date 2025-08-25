import '../../domain/entities/course.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/explore_repository.dart';
import '../datasources/explore_local_data_source.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreLocalDataSource localDataSource;

  ExploreRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Category>> getCategories() async {
    final models = await localDataSource.getCategories();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Course>> getCoursesByCategory(String categoryId) async {
    final models = await localDataSource.getCourses();
    return models
        .where((m) => m.categoryId == categoryId)
        .map((m) => m.toEntity())
        .toList();
  }

  @override
  Future<List<Course>> getAllCourses() async {
    final models = await localDataSource.getCourses();
    return models.map((m) => m.toEntity()).toList();
  }
}

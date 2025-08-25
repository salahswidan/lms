import '../entities/category.dart';
import '../repositories/explore_repository.dart';

class GetCategories {
  final ExploreRepository repository;
  GetCategories(this.repository);

  Future<List<Category>> call() => repository.getCategories();
}

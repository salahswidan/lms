import 'package:flutter/material.dart';
import '../../domain/entities/course.dart';
import '../../domain/entities/category.dart';
import '../../data/datasources/explore_local_data_source.dart';
import '../../data/repositories/explore_repository_impl.dart';
import '../../domain/usecases/get_all_courses.dart';
import '../../domain/usecases/get_categories.dart';
import '../widgets/course_card.dart';
import '../widgets/category_chip_list.dart';

class ExplorePage extends StatefulWidget {
  static const String routeName = '/explore';
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late final ExploreRepositoryImpl repository;
  late final GetAllCourses getAllCourses;
  late final GetCategories getCategories;

  List<Category> categories = [];
  List<Course> courses = [];
  String? selectedCategoryId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final dataSource = ExploreLocalDataSourceImpl();
    repository = ExploreRepositoryImpl(localDataSource: dataSource);
    getAllCourses = GetAllCourses(repository);
    getCategories = GetCategories(repository);

    _loadInitial();
  }

  Future<void> _loadInitial() async {
    final cats = await getCategories();
    final crs = await getAllCourses();
    setState(() {
      categories = cats;
      courses = crs;
      isLoading = false;
    });
  }

  Future<void> _filterByCategory(String? categoryId) async {
    setState(() {
      isLoading = true;
      selectedCategoryId = categoryId;
    });
    if (categoryId == null) {
      final all = await getAllCourses();
      setState(() {
        courses = all;
        isLoading = false;
      });
    } else {
      final all = await repository.getCoursesByCategory(categoryId);
      setState(() {
        courses = all;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadInitial,
              child: ListView(
                children: [
                  const SizedBox(height: 12),
                  CategoryChipList(
                    categories: categories,
                    selectedId: selectedCategoryId,
                    onSelected: _filterByCategory,
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Recommended for you',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 290,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return CourseCard(course: course, onBuy: () {});
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemCount: courses.length,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }
}

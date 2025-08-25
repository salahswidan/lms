import 'package:flutter/material.dart';
import '../../../explore/data/datasources/explore_local_data_source.dart';
import '../../../explore/data/repositories/explore_repository_impl.dart';
import '../../../explore/domain/entities/category.dart';
import '../../data/datasources/search_local_data_source.dart';
import '../../domain/entities/search_history_item.dart';
import '../widgets/search_history_tile.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  late final ExploreRepositoryImpl exploreRepository;
  late final SearchLocalDataSourceImpl searchLocalDataSource;

  List<Category> categories = [];
  List<SearchHistoryItem> history = [];

  @override
  void initState() {
    super.initState();
    exploreRepository = ExploreRepositoryImpl(
      localDataSource: ExploreLocalDataSourceImpl(),
    );
    searchLocalDataSource = SearchLocalDataSourceImpl();
    _init();
  }

  Future<void> _init() async {
    final cats = await exploreRepository.getCategories();
    final hist = await searchLocalDataSource.getHistory();
    setState(() {
      categories = cats;
      history = hist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search courses',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) {},
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Chip(label: Text(category.name));
              },
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: categories.length,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Recent searches',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 8),
          ...history
              .map((e) => SearchHistoryTile(item: e, onTap: () {}))
              .toList(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

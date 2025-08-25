import 'package:lms/core/dummy/search_dummy.dart';

import '../../domain/entities/search_history_item.dart';

abstract class SearchLocalDataSource {
  Future<List<SearchHistoryItem>> getHistory();
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  @override
  Future<List<SearchHistoryItem>> getHistory() async {
    return DummySearchData.history
        .map(
          (e) => SearchHistoryItem(
            id: e['id'] as String,
            query: e['query'] as String,
            createdAt: DateTime.fromMillisecondsSinceEpoch(
              (e['createdAt'] as int) * 1000,
            ),
          ),
        )
        .toList();
  }
}

class SearchHistoryItem {
  final String id;
  final String query;
  final DateTime createdAt;

  const SearchHistoryItem({
    required this.id,
    required this.query,
    required this.createdAt,
  });
}

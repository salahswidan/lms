import 'package:flutter/material.dart';
import '../../domain/entities/search_history_item.dart';

class SearchHistoryTile extends StatelessWidget {
  final SearchHistoryItem item;
  final VoidCallback? onTap;

  const SearchHistoryTile({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.history),
      title: Text(item.query),
      onTap: onTap,
    );
  }
}

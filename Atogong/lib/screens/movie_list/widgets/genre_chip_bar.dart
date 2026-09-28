import 'package:flutter/material.dart';

import '../../../data/mock_movies.dart';

class GenreChipBar extends StatelessWidget {
  const GenreChipBar({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: genres.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final genre = genres[index];
          return ChoiceChip(
            label: Text(genre),
            selected: genre == selected,
            onSelected: (_) => onSelected(genre),
          );
        },
      ),
    );
  }
}

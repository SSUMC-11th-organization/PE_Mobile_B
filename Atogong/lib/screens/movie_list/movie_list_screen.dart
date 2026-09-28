import 'package:flutter/material.dart';

import '../../data/mock_movies.dart';
import 'widgets/genre_filter_sheet.dart';
import 'widgets/movie_grid.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  Set<String> _selectedGenres = {};

  Future<void> _openFilter() async {
    final result = await showModalBottomSheet<Set<String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => GenreFilterSheet(initialSelected: _selectedGenres),
    );
    if (result == null) return; // 바깥 눌러 닫음 → 변경 없음
    setState(() => _selectedGenres = result);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final filtered = _selectedGenres.isEmpty
        ? movies
        : movies.where((m) => _selectedGenres.contains(m.genre)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '영화',
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _openFilter,
            icon: Badge(
              isLabelVisible: _selectedGenres.isNotEmpty,
              label: Text('${_selectedGenres.length}'),
              child: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
      body: MovieGrid(movies: filtered),
    );
  }
}

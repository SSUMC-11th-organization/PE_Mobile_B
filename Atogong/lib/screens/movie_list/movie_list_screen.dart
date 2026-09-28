import 'package:flutter/material.dart';

import '../../data/mock_movies.dart';
import 'widgets/genre_chip_bar.dart';
import 'widgets/movie_grid.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  String _selectedGenre = '전체';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final filtered = _selectedGenre == '전체'
        ? movies
        : movies.where((m) => m.genre == _selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '영화',
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          GenreChipBar(
            selected: _selectedGenre,
            onSelected: (genre) => setState(() => _selectedGenre = genre),
          ),
          Expanded(child: MovieGrid(movies: filtered)),
        ],
      ),
    );
  }
}

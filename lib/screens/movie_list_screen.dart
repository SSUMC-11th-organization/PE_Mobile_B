import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../theme/app_colors.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/movie_card.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  static const _all = '전체';
  String _selectedGenre = _all;

  List<Movie> get _filteredMovies {
    if (_selectedGenre == _all) return movies;
    return movies.where((movie) => movie.genre == _selectedGenre).toList();
  }

  Future<void> _openGenreSheet(
    BuildContext context,
    List<String> genres,
  ) async {
    final genre = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final genre in genres)
              ListTile(
                title: Text(genre),
                trailing: genre == _selectedGenre
                    ? const Icon(Icons.check, color: AppColors.violet)
                    : null,
                onTap: () => Navigator.pop(sheetContext, genre),
              ),
          ],
        ),
      ),
    );
    if (genre != null) setState(() => _selectedGenre = genre);
  }

  @override
  Widget build(BuildContext context) {
    final genres = [
      _all,
      ...{for (final movie in movies) movie.genre},
    ];

    return Scaffold(
      appBar: CommonAppBar(
        title: '영화 목록',
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _openGenreSheet(context, genres),
          ),
        ],
      ),
      backgroundColor: AppColors.warmWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            GenreFilterChips(
              genres: genres,
              selectedGenre: _selectedGenre,
              onSelected: (genre) => setState(() => _selectedGenre = genre),
            ),
            const SizedBox(height: 8),
            Expanded(child: MovieGrid(movies: _filteredMovies)),
          ],
        ),
      ),
    );
  }
}

class GenreFilterChips extends StatelessWidget {
  const GenreFilterChips({
    super.key,
    required this.genres,
    required this.selectedGenre,
    required this.onSelected,
  });

  final List<String> genres;
  final String selectedGenre;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: genres.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final genre = genres[index];
          final selected = genre == selectedGenre;
          return ChoiceChip(
            label: Text(genre),
            selected: selected,
            onSelected: (_) => onSelected(genre),
            selectedColor: AppColors.violet,
            labelStyle: TextStyle(
              color: selected ? AppColors.white : AppColors.black,
            ),
            backgroundColor: AppColors.lightGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide.none,
            ),
          );
        },
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  const MovieGrid({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(child: Text('해당 장르의 영화가 없어요.'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) => MovieCard(movie: movies[index]),
    );
  }
}

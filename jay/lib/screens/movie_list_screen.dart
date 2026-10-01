import 'package:flutter/material.dart';
import 'package:jay/widgets/common_app_bar.dart';
import 'package:jay/widgets/genre_filter_sheet.dart';
import 'package:jay/widgets/mock_movie.dart';
import 'package:jay/widgets/movie_card.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  Set<String> selectedGenres = {};
  @override
  Widget build(BuildContext context) {
    final filteredMovies = selectedGenres.isEmpty
        ? movies
        : movies
              .where((movie) => selectedGenres.contains(movie.genre))
              .toList();

    return Scaffold(
      appBar: CommonAppBar(
        title: '영화',
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: _openFilterSheet,
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final item = filteredMovies[index];
                return MovieCard(movie: item);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.55,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openFilterSheet() async {
    final result = await showModalBottomSheet<Set<String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetContext) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return GenreFilterSheet(
            scrollController: scrollController,
            initialGenres: selectedGenres,
          );
        },
      ),
    );
    debugPrint('$result');

    if (result != null) {
      setState(() {
        selectedGenres = result;
      });
    }
  }
}

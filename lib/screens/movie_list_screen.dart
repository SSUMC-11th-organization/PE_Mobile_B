import 'package:flutter/material.dart';

import '../data/mock_movies.dart';
import '../widgets/movie_card.dart';

// 영화 목록 탭 — 장르 필터 Chip + 2열 그리드
class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  String? selectedGenre; // null이면 '전체'

  // mockMovies의 장르를 중복 없이 뽑음 (toSet이 처음 나온 순서를 유지)
  final List<String> _genres =
      mockMovies.map((movie) => movie.genre).toSet().toList();

  @override
  Widget build(BuildContext context) {
    final movies = selectedGenre == null
        ? mockMovies
        : mockMovies.where((movie) => movie.genre == selectedGenre).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 장르 필터 — 장르가 많아져도 넘치지 않게 가로 스크롤
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  _buildGenreChip(label: '전체', genre: null),
                  for (final genre in _genres)
                    _buildGenreChip(label: genre, genre: genre),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 한 줄에 2개
                  crossAxisSpacing: 12, // 가로 간격
                  mainAxisSpacing: 16, // 세로 간격
                  childAspectRatio: 0.65, // 칸의 가로:세로 비율 (세로로 긴 포스터 카드)
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) => MovieCard(movie: movies[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // genre가 null이면 '전체' Chip
  Widget _buildGenreChip({required String label, required String? genre}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selectedGenre == genre, // 선택된 Chip은 배경색·체크 표시로 구분됨
        onSelected: (_) {
          setState(() {
            selectedGenre = genre;
          });
        },
      ),
    );
  }
}

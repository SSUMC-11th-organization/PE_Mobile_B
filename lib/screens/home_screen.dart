import 'package:flutter/material.dart';

import '../data/mock_movies.dart';
import '../theme/app_text_styles.dart';
import '../widgets/movie_card.dart';

// 홈 화면 — 추천 영화를 가로 스크롤 섹션으로 표시
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('오늘의 추천 영화', style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              // 가로 ListView는 높이가 정해져 있어야 해서 SizedBox로 감쌈
              SizedBox(
                height: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: mockMovies.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  // 가로 ListView 안에서는 폭이 무한대라 카드 폭을 지정
                  itemBuilder: (context, index) => SizedBox(
                    width: 140,
                    child: MovieCard(movie: mockMovies[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

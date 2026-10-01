import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const CommonAppBar(title: 'MovieLog', centerTitle: true),
        backgroundColor: AppColors.warmWhite,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('지금 인기 있는 영화', style: AppTextStyles.titleMedium),
                ),
                SizedBox(height: 16),
                PopularMovieList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: movies.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SizedBox(width: 140, child: MovieCard(movie: movies[index]));
        },
      ),
    );
  }
}

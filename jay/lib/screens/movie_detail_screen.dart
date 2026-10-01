import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/mock_movie.dart';
import '../widgets/rating_dialog.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  static const double averageRating = 4.5;

  bool isFavorite = false;
  double? myRating;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(isFavorite ? '즐겨찾기에 추가했습니다.' : '즐겨찾기에서 삭제했습니다.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  Future<void> _openRatingDialog() async {
    final rating = await showDialog<double>(
      context: context,
      builder: (context) => const RatingDialog(),
    );
    if (rating == null || !mounted) return;

    setState(() {
      myRating = rating;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$rating점으로 평가했습니다.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = findMovieById(int.tryParse(widget.movieId));

    return Scaffold(
      appBar: CommonAppBar(
        title: 'Cinema Archive',
        centerTitle: true,
        titleStyle: AppTextStyles.titleMedium.copyWith(color: AppColors.violet),
        onBack: () => context.pop(),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: movie == null
          ? const Center(child: Text('영화를 찾을 수 없어요.'))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    movie.posterAsset,
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title, style: AppTextStyles.titleLarge),
                        const SizedBox(height: 4),
                        Text(
                          '${movie.year} • ${movie.genre} • ${movie.runtime}분',
                          style: AppTextStyles.bodySmall,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: averageRating,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, index) =>
                                  const Icon(Icons.star, color: AppColors.violet),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '$averageRating',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            if (myRating != null) ...[
                              const SizedBox(width: 12),
                              Text(
                                '내 평점 $myRating',
                                style: AppTextStyles.bodySmall,
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 12),
                        Chip(
                          label: Text(movie.genre),
                          backgroundColor: AppColors.fieldFill,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        const Divider(height: 32),
                        const Text('시놉시스', style: AppTextStyles.titleMedium),
                        const SizedBox(height: 8),
                        Text(movie.synopsis, style: AppTextStyles.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: movie == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _toggleFavorite,
                        icon: Icon(
                          isFavorite ? Icons.bookmark : Icons.bookmark_border,
                        ),
                        label: const Text('즐겨찾기'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _openRatingDialog,
                        icon: const Icon(Icons.rate_review),
                        label: const Text('평점 남기기'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

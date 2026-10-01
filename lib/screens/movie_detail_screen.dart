import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../data/mock_movies.dart';
import '../theme/app_text_styles.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/movie_rating_input.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movieId});

  // 경로의 :movieId를 int로 파싱한 값. 숫자가 아니면 null
  final int? movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  static const double _averageRating = 4.5; // 평균 평점 — API 연결 전 임시 값

  double? _myRating; // 다이얼로그에서 확인한 내 별점. null이면 아직 평점 없음
  bool _isFavorite = false; // Mock 즐겨찾기 상태 — 화면을 나가면 초기화됨

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar() // 연속으로 눌러도 안내가 줄줄이 쌓이지 않게 이전 것을 닫음
      ..showSnackBar(
        SnackBar(
          content: Text(_isFavorite ? '즐겨찾기에 추가했습니다.' : '즐겨찾기에서 제거했습니다.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  Future<void> _openRatingDialog() async {
    // 다이얼로그가 Navigator.pop(context, rating)으로 돌려준 값. 바깥을 눌러 닫으면 null
    final rating = await showDialog<double>(
      context: context,
      builder: (context) => const RatingDialog(),
    );
    if (rating == null || !mounted) return;
    setState(() {
      _myRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final movie = findMovieById(widget.movieId);

    return Scaffold(
      // 상세 화면은 뒤로가기 허용 → 이전 화면이 있으면 pop,
      // 없으면(URL 직접 진입 등) 홈으로 이동
      appBar: CommonAppBar(
        title: movie?.title ?? '영화 상세',
        onBack: () => context.canPop() ? context.pop() : context.go('/home'),
        // 영화를 찾지 못한 경우엔 즐겨찾기 버튼을 보여주지 않음
        actions: movie == null
            ? null
            : [
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  tooltip: _isFavorite ? '즐겨찾기 해제' : '즐겨찾기',
                  onPressed: _toggleFavorite,
                ),
              ],
      ),
      body: SafeArea(
        child: movie == null
            ? const Center(
                child: Text('영화를 찾을 수 없습니다', style: AppTextStyles.bodyMedium),
              )
            : Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: AppTextStyles.titleLarge),
                    const SizedBox(height: 8),
                    Text(movie.genre, style: AppTextStyles.bodyMedium),
                    const SizedBox(height: 4),
                    Text('${movie.year}', style: AppTextStyles.bodySmall),
                    const SizedBox(height: 24),
                    // 평균 평점 — 읽기 전용 별 표시
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: _averageRating,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                        ),
                        const SizedBox(width: 8),
                        Text('평균 $_averageRating', style: AppTextStyles.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _myRating == null ? '평점 없음' : '내 평점: $_myRating',
                      style: AppTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _openRatingDialog,
                      child: const Text('평점 남기기'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

// 별점 선택 다이얼로그 — 확인 시 선택한 별점을 반환
class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('평점 남기기'),
      content: MovieRatingInput(
        rating: _rating,
        onChanged: (value) {
          setState(() {
            _rating = value;
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('취소'),
        ),
        // 별점을 고르기 전(0점)에는 비활성화 → onPressed: null이면 회색으로 표시됨
        TextButton(
          onPressed: _rating > 0 ? () => Navigator.pop(context, _rating) : null,
          child: const Text('확인'),
        ),
      ],
    );
  }
}

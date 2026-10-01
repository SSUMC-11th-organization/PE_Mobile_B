import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// 영화 별점 입력 — 0.5점 단위, 5개 별
class MovieRatingInput extends StatelessWidget {
  const MovieRatingInput({
    super.key,
    required this.rating,
    required this.onChanged,
  });

  final double rating;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0.5, // 한 번 누르면 최소 0.5점
      allowHalfRating: true, // 별 반 개 단위 선택
      itemCount: 5,
      itemSize: 40,
      // AppColors에 별점용 색이 없어 amber 사용
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: onChanged,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../theme/app_colors.dart';

class RatingInput extends StatelessWidget {
  const RatingInput({
    super.key,
    required this.rating,
    required this.onRatingUpdate,
  });

  final double rating;
  final ValueChanged<double> onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      itemCount: 5,
      allowHalfRating: false,
      itemBuilder: (context, _) =>
          const Icon(Icons.star, color: AppColors.violet),
      onRatingUpdate: onRatingUpdate,
    );
  }
}

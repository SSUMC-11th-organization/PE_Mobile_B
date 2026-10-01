import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

const List<String> favoriteGenres = ['드라마', 'SF', '애니메이션'];

class FavoriteGenres extends StatelessWidget {
  const FavoriteGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 교차축(가로) 왼쪽 정렬
      children: [
        Text(
          '선호하는 장르',
          style: AppTextStyles.titleMedium.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: favoriteGenres
              .map((genre) => GenreChip(label: genre))
              .toList(),
        ),
      ],
    );
  }
}

class GenreChip extends StatelessWidget {
  const GenreChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.violet,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: AppColors.lavender,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}

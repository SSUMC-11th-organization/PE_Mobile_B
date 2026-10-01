import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/movie.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// 포스터 실제 이미지 Asset이 없어 아이콘 Placeholder로 대체.
/// posterAsset 실제 파일이 추가되면 Image.asset(movie.posterAsset)로 교체.
class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push('/movies/${movie.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightViolet,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.movie_creation_outlined,
                color: AppColors.violet,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            '${movie.genre} · ${movie.year}',
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}

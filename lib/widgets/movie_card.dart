import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/movie.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // push = 현재 화면 위에 상세 화면을 쌓음 → 상세에서 뒤로가기로 돌아올 수 있음
      onTap: () => context.push('/movies/${movie.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 포스터 자리 — 실제 asset 파일이 아직 없어 회색 박스로 대체
          // Expanded = 제목/장르를 뺀 나머지 높이를 포스터가 채움 → 그리드 칸·가로 목록 높이에 맞춰짐
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: AppTextStyles.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // 제목이 길면 … 처리
          ),
          const SizedBox(height: 4),
          Text(movie.genre, style: AppTextStyles.bodySmall, maxLines: 1),
        ],
      ),
    );
  }
}

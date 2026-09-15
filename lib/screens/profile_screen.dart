import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/stat_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '내 프로필'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              // 프로필 사진 — 원본 파일 없어 임시 Icon으로 대체
              const CircleAvatar(
                radius: 44,
                backgroundColor: AppColors.white,
                backgroundImage:  AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(height: 16),
              const Text('무비러버', style: AppTextStyles.titleLarge),
              const SizedBox(height: 8),
              Text(
                '매주 주말엔 영화관으로 출근하는 프로 관람객. 좋은 영화를 보고 기록하는 것을 좋아합니다.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.violet,
                  side: const BorderSide(color: AppColors.violet),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                ),
                child: const Text('프로필 수정'),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  StatItem(label: '본 영화', value: '342'),
                  StatItem(label: '평점', value: '4.2'),
                  StatItem(label: '즐겨찾기', value: '58'),
                ],
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('선호하는 장르', style: AppTextStyles.titleMedium),
              ),
              const SizedBox(height: 8),
              const Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text('드라마')),
                  Chip(label: Text('SF')),
                  Chip(label: Text('애니메이션')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
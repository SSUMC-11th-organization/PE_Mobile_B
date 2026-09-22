import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/stat_item.dart';

@Preview(name: 'Profile Screen')
WidgetBuilder previewProfileScreen() {
  return (context) => MaterialApp(theme: AppTheme.light, home: const ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '내 프로필', centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ProfileHeader(),
              SizedBox(height: 28),
              ProfileStats(),
              SizedBox(height: 28),
              FavoriteGenres(),
              SizedBox(height: 32),
              EditProfileButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 44,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        const SizedBox(height: 12),
        Text('무비러버', style: AppTextStyles.titleLarge),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/movie.svg',
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(AppColors.violet, BlendMode.srcIn),
              semanticsLabel: '영화 아이콘',
            ),
            const SizedBox(width: 6),
            Text('좋아하는 영화를 기록하고 있어요', style: AppTextStyles.bodySmall),
          ],
        ),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 8,
      children: [
        Expanded(child: StatItem(label: '본 영화', value: '24')),
        Expanded(child: StatItem(label: '평점', value: '18')),
        Expanded(child: StatItem(label: '즐겨찾기', value: '7')),
      ],
    );
  }
}

class FavoriteGenres extends StatelessWidget {
  const FavoriteGenres({super.key});

  static const _genres = ['드라마', 'SF', '애니메이션'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('선호 장르', style: AppTextStyles.titleMedium),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final genre in _genres)
                Chip(
                  label: Text(genre),
                  backgroundColor: AppColors.warmWhite,
                  side: const BorderSide(color: AppColors.violet),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.violet,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('프로필 수정'),
    );
  }
}

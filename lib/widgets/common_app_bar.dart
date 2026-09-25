import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.centerTitle = false,
    this.titleStyle,
  });

  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final bool centerTitle;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleStyle ??
            AppTextStyles.titleLarge.copyWith(color: AppColors.violet),
      ),
      centerTitle: centerTitle,
      // onBack이 없으면 Navigator에 이전 페이지가 있어도 뒤로가기 버튼을 자동 생성하지 않음
      automaticallyImplyLeading: onBack != null,
      leading: onBack == null
          ? null
          : IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
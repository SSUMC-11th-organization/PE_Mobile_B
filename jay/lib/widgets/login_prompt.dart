import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key, required this.onLogin});

  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '이미 계정이 있나요?',
          style: AppTextStyles.bodyMedium.copyWith(fontSize: 14),
        ),
        TextButton(
          onPressed: onLogin,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.violet,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          child: const Text('로그인'),
        ),
      ],
    );
  }
}

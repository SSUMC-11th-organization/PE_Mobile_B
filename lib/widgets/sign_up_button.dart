import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.violet,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.gray.withValues(alpha: 0.3),
        disabledForegroundColor: AppColors.gray,
      ),
      child: const Text('가입하기'),
    );
  }
}

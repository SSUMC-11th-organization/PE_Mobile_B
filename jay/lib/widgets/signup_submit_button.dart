import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SignUpSubmitButton extends StatelessWidget {
  const SignUpSubmitButton({super.key, required this.onPressed});

  /// null이면 버튼이 비활성화됩니다.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.violet,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.violetDisabled,
        disabledForegroundColor: AppColors.white,
        elevation: 0,
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      child: const Text('가입하기'),
    );
  }
}

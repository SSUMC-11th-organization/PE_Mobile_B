import 'package:flutter/material.dart';
import 'package:jay/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.label,
    required this.value,
    required this.iconPath,
  });

  final String label;
  final String value;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.violetSurface,
        border: Border.all(color: AppColors.violetLight),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.gray,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text(label, style: textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(color: AppColors.violet),
          ),
        ],
      ),
    );
  }
}

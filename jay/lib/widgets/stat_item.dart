import 'package:flutter/material.dart';
import 'package:jay/theme/app_colors.dart';

class StatItem extends StatelessWidget {
  const StatItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.violetSurface,
        border: Border.all(color: colors.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label),
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

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? DarkAppColors.primary
        : AppColors.primary;

    return Material(
      borderRadius: BorderRadius.circular(20),
      color: color,
      elevation: 4,
      child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Center(
              child: Text(
                title,
                style: AppTypography.labelL.w500.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/theme/Design_System/typography_style.dart';
import '../settings/Theme/theme_ext.dart';

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
   

    return Material(
      borderRadius: BorderRadius.circular(20),
      color: context.color.primary,
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
                style: context.typo.labelLarge.w500.copyWith(
                  color: context.color.onPrimary,
                ),
                // style: AppTypography.labelL.w500.copyWith(
                //   color: AppColors.onPrimary,
                // ),
              ),
            ),
          )),
    );
  }
}

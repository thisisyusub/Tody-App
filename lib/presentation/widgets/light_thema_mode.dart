import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

var lightThemaMode = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    displaySmall: AppTypography.displayS.w400.copyWith(
      color: AppColors.onSurface,
    ),
    titleMedium: AppTypography.titleM.w400.copyWith(
      color: AppColors.primaryVariant,
    ),
  ),
  scaffoldBackgroundColor: AppColors.surface,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: AppTypography.labelL.w500.copyWith(
        color: AppColors.onPrimary,
      ),
    ),
  ),
);

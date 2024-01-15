import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

var blackThemaMode = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    displaySmall: AppTypography.displayS.w400.copyWith(
      color: DarkAppColors.onSurface,
    ),
    titleMedium: AppTypography.titleM.w400.copyWith(
      color: DarkAppColors.primaryVariant,
    ),
  ),
  scaffoldBackgroundColor: DarkAppColors.surface,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkAppColors.primary,
      textStyle: AppTypography.labelL.w500.copyWith(
        color: DarkAppColors.onPrimary,
      ),
    ),
  ),
);
import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/theme/app_typography.dart';

interface class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({required this.colors});

  factory AppTheme.light() {
    return _AppLightTheme();
  }

  factory AppTheme.dark() {
    return _AppDarkTheme();
  }

  final AppColors colors;

  AppTypography get typography {
    return AppTypography(
      labelLarge: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        color: colors.primary,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        height: 44 / 36,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        color: colors.primaryVariant,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        color: colors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        color: colors.surface,
      ),
    );
  }

  @override
  ThemeExtension<AppTheme> copyWith({
    AppColors? colors,
  }) {
    return AppTheme(
      colors: colors ?? this.colors,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      colors: colors.lerp(other.colors, t) as AppColors,
    );
  }
}

class _AppLightTheme extends AppTheme {
  _AppLightTheme() : super(colors: AppColors.light());
}

class _AppDarkTheme extends AppTheme {
  _AppDarkTheme() : super(colors: AppColors.dark());
}

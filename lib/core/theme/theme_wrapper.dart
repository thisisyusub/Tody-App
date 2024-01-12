import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/theme/app_typography.dart';
import 'package:tody_app/core/theme/theme_scope.dart';
import 'package:tody_app/presentation/settings/settings_scope.dart';

class ThemeWrapper extends StatelessWidget {
  const ThemeWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final themeMode = SettingsScope.of(context)!.themeMode;

    final AppColors colors = switch (themeMode) {
      ThemeMode.light => AppColors.light(),
      ThemeMode.dark => AppColors.dark(),
      _ => AppColors.light(),
    };

    final typography = AppTypography(
      displaySmall: TextStyle(
        fontSize: 36,
        height: 44 / 36,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        color: colors.primary,
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

    return ThemeScope(
      themeMode: themeMode,
      colors: colors,
      typography: typography,
      child: child,
    );
  }
}

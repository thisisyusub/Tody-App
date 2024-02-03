import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/theme/app_typography.dart';

class ThemeScope extends InheritedWidget {
  const ThemeScope({
    super.key,
    required Widget child,
    required this.themeMode,
    required this.colors,
    required this.typography,
  }) : super(child: child);

  final ThemeMode themeMode;
  final AppColors colors;
  final AppTypography typography;

  static ThemeScope of(BuildContext context) {
    final ThemeScope? result =
        context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(result != null, 'No ThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) => true;
}

import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/theme/app_typography.dart';
import 'package:tody_app/core/theme/theme_scope.dart';

class ThemeScopeWidget extends StatefulWidget {
  const ThemeScopeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  static ThemeScopeWidgetState? of(BuildContext context) {
    return context.findRootAncestorStateOfType<ThemeScopeWidgetState>();
  }

  @override
  State<ThemeScopeWidget> createState() => ThemeScopeWidgetState();
}

class ThemeScopeWidgetState extends State<ThemeScopeWidget> {
  ThemeMode? _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = ThemeMode.system;
  }

  void changeTo(ThemeMode themeMode) {
    if (_themeMode == themeMode) return;

    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    setState(() {
      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = switch (_themeMode) {
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
      titleLarge: TextStyle(
        fontSize: 22,
        height: 28 / 22,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
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
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 15 / 12,
        color: colors.onSurface,
      ),
    );

    return ThemeScope(
      themeMode: _themeMode ?? ThemeMode.light,
      colors: colors,
      typography: typography,
      child: widget.child,
    );
  }
}

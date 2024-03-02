import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/bloc/settings/theme/theme_scope.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/theme/app_typography.dart';

class ThemeScopeWidget extends StatefulWidget {
  const ThemeScopeWidget({
    super.key,
    required this.child,
    required this.preferences,
  });

  final Widget child;
  final SharedPreferences preferences;

  static ThemeScopeWidgetState? of(BuildContext context) {
    return context.findRootAncestorStateOfType<ThemeScopeWidgetState>();
  }

  @override
  State<ThemeScopeWidget> createState() => ThemeScopeWidgetState();
}

class ThemeScopeWidgetState extends State<ThemeScopeWidget> {
  ThemeMode? _themeMode;

  // ThemeMode _handleSystem() {
  //   final brightness = MediaQuery.of(context).platformBrightness;
  //   return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  // }

  void changeTo(ThemeMode themeMode) async {
    if (_themeMode == themeMode) return;

    try {
      final index = ThemeMode.values.indexOf(themeMode);
      await widget.preferences.setInt(AppKeys.themeMode, index);

      setState(() {
        _themeMode = themeMode;
      });
    } catch (_) {}
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    try {
      final themeModeIndex = widget.preferences.getInt(AppKeys.themeMode) ?? 0;
      final themeMode = ThemeMode.values[themeModeIndex];

      _themeMode = themeMode;
    } catch (_) {
      _themeMode = ThemeMode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final colors = switch (_themeMode!) {
      ThemeMode.light => AppColors.light(),
      ThemeMode.dark => AppColors.dark(),
      ThemeMode.system =>
        brightness == Brightness.dark ? AppColors.dark() : AppColors.light(),
    };

    final typography = AppTypography(
      displaySmall: TextStyle(
        fontSize: 36,
        height: 44 / 36,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
      ),
      displayLarge: TextStyle(
        fontSize: 57,
        height: 64 / 57,
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
      themeMode: _themeMode!,
      colors: colors,
      typography: typography,
      child: widget.child,
    );
  }
}

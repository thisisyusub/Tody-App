import 'package:flutter/material.dart';

import '../../../core/theme/Design System/my_app_theme.dart';
import '../../../core/theme/Design System/typography_style.dart';

class ThemeScope extends InheritedWidget {
  const ThemeScope({
    super.key,
    required super.child,
    required this.theme,
    required this.typo,
  });

  final MyAppColor theme;
  final TypoStyle typo;

  static ThemeScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeScope>();
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) {
    return true;
  }
}

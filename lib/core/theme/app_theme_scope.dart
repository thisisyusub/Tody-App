import 'package:flutter/widgets.dart';
import 'package:tody_app/core/theme/app_theme.dart';

class AppThemeScope extends InheritedWidget {
  const AppThemeScope({
    super.key,
    required super.child,
    required this.theme,
  });

  final AppTheme theme;

  static AppThemeScope of(BuildContext context) {
    final AppThemeScope? result =
        context.dependOnInheritedWidgetOfExactType<AppThemeScope>();
    assert(result != null, 'No AppThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppThemeScope oldWidget) => true;
}

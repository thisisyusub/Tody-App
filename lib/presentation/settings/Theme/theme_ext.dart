import 'package:flutter/widgets.dart';
import '../../../core/theme/Design_System/my_app_theme.dart';
import 'app_theme.dart';
import 'theme_scope.dart';

import '../../../core/theme/Design_System/my_app_typography.dart';

extension ThemeExt on BuildContext {
  AppTheme get theme => AppThemeScope.of(this)!.theme;
  MyAppColor get color => theme.colors;
  MyAppTypography get typo => theme.typography;
}

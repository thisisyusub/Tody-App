import 'package:flutter/widgets.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/core/theme/app_theme.dart';
import 'package:tody_app/core/theme/app_theme_scope.dart';
import 'package:tody_app/core/theme/app_typography.dart';

extension ThemeExt on BuildContext {
  AppTheme get theme => AppThemeScope.of(this).theme;
  AppColors get colors => theme.colors;
  AppTypography get typography => theme.typography;
}

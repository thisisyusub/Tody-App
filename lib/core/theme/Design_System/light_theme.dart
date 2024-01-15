
import 'package:flutter/material.dart';
import 'my_app_theme.dart';

class LightTheme extends MyAppColor {
  @override
  Color get surface => Colors.white;
  @override
  Color get primary => const Color(0xFF5946D2);
  @override
  Color get onPrimary => Colors.white;
  @override
  Color get onSurface => const Color(0xFF1C1B1F);
  @override
  Color get primaryVariant => const Color(0xFF5835E5);
  @override
  Color get primaryInverse => const Color(0xFFCBBEFF);
  @override
  Color get onSurfaceMediumBrush => const Color(0xFF1C1B1F).withOpacity(0.6);
  @override
  Color get error => const Color(0xFFF85977);
}

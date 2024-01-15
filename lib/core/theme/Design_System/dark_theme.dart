
import 'package:flutter/material.dart';
import 'my_app_theme.dart';

class DarkTheme extends MyAppColor {
  @override
  Color get surface => const Color(0xFF201F24);
  @override
  Color get primary => const Color(0xFF9373FF);
  @override
  Color get onPrimary => Colors.white;
  @override
  Color get onSurface => const Color(0xFFE6E1E5);
  @override
  Color get primaryVariant => const Color(0xFFCBBEFF);
  @override
  Color get primaryInverse => const Color(0xFF5946D2);
  @override
  Color get onSurfaceMediumBrush => const Color(0xFFE6E1E5).withOpacity(0.6);
  @override
  Color get error => const Color(0xFFD9415E);
}
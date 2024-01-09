import 'package:flutter/material.dart';

class AppTypography {
  static const fontFamily = 'SF Pro Display';

  static const labelLarge = TextStyle(
    fontSize: 14,
    height: 20 / 14,
  );

  static const displaySmall = TextStyle(
    fontSize: 36,
    height: 44 / 36,
  );

  static const titleMedium = TextStyle(
    fontSize: 16,
    height: 24 / 16,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    height: 24 / 16,
  );
}

extension TextStyleExt on TextStyle {
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
}

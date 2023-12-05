import 'package:flutter/material.dart';

class AppTypography {
  static const fontFamily = 'SF Pro Display';

  static const sp28 = TextStyle(fontSize: 28);
  static const sp26 = TextStyle(fontSize: 26);
  static const sp24 = TextStyle(fontSize: 24);
  static const sp18 = TextStyle(fontSize: 18);
  static const sp14 = TextStyle(fontSize: 14);
}

extension TextStyleExt on TextStyle {
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
}

extension TextColorExt on TextStyle {
  TextStyle get red => copyWith(color: Colors.red);
}

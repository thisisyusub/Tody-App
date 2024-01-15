import 'package:flutter/material.dart';

class AppTypography {
  static const displayL = TextStyle(fontSize: 57, height: 64 / 57);
  static const displayM = TextStyle(fontSize: 45, height: 52 / 45);
  static const displayS = TextStyle(fontSize: 36, height: 44 / 36);
  static const headlineL = TextStyle(fontSize: 36, height: 36 / 44);
  static const headlineM = TextStyle(fontSize: 32, height: 32 / 40);
  static const headlineS = TextStyle(fontSize: 28, height: 28 / 36);
  static const titleL = TextStyle(fontSize: 22, height: 22 / 28);
  static const titleM = TextStyle(fontSize: 16, height: 24 / 16);
  static const titleS = TextStyle(fontSize: 14, height: 14 / 20);
  static const labelL = TextStyle(fontSize: 14, height: 14 / 20);
  static const labelM = TextStyle(fontSize: 12, height: 12 / 16);
  static const labelS = TextStyle(fontSize: 11, height: 11 / 16);
  static const labelXS = TextStyle(fontSize: 11, height: 11 / 16);
  static const bodyL = TextStyle(fontSize: 16, height: 16 / 24);
  static const bodyM = TextStyle(fontSize: 14, height: 14 / 20);
  static const bodyS = TextStyle(fontSize: 12, height: 12 / 16);
  static const captionL = TextStyle(fontSize: 13, height: 13 / 18);
  static const captionM = TextStyle(fontSize: 12, height: 12 / 16);
  static const captionS = TextStyle(fontSize: 11, height: 11 / 13);
}

extension TextStyleExt on TextStyle {
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
}
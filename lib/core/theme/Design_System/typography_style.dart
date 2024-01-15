import 'package:flutter/material.dart';
import 'my_app_typography.dart';

class TypoStyle extends MyAppTypography {
  @override
  TextStyle get displayLarge => const TextStyle(
        fontSize: 57,
        height: 57 / 64,
      );

  @override
  TextStyle get displayMedium => const TextStyle(
        fontSize: 45,
        height: 45 / 52,
      );

  @override
  TextStyle get displaySmall => const TextStyle(
        fontSize: 36,
        height: 36 / 44,
      );

  @override
  TextStyle get headlineLarge => const TextStyle(
        fontSize: 36,
        height: 36 / 44,
      );

  @override
  TextStyle get headlineMedium => const TextStyle(
        fontSize: 32,
        height: 32 / 40,
      );

  @override
  TextStyle get headlineSmall => const TextStyle(
        fontSize: 28,
        height: 28 / 36,
      );

  @override
  TextStyle get titleLarge => const TextStyle(
        fontSize: 22,
        height: 22 / 28,
      );

  @override
  TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        height: 16 / 20,
      );

  @override
  TextStyle get titleSmall => const TextStyle(
        fontSize: 14,
        height: 14 / 20,
      );

  @override
  TextStyle get labelLarge => const TextStyle(
        fontSize: 14,
        height: 14 / 20,
      );

  @override
  TextStyle get labelMedium => const TextStyle(
        fontSize: 12,
        height: 12 / 16,
      );

  @override
  TextStyle get labelSmall => const TextStyle(
        fontSize: 11,
        height: 11 / 16,
      );

  @override
  TextStyle get labelXSmall => const TextStyle(
        fontSize: 11,
        height: 11 / 16,
      );

  @override
  TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
        height: 16 / 24,
      );

  @override
  TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        height: 14 / 20,
      );

  @override
  TextStyle get bodySmall => const TextStyle(
        fontSize: 12,
        height: 12 / 16,
      );

  @override
  TextStyle get captionLarge => const TextStyle(
        fontSize: 13,
        height: 13 / 18,
      );

  @override
  TextStyle get captionMedium => const TextStyle(
        fontSize: 12,
        height: 12 / 16,
      );

  @override
  TextStyle get captionSmall => const TextStyle(
        fontSize: 11,
        height: 11 / 16,
      );

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


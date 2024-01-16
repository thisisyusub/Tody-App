import 'package:flutter/material.dart';

interface class AppTypography extends ThemeExtension<AppTypography> {
  AppTypography({
    required this.labelLarge,
    required this.displaySmall,
    required this.titleMedium,
    required this.titleLarge,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  /// label
  final TextStyle labelLarge;

  /// display
  final TextStyle displaySmall;

  /// title
  final TextStyle titleMedium;
  final TextStyle titleLarge;

  /// body
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  @override
  ThemeExtension<AppTypography> copyWith({
    final TextStyle? labelLarge,
    final TextStyle? displaySmall,
    final TextStyle? titleMedium,
    final TextStyle? titleLarge,
    final TextStyle? bodyLarge,
    final TextStyle? bodyMedium,
    final TextStyle? bodySmall,
  }) {
    return AppTypography(
      labelLarge: labelLarge ?? this.labelLarge,
      displaySmall: displaySmall ?? this.displaySmall,
      titleMedium: titleMedium ?? this.titleMedium,
      titleLarge: titleLarge ?? this.titleLarge,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other is! AppTypography) {
      return this;
    }

    return AppTypography(
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
    );
  }
}

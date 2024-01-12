import 'package:flutter/material.dart';

interface class AppTypography extends ThemeExtension<AppTypography> {
  AppTypography({
    required this.labelLarge,
    required this.displaySmall,
    required this.titleMedium,
    required this.bodyLarge,
    required this.bodyMedium,
  });

  /// label
  final TextStyle labelLarge;

  /// display
  final TextStyle displaySmall;

  /// title
  final TextStyle titleMedium;

  /// body
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;

  @override
  ThemeExtension<AppTypography> copyWith({
    final TextStyle? labelLarge,
    final TextStyle? displaySmall,
    final TextStyle? titleMedium,
    final TextStyle? bodyLarge,
    final TextStyle? bodyMedium,
  }) {
    return AppTypography(
      labelLarge: labelLarge ?? this.labelLarge,
      displaySmall: displaySmall ?? this.displaySmall,
      titleMedium: titleMedium ?? this.titleMedium,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
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
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
    );
  }
}

class _AppRegularTypography extends AppTypography {
  _AppRegularTypography({
    super.labelLarge = const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    super.displaySmall = const TextStyle(
      fontSize: 36,
      height: 44 / 36,
      fontWeight: FontWeight.w400,
    ),
    super.titleMedium = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.bodyLarge = const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    super.bodyMedium = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
    ),
  });
}

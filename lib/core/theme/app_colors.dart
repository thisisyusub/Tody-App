import 'package:flutter/material.dart';

interface class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.surface,
    required this.primary,
    required this.onPrimary,
    required this.onSurface,
    required this.error,
    required this.primaryVariant,
    required this.onSurfaceMediumBrush,
    required this.primaryInverse,
    required this.onPrimaryContainer,
    required this.secondaryContainer,
    required this.onSurfacePressedBrush,
    required this.onSurfaceLowBrush,
    required this.surfaceVariant,
    required this.primaryVariantLight,
  });

  factory AppColors.light() {
    return _AppLightColors();
  }

  factory AppColors.dark() {
    return _AppDarkColors();
  }

  final Color surface;
  final Color primary;
  final Color onPrimary;
  final Color onSurface;
  final Color primaryVariant;
  final Color error;
  final Color onSurfaceMediumBrush;
  final Color primaryInverse;
  final Color onPrimaryContainer;
  final Color secondaryContainer;
  final Color onSurfacePressedBrush;
  final Color onSurfaceLowBrush;
  final Color surfaceVariant;
  final Color primaryVariantLight;

  @override
  ThemeExtension<AppColors> copyWith({
    final Color? surface,
    final Color? primary,
    final Color? onPrimary,
    final Color? onSurface,
    final Color? primaryVariant,
    final Color? error,
    final Color? onSurfaceMediumBrush,
    final Color? primaryInverse,
    final Color? onPrimaryContainer,
    final Color? secondaryContainer,
    final Color? onSurfacePressedBrush,
    final Color? onSurfaceLowBrush,
    final Color? surfaceVariant,
    final Color? primaryVariantLight,
  }) {
    return AppColors(
      surface: surface ?? this.surface,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      onSurface: onSurface ?? this.onSurface,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      error: error ?? this.error,
      onSurfaceMediumBrush: onSurfaceMediumBrush ?? this.onSurfaceMediumBrush,
      primaryInverse: primaryInverse ?? this.primaryInverse,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSurfacePressedBrush:
          onSurfacePressedBrush ?? this.onSurfacePressedBrush,
      onSurfaceLowBrush: onSurfaceLowBrush ?? this.onSurfaceLowBrush,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      primaryVariantLight: primaryVariantLight ?? this.primaryVariantLight,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      surface: Color.lerp(surface, other.surface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      error: Color.lerp(error, other.error, t)!,
      onSurfaceMediumBrush: Color.lerp(
        onSurfaceMediumBrush,
        other.onSurfaceMediumBrush,
        t,
      )!,
      primaryInverse: Color.lerp(primaryInverse, other.primaryInverse, t)!,
      onPrimaryContainer: Color.lerp(
        onPrimaryContainer,
        other.onPrimaryContainer,
        t,
      )!,
      secondaryContainer: Color.lerp(
        secondaryContainer,
        other.secondaryContainer,
        t,
      )!,
      onSurfacePressedBrush: Color.lerp(
        onSurfacePressedBrush,
        other.onSurfacePressedBrush,
        t,
      )!,
      onSurfaceLowBrush: Color.lerp(
        onSurfaceLowBrush,
        other.onSurfaceLowBrush,
        t,
      )!,
      surfaceVariant: Color.lerp(
        surfaceVariant,
        other.surfaceVariant,
        t,
      )!,
      primaryVariantLight: Color.lerp(
        primaryVariantLight,
        other.primaryVariantLight,
        t,
      )!,
    );
  }
}

class _AppLightColors extends AppColors {
  _AppLightColors({
    super.surface = const Color(0xFFFFFFFF),
    super.primary = const Color(0xFF5946D2),
    super.onPrimary = const Color(0xFFFFFFFF),
    super.onSurface = const Color(0xFF1C1B1F),
    super.error = const Color(0xFFF85977),
    super.primaryVariant = const Color(0xFF5835E5),
    super.onSurfaceMediumBrush = const Color.fromRGBO(28, 27, 31, 0.6),
    super.primaryInverse = const Color(0xFFC8BFFF),
    super.onPrimaryContainer = const Color(0xFF160067),
    super.secondaryContainer = const Color(0xFFE5DFF9),
    super.onSurfacePressedBrush = const Color.fromRGBO(28, 27, 31, 0.2),
    super.onSurfaceLowBrush = const Color.fromRGBO(28, 27, 31, 0.38),
    super.surfaceVariant = const Color(0xfffaf9fb),
    super.primaryVariantLight = const Color(0xFFB0A2F2),
  });
}

class _AppDarkColors extends AppColors {
  _AppDarkColors({
    super.surface = const Color(0xFF201F24),
    super.primary = const Color(0xFF5946D2),
    super.onPrimary = const Color(0xFFFFFFFF),
    super.onSurface = const Color(0xFFE6E1E5),
    super.error = const Color(0xFFD9415E),
    super.primaryVariant = const Color(0xFFCBBEFF),
    super.onSurfaceMediumBrush = const Color.fromRGBO(230, 225, 229, 0.6),
    super.primaryInverse = const Color(0xFF5946D2),
    super.onPrimaryContainer = const Color(0xFFE5DEFF),
    super.secondaryContainer = const Color(0xFF474459),
    super.onSurfacePressedBrush = const Color.fromRGBO(230, 225, 229, 0.2),
    super.onSurfaceLowBrush = const Color(0x61e6e1e5),
    super.surfaceVariant = const Color(0xff49454f),
    super.primaryVariantLight = const Color(0xff544794),
  });
}

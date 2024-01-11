import 'dart:ui';

abstract interface class AppColors {
  const AppColors._({
    required this.surface,
    required this.primary,
    required this.onPrimary,
    required this.onSurface,
    required this.error,
    required this.primaryVariant,
    required this.onSurfaceMediumBrush,
    required this.primaryInverse,
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
}

class _AppLightColors implements AppColors {
  @override
  Color get error => const Color(0xFFF85977);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onSurface => const Color(0xFF1C1B1F);

  @override
  Color get onSurfaceMediumBrush => const Color.fromRGBO(28, 27, 31, 0.6);

  @override
  Color get primary => const Color(0xFF5946D2);

  @override
  Color get primaryInverse => const Color(0xFFC8BFFF);

  @override
  Color get primaryVariant => const Color(0xFF5835E5);

  @override
  Color get surface => const Color(0xFFFFFFFF);
}

class _AppDarkColors implements AppColors {
  @override
  Color get error => const Color(0xFFD9415E);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get onSurface => const Color(0xFFE6E1E5);

  @override
  Color get onSurfaceMediumBrush => const Color.fromRGBO(230, 225, 229, 0.6);

  @override
  Color get primary => const Color(0xFF5946D2);

  @override
  Color get primaryInverse => const Color(0xFF5946D2);

  @override
  Color get primaryVariant => const Color(0xFFCBBEFF);

  @override
  Color get surface => const Color(0xFF201F24);
}

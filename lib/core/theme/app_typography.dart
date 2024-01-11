import 'package:flutter/rendering.dart';

interface class AppTypography {
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
}

// class _AppRegularTypography implements AppTypography {
//   @override
//   TextStyle get bodyLarge => const TextStyle(
//         fontSize: 16,
//         height: 24 / 16,
//       );
//
//   @override
//   TextStyle get displaySmall => const TextStyle(
//         fontSize: 36,
//         height: 44 / 36,
//       );
//
//   @override
//   TextStyle get labelLarge => const TextStyle(
//         fontSize: 14,
//         height: 20 / 14,
//       );
//
//   @override
//   TextStyle get titleMedium => const TextStyle(
//         fontSize: 16,
//         height: 24 / 16,
//       );
// }

// extension TextStyleExt on TextStyle {
//   TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
//   TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
//   TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
//   TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
// }

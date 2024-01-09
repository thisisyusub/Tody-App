import 'package:flutter/material.dart';

extension ThemeExt on ThemeData {
  Color select({
    required Color light,
    required Color dark,
  }) {
    return brightness == Brightness.light ? light : dark;
  }
}

import 'package:flutter/material.dart';

class SettingsScope extends InheritedWidget {
  const SettingsScope({
    super.key,
    required super.child,
    required this.themeMode,
  });

  final ThemeMode themeMode;

  static SettingsScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingsScope>();
  }

  @override
  bool updateShouldNotify(SettingsScope oldWidget) {
    return true;
  }
}

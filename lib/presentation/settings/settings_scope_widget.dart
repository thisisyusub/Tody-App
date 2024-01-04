import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/presentation/settings/settings_scope.dart';

class SettingsScopeWidget extends StatefulWidget {
  const SettingsScopeWidget({
    super.key,
    required this.child,
    required this.preferences,
  });

  final Widget child;
  final SharedPreferences preferences;

  static SettingsScopeWidgetState? of(BuildContext context) {
    return context.findRootAncestorStateOfType<SettingsScopeWidgetState>();
  }

  @override
  State<SettingsScopeWidget> createState() => SettingsScopeWidgetState();
}

class SettingsScopeWidgetState extends State<SettingsScopeWidget> {
  ThemeMode? _themeMode;

  void toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    await widget.preferences.setBool(
      AppKeys.isDarkMode,
      _themeMode == ThemeMode.dark ? true : false,
    );

    setState(() {});
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    setState(() {
      _themeMode = widget.preferences.getBool(AppKeys.isDarkMode) == true
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingsScope(
      themeMode: _themeMode ?? ThemeMode.light,
      child: widget.child,
    );
  }
}

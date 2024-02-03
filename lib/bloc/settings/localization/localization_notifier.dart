import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/core/constants/app_keys.dart';

class LocalizationNotifier extends ChangeNotifier {
  LocalizationNotifier(this.preferences) {
    final languageCode = preferences.getString(AppKeys.languageCode);

    if (languageCode != null) {
      _locale = Locale(languageCode);
    } else {
      _locale = const Locale('en');
    }
  }

  final SharedPreferences preferences;

  var _locale = const Locale('tr');
  Locale get locale => _locale;

  void changeTo(Locale locale) async {
    if (locale == _locale) return;

    try {
      await preferences.setString(
        AppKeys.languageCode,
        locale.languageCode,
      );

      _locale = locale;
      notifyListeners();
    } catch (_) {}
  }
}

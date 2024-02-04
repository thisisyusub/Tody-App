import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/data/repository/auth_repository.dart';

enum AuthState { initial, onboarding, authenticated, unauthenticated }

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this.authRepository);

  final AuthRepository authRepository;

  AuthState _authState = AuthState.initial;
  AuthState get authState => _authState;

  void checkAuth() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final isAuthenticated = await authRepository.isAuthenticated;

      if (isAuthenticated) {
        _authState = AuthState.authenticated;
        notifyListeners();
      } else {
        _checkIfAppOpenedPreviously();
      }
    } catch (_) {
      _checkIfAppOpenedPreviously();
    }
  }

  void _checkIfAppOpenedPreviously() async {
    final preferences = await SharedPreferences.getInstance();
    final isAppOpened = preferences.getBool(AppKeys.isAppOpened);
    await Future.delayed(const Duration(seconds: 1));

    if (isAppOpened == null || !isAppOpened) {
      _authState = AuthState.onboarding;
    } else {
      _authState = AuthState.unauthenticated;
    }

    notifyListeners();
  }

  void userLogged() {
    _authState = AuthState.authenticated;
    notifyListeners();
  }

  void logOut() async {
    try {
      await authRepository.logOut();
      _authState = AuthState.unauthenticated;
      notifyListeners();
    } catch (_) {}
  }
}

import 'package:flutter/foundation.dart';
import 'package:tody_app/data/repository/auth_repository.dart';

enum AuthState { initial, authenticated, unauthenticated }

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this.authRepository);

  final AuthRepository authRepository;

  AuthState _authState = AuthState.initial;
  AuthState get authState => _authState;

  void checkAuth() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final isAuthenticated = await authRepository.isAuthenticated;

      _authState =
          isAuthenticated ? AuthState.authenticated : AuthState.unauthenticated;
      notifyListeners();
    } catch (_) {
      _authState = AuthState.unauthenticated;
      notifyListeners();
    }
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

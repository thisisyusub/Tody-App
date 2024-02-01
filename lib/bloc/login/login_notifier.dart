import 'package:flutter/material.dart';
import 'package:tody_app/core/exception/general_exception.dart';
import 'package:tody_app/data/model/error_response.dart';
import 'package:tody_app/data/repository/auth_repository.dart';

import 'login_state.dart';

class LoginNotifier extends ChangeNotifier {
  LoginNotifier(this.authRepository);

  LoginState _loginState = InitialState();
  LoginState get loginState => _loginState;

  final AuthRepository authRepository;

  void login({
    required String username,
    required String password,
  }) async {
    try {
      _loginState = LoadingState();
      await authRepository.login(username, password);
      _loginState = SuccessState();
      notifyListeners();
    } on ErrorResponse catch (e) {
      _loginState = ErrorState(e.message);
      notifyListeners();
    } on GeneralException catch (e) {
      _loginState = ErrorState(e.message);
      notifyListeners();
    }
  }
}

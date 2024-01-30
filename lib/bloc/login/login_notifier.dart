import 'package:flutter/material.dart';
import 'package:tody_app/core/utils/base64_converter.dart';
import 'package:tody_app/data/data_source/auth_local_data_source.dart';
import 'package:tody_app/data/data_source/auth_remote_data_source.dart';
import 'package:tody_app/data/model/error_response.dart';

import 'login_state.dart';

class LoginNotifier extends ChangeNotifier {
  LoginNotifier({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.converter,
  });

  LoginState _loginState = InitialState();
  LoginState get loginState => _loginState;

  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final Base64Converter converter;

  void login({
    required String username,
    required String password,
  }) async {
    try {
      // 1 - SM
      _loginState = LoadingState();

      await authRemoteDataSource.login(username, password);

      // 2
      await _persistToken(username, password);

      // 1
      _loginState = SuccessState();
      notifyListeners();
    } on ErrorResponse catch (e) {
      // // 1
      _loginState = ErrorState(e.message);
      notifyListeners();
    } catch (e) {
      // // 1
      _loginState = ErrorState(e.toString());
      notifyListeners();
    }
  }

  // TODO: should be solved
  Future<void> _persistToken(String username, String password) async {
    final basicAuthConfig = '$username:$password';
    final token = converter.convert(basicAuthConfig.codeUnits);
    authLocalDataSource.persistToken(token);
  }
}

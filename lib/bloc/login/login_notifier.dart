import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tody_app/core/rest/http_rest_client.dart';
import 'package:tody_app/model/error_response.dart';

import '../../core/constants/app_keys.dart';
import 'login_state.dart';

class LoginNotifier extends ChangeNotifier {
  LoginState _loginState = InitialState();
  LoginState get loginState => _loginState;

  void login({
    required String username,
    required String password,
  }) async {
    try {
      // _loginState = LoadingState();
      // notifyListeners();

      // _loginState = LoadingState();
      // notifyListeners();

      final uri = Uri.http('localhost:8080', '/auth/login');
      final client = HttpRestClient(http.Client());

      await client.post(
        uri,
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      await _persistToken(username, password);
      _loginState = SuccessState();
      notifyListeners();
    } on ErrorResponse catch (e) {
      _loginState = ErrorState(e.message);
      notifyListeners();
    } catch (e) {
      _loginState = ErrorState(e.toString());
      notifyListeners();
    }
  }

  Future<void> _persistToken(String username, String password) async {
    final basicAuthConfig = '$username:$password';
    final token = base64Encode(basicAuthConfig.codeUnits);
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: AppKeys.token, value: token);
  }
}

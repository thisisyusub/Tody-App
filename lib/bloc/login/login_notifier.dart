import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/constants/app_keys.dart';
import 'login_state.dart';


class LoginNotifier extends ChangeNotifier {
  /// Login State
  LoginState _loginState = LoginInitial();
  LoginState get state => _loginState;
  String? errorMessage;

  /// Login
  void login({
    required String username,
    required String password,
  }) async {
    try {

      _loginState = LoginLoading();
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));
      final uri = Uri.http('192.168.100.14:8080', '/auth/login');
      final response = await http.post(
        uri,
        body: jsonEncode(
          {
            "username": username,
            "password": password,
          },
        ),
      );

      if (response.statusCode == 200) {
        await _persistToken(username, password);

        _loginState = LoginSuccess();

        notifyListeners();
      } else {
        final error = response.body;
        _loginState = LoginError(error);
        errorMessage = error;
        notifyListeners();
      }
    } catch (e) {
      _loginState = LoginError(e.toString());
      notifyListeners();
    } 
  }

  Future<void> _persistToken(String username, String password) async {
    final basicAuthConfig = "$username:$password";
    final token = base64Encode(basicAuthConfig.codeUnits);
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: AppKeys.token, value: token);
  }
}

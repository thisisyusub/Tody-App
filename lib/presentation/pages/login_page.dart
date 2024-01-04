// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _login() async {
    try {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      // http://localhost:8080/auth/login - POST
      /*
    {
    "userName": "Thisisyusub",
    "password": "123456"
    }*/

      final uri = Uri.http('localhost:8080', '/auth/login');
      final response = await http.post(
        uri,
        body: jsonEncode({
          'userName': username,
          'password': password,
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        await _persistToken(username, password);

        if (!context.mounted) return;
        Navigator.of(context).pushReplacementNamed(Routes.home.path);
      } else {
        final error = response.body;

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
            ),
          );
      }
    } catch (e) {
      debugPrintThrottled(e.toString());
    }
  }

  Future<void> _persistToken(String username, String password) async {
    final basicAuthConfig = '$username:$password';
    final token = base64Encode(basicAuthConfig.codeUnits);
    final secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: AppKeys.token, value: token);
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.onPrimary,
      ),
    );

    final errorBorder = border.copyWith(
      borderSide: BorderSide(
        color: Colors.redAccent,
      ),
    );

    return TextFieldTapRegion(
      onTapInside: (_) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    enabledBorder: border,
                    focusedBorder: border,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: border,
                    focusedBorder: border,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                    errorMaxLines: 2,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password is required and must be at least 6 characters';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_isPasswordVisible,
                  obscuringCharacter: '*',
                ),
                const SizedBox(height: 32),
                AppActionButton(
                  title: 'Login',
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }
}

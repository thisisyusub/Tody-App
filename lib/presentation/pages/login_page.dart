// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/login/login_notifier.dart';
import '../../bloc/login/login_state.dart';
import '../../core/constants/routes.dart';
import '../settings/Setting/settings_scope.dart';
import '../widgets/app_action_button.dart';

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

  @override
  void initState() {
    super.initState();
    context.read<LoginNotifier>().addListener(() {
      /// Login State Listener
      final loginNotifier = context.read<LoginNotifier>();
      final loginState = loginNotifier.state;

      /// Login State Listener for UI
      if (loginState is LoginSuccess ) {
        Navigator.pushReplacementNamed(context, Routes.home.path);
      } else if (loginState is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            loginState.errorMessage ,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Login State
    final loginState = context.watch<LoginNotifier>().state;

    /// ThemeMode from SettingsScope
    final themeMode = SettingsScope.of(context)!.themeMode;
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: themeMode == ThemeMode.dark ? Colors.white : Colors.black,
      ),
    );
    var errorBorder = border.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  labelStyle: TextStyle(
                    color: themeMode == ThemeMode.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 10,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'User name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: border,
                  focusedBorder: border,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                  labelStyle: TextStyle(
                    color: themeMode == ThemeMode.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 10,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password id required and must be at least 6 character';
                  }
                  return null;
                },
                obscureText: !_isPasswordVisible,
                obscuringCharacter: '*',
              ),
              const SizedBox(
                height: 26,
              ),
              if (loginState is LoginLoading)
                const CircularProgressIndicator()
              else
                AppActionButton(
                  onPressed: () {
                    setState(() {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginNotifier>().login(
                              username: _usernameController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                      }
                    });
                  },
                  title: 'Login',
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

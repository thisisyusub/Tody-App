// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/bloc/login/login_state.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/core/theme/app_colors.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';

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
  late LoginNotifier _loginNotifier;

  @override
  void initState() {
    super.initState();

    _loginNotifier = context.read<LoginNotifier>();

    _loginNotifier.addListener(
      () {
        final loginState = _loginNotifier.loginState;

        if (loginState is SuccessState) {
          Navigator.of(context).pushReplacementNamed(Routes.home.path);
        } else if (loginState is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                loginState.errorMessage,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginNotifier>().loginState;

    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.onSurface
            : DarkAppColors.onPrimary,
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
                if (loginState is LoadingState)
                  const CircularProgressIndicator()
                else
                  AppActionButton(
                    title: 'Login',
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginNotifier>().login(
                              username: _usernameController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
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

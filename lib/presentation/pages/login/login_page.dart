import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tody_app/bloc/auth/auth_notifier.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/bloc/login/login_state.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/core/utils/extensions/context_ext.dart';
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
          context.read<AuthNotifier>().userLogged();
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
        color: context.colors.onSurfaceLowBrush,
      ),
    );

    final errorBorder = border.copyWith(
      borderSide: const BorderSide(
        color: Colors.redAccent,
      ),
    );

    return TextFieldTapRegion(
      onTapInside: (_) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: context.colors.surface,
        appBar: AppBar(
          backgroundColor: context.colors.surface,
          title: Text(
            context.l10n.login,
            style: context.typography.displaySmall,
          ),
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
                    labelText: context.l10n.username,
                    enabledBorder: border,
                    focusedBorder: border,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.usernameRequired;
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: context.l10n.password,
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
                      return context.l10n.passwordRequired;
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
                    title: context.l10n.login,
                    widthFactor: WidthFactor.sized,
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

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tody_app/bloc/auth/auth_notifier.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/bloc/user/user_notifier.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/presentation/pages/login_page.dart';

import '../../core/constants/assets.dart';
import 'home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // void _checkIfAppOpenedPreviously() async {
  //   final preferences = await SharedPreferences.getInstance();
  //   final isAppOpened = preferences.getBool(AppKeys.isAppOpened);
  //   await Future.delayed(const Duration(seconds: 1));
  //
  //   if (mounted) {
  //     if (isAppOpened == null || !isAppOpened) {
  //       Navigator.pushReplacementNamed(
  //         context,
  //         Routes.onboarding.path,
  //       );
  //     } else {
  //       Navigator.pushReplacementNamed(
  //         context,
  //         Routes.login.path,
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthNotifier>().authState;

    final placeHolder = Scaffold(
      backgroundColor: context.colors.surface,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppIcons.splashLogo),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );

    if (authState == AuthState.initial) {
      return placeHolder;
    } else if (authState == AuthState.authenticated) {
      return ChangeNotifierProvider(
        lazy: true,
        create: (context) => UserNotifier()..fetchUser(),
        child: const HomePage(),
      );
    } else {
      return ChangeNotifierProvider(
        create: (context) => GetIt.instance<LoginNotifier>(),
        child: const LoginPage(),
      );
    }
  }
}

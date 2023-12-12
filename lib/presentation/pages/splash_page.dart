import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/routes.dart';
import 'login_page.dart';

import '../../core/constants/app_keys.dart';
import '../../core/constants/assets.dart';
import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkIfAppOpenedPreviously();
  }

  void _checkIfAppOpenedPreviously() async {
    final preferences = await SharedPreferences.getInstance();
    final isAppOpened = preferences.getBool(AppKeys.isAppOpened);
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      if (isAppOpened == null || !isAppOpened) {
        Navigator.pushReplacementNamed(
          context,
          Routes.onboarding.path,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          Routes.login.path,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
  }
}

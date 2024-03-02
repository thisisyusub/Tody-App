import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';

class OnboardingActionButton extends StatelessWidget {
  const OnboardingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppActionButton(
      onPressed: () async {
        final preferences = await SharedPreferences.getInstance();
        await preferences.setBool(AppKeys.isAppOpened, true);

        if (context.mounted) {
          Navigator.pushReplacementNamed(
            context,
            Routes.login.path,
          );
        }
      },
      title: 'Get Started',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/bloc/auth/auth_notifier.dart';
import 'package:tody_app/presentation/widgets/app_action_button.dart';

class OnboardingActionButton extends StatelessWidget {
  const OnboardingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppActionButton(
      onPressed: context.read<AuthNotifier>().onboardingChecked,
      title: 'Get Started',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tody_app/core/constants/assets.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/presentation/pages/onboarding/widgets/onboarding_action_button.dart';
import 'package:tody_app/presentation/pages/onboarding/widgets/onboarding_strategy.dart';

class OnboardingMobileStrategy extends OnboardingStrategy {
  const OnboardingMobileStrategy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(AppImages.onboarding)),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  'Welcome to\nUno To Do!',
                  style: context.typography.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Start using the best To Do app',
                  style: context.typography.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
                const OnboardingActionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tody_app/core/constants/assets.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/presentation/pages/onboarding/widgets/onboarding_action_button.dart';
import 'package:tody_app/presentation/pages/onboarding/widgets/onboarding_strategy.dart';

class OnboardingDesktopStrategy extends OnboardingStrategy {
  const OnboardingDesktopStrategy({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to\nUno To Do!',
                    style: context.typography.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Start using the best To Do app',
                    style: context.typography.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  const OnboardingActionButton(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: context.colors.primarySelectedBrush,
              child: Image.asset(AppImages.onboarding),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tody_app/core/constants/responsive_builder.dart';
import 'package:tody_app/presentation/pages/onboarding/widgets/onboarding_desktop_strategy.dart';
import 'package:tody_app/presentation/pages/onboarding/widgets/onboarding_mobile_strategy.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, deviceType) {
        return Scaffold(
          body: switch (deviceType) {
            DeviceType.desktop => const OnboardingDesktopStrategy(),
            _ => const OnboardingMobileStrategy(),
          },
        );
      },
    );
  }
}

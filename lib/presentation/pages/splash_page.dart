import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_icons.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
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

    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brendDefault,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.splashLogo),
            const SizedBox(height: 16),
            Text(
              'Tody App',
              style: AppTypography.sp26.w600.copyWith(
                color: AppColors.neutralWhite,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'The best to do list application for you',
              style: AppTypography.sp14.w400.copyWith(
                color: AppColors.neutralWhite,
                height: 20 / 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

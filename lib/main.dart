import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/presentation/pages/home_page.dart';
import 'package:tody_app/presentation/settings/settings_scope.dart';
import 'package:tody_app/presentation/settings/settings_scope_widget.dart';

import 'core/constants/routes.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_typography.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  runApp(
    SettingsScopeWidget(
      preferences: preferences,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: SettingsScope.of(context)!.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            textTheme: TextTheme(
              displaySmall: AppTypography.displaySmall.w400.copyWith(
                color: AppColors.onSurface,
              ),
              titleMedium: AppTypography.titleMedium.w500.copyWith(
                color: AppColors.primaryVariant,
              ),
            ),
            scaffoldBackgroundColor: AppColors.surface,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                textStyle: AppTypography.labelLarge.w500.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            textTheme: TextTheme(
              displaySmall: AppTypography.displaySmall.w400.copyWith(
                color: DarkAppColors.onSurface,
              ),
              titleMedium: AppTypography.titleMedium.w500.copyWith(
                color: DarkAppColors.primaryVariant,
              ),
            ),
            scaffoldBackgroundColor: DarkAppColors.surface,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: DarkAppColors.primary,
                textStyle: AppTypography.labelLarge.w500.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          ),
          initialRoute: Routes.splash.path,
          routes: {
            Routes.splash.path: (context) => const SplashPage(),
            Routes.onboarding.path: (context) => const OnBoardingPage(),
            Routes.login.path: (context) => const LoginPage(),
            Routes.home.path: (context) => const HomePage(),
          },
        );
      },
    );
  }
}

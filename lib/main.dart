import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/core/theme/theme.dart';
import 'package:tody_app/presentation/pages/home/home_page.dart';
import 'package:tody_app/presentation/settings/settings_scope.dart';
import 'package:tody_app/presentation/settings/settings_scope_widget.dart';

import 'core/constants/routes.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    // DevicePreview(
    // enabled: true,
    // builder: (context) =>
    SettingsScopeWidget(
      preferences: preferences,
      child: const MyApp(),
    ),
    // ),
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
    final themeMode = SettingsScope.of(context)!.themeMode;
    final colors =
        themeMode == ThemeMode.light ? AppColors.light() : AppColors.dark();

    final typography = AppTypography(
      displaySmall: TextStyle(
        fontSize: 36,
        height: 44 / 36,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        color: colors.primary,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        color: colors.primaryVariant,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        color: colors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        color: colors.surface,
      ),
    );

    return AppThemeScope(
      theme: AppTheme(
        colors: colors,
        typography: typography,
      ),
      child: MaterialApp(
        title: 'Tody App',
        debugShowCheckedModeBanner: false,
        themeMode: SettingsScope.of(context)!.themeMode,
        initialRoute: Routes.splash.path,
        builder: (context, child) {
          return MediaQuery.withClampedTextScaling(
            minScaleFactor: 1.0,
            maxScaleFactor: 1.3,
            child: child!,
          );
        },
        routes: {
          Routes.splash.path: (context) => const SplashPage(),
          Routes.onboarding.path: (context) => const OnBoardingPage(),
          Routes.login.path: (context) => ChangeNotifierProvider(
                create: (context) => LoginNotifier(),
                child: const LoginPage(),
              ),
          Routes.home.path: (context) => const HomePage(),
        },
      ),
    );
  }
}

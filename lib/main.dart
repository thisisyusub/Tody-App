import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/Design_System/light_theme.dart';
import 'presentation/settings/Theme/app_theme.dart';
import 'presentation/settings/Theme/theme_scope.dart';
import 'bloc/login/login_notifier.dart';
import 'core/theme/Design_System/typography_style.dart';
import 'presentation/pages/home/home_page.dart';

import 'core/constants/routes.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/splash_page.dart';
import 'presentation/settings/Setting/settings_scope_widget.dart';

// import 'presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => SettingsScopeWidget(
        preferences: preferences,
        child: const MyApp(),
      ),
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
    return AppThemeScope(
      theme: AppTheme(
        colors: LightTheme(),
        typography: TypoStyle(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        /// ThemeMode
        //themeMode: SettingsScope.of(context)?.themeMode,

        /// Themes
        //theme: lightThemaMode,
        //darkTheme: blackThemaMode,

        /// Routes
        initialRoute: Routes.splash.path,
        builder: ((context, child) {
          return MediaQuery.withClampedTextScaling(
            minScaleFactor: 0.8,
            maxScaleFactor: 2.5,
            child: child!,
          );
        }),
        routes: {
          Routes.splash.path: (context) => const SplashPage(),
          Routes.onboarding.path: (context) => const OnBoardingPage(),
          Routes.login.path: (context) => ChangeNotifierProvider(
                create: (context) => LoginNotifier(),
                child: const LoginPage(),
              ),
          Routes.home.path: (context) => const HomePageMain(),
        },
      ),
    );
  }
}

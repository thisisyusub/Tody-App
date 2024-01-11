import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/login/login_notifier.dart';
import 'counter_notifier.dart';
import 'presentation/pages/home_page.dart';

import 'core/constants/routes.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/splash_page.dart';
import 'presentation/settings/Setting/settings_scope.dart';
import 'presentation/settings/Setting/settings_scope_widget.dart';
import 'presentation/widgets/black_thema_mode.dart';
import 'presentation/widgets/light_thema_mode.dart';

// import 'presentation/pages/splash_page.dart';

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
    return ChangeNotifierProvider<CounterNotifier>(
      create: (context) => CounterNotifier(),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          /// ThemeMode
          themeMode: SettingsScope.of(context)?.themeMode,

          /// Themes
          theme: lightThemaMode,
          darkTheme: blackThemaMode,

          /// Routes
          initialRoute: Routes.splash.path,
          routes: {
            Routes.splash.path: (context) => const SplashPage(),
            Routes.onboarding.path: (context) => const OnBoardingPage(),
            Routes.login.path: (context) => ChangeNotifierProvider(
              create: (context) => LoginNotifier(),
              child: const LoginPage(),

              ),
            Routes.home.path: (context) => const HomePageMain(),
          },
        );
      }),
    );
  }
}



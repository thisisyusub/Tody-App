import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/core/theme/theme_scope.dart';
import 'package:tody_app/core/theme/theme_scope_widget.dart';
import 'package:tody_app/presentation/pages/home/home_page.dart';
import 'package:tody_app/presentation/pages/settings/settings_page.dart';
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
      child: const ThemeScopeWidget(
        child: MyApp(),
      ),
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
    final theme = ThemeScope.of(context);
    final extensions = <ThemeExtension<dynamic>>[
      theme.colors,
      theme.typography,
    ];

    return MaterialApp(
      title: 'Tody App',
      debugShowCheckedModeBanner: false,
      locale: const Locale('tr'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // localizationsDelegates: ,
      themeMode: theme.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        extensions: extensions,
        scaffoldBackgroundColor: theme.colors.surface,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        extensions: extensions,
        scaffoldBackgroundColor: theme.colors.surface,
      ),
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
        Routes.settings.path: (context) => const SettingsPage(),
      },
    );
  }
}

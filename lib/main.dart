import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/bloc/auth/auth_notifier.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/bloc/settings/localization/localization_notifier.dart';
import 'package:tody_app/bloc/settings/theme/theme_scope.dart';
import 'package:tody_app/bloc/settings/theme/theme_scope_widget.dart';
import 'package:tody_app/bloc/user/user_notifier.dart';
import 'package:tody_app/presentation/pages/home/home_page.dart';
import 'package:tody_app/presentation/pages/settings/settings_page.dart';

import 'core/constants/routes.dart';
import 'initialization.dart' as di;
import 'presentation/pages/login/login_page.dart';
import 'presentation/pages/onboarding/onboarding_page.dart';
import 'presentation/pages/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    // DevicePreview(
    // enabled: true,
    // builder: (context) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetIt.instance<AuthNotifier>()..checkAuth(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetIt.instance<LocalizationNotifier>(),
        ),
      ],
      child: ThemeScopeWidget(
        preferences: GetIt.instance<SharedPreferences>(),
        child: const MyApp(),
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
  final _routeState = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final authNotifier = context.read<AuthNotifier>();
    authNotifier.addListener(
      () {
        final authState = authNotifier.authState;

        switch (authState) {
          case AuthState.onboarding:
            _routeState.currentState?.pushNamedAndRemoveUntil(
              Routes.onboarding.path,
              (route) => false,
            );
          case AuthState.unauthenticated:
            _routeState.currentState?.pushNamedAndRemoveUntil(
              Routes.login.path,
              (route) => false,
            );
          case AuthState.authenticated:
            _routeState.currentState?.pushNamedAndRemoveUntil(
              Routes.home.path,
              (route) => false,
            );
          default:
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context);
    final extensions = <ThemeExtension<dynamic>>[
      theme.colors,
      theme.typography,
    ];

    return MaterialApp(
      navigatorKey: _routeState,
      title: 'Tody App',
      debugShowCheckedModeBanner: false,
      locale: context.watch<LocalizationNotifier>().locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: theme.themeMode,
      themeAnimationCurve: Curves.fastOutSlowIn,
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
              create: (context) => GetIt.instance<LoginNotifier>(),
              child: const LoginPage(),
            ),
        Routes.home.path: (context) => ChangeNotifierProvider(
              lazy: true,
              create: (context) => UserNotifier()..fetchUser(),
              child: const HomePage(),
            ),
        Routes.settings.path: (context) {
          final modalRoute = ModalRoute.of(context)!;
          final settings = modalRoute.settings;

          return ChangeNotifierProvider.value(
            value: settings.arguments as UserNotifier,
            child: const SettingsPage(),
          );
        },
      },
    );
  }
}

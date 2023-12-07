import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.surface,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: DarkAppColors.surface,
      ),
      home: const SplashPage(),
    );
  }
}

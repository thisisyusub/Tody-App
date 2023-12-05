import 'package:flutter/material.dart';

import 'core/theme/app_typography.dart';
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
      theme: ThemeData(
        fontFamily: AppTypography.fontFamily,
      ),
      home: const SplashPage(),
    );
  }
}

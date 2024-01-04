import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/main.dart';
import 'package:tody_app/presentation/settings/settings_scope.dart';
import 'package:tody_app/presentation/settings/settings_scope_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = SettingsScope.of(context)!.themeMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Switch.adaptive(
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              SettingsScopeWidget.of(context)!.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await const FlutterSecureStorage().write(
                key: AppKeys.token,
                value: null,
              );

              if (!context.mounted) return;
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.login.path,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

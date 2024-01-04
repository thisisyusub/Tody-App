import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/constants/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
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

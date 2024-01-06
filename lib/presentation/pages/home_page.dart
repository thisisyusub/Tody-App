import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/counter_notifier.dart';
import 'package:tody_app/presentation/settings/settings_scope.dart';
import 'package:tody_app/presentation/settings/settings_scope_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = SettingsScope.of(context)!.themeMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
      body: Column(
        children: [
          Center(
            child: Selector<CounterNotifier, int>(
              selector: (context, notifier) => notifier.counter,
              builder: (context, count, _) {
                print('counter rebuild...');
                return Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
          ),
          Center(
            child: Selector<CounterNotifier, String>(
              selector: (context, notifier) => notifier.message,
              builder: (context, message, _) {
                print('message rebuild...');
                return Text(
                  message.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
          ),

          /// add increment and decrement buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: context.read<CounterNotifier>().increment,
                child: const Text(
                  'Increment',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: context.read<CounterNotifier>().decrement,
                child: const Text(
                  'Decrement',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: context.read<CounterNotifier>().changeMessage,
                child: const Text(
                  'Change Message',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

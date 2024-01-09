import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/constants/routes.dart';
import 'package:tody_app/core/theme/app_colors.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 332.0,
                              height: 50.0,
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? AppColors.primary
                                          : DarkAppColors.primary,
                                      child: Center(
                                        child: Text(
                                          'AB',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? AppColors.onPrimary
                                                    : DarkAppColors.surface,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'Antonio Bonilla',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColors.primary
                                  : DarkAppColors.primary,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.error
                                    : DarkAppColors.error,
                          ),
                          const SizedBox(width: 16.0),
                          const Text(
                            'Important',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.onSurface.withOpacity(0.6)
                            : DarkAppColors.onSurface.withOpacity(0.6),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.house_siding_outlined,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.primary
                                    : DarkAppColors.primary,
                          ),
                          const SizedBox(width: 16.0),
                          const Text(
                            'Tasks',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.onSurface.withOpacity(0.6)
                            : DarkAppColors.onSurface.withOpacity(0.6),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Divider(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.onSurface.withOpacity(0.12)
                            : AppColors.onPrimary.withOpacity(0.12),
                        thickness: 1.0,
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.list,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.primaryInverse
                                    : DarkAppColors.primaryInverse,
                          ),
                          const SizedBox(width: 16.0),
                          const Text(
                            'Task List',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.onSurface.withOpacity(0.6)
                            : DarkAppColors.onSurface.withOpacity(0.6),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.list,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.primaryInverse
                                    : DarkAppColors.primaryInverse,
                          ),
                          const SizedBox(width: 16.0),
                          const Text(
                            'House List',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.onSurface.withOpacity(0.6)
                            : DarkAppColors.onSurface.withOpacity(0.6),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 24.0,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.primary
                        : DarkAppColors.primary,
                  ),
                  label: Text(
                    'New List',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.primary
                          : DarkAppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Center(
      //       child: Selector<CounterNotifier, int>(
      //         selector: (context, notifier) => notifier.counter,
      //         builder: (context, count, _) {
      //           print('counter rebuild...');
      //           return Text(
      //             count.toString(),
      //             style: const TextStyle(fontSize: 40),
      //           );
      //         },
      //       ),
      //     ),
      //     Center(
      //       child: Selector<CounterNotifier, String>(
      //         selector: (context, notifier) => notifier.message,
      //         builder: (context, message, _) {
      //           print('message rebuild...');
      //           return Text(
      //             message.toString(),
      //             style: const TextStyle(fontSize: 40),
      //           );
      //         },
      //       ),
      //     ),

      //     /// add increment and decrement buttons
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         ElevatedButton(
      //           onPressed: context.read<CounterNotifier>().increment,
      //           child: const Text(
      //             'Increment',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         ElevatedButton(
      //           onPressed: context.read<CounterNotifier>().decrement,
      //           child: const Text(
      //             'Decrement',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         ElevatedButton(
      //           onPressed: context.read<CounterNotifier>().changeMessage,
      //           child: const Text(
      //             'Change Message',
      //             style: TextStyle(
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

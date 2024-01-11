import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/constants/routes.dart';
import '../../core/theme/app_colors.dart';

import '../../core/constants/app_keys.dart';
import '../settings/Setting/settings_scope.dart';
import '../settings/Setting/settings_scope_widget.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMain> {
  @override
  Widget build(BuildContext context) {
    /// ThemeMode from SettingsScope
    final themeMode = SettingsScope.of(context)!.themeMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          /// Theme Switch
          Switch.adaptive(
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              SettingsScopeWidget.of(context)!.toggleThemeMode();
            },
          ),

          /// Logout
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await const FlutterSecureStorage().write(
                  key: AppKeys.token,
                  value: null,
                );

                if (!mounted) return;

                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.login.path,
                  (route) => false,
                );
              }),
        ],
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          /// Parviz Hashimi
          InkWell(
            onTap: () {
              print('Parviz Hashimi');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeMode == ThemeMode.dark
                            ? DarkAppColors.primary
                            : AppColors.primary,
                      ),
                      child: Center(
                          child: Text(
                        'PH',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: themeMode == ThemeMode.dark
                                ? DarkAppColors.surface
                                : AppColors.surface),
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Parviz Hashimi',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: themeMode == ThemeMode.dark
                              ? DarkAppColors.onSurface
                              : AppColors.onSurface),
                    ),
                  ]),
                  Icon(
                    Icons.search,
                    color: themeMode == ThemeMode.dark
                        ? DarkAppColors.primary
                        : AppColors.primary,
                  ),
                ],
              ),
            ),
          ),

          /// Important
          InkWell(
            onTap: () {
              print('Important');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Icon(
                      Icons.star_outlined,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Important',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: themeMode == ThemeMode.dark
                              ? DarkAppColors.onSurface
                              : AppColors.onSurface),
                    ),
                  ]),
                  Icon(Icons.chevron_right_outlined,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.onSurfaceMediumBrush
                          : AppColors.onSurfaceMediumBrush),
                ],
              ),
            ),
          ),

          /// Tasks
          InkWell(
            onTap: () {
              print('Tasks');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.house_siding_outlined,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.primary
                          : AppColors.primary,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Tasks',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: themeMode == ThemeMode.dark
                              ? DarkAppColors.onSurface
                              : AppColors.onSurface),
                    ),
                  ]),
                  Icon(Icons.chevron_right_outlined,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.onSurfaceMediumBrush
                          : AppColors.onSurfaceMediumBrush),
                ],
              ),
            ),
          ),

          /// Divider
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Divider(),
          ),

          /// Task List
          InkWell(
            onTap: () {
              print('Task List');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.list_outlined,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.primaryInverse
                          : AppColors.primaryInverse,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Task List',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: themeMode == ThemeMode.dark
                                    ? DarkAppColors.onSurface
                                    : AppColors.onSurface)),
                  ]),
                  Icon(Icons.chevron_right_outlined,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.onSurfaceMediumBrush
                          : AppColors.onSurfaceMediumBrush),
                ],
              ),
            ),
          ),

          /// House List
          InkWell(
            onTap: () {
              print('House List');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.list_outlined,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.primaryInverse
                          : AppColors.primaryInverse,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('House List',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: themeMode == ThemeMode.dark
                                    ? DarkAppColors.onSurface
                                    : AppColors.onSurface)),
                  ]),
                  Icon(Icons.chevron_right_outlined,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.onSurfaceMediumBrush
                          : AppColors.onSurfaceMediumBrush),
                ],
              ),
            ),
          ),
        ]),

        /// New List
        InkWell(
          onTap: () {
            print('New List');
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(Icons.add,
                      size: 20,
                      color: themeMode == ThemeMode.dark
                          ? DarkAppColors.primary
                          : AppColors.primary),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('New List',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: themeMode == ThemeMode.dark
                              ? DarkAppColors.primary
                              : AppColors.primary)),
                ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

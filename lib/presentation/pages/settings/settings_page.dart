import 'package:flutter/material.dart';
import 'package:tody_app/core/theme/theme_ext.dart';
import 'package:tody_app/core/theme/theme_scope.dart';
import 'package:tody_app/core/theme/theme_scope_widget.dart';
import 'package:tody_app/core/utils/extensions/context_ext.dart';
import 'package:tody_app/presentation/pages/settings/widgets/settings_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(Icons.close),
        ),
        title: Text(
          context.l10n.settings,
          style: context.typography.titleLarge,
        ),
        backgroundColor: context.colors.surface,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsBar<Locale>(
            title: 'Language',
            defaultSelectedType: const Locale('az'),
            onChipSelected: (locale) {},
            chips: const [
              SettingsItem(
                title: 'English',
                type: Locale('en'),
              ),
              SettingsItem(
                title: 'Azerbaijani',
                type: Locale('az'),
              ),
              SettingsItem(
                title: 'Turkish',
                type: Locale('tr'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SettingsBar<ThemeMode>(
            title: 'Mode',
            defaultSelectedType: ThemeScope.of(context).themeMode,
            onChipSelected: (themeMode) {
              ThemeScopeWidget.of(context)!.changeTo(themeMode);
            },
            chips: [
              SettingsItem(
                title: context.l10n.light,
                prefix: const Icon(Icons.light_mode),
                type: ThemeMode.light,
              ),
              SettingsItem(
                title: context.l10n.dark,
                prefix: const Icon(Icons.dark_mode_rounded),
                type: ThemeMode.dark,
              ),
              SettingsItem(
                title: context.l10n.system,
                type: ThemeMode.system,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

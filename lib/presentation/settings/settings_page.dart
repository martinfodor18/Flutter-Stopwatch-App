import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stopwatch_app/presentation/common/page_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastructure/provider/settings_provider.dart';
import '../../translation/locale_keys.g.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsProvider);
    final controller = ref.read(settingsProvider.notifier);

    return PageScaffold(
      appBarTitleKey: LocaleKeys.stopwatch,
      body: ListView(
        children: [
          //Theme switch
          SwitchListTile(
            title: Text(LocaleKeys.dark_mode.tr()),
            value: state.isDark,
            onChanged: (value) {
              controller.toggleTheme(value);
            },
          ),

          //Language selector
          ListTile(
            title: Text(LocaleKeys.language.tr()),
            trailing: DropdownButton<Locale>(
              value: state.locale,
              onChanged: (Locale? newLocale) {
                if (newLocale == null) return;
                controller.changeLanguage(newLocale);
                context.setLocale(newLocale);
              },
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('hu'), child: Text('Magyar')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

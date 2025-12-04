import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stopwatch_app/translation/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/settings/settings_page.dart';
import '../presentation/stopwatch/stopwatch_page.dart';
import '../presentation/theme/app_radius.dart';
import 'nav_index_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: const [StopwatchPage(), SettingsPage()],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppRadius.extraLarge),
          topRight: Radius.circular(AppRadius.extraLarge),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) {
            ref.read(navIndexProvider.notifier).state = i;
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.timer_outlined),
              selectedIcon: Icon(Icons.timer),
              label: LocaleKeys.stopwatch.tr(),
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: LocaleKeys.settings.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

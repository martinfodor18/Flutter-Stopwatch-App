import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'infrastructure/provider/settings_provider.dart';
import 'navigation/bottom_nav_bar.dart';
import 'presentation/app_theme.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return GestureDetector(
      onTap: () => _unfocus(context),
      child: MaterialApp(
        title: 'Stopwatch',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        // Theme
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: settings.isDark ? ThemeMode.dark : ThemeMode.light,

        home: const BottomNavBar(),
      ),
    );
  }

  void _unfocus(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
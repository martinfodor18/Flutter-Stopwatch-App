import 'package:flutter/material.dart';
import '../presentation/stopwatch/stopwatch_page.dart';
import '../presentation/settings/settings_page.dart';
import '../utils/logger.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.stopwatch:
        return _material(const StopwatchPage());
      case AppRoute.settings:
        return _material(const SettingsPage());
      default:
        logger.e('Unknown route: ${settings.name}');
        return _material(const StopwatchPage());
    }
  }

  static MaterialPageRoute _material(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}

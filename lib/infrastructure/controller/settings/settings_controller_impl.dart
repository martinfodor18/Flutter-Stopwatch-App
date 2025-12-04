import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../utils/logger.dart';
import 'settings_state.dart';
import 'settings_controller.dart';

class SettingsControllerImpl extends SettingsController {
  SettingsControllerImpl() : super(SettingsState.initial()) {
    loadPreferences();
  }

  static const _darkKey = "is_dark_mode";
  static const _langKey = "app_language";

  @override
  Future<void> loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final dark = prefs.getBool(_darkKey) ?? false;
      final langCode = prefs.getString(_langKey) ?? "hu";

      state = state.copyWith(isDark: dark, locale: Locale(langCode));
    } catch (e, st) {
      logger.e("Failed to load preferences", error: e, stackTrace: st);
    }
  }

  @override
  Future<void> toggleTheme(bool dark) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      state = state.copyWith(isDark: dark);
      await prefs.setBool(_darkKey, dark);
    } catch (e, st) {
      logger.e("Failed to update theme", error: e, stackTrace: st);
    }
  }

  @override
  Future<void> changeLanguage(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      state = state.copyWith(locale: locale);
      await prefs.setString(_langKey, locale.languageCode);
    } catch (e, st) {
      logger.e("Failed to update language", error: e, stackTrace: st);
    }
  }
}

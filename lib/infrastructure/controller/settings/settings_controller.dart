import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'settings_state.dart';

/// Handles loading and modifying user settings such as theme and language
abstract class SettingsController extends StateNotifier<SettingsState> {
  SettingsController(super.state);

  /// Loads stored settings from persistence
  Future<void> loadPreferences();

  /// Toggles light/dark theme and persists the value
  Future<void> toggleTheme(bool dark);

  /// Changes the app language and persists it
  Future<void> changeLanguage(Locale locale);
}
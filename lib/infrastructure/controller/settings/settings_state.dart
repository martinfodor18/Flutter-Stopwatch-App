import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({required bool isDark, required Locale locale}) =
      _SettingsState;

  factory SettingsState.initial() =>
      const SettingsState(isDark: false, locale: Locale("hu"));

  const SettingsState._();
}

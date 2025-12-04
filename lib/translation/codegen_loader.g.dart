// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> _en = {
    "dark_mode": "Dark mode",
    "language": "Language",
    "lap": "Lap",
    "lap_time": "Lap time:",
    "pause": "Pause",
    "reset": "Reset",
    "resume": "Resume",
    "settings": "Settings",
    "start": "Start",
    "stopwatch": "Stopwatch",
    "total_time": "Total time:",
  };
  static const Map<String, dynamic> _hu = {
    "dark_mode": "Sötét mód",
    "language": "Nyelv",
    "lap": "Kör",
    "lap_time": "Köridő:",
    "pause": "Szünet",
    "reset": "Visszaállít",
    "resume": "Folytatás",
    "settings": "Beállítások",
    "start": "Indít",
    "stopwatch": "Stopperóra",
    "total_time": "Teljes idő:",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": _en,
    "hu": _hu,
  };
}

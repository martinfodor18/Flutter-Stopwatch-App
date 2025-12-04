import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../infrastructure/provider/shared_prefs_provider.dart';

Future<bool?> readBool(Ref ref, String key) async {
  final prefs = await ref.read(sharedPrefsProvider);
  return prefs.getBool(key);
}

Future<String?> readString(Ref ref, String key) async {
  final prefs = await ref.read(sharedPrefsProvider);
  return prefs.getString(key);
}

Future<void> writeBool(Ref ref, String key, bool value) async {
  final prefs = await ref.read(sharedPrefsProvider);
  await prefs.setBool(key, value);
}

Future<void> writeString(Ref ref, String key, String value) async {
  final prefs = await ref.read(sharedPrefsProvider);
  await prefs.setString(key, value);
}
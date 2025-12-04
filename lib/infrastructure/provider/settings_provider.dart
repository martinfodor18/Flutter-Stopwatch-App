import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/settings/settings_controller_impl.dart';
import '../controller/settings/settings_state.dart';

final settingsProvider =
StateNotifierProvider<SettingsControllerImpl, SettingsState>(
      (ref) => SettingsControllerImpl(),
);
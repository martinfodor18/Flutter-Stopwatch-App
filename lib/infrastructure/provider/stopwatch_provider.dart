import 'package:flutter_stopwatch_app/infrastructure/controller/stopwatch/stopwatch_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/stopwatch/stopwatch_controller_impl.dart';

final stopwatchControllerProvider =
    StateNotifierProvider<StopwatchControllerImpl, StopwatchState>(
      (ref) => StopwatchControllerImpl(),
    );

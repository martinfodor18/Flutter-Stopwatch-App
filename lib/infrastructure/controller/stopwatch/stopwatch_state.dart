import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/lap_time.dart';

part 'stopwatch_state.freezed.dart';

@freezed
abstract class StopwatchState with _$StopwatchState {
  const factory StopwatchState({
    required Duration actualTotalTime,
    required Duration actualLapTime,
    required bool isRunning,
    required List<LapTime> previousLaps,
  }) = _StopwatchState;

  factory StopwatchState.initial() => const StopwatchState(
    actualTotalTime: .zero,
    actualLapTime: .zero,
    isRunning: false,
    previousLaps: [],
  );
}
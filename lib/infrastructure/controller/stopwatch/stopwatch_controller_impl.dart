import 'dart:async';

import 'package:flutter_stopwatch_app/infrastructure/controller/stopwatch/stopwatch_controller.dart';
import 'package:flutter_stopwatch_app/infrastructure/controller/stopwatch/stopwatch_state.dart';

import '../../model/lap_time.dart';

class StopwatchControllerImpl extends StopwatchController {
  StopwatchControllerImpl() : super(StopwatchState.initial());


  Timer? _timer;
  static const tick = Duration(milliseconds: 30);

  @override
  void startTimer() {
    if (state.isRunning) return;

    state = state.copyWith(isRunning: true);

    _timer = Timer.periodic(tick, (_) {
      state = state.copyWith(
        actualTotalTime:
            state.actualTotalTime + tick,
        actualLapTime: state.actualLapTime + tick,
      );
    });
  }

  @override
  void pauseTimer() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  @override
  void resetTimer() {
    _timer?.cancel();
    state = StopwatchState.initial();
  }

  @override
  void addLap() {
    if (!state.isRunning) return;
    state = state.copyWith(actualLapTime: Duration.zero, previousLaps: [...state.previousLaps, LapTime(lapTime: state.actualLapTime, totalTime: state.actualTotalTime)]);
  }

  @override
  void clearLaps() {
    state = state.copyWith(actualLapTime: state.actualTotalTime, previousLaps: []);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

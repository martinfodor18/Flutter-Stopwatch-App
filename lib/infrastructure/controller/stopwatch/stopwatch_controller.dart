import 'package:flutter_stopwatch_app/infrastructure/controller/stopwatch/stopwatch_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Controls the stopwatch logic and exposes the current state.
abstract class StopwatchController extends StateNotifier<StopwatchState> {
  StopwatchController(super.state);

  /// Starts the stopwatch timer.
  void startTimer();

  /// Pauses the stopwatch.
  void pauseTimer();

  /// Resets the stopwatch to zero.
  void resetTimer();

  /// Records the current lap time.
  void addLap();

  /// Clears all recorded laps.
  void clearLaps();
}
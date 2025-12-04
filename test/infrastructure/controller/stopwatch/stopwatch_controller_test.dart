import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_stopwatch_app/infrastructure/controller/stopwatch/stopwatch_controller_impl.dart';
import 'package:flutter_stopwatch_app/infrastructure/provider/stopwatch_provider.dart';

void main() {
  late ProviderContainer container;
  late StopwatchControllerImpl controller;

  setUp(() {
    container = ProviderContainer();
    controller = container.read(stopwatchControllerProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  // ---------------------------------------------------------------------------
  // 1) Task: Create a unit test to verify that pressing the start button starts
  // the stopwatch and the elapsed time increases over time.
  // ---------------------------------------------------------------------------
  test('Pressing start begins stopwatch and elapsed time increases', () {
    fakeAsync((async) {
      controller.startTimer();
      async.elapse(const Duration(milliseconds: 90));

      final state = container.read(stopwatchControllerProvider);
      expect(
        state.isRunning,
        true,
        reason: 'Stopwatch should be running after start button is pressed',
      );
      expect(
        state.actualTotalTime,
        const Duration(milliseconds: 90),
        reason: 'Elapsed time should increase according to elapsed fake time',
      );
    });
  });

  // ---------------------------------------------------------------------------
  // 2) Task: Write a unit test to ensure that pressing the pause button pauses
  // the stopwatch and the elapsed time stops increasing.
  // ---------------------------------------------------------------------------
  test('Pressing pause stops elapsed time from increasing', () {
    fakeAsync((async) {
      controller.startTimer();
      async.elapse(const Duration(milliseconds: 200));
      final elapsedBeforePause = container
          .read(stopwatchControllerProvider)
          .actualTotalTime;
      controller.pauseTimer();
      async.elapse(const Duration(milliseconds: 500));

      final state = container.read(stopwatchControllerProvider);
      expect(
        state.isRunning,
        false,
        reason: 'Stopwatch should be stopped after pause button is pressed',
      );
      expect(
        state.actualTotalTime,
        elapsedBeforePause,
        reason: "Elapsed should not increase while paused",
      );
    });
  });

  // ---------------------------------------------------------------------------
  // 3) Task: Implement a unit test to confirm that pressing the reset button
  // resets the stopwatch to 0 and stops the elapsed time.
  // ---------------------------------------------------------------------------
  test('Pressing reset stops stopwatch and resets elapsed time', () {
    fakeAsync((async) {
      controller.startTimer();
      async.elapse(const Duration(seconds: 1));
      controller.resetTimer();

      final state = container.read(stopwatchControllerProvider);
      expect(
        state.actualTotalTime,
        Duration.zero,
        reason: "Reset should clear elapsed time",
      );
      expect(
          state.isRunning,
          false,
          reason: "Reset should stop the stopwatch"
      );
      expect(
          state.previousLaps,
          isEmpty,
          reason: "Reset should clear all laps"
      );
    });
  });
}

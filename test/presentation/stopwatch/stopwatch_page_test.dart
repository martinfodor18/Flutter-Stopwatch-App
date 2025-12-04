import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_stopwatch_app/presentation/stopwatch/stopwatch_page.dart';
import 'package:flutter_stopwatch_app/infrastructure/provider/stopwatch_provider.dart';

void main() {
  setUpAll(() {
    EasyLocalization.logger.enableLevels = [];
  });

  // ---------------------------------------------------------------------------
  // 4) Task: Write a widget test to simulate user interactions by tapping the
  // buttons and verify that the UI responds correctly.
  // ---------------------------------------------------------------------------

  //NOTE: Avoid exact time checks in widget tests; timing is not deterministic.

  testWidgets(
    'All stopwatch action buttons are visible on screen, except for the button that clears the laps.',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: StopwatchPage())),
      );

      expect(find.byKey(const Key('start_button')), findsOneWidget);
      expect(find.byKey(const Key('pause_button')), findsOneWidget);
      expect(find.byKey(const Key('reset_button')), findsOneWidget);
      expect(find.byKey(const Key('lap_button')), findsOneWidget);
      expect(find.byKey(const Key('clear_laps_button')), findsNothing);
    },
  );

  testWidgets('Start button starts the stopwatch', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: StopwatchPage())),
    );

    final startButton = find.byKey(const Key('start_button'));

    await tester.tap(startButton);
    await tester.pump(const Duration(milliseconds: 60));

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StopwatchPage)),
    );
    final state = container.read(stopwatchControllerProvider);

    expect(state.isRunning, true);
    expect(state.actualTotalTime, greaterThan(Duration.zero));
  });

  testWidgets('Pause button pauses stopwatch', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: StopwatchPage())),
    );

    final startButton = find.byKey(const Key('start_button'));
    final pauseButton = find.byKey(const Key('pause_button'));

    await tester.tap(startButton);
    await tester.pump(const Duration(milliseconds: 60));

    await tester.tap(pauseButton);
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StopwatchPage)),
    );

    final state = container.read(stopwatchControllerProvider);
    expect(state.isRunning, false);
    expect(state.actualTotalTime, greaterThan(Duration.zero));
  });

  testWidgets('Resume button resumes the stopwatch', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: StopwatchPage())),
    );

    final startButton = find.byKey(const Key('start_button'));
    final pauseButton = find.byKey(
      const Key('pause_button'),
    ); //In the paused state this button functions as the resume button.

    await tester.tap(startButton);
    await tester.pump(const Duration(milliseconds: 60));

    await tester.tap(pauseButton);
    await tester.pump(const Duration(milliseconds: 60));

    await tester.tap(pauseButton);
    await tester.pump(const Duration(milliseconds: 60));

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StopwatchPage)),
    );

    final state = container.read(stopwatchControllerProvider);
    expect(state.isRunning, true);
    expect(state.actualTotalTime, greaterThan(Duration.zero));
  });

  testWidgets('Reset button resets elapsed time and clears laps', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: StopwatchPage())),
    );

    final startBtn = find.byKey(const Key('start_button'));
    final lapButton = find.byKey(const Key('lap_button'));
    final resetButton = find.byKey(const Key('reset_button'));

    await tester.tap(startBtn);
    await tester.pump(const Duration(milliseconds: 50));

    await tester.tap(lapButton);
    await tester.pump();

    await tester.tap(resetButton);
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StopwatchPage)),
    );
    final state = container.read(stopwatchControllerProvider);

    expect(state.isRunning, false);
    expect(state.actualTotalTime, Duration.zero);
    expect(state.previousLaps.isEmpty, true);
  });

  testWidgets('Lap button records a new lap when running', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: StopwatchPage())),
    );

    final startButton = find.byKey(const Key('start_button'));
    final lapButton = find.byKey(const Key('lap_button'));

    await tester.tap(startButton);
    await tester.pump(const Duration(milliseconds: 60));

    await tester.tap(lapButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 60));

    await tester.tap(lapButton);
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StopwatchPage)),
    );
    final state = container.read(stopwatchControllerProvider);

    expect(state.previousLaps.length, 2);
  });

  testWidgets('Clear laps button clears all laps', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: StopwatchPage())),
    );

    final startButton = find.byKey(const Key('start_button'));
    final lapButton = find.byKey(const Key('lap_button'));

    await tester.tap(startButton);
    await tester.pump(const Duration(milliseconds: 60));

    await tester.tap(lapButton);
    await tester.pump(const Duration(milliseconds: 200));

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StopwatchPage)),
    );
    final stateBefore = container.read(stopwatchControllerProvider);
    expect(stateBefore.previousLaps.length, 1);

    final clearLapsButton = find.byKey(const Key('clear_laps_button'));
    // FAB is conditionally rendered, so tap() may not hit it.
    // Calling onPressed directly is the reliable option:
    final fab = tester.widget<FloatingActionButton>(clearLapsButton);
    fab.onPressed
        ?.call();
    await tester.pump();

    final stateAfter = container.read(stopwatchControllerProvider);
    expect(stateAfter.previousLaps.length, 0);
  });

  // ---------------------------------------------------------------------------
  // 5) Task: Include a test case to handle edge cases, such as verifying that
  // pressing the start button multiple times without pausing or resetting
  // doesn't cause unexpected behavior.
  // ---------------------------------------------------------------------------

  testWidgets('Pressing start multiple times does not break behavior', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: StopwatchPage())),
    );

    final startButton = find.byKey(const Key('start_button'));

    await tester.tap(startButton);
    await tester.tap(startButton);
    await tester.tap(startButton);
    await tester.pump(const Duration(milliseconds: 60));

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StopwatchPage)),
    );
    final state = container.read(stopwatchControllerProvider);

    expect(state.isRunning, true);
    expect(state.actualTotalTime, greaterThan(Duration.zero));
  });
}

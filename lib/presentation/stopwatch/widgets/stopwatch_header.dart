import 'package:flutter/material.dart';
import 'package:flutter_stopwatch_app/presentation/stopwatch/widgets/stopwatch_analog_clock.dart';
import 'package:flutter_stopwatch_app/presentation/stopwatch/widgets/stopwatch_buttons.dart';

import '../../../infrastructure/controller/stopwatch/stopwatch_state.dart';
import '../../../utils/time_formatter.dart';

class StopwatchHeader extends StatelessWidget {
  final StopwatchState state;

  const StopwatchHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatStopwatchTime(state.actualTotalTime),
          style: const TextStyle(
            fontFamily: 'GoogleSansFlex',
            fontSize: 45,
            fontWeight: .bold,
            fontFeatures: [.tabularFigures()],
          ),
        ),

        const SizedBox(height: 10),

        if (state.previousLaps.isNotEmpty)
          Text(
            formatStopwatchTime(state.actualLapTime),
            style: const TextStyle(
              fontFamily: 'GoogleSansFlex',
              fontSize: 20,
              fontFeatures: [.tabularFigures()],
            ),
          ),

        const SizedBox(height: 20),

        StopwatchClock(totalTime: state.actualTotalTime),
      ],
    );
  }
}
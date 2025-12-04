import 'package:flutter/material.dart';
import 'package:flutter_stopwatch_app/presentation/stopwatch/widgets/stopwatch_analog_clock.dart';

import '../../../infrastructure/controller/stopwatch/stopwatch_state.dart';
import '../../../utils/time_formatter.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_theme.dart';

class StopwatchHeader extends StatelessWidget {
  final StopwatchState state;

  const StopwatchHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatStopwatchTime(state.actualTotalTime),
          style: AppTheme.counterLarge,
        ),

        const SizedBox(height: AppSpacing.small),

        if (state.previousLaps.isNotEmpty)
          Text(
            formatStopwatchTime(state.actualLapTime),
            style: AppTheme.counterSmall,
          ),

        const SizedBox(height: AppSpacing.normal),

        StopwatchClock(totalTime: state.actualTotalTime),
      ],
    );
  }
}
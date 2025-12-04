import 'package:flutter/material.dart';

import '../../../infrastructure/controller/stopwatch/stopwatch_controller.dart';
import '../../../infrastructure/controller/stopwatch/stopwatch_state.dart';
import '../../../translation/locale_keys.g.dart';
import '../../app_color.dart';
import '../../common/primary_button.dart';

class StopwatchButtons extends StatelessWidget {
  final StopwatchState state;
  final StopwatchController controller;

  const StopwatchButtons({
    super.key,
    required this.state,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: PrimaryButton(
                key: const Key('start_button'),
                onPressed: state.actualTotalTime == Duration.zero
                    ? controller.startTimer
                    : null,
                backgroundColor: AppColor.brandGreen,
                textKey: LocaleKeys.start,
                leadingIcon: const Icon(Icons.play_arrow),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: PrimaryButton(
                key: const Key('pause_button'),
                onPressed: state.isRunning
                    ? controller.pauseTimer
                    : (state.actualTotalTime != Duration.zero
                    ? controller.startTimer
                    : null),
                backgroundColor: AppColor.orange,
                textKey: state.isRunning || state.actualTotalTime == Duration.zero
                    ? LocaleKeys.pause
                    : LocaleKeys.resume,
                leadingIcon: Icon(
                  state.isRunning ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Flexible(
              child: PrimaryButton(
                key: const Key('reset_button'),
                onPressed: state.actualTotalTime != Duration.zero
                    ? controller.resetTimer
                    : null,
                backgroundColor: AppColor.red,
                textKey: LocaleKeys.reset,
                leadingIcon: const Icon(Icons.refresh),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: PrimaryButton(
                key: const Key('lap_button'),
                onPressed: state.isRunning ? controller.addLap : null,
                backgroundColor: AppColor.black,
                textKey: LocaleKeys.lap,
                leadingIcon: const Icon(Icons.more_time_outlined),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_stopwatch_app/presentation/stopwatch/widgets/stopwatch_buttons.dart';
import 'package:flutter_stopwatch_app/presentation/stopwatch/widgets/stopwatch_header.dart';
import 'package:flutter_stopwatch_app/presentation/stopwatch/widgets/stopwatch_lap_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastructure/controller/stopwatch/stopwatch_state.dart';
import '../../infrastructure/provider/stopwatch_provider.dart';
import '../../translation/locale_keys.g.dart';
import '../common/page_scaffold.dart';

class StopwatchPage extends HookConsumerWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stopwatchControllerProvider);
    final controller = ref.watch(stopwatchControllerProvider.notifier);

    final height = MediaQuery.of(context).size.height;
    final isSmallHeight = height < 700;

    return PageScaffold(
      appBarTitleKey: LocaleKeys.stopwatch,
      body: isSmallHeight
          ? _buildScrollableLayout(context, state, controller)
          : _buildFixedLayout(context, state, controller),
      floatingActionButton: state.previousLaps.isNotEmpty
          ? FloatingActionButton(
              key: const Key('clear_laps_button'),
              onPressed: () {
                controller.clearLaps();
              },
              child: Icon(Icons.timer_off_outlined),
            )
          : null,
    );
  }

  Widget _buildFixedLayout(
    BuildContext context,
    StopwatchState state,
    controller,
  ) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            const SizedBox(height: 20),
            StopwatchHeader(state: state),
            const SizedBox(height: 20),
            StopwatchButtons(state: state, controller: controller),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                itemCount: state.previousLaps.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, i) => _buildLapItem(context, state, i),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableLayout(
    BuildContext context,
    StopwatchState state,
    controller,
  ) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              const SizedBox(height: 20),
              StopwatchHeader(state: state),
              const SizedBox(height: 20),
              StopwatchButtons(state: state, controller: controller),
              const SizedBox(height: 20),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.previousLaps.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, i) => _buildLapItem(context, state, i),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLapItem(BuildContext context, StopwatchState state, int index) {
    final reversedIndex = state.previousLaps.length - index;
    final lap = state.previousLaps.reversed.toList()[index];

    return StopwatchLapItem(lap: lap, index: reversedIndex);
  }
}

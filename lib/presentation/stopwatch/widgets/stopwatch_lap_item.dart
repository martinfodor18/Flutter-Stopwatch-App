import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/model/lap_time.dart';
import '../../../translation/locale_keys.g.dart';
import '../../../utils/time_formatter.dart';
import '../../theme/app_theme.dart';

class StopwatchLapItem extends StatelessWidget {
  final LapTime lap;
  final int index;

  const StopwatchLapItem({
    super.key,
    required this.lap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "${LocaleKeys.lap.tr()} #$index",
        style: AppTheme.lapItemLapTimeTextStyle,
      ),
      subtitle: Text(
        "${LocaleKeys.lap_time.tr()} ${formatStopwatchTime(lap.lapTime)}",
        style: AppTheme.lapItemLapTimeTextStyle,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${LocaleKeys.total_time.tr()} ${formatStopwatchTime(lap.totalTime)}",
            style: AppTheme.lapItemTotalTimeTextStyle,
          ),
        ],
      ),
    );
  }
}
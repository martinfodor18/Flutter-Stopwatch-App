import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

import '../../app_color.dart';
import '../../app_image.dart';

class StopwatchClock extends StatelessWidget {
  final Duration totalTime;

  const StopwatchClock({
    super.key,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImage.otpBankLogo),

          AnalogClock(
            width: 140.0,
            isLive: false,
            hourHandColor: Colors.black,
            minuteHandColor: AppColor.black,
            secondHandColor: AppColor.red,
            showSecondHand: true,
            showNumbers: false,
            textScaleFactor: 1.8,
            showTicks: false,
            showDigitalClock: false,
            datetime: DateTime(
              0,
              0,
              0,
              0,
              0,
              totalTime.inSeconds,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lap_time.freezed.dart';

@freezed
abstract class LapTime with _$LapTime {
  const factory LapTime({
    required Duration lapTime,
    required Duration totalTime,
  }) = _LapTime;
}
String formatStopwatchTime(Duration d) {
  final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  final ms = (d.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0');
  return "$minutes:$seconds.$ms";
}
import 'package:hooks_riverpod/hooks_riverpod.dart';

var timeZoneDateTimeObservableProvider = StateProvider((ref) =>
    TimeZoneDateTimeObservable(
        dateTime: DateTime.now(), timeZone: 0, timeZone01Interval: .5));

class TimeZoneDateTimeObservable {
  final DateTime dateTime;
  final int timeZone;

  final double timeZone01Interval;

  TimeZoneDateTimeObservable(
      {required this.timeZone01Interval,
      required this.dateTime,
      required this.timeZone});
}

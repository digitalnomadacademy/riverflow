import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

var updateTimeZoneSignalProvider = Provider((ref) => UpdateTimeZoneSignal());

class UpdateTimeZoneSignal extends Signal1<TimeZonePayload> {}

class TimeZonePayload {
  final double interval;

  TimeZonePayload(this.interval);
}

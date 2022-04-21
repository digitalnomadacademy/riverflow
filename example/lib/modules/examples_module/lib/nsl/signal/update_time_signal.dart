import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';


var updateTimeZoneSignalProvider = Provider((ref) => UpdateTimeZoneSignal());

class TimeZonePayload {
  final int timeZone;

  TimeZonePayload(this.timeZone);
}

class UpdateTimeZoneSignal extends Signal1<TimeZonePayload> {}

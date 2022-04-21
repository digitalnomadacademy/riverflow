import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/command.dart';

import '../signal/time_zone_changed_signal.dart';
import '../store/time_zone_store.dart';

class UpdateTimeZoneCommand extends Command1<TimeZonePayload> {
  UpdateTimeZoneCommand(ProviderRef ref) : super(ref);

  @override
  void execute(TimeZonePayload payload) {
    readStore(timeZoneStoreProvider).updateTimeZone(payload.interval);
  }
}

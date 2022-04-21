import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/store.dart';

import 'package:root/root.dart';

import '../observable/time_zone_observable.dart';

var timeZoneStoreProvider = Provider((ref) => TimeZoneStore(ref));

class TimeZoneStore extends BaseStore {
  TimeZoneStore(ProviderRef ref) : super(ref);

  /// interval 0 -- 1
  void updateTimeZone(double interval) {
    var globalTime = read(globalDateTimeEntityProvider);
    int timeZoneDifference = ((interval * 10 - 5)).toInt();
    write(
        timeZoneDateTimeObservableProvider,
        TimeZoneDateTimeObservable(
            dateTime:
                (globalTime.dateTime.add(Duration(hours: timeZoneDifference))),
            timeZone01Interval: interval,
            timeZone: timeZoneDifference));
  }
}

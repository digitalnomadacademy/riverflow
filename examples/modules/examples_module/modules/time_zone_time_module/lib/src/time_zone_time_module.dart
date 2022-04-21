import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/widgets/module_widget.dart';

import 'package:root/root.dart';
import 'package:time_zone_time_module/src/signal/time_zone_changed_signal.dart';

import 'config/config.dart';
import 'observable/time_zone_observable.dart';

class TimeZoneModule extends StatelessWidget {
  final ProviderContainer parent;

  const TimeZoneModule({Key? key, required this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: configureTimeZoneModule,
      builder: (context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) => Text(ref
                  .watch(timeZoneDateTimeObservableProvider)
                  .timeZone
                  .toString()),
            ),
            Consumer(builder: (context, ref, _) {
              var interval = ref.watch(timeZoneDateTimeObservableProvider);
              return Slider(
                  value: interval.timeZone01Interval,
                  onChanged: (val) {
                    ref.watch(updateTimeZoneSignalProvider).dispatch(TimeZonePayload(val));
                  },
                  divisions: 10);
            }),
            Consumer(
              builder: (context, ref, _) => Text(
                  'GlobalTime:      ' +
                      ref
                          .watch(globalDateTimeEntityProvider)
                          .dateTime
                          .toIso8601String()
                          .substring(0, 16)
                          .replaceFirst('T', '\n'),
                  style: Theme.of(context).textTheme.headline5),
            ),
            Consumer(
              builder: (context, ref, _) => Text(
                  'TimeZoneTime: ' +
                      ref
                          .watch(timeZoneDateTimeObservableProvider)
                          .dateTime
                          .toIso8601String()
                          .substring(0, 16)
                          .replaceFirst('T', '\n'),
                  style: Theme.of(context).textTheme.headline5),
            )
          ],
        ),
      ),
    );
  }
}

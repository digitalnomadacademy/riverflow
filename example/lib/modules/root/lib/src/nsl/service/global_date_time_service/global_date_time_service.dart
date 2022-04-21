import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/service.dart';


var globalDateTimeServiceProvider =
    Provider((ref) => GlobalDateTimeService(ref));

class GlobalDateTimeService extends BaseService {
  late final Timer timer;

  GlobalDateTimeService(ref) : super(ref) {
    timer = Timer(const Duration(seconds: 1), () {
      write(globalDateTimeEntityProvider, DateTimeEntity(DateTime.now()));
    });
  }
}

var globalDateTimeEntityProvider =
    StateProvider((ref) => DateTimeEntity(DateTime.now()));

class DateTimeEntity {
  final DateTime dateTime;

  DateTimeEntity(this.dateTime);
}

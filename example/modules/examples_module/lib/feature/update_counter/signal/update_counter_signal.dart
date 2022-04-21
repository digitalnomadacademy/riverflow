import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

var updateCounterSignalProvider = Provider((ref) {
  return UpdateCounterSignal();
});

class UpdateCounterSignal extends Signal0 {}

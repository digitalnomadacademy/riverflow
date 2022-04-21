import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal.dart';

var updateSumSignalProvider = Provider((ref) {
  return UpdateSumSignal();
});

class UpdateSumSignal extends Signal1<UpdateSumPayload> {}

class UpdateSumPayload {
  final int a;
  final int b;

  UpdateSumPayload(this.a, this.b);
}

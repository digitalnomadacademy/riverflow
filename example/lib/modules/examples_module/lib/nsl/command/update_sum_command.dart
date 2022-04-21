import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/command.dart';

import '../signal/update_sum_signal.dart';
import '../store/sum_store.dart';

class UpdateSumCommand extends Command1<UpdateSumPayload> {
  UpdateSumCommand(ProviderRef ref) : super(ref);

  @override
  void execute(UpdateSumPayload payload) {
    ref.watch(sumStoreProvider).sum(payload.a, payload.b);
  }
}

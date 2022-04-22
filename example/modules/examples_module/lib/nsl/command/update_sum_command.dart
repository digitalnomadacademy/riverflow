import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';

import '../signal/update_sum_signal.dart';
import '../store/sum_store.dart';

void mapUpdateSumCommand(SignalCommandMap signalCommandMap) {
  signalCommandMap.map1(
      updateSumSignalProvider, (ref) => UpdateSumCommand(ref));
}

class UpdateSumCommand extends Command1<UpdateSumPayload> {
  UpdateSumCommand(ProviderContainer providerContainer)
      : super(providerContainer);

  @override
  void execute(UpdateSumPayload payload) {
    readStore(sumStoreProvider).sum(payload.a, payload.b);
  }
}

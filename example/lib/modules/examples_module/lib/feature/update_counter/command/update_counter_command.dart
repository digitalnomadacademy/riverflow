import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';

import '../signal/update_counter_signal.dart';
import '../store/counter-store.dart';

void mapUpdateCounterCommand(SignalCommandMap signalCommandMap) {
  signalCommandMap.map0(
      updateCounterSignalProvider, (ref) => UpdateCounterCommand(ref));
}

class UpdateCounterCommand extends Command0 {
  UpdateCounterCommand(ProviderRef ref) : super(ref);

  @override
  void execute() {
    readStore(counterStoreProvider).updateCounter();
  }
}

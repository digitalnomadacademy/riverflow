
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal_command_map.dart';


import '../command/async_button_command.dart';
import '../command/update_counter_command.dart';
import '../command/update_sum_command.dart';
import '../signal/async_button_signal.dart';
import '../signal/update_counter_signal.dart';
import '../signal/update_sum_signal.dart';

ProviderContainer configureExamples() {
  var providerContainer = ProviderContainer(overrides: [
    signalCommandMapProvider
        .overrideWithProvider(Provider((ref) => SignalCommandMap(ref)))
  ]);
  mapCommands(providerContainer);

  return providerContainer;
}

void mapCommands(ProviderContainer container) {
  var signalCommandMap = container.read(signalCommandMapProvider);

  signalCommandMap.map0(
    container.read(updateCounterSignalProvider),
    () => UpdateCounterCommand(signalCommandMap.ref),
  );

  signalCommandMap.map1(
    container.read(updateSumSignalProvider),
    () => UpdateSumCommand(signalCommandMap.ref),
  );

  signalCommandMap.mapAsync0(container.read(asyncButtonSignalProvider),
      () => AsyncButtonCommand(signalCommandMap.ref));
}

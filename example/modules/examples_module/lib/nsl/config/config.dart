import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal_command_map.dart';

import '../../feature/update_counter/command/update_counter_command.dart';
import '../command/async_button_command.dart';
import '../command/update_sum_command.dart';

ProviderContainer configureExamples(ProviderContainer parent) {
  var providerContainer = ProviderContainer(overrides: [
    signalCommandMapProvider.overrideWithProvider(
        Provider((ref) => SignalCommandMap(ref.container)))
  ], parent: parent);
  mapCommands(providerContainer);

  return providerContainer;
}

void mapCommands(ProviderContainer container) {
  var signalCommandMap = container.read(signalCommandMapProvider);

  // Commands
  mapUpdateCounterCommand(signalCommandMap);
  mapUpdateSumCommand(signalCommandMap);
  mapAsyncButtonClickedCommand(signalCommandMap);
}

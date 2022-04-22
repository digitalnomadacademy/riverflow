import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';

import '../signal/async_button_signal.dart';

void mapAsyncButtonClickedCommand(SignalCommandMap signalCommandMap) {
  signalCommandMap.mapAsync0(asyncButtonClickedSignalProvider,
      (providerContainer) => AsyncButtonClickedCommand(providerContainer));
}

class AsyncButtonClickedCommand extends AsyncCommand0 {
  AsyncButtonClickedCommand(ProviderContainer providerContainer)
      : super(providerContainer);

  @override
  Future<void> execute() async {
    // simulate wait from the API
    await Future.delayed(const Duration(seconds: 3));
  }
}

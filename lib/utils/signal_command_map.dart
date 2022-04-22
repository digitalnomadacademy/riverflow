import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/actor.dart';
import 'package:riverflow/utils/signal.dart';

import 'command.dart';

final signalCommandMapProvider = Provider((ProviderRef ref) {
  var signalCommandMap = SignalCommandMap(ref.container);

  return signalCommandMap;
});

class SignalCommandMap extends BaseActor {
  final List<SignalCommandMapping> mappings = [];

  SignalCommandMap(ProviderContainer providerContainer)
      : super(providerContainer);

  void map1<C extends Command1<T>, T>(Provider<Signal1<T>> signalProvider,
      C Function(ProviderContainer providerContainer) commandFactory) {
    var signal = providerContainer.read(signalProvider);
    var subscription = signal.listen(
        (payload) => commandFactory(providerContainer).execute(payload));
    mappings.add(SignalCommandMapping(
        subscription: subscription,
        signalType: signal.runtimeType,
        commandType: C));
  }

  void map0<C extends Command0>(Provider<Signal0> signalProvider,
      C Function(ProviderContainer providerContainer) commandFactory) {
    var signal = providerContainer.read(signalProvider);
    var subscription =
        signal.listen(() => commandFactory(providerContainer).execute());
    mappings.add(SignalCommandMapping(
        subscription: subscription,
        signalType: signal.runtimeType,
        commandType: C));
  }

  void mapAsync1<C extends AsyncCommand1<T>, T>(
      Provider<AsyncSignal1<T>> signalProvider,
      C Function(ProviderContainer providerContainer) commandFactory) {
    var signal = providerContainer.read(signalProvider);

    var subscription = signal.listen(
        (payload) => commandFactory(providerContainer).execute(payload));
    mappings.add(SignalCommandMapping(
        subscription: subscription,
        signalType: signal.runtimeType,
        commandType: C));
  }

  void mapAsync0<C extends AsyncCommand0>(Provider<AsyncSignal0> signalProvider,
      C Function(ProviderContainer providerContainer) commandFactory) {
    var signal = providerContainer.read(signalProvider);

    var subscription =
        signal.listen(() => commandFactory(providerContainer).execute());
    mappings.add(SignalCommandMapping(
        subscription: subscription,
        signalType: signal.runtimeType,
        commandType: C));
  }

  @override
  void dispose() {
    super.dispose();
    for (var mapping in mappings) {
      mapping.subscription.removeListener();
    }
    mappings.clear();
  }
}

class SignalCommandMapping {
  final BaseSubscription subscription;
  final Type signalType;
  final Type commandType;

  SignalCommandMapping(
      {required this.subscription,
      required this.signalType,
      required this.commandType});
}

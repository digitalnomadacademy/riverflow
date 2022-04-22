import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/actor.dart';
import 'package:riverflow/utils/signal.dart';

import 'command.dart';

final signalCommandMapProvider = Provider((ProviderRef ref) {
  var signalCommandMap = SignalCommandMap(ref.container);

  return signalCommandMap;
});

class SignalCommandMap extends BaseActor {
  final List<BaseSubscription> subscriptions = [];

  SignalCommandMap(ProviderContainer providerContainer)
      : super(providerContainer);

  void map1<T>(
      Provider<Signal1<T>> signalProvider,
      Command1<T> Function(ProviderContainer providerContainer)
          commandFactory) {
    var signal = providerContainer.read(signalProvider);
    var subscription = signal.listen(
        (payload) => commandFactory(providerContainer).execute(payload));
    subscriptions.add(subscription);
  }

  void map0(Provider<Signal0> signalProvider,
      Command0 Function(ProviderContainer providerContainer) commandFactory) {
    var signal = providerContainer.read(signalProvider);
    var subscription =
        signal.listen(() => commandFactory(providerContainer).execute());
    subscriptions.add(subscription);
  }

  void mapAsync1<T>(
      Provider<AsyncSignal1<T>> signalProvider,
      AsyncCommand1<T> Function(ProviderContainer providerContainer)
          commandFactory) {
    var signal = providerContainer.read(signalProvider);

    var subscription = signal.listen(
        (payload) => commandFactory(providerContainer).execute(payload));
    subscriptions.add(subscription);
  }

  void mapAsync0(
      Provider<AsyncSignal0> signalProvider,
      AsyncCommand0 Function(ProviderContainer providerContainer)
          commandFactory) {
    var signal = providerContainer.read(signalProvider);

    var subscription =
        signal.listen(() => commandFactory(providerContainer).execute());
    subscriptions.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    subscriptions.clear();
  }
}

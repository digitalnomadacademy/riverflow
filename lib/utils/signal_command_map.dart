import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nsl/utils/actor.dart';
import 'package:nsl/utils/signal.dart';

import 'command.dart';

final signalCommandMapProvider = Provider((ProviderRef ref) {
  var signalCommandMap = SignalCommandMap(ref);

  return signalCommandMap;
});

class SignalCommandMap extends BaseActor {
  final List<BaseSubscription> subscriptions = [];

  SignalCommandMap(ProviderRef ref) : super(ref);

  void map1<T>(Signal1<T> signal, Command1<T> Function() commandFactory) {
    var subscription =
        signal.listen((payload) => commandFactory().execute(payload));
    subscriptions.add(subscription);
  }

  void map0(Signal0 signal, Command0 Function() commandFactory) {
    var subscription = signal.listen(() => commandFactory().execute());
    subscriptions.add(subscription);
  }

  void mapAsync1<T>(
      AsyncSignal1<T> signal, AsyncCommand1<T> Function() commandFactory) {
    var subscription =
        signal.listen((payload) => commandFactory().execute(payload));
    subscriptions.add(subscription);
  }

  void mapAsync0(AsyncSignal0 signal, AsyncCommand0 Function() commandFactory) {
    var subscription = signal.listen(() => commandFactory().execute());
    subscriptions.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    subscriptions.clear();
  }
}

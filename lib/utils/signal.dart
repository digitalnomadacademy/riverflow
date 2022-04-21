import 'package:nsl/utils/logger.dart';

typedef SignalListener1<T> = void Function(T payload);
typedef SignalListener0 = void Function();
typedef AsyncSignalListener1<T> = Future<void> Function(T payload);
typedef AsyncSignalListener0 = Future<void> Function();

abstract class BaseSubscription {
  void removeListener();
}

class SignalSubscription1<T> extends BaseSubscription {
  SignalSubscription1(this.signal, this.listener);

  final Signal1<T> signal;
  final SignalListener1<T> listener;

  @override
  void removeListener() {
    signal.removeListener(listener);
  }
}

class AsyncSignalSubscription1<T> extends BaseSubscription {
  AsyncSignalSubscription1(this.signal, this.listener);

  final AsyncSignal1<T> signal;
  final AsyncSignalListener1<T> listener;

  @override
  void removeListener() {
    signal.removeListener(listener);
  }
}

class SignalSubscription0 extends BaseSubscription {
  SignalSubscription0(this.signal, this.listener);

  final Signal0 signal;
  final SignalListener0 listener;

  @override
  void removeListener() {
    signal.removeListener(listener);
  }
}

class AsyncSignalSubscription0 extends BaseSubscription {
  AsyncSignalSubscription0(this.signal, this.listener);

  final AsyncSignal0 signal;
  final AsyncSignalListener0 listener;

  @override
  void removeListener() {
    signal.removeListener(listener);
  }
}

abstract class Signal1<T> {
  final List<SignalListener1<T>> listeners = [];

  SignalSubscription1<T> listen(SignalListener1<T> listener) {
    listeners.add(listener);

    return SignalSubscription1<T>(this, listener);
  }

  void removeListener(SignalListener1<T> listener) {
    listeners.remove(listener);
  }

  void removeAll() {
    listeners.clear();
  }

  void dispatch(T payload) {
    for (var listener in listeners) {
      listener(payload);
    }
  }
}

abstract class AsyncSignal1<T> {
  final List<AsyncSignalListener1<T>> listeners = [];

  AsyncSignalSubscription1<T> listen(AsyncSignalListener1<T> listener) {
    listeners.add(listener);

    return AsyncSignalSubscription1<T>(this, listener);
  }

  void removeListener(SignalListener1<T> listener) {
    listeners.remove(listener);
  }

  void removeAll() {
    listeners.clear();
  }

  Future<void> dispatch(T payload) async {
    try {
      logger.v('executing ${listeners.length} listeners on $runtimeType'
          ' with payload \n $payload');
      await Future.wait(listeners.map((listener) => listener(payload)));
    } catch (e) {
      logger.e('listener failed for $runtimeType with \n $e '
          '\n with payload $payload');
    }
  }
}

abstract class Signal0 {
  final List<SignalListener0> listeners = [];

  SignalSubscription0 listen(SignalListener0 listener) {
    listeners.add(listener);

    return SignalSubscription0(this, listener);
  }

  void removeListener(SignalListener0 listener) {
    listeners.remove(listener);
  }

  void removeAll() {
    listeners.clear();
  }

  void dispatch() {
    for (var listener in listeners) {
      listener();
    }
  }
}

abstract class AsyncSignal0 {
  final List<AsyncSignalListener0> listeners = [];

  AsyncSignalSubscription0 listen(AsyncSignalListener0 listener) {
    listeners.add(listener);

    return AsyncSignalSubscription0(this, listener);
  }

  void removeListener(SignalListener0 listener) {
    listeners.remove(listener);
  }

  void removeAll() {
    listeners.clear();
  }

  Future<void> dispatch() async {
    try {
      logger.v('executing ${listeners.length} listeners on $runtimeType');
      await Future.wait(listeners.map((listener) => listener()));
    } catch (e) {
      logger.e('listener failed for $runtimeType with \n $e');
    }
  }
}

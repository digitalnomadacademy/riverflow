import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'logger.dart';

abstract class BaseActor {
  final ProviderRef ref;

  BaseActor(this.ref) {
    ref.onDispose(dispose);
  }

  T read<T>(StateProvider<T> provider) {
    return ref.watch(provider.notifier).state;
  }

  void write<T>(StateProvider<T> provider, T value, {bool cache = false}) {
    ref.watch(provider.notifier).state = value;
  }

  @mustCallSuper
  void dispose() {
    logger.d('disposing $runtimeType');
  }
}

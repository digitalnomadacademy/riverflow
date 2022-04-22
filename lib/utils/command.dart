import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/service.dart';
import 'package:riverflow/utils/signal.dart';
import 'package:riverflow/utils/store.dart';

/// Command will read Store and Service
/// Command can also chain execute other commands
///
/// todo make commands async
class _BaseCommand {
  @protected
  final ProviderContainer providerContainer;

  _BaseCommand(this.providerContainer);
  // T read<T>(Provider<T> provider) {
  //   return ref.watch(provider);
  // }

  T readStore<T extends BaseStore>(Provider<T> provider) {
    return providerContainer.read(provider);
  }

  T readService<T extends BaseService>(Provider<T> provider) {
    return providerContainer.read(provider);
  }

  T readSignal<T extends Signal1>(Provider<T> provider) {
    return providerContainer.read(provider);
  }
}

abstract class Command1<T> extends _BaseCommand {
  Command1(ProviderContainer container) : super(container);

  void execute(T payload);
}

abstract class Command0 extends _BaseCommand {
  Command0(ProviderContainer container) : super(container);

  void execute();
}

abstract class AsyncCommand1<T> extends _BaseCommand {
  AsyncCommand1(ProviderContainer container) : super(container);

  Future<void> execute(T payload);
}

abstract class AsyncCommand0 extends _BaseCommand {
  AsyncCommand0(ProviderContainer container) : super(container);

  Future<void> execute();
}

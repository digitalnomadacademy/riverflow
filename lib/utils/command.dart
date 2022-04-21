import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nsl/utils/service.dart';
import 'package:nsl/utils/signal.dart';
import 'package:nsl/utils/store.dart';

/// Command will read Store and Service
/// Command can also chain execute other commands
///
/// todo make commands async
class _BaseCommand {
  @protected
  final ProviderRef ref;

  _BaseCommand(this.ref);

  // T read<T>(Provider<T> provider) {
  //   return ref.watch(provider);
  // }

  T readStore<T extends BaseStore>(Provider<T> provider) {
    return ref.watch(provider);
  }

  T readService<T extends BaseService>(Provider<T> provider) {
    return ref.watch(provider);
  }

  T readSignal<T extends Signal1>(Provider<T> provider) {
    return ref.watch(provider);
  }
}

abstract class Command1<T> extends _BaseCommand {
  Command1(ProviderRef ref) : super(ref);

  void execute(T payload);
}

abstract class Command0 extends _BaseCommand {
  Command0(ProviderRef ref) : super(ref);

  void execute();
}

abstract class AsyncCommand1<T> extends _BaseCommand {
  AsyncCommand1(ProviderRef ref) : super(ref);

  Future<void> execute(T payload);
}

abstract class AsyncCommand0 extends _BaseCommand {
  AsyncCommand0(ProviderRef ref) : super(ref);

  Future<void> execute();
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/command.dart';


import '../store/counter-store.dart';

class UpdateCounterCommand extends Command0 {
  UpdateCounterCommand(ProviderRef ref) : super(ref);

  @override
  void execute() {
    readStore(counterStoreProvider).updateCounter();
  }
}

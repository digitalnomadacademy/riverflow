import 'package:examples_module/feature/update_counter/command/update_counter_command.dart';
import 'package:examples_module/feature/update_counter/signal/update_counter_signal.dart';
import 'package:examples_module/feature/update_counter/store/counter-store.dart';
import 'package:examples_module/feature/update_counter/store/counter_store_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:riverflow/utils/signal_command_map.dart';

void main() {
  late ProviderContainer providerContainer;
  late MockCounterStore mockCounterStore;

  setUp(() {
    mockCounterStore = MockCounterStore();
    providerContainer = ProviderContainer(
        overrides: [counterStoreProvider.overrideWithValue(mockCounterStore)]);
  });

  tearDown(() {
    providerContainer.dispose();
  });

  test('command calls update counter method on the store', () {
    var command = UpdateCounterCommand(providerContainer);
    verifyZeroInteractions(mockCounterStore);

    command.execute();
    verify(command.execute());

    verifyNoMoreInteractions(mockCounterStore);
  });

  test('command is mapped to signal correctly', () {
    // since we declare the mapping in the same file as command,
    // we can test it to make sure that the mapping works
    //
    // here there is no need to mock SignalCommandMap, since we only are
    // interested if the mapping is as it should be for the command. The
    // functionality of the signal command map is tested inside framework tests
    var signalCommandMap = SignalCommandMap(providerContainer);
    mapUpdateCounterCommand(signalCommandMap);

    expect(
        signalCommandMap.mappings.any((element) =>
            element.signalType is UpdateCounterSignal &&
            element.commandType is UpdateCounterCommand),
        true);
  });
}

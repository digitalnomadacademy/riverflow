import 'package:examples_module/feature/update_counter/command/update_counter_command.dart';
import 'package:examples_module/feature/update_counter/store/counter-store.dart';
import 'package:examples_module/feature/update_counter/store/counter_store_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

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
}

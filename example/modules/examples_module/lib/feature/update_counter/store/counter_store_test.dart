import 'package:examples_module/feature/update_counter/observable/counter_observable.dart';
import 'package:examples_module/feature/update_counter/store/counter-store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([], customMocks: [
  MockSpec<CounterStore>(
      fallbackGenerators: {#readObservable: mockReadObservable})
])
T mockReadObservable<T>(StateProvider<T>? provider) {
  return Object() as T;
}

void main() {
  late ProviderContainer providerContainer;
  late CounterStore counterStore;

  setUp(() {
    /// Make sure that inside the test the observable has default value 0
    /// we only test if the new value was ++
    /// if we change later the default value inside the observable, that should
    /// be tested over there
    ///
    /// we could mock the provider container and test if write to provider observable
    /// was called, but I think it complicates things and since riverpod is a library that is
    /// tested as well, we can rely on it working. especially if we version it correctly.
    providerContainer = ProviderContainer(overrides: [
      counterObservableProvider
          .overrideWithValue(StateController(CounterObservable(counter: 0)))
    ]);

    counterStore = CounterStore(providerContainer);
  });

  tearDown(() {
    providerContainer.dispose();
  });

  test('store updates the observer when increase is called', () {
    counterStore.updateCounter();
    expect(counterStore.counterO.counter, 1);
  });
  test('store updating counter twice makes correct value', () {
    counterStore.updateCounter();
    counterStore.updateCounter();
    expect(counterStore.counterO.counter, 2);
  });
}

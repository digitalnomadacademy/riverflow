import 'package:examples_module/feature/update_counter/store/counter-store.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([], customMocks: [
  MockSpec<CounterStore>(
      fallbackGenerators: {#readObservable: mockReadObservable})
])
T mockReadObservable<T>(StateProvider<T>? provider) {
  return Object() as T;
}

void main() {}

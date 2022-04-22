import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/store.dart';

import '../observable/counter_observable.dart';

final counterStoreProvider = Provider((ref) {
  var counterStore = CounterStore(ref.container);
  ref.onDispose(() {
    counterStore.dispose();
  });
  return counterStore;
});

class CounterStore extends BaseStore {
  CounterStore(ProviderContainer providerContainer) : super(providerContainer);

  CounterObservable get counterO => readObservable(counterObservableProvider);

  void updateCounter() => writeObservable(counterObservableProvider,
      counterO.copyWith(counter: counterO.counter + 1));
}

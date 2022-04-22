import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/store.dart';

import '../observables/sum_observable.dart';

final sumStoreProvider = Provider((ref) => SumStore(ref.container));

class SumStore extends BaseStore {
  SumStore(ProviderContainer providerContainer) : super(providerContainer);

  SumObservable get sumObservable => readObservable(sumObservableProvider);

  void sum(int a, int b) =>
      writeObservable(sumObservableProvider, SumObservable(a + b));
}

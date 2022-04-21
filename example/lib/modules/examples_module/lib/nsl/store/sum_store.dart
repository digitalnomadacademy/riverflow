import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/actor.dart';

import '../observables/sum_observable.dart';

final sumStoreProvider = Provider((ref) => SumStore(ref));

class SumStore extends BaseActor {
  SumStore(ProviderRef ref) : super(ref);

  SumObservable get sumObservable => readObservableeee(sumObservableProvider);

  void sum(int a, int b) =>
      writeObservableeee(sumObservableProvider, SumObservable(a + b));
}

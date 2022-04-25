import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/actor.dart';

void main() {
  test('readObservable reads correctObservable', () {
    var providerContainer = ProviderContainer();
    var actor = _TestActor(providerContainer);

    _TestObservable observable;

    //test for initial data
    observable = actor.readObservable(_testObservableProvider);
    expect(observable, providerContainer.read(_testObservableProvider));

    // update data directly
    providerContainer.read(_testObservableProvider.notifier).state =
        _TestObservable(3);

    // test for new data
    observable = actor.readObservable(_testObservableProvider);
    expect(observable, providerContainer.read(_testObservableProvider));
  });

  test('writeObservable writes correctObservable', () {
    var providerContainer = ProviderContainer();
    var actor = _TestActor(providerContainer);

    _TestObservable observable;
    //write initial data
    actor.writeObservable(_testObservableProvider, _TestObservable(4));

    // check if actor correctly updates the observable
    observable = actor.readObservable(_testObservableProvider);
    expect(observable.counter, 4);

    // update data directly
    providerContainer.read(_testObservableProvider.notifier).state =
        _TestObservable(3);

    // test for new data
    actor.writeObservable(_testObservableProvider, _TestObservable(7));

    observable = actor.readObservable(_testObservableProvider);
    expect(observable.counter, 7);
  });

  // power of types in dart. this cannot even compile

  // test('cannot read observable that is not stateProvider', () {
  //   var providerContainer = ProviderContainer();
  //   var actor = _TestActor(providerContainer);
  //
  //   actor.readObservable(_testRegularProvider);
  //
  // });
}

class _TestActor extends BaseActor {
  _TestActor(ProviderContainer providerContainer) : super(providerContainer);
}

var _testObservableProvider = StateProvider((red) => _TestObservable(0));

var _testRegularProvider = Provider((ref) => _TestObservable(0));

class _TestObservable {
  final int counter;

  _TestObservable(this.counter);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TestObservable &&
          runtimeType == other.runtimeType &&
          counter == other.counter;

  @override
  int get hashCode => counter.hashCode;
}

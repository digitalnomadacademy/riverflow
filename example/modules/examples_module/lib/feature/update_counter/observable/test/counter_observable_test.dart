import 'package:examples_module/feature/update_counter/observable/counter_observable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  test('test if default value of observable is 0', () {
    var providerContainer = ProviderContainer();
    var observable = providerContainer.read(counterObservableProvider);
    expect(observable.counter, 0);
  });
}

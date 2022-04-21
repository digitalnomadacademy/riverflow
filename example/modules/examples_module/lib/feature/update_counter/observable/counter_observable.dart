import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'counter_observable.freezed.dart';

final counterObservableProvider =
    StateProvider((ref) => CounterObservable(counter: 0));

@freezed
class CounterObservable with _$CounterObservable {
  factory CounterObservable({required int counter}) = _CounterObservable;
}

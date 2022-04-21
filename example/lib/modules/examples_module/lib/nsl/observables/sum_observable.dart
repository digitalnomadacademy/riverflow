import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'sum_observable.freezed.dart';

final sumObservableProvider = StateProvider((ref) => SumObservable(0));

@freezed
class SumObservable with _$SumObservable {
  factory SumObservable(int sum) = _SumObservable;
}

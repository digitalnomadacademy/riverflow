// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'counter_observable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CounterObservable {
  int get counter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterObservableCopyWith<CounterObservable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterObservableCopyWith<$Res> {
  factory $CounterObservableCopyWith(
          CounterObservable value, $Res Function(CounterObservable) then) =
      _$CounterObservableCopyWithImpl<$Res>;

  $Res call({int counter});
}

/// @nodoc
class _$CounterObservableCopyWithImpl<$Res>
    implements $CounterObservableCopyWith<$Res> {
  _$CounterObservableCopyWithImpl(this._value, this._then);

  final CounterObservable _value;

  // ignore: unused_field
  final $Res Function(CounterObservable) _then;

  @override
  $Res call({
    Object? counter = freezed,
  }) {
    return _then(_value.copyWith(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CounterObservableCopyWith<$Res>
    implements $CounterObservableCopyWith<$Res> {
  factory _$CounterObservableCopyWith(
          _CounterObservable value, $Res Function(_CounterObservable) then) =
      __$CounterObservableCopyWithImpl<$Res>;

  @override
  $Res call({int counter});
}

/// @nodoc
class __$CounterObservableCopyWithImpl<$Res>
    extends _$CounterObservableCopyWithImpl<$Res>
    implements _$CounterObservableCopyWith<$Res> {
  __$CounterObservableCopyWithImpl(
      _CounterObservable _value, $Res Function(_CounterObservable) _then)
      : super(_value, (v) => _then(v as _CounterObservable));

  @override
  _CounterObservable get _value => super._value as _CounterObservable;

  @override
  $Res call({
    Object? counter = freezed,
  }) {
    return _then(_CounterObservable(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CounterObservable implements _CounterObservable {
  _$_CounterObservable({required this.counter});

  @override
  final int counter;

  @override
  String toString() {
    return 'CounterObservable(counter: $counter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CounterObservable &&
            const DeepCollectionEquality().equals(other.counter, counter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(counter));

  @JsonKey(ignore: true)
  @override
  _$CounterObservableCopyWith<_CounterObservable> get copyWith =>
      __$CounterObservableCopyWithImpl<_CounterObservable>(this, _$identity);
}

abstract class _CounterObservable implements CounterObservable {
  factory _CounterObservable({required final int counter}) =
      _$_CounterObservable;

  @override
  int get counter => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$CounterObservableCopyWith<_CounterObservable> get copyWith =>
      throw _privateConstructorUsedError;
}

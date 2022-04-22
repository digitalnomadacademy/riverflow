// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sum_observable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SumObservable {
  int get sum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SumObservableCopyWith<SumObservable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SumObservableCopyWith<$Res> {
  factory $SumObservableCopyWith(
          SumObservable value, $Res Function(SumObservable) then) =
      _$SumObservableCopyWithImpl<$Res>;
  $Res call({int sum});
}

/// @nodoc
class _$SumObservableCopyWithImpl<$Res>
    implements $SumObservableCopyWith<$Res> {
  _$SumObservableCopyWithImpl(this._value, this._then);

  final SumObservable _value;
  // ignore: unused_field
  final $Res Function(SumObservable) _then;

  @override
  $Res call({
    Object? sum = freezed,
  }) {
    return _then(_value.copyWith(
      sum: sum == freezed
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SumObservableCopyWith<$Res>
    implements $SumObservableCopyWith<$Res> {
  factory _$SumObservableCopyWith(
          _SumObservable value, $Res Function(_SumObservable) then) =
      __$SumObservableCopyWithImpl<$Res>;
  @override
  $Res call({int sum});
}

/// @nodoc
class __$SumObservableCopyWithImpl<$Res>
    extends _$SumObservableCopyWithImpl<$Res>
    implements _$SumObservableCopyWith<$Res> {
  __$SumObservableCopyWithImpl(
      _SumObservable _value, $Res Function(_SumObservable) _then)
      : super(_value, (v) => _then(v as _SumObservable));

  @override
  _SumObservable get _value => super._value as _SumObservable;

  @override
  $Res call({
    Object? sum = freezed,
  }) {
    return _then(_SumObservable(
      sum == freezed
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SumObservable implements _SumObservable {
  _$_SumObservable(this.sum);

  @override
  final int sum;

  @override
  String toString() {
    return 'SumObservable(sum: $sum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SumObservable &&
            const DeepCollectionEquality().equals(other.sum, sum));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sum));

  @JsonKey(ignore: true)
  @override
  _$SumObservableCopyWith<_SumObservable> get copyWith =>
      __$SumObservableCopyWithImpl<_SumObservable>(this, _$identity);
}

abstract class _SumObservable implements SumObservable {
  factory _SumObservable(final int sum) = _$_SumObservable;

  @override
  int get sum => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SumObservableCopyWith<_SumObservable> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../bills_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BillsState {
  BillsLoadingState get state => throw _privateConstructorUsedError;
  List<BillModel> get allBills => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillsStateCopyWith<BillsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillsStateCopyWith<$Res> {
  factory $BillsStateCopyWith(
          BillsState value, $Res Function(BillsState) then) =
      _$BillsStateCopyWithImpl<$Res, BillsState>;
  @useResult
  $Res call({BillsLoadingState state, List<BillModel> allBills});
}

/// @nodoc
class _$BillsStateCopyWithImpl<$Res, $Val extends BillsState>
    implements $BillsStateCopyWith<$Res> {
  _$BillsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? allBills = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BillsLoadingState,
      allBills: null == allBills
          ? _value.allBills
          : allBills // ignore: cast_nullable_to_non_nullable
              as List<BillModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BillsStateCopyWith<$Res>
    implements $BillsStateCopyWith<$Res> {
  factory _$$_BillsStateCopyWith(
          _$_BillsState value, $Res Function(_$_BillsState) then) =
      __$$_BillsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BillsLoadingState state, List<BillModel> allBills});
}

/// @nodoc
class __$$_BillsStateCopyWithImpl<$Res>
    extends _$BillsStateCopyWithImpl<$Res, _$_BillsState>
    implements _$$_BillsStateCopyWith<$Res> {
  __$$_BillsStateCopyWithImpl(
      _$_BillsState _value, $Res Function(_$_BillsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? allBills = null,
  }) {
    return _then(_$_BillsState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BillsLoadingState,
      allBills: null == allBills
          ? _value._allBills
          : allBills // ignore: cast_nullable_to_non_nullable
              as List<BillModel>,
    ));
  }
}

/// @nodoc

class _$_BillsState implements _BillsState {
  const _$_BillsState(
      {this.state = BillsLoadingState.idle,
      final List<BillModel> allBills = const []})
      : _allBills = allBills;

  @override
  @JsonKey()
  final BillsLoadingState state;
  final List<BillModel> _allBills;
  @override
  @JsonKey()
  List<BillModel> get allBills {
    if (_allBills is EqualUnmodifiableListView) return _allBills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allBills);
  }

  @override
  String toString() {
    return 'BillsState(state: $state, allBills: $allBills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillsState &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._allBills, _allBills));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, state, const DeepCollectionEquality().hash(_allBills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BillsStateCopyWith<_$_BillsState> get copyWith =>
      __$$_BillsStateCopyWithImpl<_$_BillsState>(this, _$identity);
}

abstract class _BillsState implements BillsState {
  const factory _BillsState(
      {final BillsLoadingState state,
      final List<BillModel> allBills}) = _$_BillsState;

  @override
  BillsLoadingState get state;
  @override
  List<BillModel> get allBills;
  @override
  @JsonKey(ignore: true)
  _$$_BillsStateCopyWith<_$_BillsState> get copyWith =>
      throw _privateConstructorUsedError;
}

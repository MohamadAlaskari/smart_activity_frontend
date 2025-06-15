// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivityDetailState {
  Activity get activity => throw _privateConstructorUsedError;
  ScreenStatus get screenStatus => throw _privateConstructorUsedError;

  /// Create a copy of ActivityDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityDetailStateCopyWith<ActivityDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityDetailStateCopyWith<$Res> {
  factory $ActivityDetailStateCopyWith(
          ActivityDetailState value, $Res Function(ActivityDetailState) then) =
      _$ActivityDetailStateCopyWithImpl<$Res, ActivityDetailState>;
  @useResult
  $Res call({Activity activity, ScreenStatus screenStatus});

  $ActivityCopyWith<$Res> get activity;
  $ScreenStatusCopyWith<$Res> get screenStatus;
}

/// @nodoc
class _$ActivityDetailStateCopyWithImpl<$Res, $Val extends ActivityDetailState>
    implements $ActivityDetailStateCopyWith<$Res> {
  _$ActivityDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? screenStatus = null,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      screenStatus: null == screenStatus
          ? _value.screenStatus
          : screenStatus // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
    ) as $Val);
  }

  /// Create a copy of ActivityDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivityCopyWith<$Res> get activity {
    return $ActivityCopyWith<$Res>(_value.activity, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
    });
  }

  /// Create a copy of ActivityDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScreenStatusCopyWith<$Res> get screenStatus {
    return $ScreenStatusCopyWith<$Res>(_value.screenStatus, (value) {
      return _then(_value.copyWith(screenStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityDetailStateImplCopyWith<$Res>
    implements $ActivityDetailStateCopyWith<$Res> {
  factory _$$ActivityDetailStateImplCopyWith(_$ActivityDetailStateImpl value,
          $Res Function(_$ActivityDetailStateImpl) then) =
      __$$ActivityDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Activity activity, ScreenStatus screenStatus});

  @override
  $ActivityCopyWith<$Res> get activity;
  @override
  $ScreenStatusCopyWith<$Res> get screenStatus;
}

/// @nodoc
class __$$ActivityDetailStateImplCopyWithImpl<$Res>
    extends _$ActivityDetailStateCopyWithImpl<$Res, _$ActivityDetailStateImpl>
    implements _$$ActivityDetailStateImplCopyWith<$Res> {
  __$$ActivityDetailStateImplCopyWithImpl(_$ActivityDetailStateImpl _value,
      $Res Function(_$ActivityDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? screenStatus = null,
  }) {
    return _then(_$ActivityDetailStateImpl(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      screenStatus: null == screenStatus
          ? _value.screenStatus
          : screenStatus // ignore: cast_nullable_to_non_nullable
              as ScreenStatus,
    ));
  }
}

/// @nodoc

class _$ActivityDetailStateImpl extends _ActivityDetailState {
  _$ActivityDetailStateImpl(
      {required this.activity, this.screenStatus = const ScreenStatus.pure()})
      : super._();

  @override
  final Activity activity;
  @override
  @JsonKey()
  final ScreenStatus screenStatus;

  @override
  String toString() {
    return 'ActivityDetailState(activity: $activity, screenStatus: $screenStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityDetailStateImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.screenStatus, screenStatus) ||
                other.screenStatus == screenStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, screenStatus);

  /// Create a copy of ActivityDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityDetailStateImplCopyWith<_$ActivityDetailStateImpl> get copyWith =>
      __$$ActivityDetailStateImplCopyWithImpl<_$ActivityDetailStateImpl>(
          this, _$identity);
}

abstract class _ActivityDetailState extends ActivityDetailState {
  factory _ActivityDetailState(
      {required final Activity activity,
      final ScreenStatus screenStatus}) = _$ActivityDetailStateImpl;
  _ActivityDetailState._() : super._();

  @override
  Activity get activity;
  @override
  ScreenStatus get screenStatus;

  /// Create a copy of ActivityDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityDetailStateImplCopyWith<_$ActivityDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScreenStatus _$ScreenStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pure':
      return ScreenStatusPure.fromJson(json);
    case 'loading':
      return ScreenStatusLoading.fromJson(json);
    case 'success':
      return ScreenStatusSuccess.fromJson(json);
    case 'error':
      return ScreenStatusError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ScreenStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ScreenStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pure,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? messageKey) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pure,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? messageKey)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pure,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? messageKey)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenStatusPure value) pure,
    required TResult Function(ScreenStatusLoading value) loading,
    required TResult Function(ScreenStatusSuccess value) success,
    required TResult Function(ScreenStatusError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenStatusPure value)? pure,
    TResult? Function(ScreenStatusLoading value)? loading,
    TResult? Function(ScreenStatusSuccess value)? success,
    TResult? Function(ScreenStatusError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenStatusPure value)? pure,
    TResult Function(ScreenStatusLoading value)? loading,
    TResult Function(ScreenStatusSuccess value)? success,
    TResult Function(ScreenStatusError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ScreenStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenStatusCopyWith<$Res> {
  factory $ScreenStatusCopyWith(
          ScreenStatus value, $Res Function(ScreenStatus) then) =
      _$ScreenStatusCopyWithImpl<$Res, ScreenStatus>;
}

/// @nodoc
class _$ScreenStatusCopyWithImpl<$Res, $Val extends ScreenStatus>
    implements $ScreenStatusCopyWith<$Res> {
  _$ScreenStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScreenStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ScreenStatusPureImplCopyWith<$Res> {
  factory _$$ScreenStatusPureImplCopyWith(_$ScreenStatusPureImpl value,
          $Res Function(_$ScreenStatusPureImpl) then) =
      __$$ScreenStatusPureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScreenStatusPureImplCopyWithImpl<$Res>
    extends _$ScreenStatusCopyWithImpl<$Res, _$ScreenStatusPureImpl>
    implements _$$ScreenStatusPureImplCopyWith<$Res> {
  __$$ScreenStatusPureImplCopyWithImpl(_$ScreenStatusPureImpl _value,
      $Res Function(_$ScreenStatusPureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScreenStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ScreenStatusPureImpl implements ScreenStatusPure {
  const _$ScreenStatusPureImpl({final String? $type}) : $type = $type ?? 'pure';

  factory _$ScreenStatusPureImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreenStatusPureImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScreenStatus.pure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScreenStatusPureImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pure,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? messageKey) error,
  }) {
    return pure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pure,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? messageKey)? error,
  }) {
    return pure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pure,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? messageKey)? error,
    required TResult orElse(),
  }) {
    if (pure != null) {
      return pure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenStatusPure value) pure,
    required TResult Function(ScreenStatusLoading value) loading,
    required TResult Function(ScreenStatusSuccess value) success,
    required TResult Function(ScreenStatusError value) error,
  }) {
    return pure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenStatusPure value)? pure,
    TResult? Function(ScreenStatusLoading value)? loading,
    TResult? Function(ScreenStatusSuccess value)? success,
    TResult? Function(ScreenStatusError value)? error,
  }) {
    return pure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenStatusPure value)? pure,
    TResult Function(ScreenStatusLoading value)? loading,
    TResult Function(ScreenStatusSuccess value)? success,
    TResult Function(ScreenStatusError value)? error,
    required TResult orElse(),
  }) {
    if (pure != null) {
      return pure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreenStatusPureImplToJson(
      this,
    );
  }
}

abstract class ScreenStatusPure implements ScreenStatus {
  const factory ScreenStatusPure() = _$ScreenStatusPureImpl;

  factory ScreenStatusPure.fromJson(Map<String, dynamic> json) =
      _$ScreenStatusPureImpl.fromJson;
}

/// @nodoc
abstract class _$$ScreenStatusLoadingImplCopyWith<$Res> {
  factory _$$ScreenStatusLoadingImplCopyWith(_$ScreenStatusLoadingImpl value,
          $Res Function(_$ScreenStatusLoadingImpl) then) =
      __$$ScreenStatusLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScreenStatusLoadingImplCopyWithImpl<$Res>
    extends _$ScreenStatusCopyWithImpl<$Res, _$ScreenStatusLoadingImpl>
    implements _$$ScreenStatusLoadingImplCopyWith<$Res> {
  __$$ScreenStatusLoadingImplCopyWithImpl(_$ScreenStatusLoadingImpl _value,
      $Res Function(_$ScreenStatusLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScreenStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ScreenStatusLoadingImpl implements ScreenStatusLoading {
  const _$ScreenStatusLoadingImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$ScreenStatusLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreenStatusLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScreenStatus.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenStatusLoadingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pure,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? messageKey) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pure,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? messageKey)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pure,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? messageKey)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenStatusPure value) pure,
    required TResult Function(ScreenStatusLoading value) loading,
    required TResult Function(ScreenStatusSuccess value) success,
    required TResult Function(ScreenStatusError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenStatusPure value)? pure,
    TResult? Function(ScreenStatusLoading value)? loading,
    TResult? Function(ScreenStatusSuccess value)? success,
    TResult? Function(ScreenStatusError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenStatusPure value)? pure,
    TResult Function(ScreenStatusLoading value)? loading,
    TResult Function(ScreenStatusSuccess value)? success,
    TResult Function(ScreenStatusError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreenStatusLoadingImplToJson(
      this,
    );
  }
}

abstract class ScreenStatusLoading implements ScreenStatus {
  const factory ScreenStatusLoading() = _$ScreenStatusLoadingImpl;

  factory ScreenStatusLoading.fromJson(Map<String, dynamic> json) =
      _$ScreenStatusLoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$ScreenStatusSuccessImplCopyWith<$Res> {
  factory _$$ScreenStatusSuccessImplCopyWith(_$ScreenStatusSuccessImpl value,
          $Res Function(_$ScreenStatusSuccessImpl) then) =
      __$$ScreenStatusSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScreenStatusSuccessImplCopyWithImpl<$Res>
    extends _$ScreenStatusCopyWithImpl<$Res, _$ScreenStatusSuccessImpl>
    implements _$$ScreenStatusSuccessImplCopyWith<$Res> {
  __$$ScreenStatusSuccessImplCopyWithImpl(_$ScreenStatusSuccessImpl _value,
      $Res Function(_$ScreenStatusSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScreenStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ScreenStatusSuccessImpl implements ScreenStatusSuccess {
  const _$ScreenStatusSuccessImpl({final String? $type})
      : $type = $type ?? 'success';

  factory _$ScreenStatusSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreenStatusSuccessImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScreenStatus.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenStatusSuccessImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pure,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? messageKey) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pure,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? messageKey)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pure,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? messageKey)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenStatusPure value) pure,
    required TResult Function(ScreenStatusLoading value) loading,
    required TResult Function(ScreenStatusSuccess value) success,
    required TResult Function(ScreenStatusError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenStatusPure value)? pure,
    TResult? Function(ScreenStatusLoading value)? loading,
    TResult? Function(ScreenStatusSuccess value)? success,
    TResult? Function(ScreenStatusError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenStatusPure value)? pure,
    TResult Function(ScreenStatusLoading value)? loading,
    TResult Function(ScreenStatusSuccess value)? success,
    TResult Function(ScreenStatusError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreenStatusSuccessImplToJson(
      this,
    );
  }
}

abstract class ScreenStatusSuccess implements ScreenStatus {
  const factory ScreenStatusSuccess() = _$ScreenStatusSuccessImpl;

  factory ScreenStatusSuccess.fromJson(Map<String, dynamic> json) =
      _$ScreenStatusSuccessImpl.fromJson;
}

/// @nodoc
abstract class _$$ScreenStatusErrorImplCopyWith<$Res> {
  factory _$$ScreenStatusErrorImplCopyWith(_$ScreenStatusErrorImpl value,
          $Res Function(_$ScreenStatusErrorImpl) then) =
      __$$ScreenStatusErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? messageKey});
}

/// @nodoc
class __$$ScreenStatusErrorImplCopyWithImpl<$Res>
    extends _$ScreenStatusCopyWithImpl<$Res, _$ScreenStatusErrorImpl>
    implements _$$ScreenStatusErrorImplCopyWith<$Res> {
  __$$ScreenStatusErrorImplCopyWithImpl(_$ScreenStatusErrorImpl _value,
      $Res Function(_$ScreenStatusErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScreenStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageKey = freezed,
  }) {
    return _then(_$ScreenStatusErrorImpl(
      freezed == messageKey
          ? _value.messageKey
          : messageKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreenStatusErrorImpl implements ScreenStatusError {
  const _$ScreenStatusErrorImpl([this.messageKey, final String? $type])
      : $type = $type ?? 'error';

  factory _$ScreenStatusErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreenStatusErrorImplFromJson(json);

  @override
  final String? messageKey;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ScreenStatus.error(messageKey: $messageKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenStatusErrorImpl &&
            (identical(other.messageKey, messageKey) ||
                other.messageKey == messageKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageKey);

  /// Create a copy of ScreenStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenStatusErrorImplCopyWith<_$ScreenStatusErrorImpl> get copyWith =>
      __$$ScreenStatusErrorImplCopyWithImpl<_$ScreenStatusErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pure,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? messageKey) error,
  }) {
    return error(messageKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pure,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? messageKey)? error,
  }) {
    return error?.call(messageKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pure,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? messageKey)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(messageKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenStatusPure value) pure,
    required TResult Function(ScreenStatusLoading value) loading,
    required TResult Function(ScreenStatusSuccess value) success,
    required TResult Function(ScreenStatusError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenStatusPure value)? pure,
    TResult? Function(ScreenStatusLoading value)? loading,
    TResult? Function(ScreenStatusSuccess value)? success,
    TResult? Function(ScreenStatusError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenStatusPure value)? pure,
    TResult Function(ScreenStatusLoading value)? loading,
    TResult Function(ScreenStatusSuccess value)? success,
    TResult Function(ScreenStatusError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreenStatusErrorImplToJson(
      this,
    );
  }
}

abstract class ScreenStatusError implements ScreenStatus {
  const factory ScreenStatusError([final String? messageKey]) =
      _$ScreenStatusErrorImpl;

  factory ScreenStatusError.fromJson(Map<String, dynamic> json) =
      _$ScreenStatusErrorImpl.fromJson;

  String? get messageKey;

  /// Create a copy of ScreenStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScreenStatusErrorImplCopyWith<_$ScreenStatusErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

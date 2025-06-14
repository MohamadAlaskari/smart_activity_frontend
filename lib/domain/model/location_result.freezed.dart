// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationResult {
  String get cityName => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Create a copy of LocationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationResultCopyWith<LocationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationResultCopyWith<$Res> {
  factory $LocationResultCopyWith(
          LocationResult value, $Res Function(LocationResult) then) =
      _$LocationResultCopyWithImpl<$Res, LocationResult>;
  @useResult
  $Res call({String cityName, double latitude, double longitude});
}

/// @nodoc
class _$LocationResultCopyWithImpl<$Res, $Val extends LocationResult>
    implements $LocationResultCopyWith<$Res> {
  _$LocationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationResultImplCopyWith<$Res>
    implements $LocationResultCopyWith<$Res> {
  factory _$$LocationResultImplCopyWith(_$LocationResultImpl value,
          $Res Function(_$LocationResultImpl) then) =
      __$$LocationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cityName, double latitude, double longitude});
}

/// @nodoc
class __$$LocationResultImplCopyWithImpl<$Res>
    extends _$LocationResultCopyWithImpl<$Res, _$LocationResultImpl>
    implements _$$LocationResultImplCopyWith<$Res> {
  __$$LocationResultImplCopyWithImpl(
      _$LocationResultImpl _value, $Res Function(_$LocationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationResultImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LocationResultImpl implements _LocationResult {
  const _$LocationResultImpl(
      {required this.cityName,
      required this.latitude,
      required this.longitude});

  @override
  final String cityName;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LocationResult(cityName: $cityName, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationResultImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityName, latitude, longitude);

  /// Create a copy of LocationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationResultImplCopyWith<_$LocationResultImpl> get copyWith =>
      __$$LocationResultImplCopyWithImpl<_$LocationResultImpl>(
          this, _$identity);
}

abstract class _LocationResult implements LocationResult {
  const factory _LocationResult(
      {required final String cityName,
      required final double latitude,
      required final double longitude}) = _$LocationResultImpl;

  @override
  String get cityName;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of LocationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationResultImplCopyWith<_$LocationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

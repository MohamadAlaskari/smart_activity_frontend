// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  ActivityLocation get location => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  bool get isTicketed => throw _privateConstructorUsedError;
  List<String> get vibeMatch => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get healthDataMatch => throw _privateConstructorUsedError;
  List<String> get healthDataMatchReason => throw _privateConstructorUsedError;

  /// Serializes this Activity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call(
      {String title,
      String description,
      String category,
      ActivityLocation location,
      double distanceKm,
      DateTime startTime,
      DateTime endTime,
      String price,
      bool isTicketed,
      List<String> vibeMatch,
      List<String> images,
      String url,
      bool healthDataMatch,
      List<String> healthDataMatchReason});

  $ActivityLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? location = null,
    Object? distanceKm = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? price = null,
    Object? isTicketed = null,
    Object? vibeMatch = null,
    Object? images = null,
    Object? url = null,
    Object? healthDataMatch = null,
    Object? healthDataMatchReason = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ActivityLocation,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      isTicketed: null == isTicketed
          ? _value.isTicketed
          : isTicketed // ignore: cast_nullable_to_non_nullable
              as bool,
      vibeMatch: null == vibeMatch
          ? _value.vibeMatch
          : vibeMatch // ignore: cast_nullable_to_non_nullable
              as List<String>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      healthDataMatch: null == healthDataMatch
          ? _value.healthDataMatch
          : healthDataMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      healthDataMatchReason: null == healthDataMatchReason
          ? _value.healthDataMatchReason
          : healthDataMatchReason // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivityLocationCopyWith<$Res> get location {
    return $ActivityLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityImplCopyWith<$Res>
    implements $ActivityCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
          _$ActivityImpl value, $Res Function(_$ActivityImpl) then) =
      __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String category,
      ActivityLocation location,
      double distanceKm,
      DateTime startTime,
      DateTime endTime,
      String price,
      bool isTicketed,
      List<String> vibeMatch,
      List<String> images,
      String url,
      bool healthDataMatch,
      List<String> healthDataMatchReason});

  @override
  $ActivityLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
      _$ActivityImpl _value, $Res Function(_$ActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? location = null,
    Object? distanceKm = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? price = null,
    Object? isTicketed = null,
    Object? vibeMatch = null,
    Object? images = null,
    Object? url = null,
    Object? healthDataMatch = null,
    Object? healthDataMatchReason = null,
  }) {
    return _then(_$ActivityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as ActivityLocation,
      distanceKm: null == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      isTicketed: null == isTicketed
          ? _value.isTicketed
          : isTicketed // ignore: cast_nullable_to_non_nullable
              as bool,
      vibeMatch: null == vibeMatch
          ? _value._vibeMatch
          : vibeMatch // ignore: cast_nullable_to_non_nullable
              as List<String>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      healthDataMatch: null == healthDataMatch
          ? _value.healthDataMatch
          : healthDataMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      healthDataMatchReason: null == healthDataMatchReason
          ? _value._healthDataMatchReason
          : healthDataMatchReason // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityImpl implements _Activity {
  const _$ActivityImpl(
      {required this.title,
      required this.description,
      required this.category,
      required this.location,
      required this.distanceKm,
      required this.startTime,
      required this.endTime,
      required this.price,
      required this.isTicketed,
      required final List<String> vibeMatch,
      required final List<String> images,
      required this.url,
      this.healthDataMatch = false,
      final List<String> healthDataMatchReason = const []})
      : _vibeMatch = vibeMatch,
        _images = images,
        _healthDataMatchReason = healthDataMatchReason;

  factory _$ActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final ActivityLocation location;
  @override
  final double distanceKm;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String price;
  @override
  final bool isTicketed;
  final List<String> _vibeMatch;
  @override
  List<String> get vibeMatch {
    if (_vibeMatch is EqualUnmodifiableListView) return _vibeMatch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibeMatch);
  }

  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String url;
  @override
  @JsonKey()
  final bool healthDataMatch;
  final List<String> _healthDataMatchReason;
  @override
  @JsonKey()
  List<String> get healthDataMatchReason {
    if (_healthDataMatchReason is EqualUnmodifiableListView)
      return _healthDataMatchReason;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_healthDataMatchReason);
  }

  @override
  String toString() {
    return 'Activity(title: $title, description: $description, category: $category, location: $location, distanceKm: $distanceKm, startTime: $startTime, endTime: $endTime, price: $price, isTicketed: $isTicketed, vibeMatch: $vibeMatch, images: $images, url: $url, healthDataMatch: $healthDataMatch, healthDataMatchReason: $healthDataMatchReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isTicketed, isTicketed) ||
                other.isTicketed == isTicketed) &&
            const DeepCollectionEquality()
                .equals(other._vibeMatch, _vibeMatch) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.healthDataMatch, healthDataMatch) ||
                other.healthDataMatch == healthDataMatch) &&
            const DeepCollectionEquality()
                .equals(other._healthDataMatchReason, _healthDataMatchReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      category,
      location,
      distanceKm,
      startTime,
      endTime,
      price,
      isTicketed,
      const DeepCollectionEquality().hash(_vibeMatch),
      const DeepCollectionEquality().hash(_images),
      url,
      healthDataMatch,
      const DeepCollectionEquality().hash(_healthDataMatchReason));

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityImplToJson(
      this,
    );
  }
}

abstract class _Activity implements Activity {
  const factory _Activity(
      {required final String title,
      required final String description,
      required final String category,
      required final ActivityLocation location,
      required final double distanceKm,
      required final DateTime startTime,
      required final DateTime endTime,
      required final String price,
      required final bool isTicketed,
      required final List<String> vibeMatch,
      required final List<String> images,
      required final String url,
      final bool healthDataMatch,
      final List<String> healthDataMatchReason}) = _$ActivityImpl;

  factory _Activity.fromJson(Map<String, dynamic> json) =
      _$ActivityImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  ActivityLocation get location;
  @override
  double get distanceKm;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get price;
  @override
  bool get isTicketed;
  @override
  List<String> get vibeMatch;
  @override
  List<String> get images;
  @override
  String get url;
  @override
  bool get healthDataMatch;
  @override
  List<String> get healthDataMatchReason;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityLocation _$ActivityLocationFromJson(Map<String, dynamic> json) {
  return _ActivityLocation.fromJson(json);
}

/// @nodoc
mixin _$ActivityLocation {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  /// Serializes this ActivityLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityLocationCopyWith<ActivityLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityLocationCopyWith<$Res> {
  factory $ActivityLocationCopyWith(
          ActivityLocation value, $Res Function(ActivityLocation) then) =
      _$ActivityLocationCopyWithImpl<$Res, ActivityLocation>;
  @useResult
  $Res call({String name, String address, double lat, double lon});
}

/// @nodoc
class _$ActivityLocationCopyWithImpl<$Res, $Val extends ActivityLocation>
    implements $ActivityLocationCopyWith<$Res> {
  _$ActivityLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityLocationImplCopyWith<$Res>
    implements $ActivityLocationCopyWith<$Res> {
  factory _$$ActivityLocationImplCopyWith(_$ActivityLocationImpl value,
          $Res Function(_$ActivityLocationImpl) then) =
      __$$ActivityLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String address, double lat, double lon});
}

/// @nodoc
class __$$ActivityLocationImplCopyWithImpl<$Res>
    extends _$ActivityLocationCopyWithImpl<$Res, _$ActivityLocationImpl>
    implements _$$ActivityLocationImplCopyWith<$Res> {
  __$$ActivityLocationImplCopyWithImpl(_$ActivityLocationImpl _value,
      $Res Function(_$ActivityLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$ActivityLocationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityLocationImpl implements _ActivityLocation {
  const _$ActivityLocationImpl(
      {required this.name,
      required this.address,
      required this.lat,
      required this.lon});

  factory _$ActivityLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityLocationImplFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'ActivityLocation(name: $name, address: $address, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityLocationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, address, lat, lon);

  /// Create a copy of ActivityLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityLocationImplCopyWith<_$ActivityLocationImpl> get copyWith =>
      __$$ActivityLocationImplCopyWithImpl<_$ActivityLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityLocationImplToJson(
      this,
    );
  }
}

abstract class _ActivityLocation implements ActivityLocation {
  const factory _ActivityLocation(
      {required final String name,
      required final String address,
      required final double lat,
      required final double lon}) = _$ActivityLocationImpl;

  factory _ActivityLocation.fromJson(Map<String, dynamic> json) =
      _$ActivityLocationImpl.fromJson;

  @override
  String get name;
  @override
  String get address;
  @override
  double get lat;
  @override
  double get lon;

  /// Create a copy of ActivityLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityLocationImplCopyWith<_$ActivityLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

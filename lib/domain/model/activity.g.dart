// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      location:
          ActivityLocation.fromJson(json['location'] as Map<String, dynamic>),
      distanceKm: (json['distanceKm'] as num).toDouble(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      price: json['price'] as String,
      isTicketed: json['isTicketed'] as bool,
      vibeMatch:
          (json['vibeMatch'] as List<dynamic>).map((e) => e as String).toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'location': instance.location,
      'distanceKm': instance.distanceKm,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'price': instance.price,
      'isTicketed': instance.isTicketed,
      'vibeMatch': instance.vibeMatch,
      'images': instance.images,
      'url': instance.url,
    };

_$ActivityLocationImpl _$$ActivityLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityLocationImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$ActivityLocationImplToJson(
        _$ActivityLocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'lat': instance.lat,
      'lon': instance.lon,
    };

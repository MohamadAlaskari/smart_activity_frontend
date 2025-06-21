// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      date: json['date'] as String,
      tempmax: (json['tempmax'] as num).toDouble(),
      tempmin: (json['tempmin'] as num).toDouble(),
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'tempmax': instance.tempmax,
      'tempmin': instance.tempmin,
      'icon': instance.icon,
    };

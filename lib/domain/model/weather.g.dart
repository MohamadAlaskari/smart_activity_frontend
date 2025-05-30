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
      temp: (json['temp'] as num).toDouble(),
      feelslikemax: (json['feelslikemax'] as num).toDouble(),
      feelslikemin: (json['feelslikemin'] as num).toDouble(),
      feelslike: (json['feelslike'] as num).toDouble(),
      dew: (json['dew'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      precip: (json['precip'] as num).toDouble(),
      precipprob: (json['precipprob'] as num).toDouble(),
      precipcover: (json['precipcover'] as num).toDouble(),
      preciptype: (json['preciptype'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      snow: (json['snow'] as num).toDouble(),
      snowdepth: (json['snowdepth'] as num).toDouble(),
      windgust: (json['windgust'] as num).toDouble(),
      windspeed: (json['windspeed'] as num).toDouble(),
      winddir: (json['winddir'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      cloudcover: (json['cloudcover'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
      solarradiation: (json['solarradiation'] as num).toDouble(),
      solarenergy: (json['solarenergy'] as num).toDouble(),
      uvindex: (json['uvindex'] as num).toDouble(),
      severerisk: (json['severerisk'] as num).toDouble(),
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      moonphase: (json['moonphase'] as num).toDouble(),
      conditions: json['conditions'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'tempmax': instance.tempmax,
      'tempmin': instance.tempmin,
      'temp': instance.temp,
      'feelslikemax': instance.feelslikemax,
      'feelslikemin': instance.feelslikemin,
      'feelslike': instance.feelslike,
      'dew': instance.dew,
      'humidity': instance.humidity,
      'precip': instance.precip,
      'precipprob': instance.precipprob,
      'precipcover': instance.precipcover,
      'preciptype': instance.preciptype,
      'snow': instance.snow,
      'snowdepth': instance.snowdepth,
      'windgust': instance.windgust,
      'windspeed': instance.windspeed,
      'winddir': instance.winddir,
      'pressure': instance.pressure,
      'cloudcover': instance.cloudcover,
      'visibility': instance.visibility,
      'solarradiation': instance.solarradiation,
      'solarenergy': instance.solarenergy,
      'uvindex': instance.uvindex,
      'severerisk': instance.severerisk,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonphase': instance.moonphase,
      'conditions': instance.conditions,
      'description': instance.description,
      'icon': instance.icon,
    };

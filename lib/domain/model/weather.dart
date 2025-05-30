import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@Freezed(toJson: true, fromJson: true)
class Weather with _$Weather {
  const Weather._();

  const factory Weather({
    required String date,
    required double tempmax,
    required double tempmin,
    required double temp,
    required double feelslikemax,
    required double feelslikemin,
    required double feelslike,
    required double dew,
    required double humidity,
    required double precip,
    required double precipprob,
    required double precipcover,
    List<String?>? preciptype,
    required double snow,
    required double snowdepth,
    required double windgust,
    required double windspeed,
    required double winddir,
    required double pressure,
    required double cloudcover,
    required double visibility,
    required double solarradiation,
    required double solarenergy,
    required double uvindex,
    required double severerisk,
    required String sunrise,
    required String sunset,
    required double moonphase,
    required String conditions,
    required String description,
    required String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
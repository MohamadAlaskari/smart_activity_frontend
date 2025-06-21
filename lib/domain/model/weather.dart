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
    required String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

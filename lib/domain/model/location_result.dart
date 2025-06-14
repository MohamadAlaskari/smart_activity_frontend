import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_result.freezed.dart';

@freezed
class LocationResult with _$LocationResult {
  const factory LocationResult({
    required String cityName,
    required double latitude,
    required double longitude,
  }) = _LocationResult;
}
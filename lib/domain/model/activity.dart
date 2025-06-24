import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String title,
    required String description,
    required String category,
    required ActivityLocation location,
    required double distanceKm,
    required DateTime startTime,
    required DateTime endTime,
    required String price,
    required bool isTicketed,
    required List<String> vibeMatch,
    required List<String> images,
    required String url,
    @Default(false) bool healthDataMatch,
    @Default([]) List<String> healthDataMatchReason,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
}

@freezed
class ActivityLocation with _$ActivityLocation {
  const factory ActivityLocation({
    required String name,
    required String address,
    required double lat,
    required double lon,
  }) = _ActivityLocation;

  factory ActivityLocation.fromJson(Map<String, dynamic> json) => _$ActivityLocationFromJson(json);
}
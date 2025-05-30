import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@Freezed(toJson: true, fromJson: true)
class Activity with _$Activity {
  const Activity._();

  const factory Activity({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required String location,
    required String date,
    required String time,
    required String cost,
    required String category,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
}
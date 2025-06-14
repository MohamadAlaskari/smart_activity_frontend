import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';

part 'user_preferences.g.dart';

@Freezed(toJson: true, fromJson: true)
class UserPreferences with _$UserPreferences {
  const UserPreferences._();

  const factory UserPreferences({
    int? id,
    @Default([]) List<String> selectedVibes,
    @Default([]) List<String> selectedLifeVibes,
    @Default([]) List<String> selectedExperienceTypes,
    @Default(20.0) double budget,
    @Default(10.0) double distanceRadius,
    @Default([]) List<String> selectedTimeWindows,
    @Default([]) List<String> selectedGroupSizes,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);

  Map<String, dynamic> toApiRequest() {
    return {
      'selectedVibes': selectedVibes,
      'selectedLifeVibes': selectedLifeVibes,
      'selectedExperienceTypes': selectedExperienceTypes,
      'budget': budget,
      'distanceRadius': distanceRadius,
      'selectedTimeWindows': selectedTimeWindows,
      'selectedGroupSizes': selectedGroupSizes,
    };
  }
}

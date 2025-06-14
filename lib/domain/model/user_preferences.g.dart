// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      id: (json['id'] as num?)?.toInt(),
      selectedVibes: (json['selectedVibes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedLifeVibes: (json['selectedLifeVibes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedExperienceTypes:
          (json['selectedExperienceTypes'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      budget: (json['budget'] as num?)?.toDouble() ?? 20.0,
      distanceRadius: (json['distanceRadius'] as num?)?.toDouble() ?? 10.0,
      selectedTimeWindows: (json['selectedTimeWindows'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedGroupSizes: (json['selectedGroupSizes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selectedVibes': instance.selectedVibes,
      'selectedLifeVibes': instance.selectedLifeVibes,
      'selectedExperienceTypes': instance.selectedExperienceTypes,
      'budget': instance.budget,
      'distanceRadius': instance.distanceRadius,
      'selectedTimeWindows': instance.selectedTimeWindows,
      'selectedGroupSizes': instance.selectedGroupSizes,
    };

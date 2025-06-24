import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_data.freezed.dart';

part 'health_data.g.dart';

@freezed
class HealthData with _$HealthData {
  const factory HealthData({
    String? userId,
    required String date,
    required int stepsToday,
    required int stepsWeekAverage,
    required int activityMinutesToday,
    required int activityMinutesWeekAverage,
    required int restingHeartRate,
    required double sleepHoursLastNight,
    required double sleepHoursWeekAverage,
    required String sleepQuality,
    required int caloriesToday,
    required String workoutTypeLast,
    required int workoutDurationLast,
    required int workoutFrequencyWeek,
    required String stressLevel,
    required double weightKg,
    required double bmi,
    required BloodPressure bloodPressure,
    required int activeEnergyBurnedToday,
    required int hydrationMlToday,
    required String moodToday,
    required String menstruationPhase,
  }) = _HealthData;

  factory HealthData.fromJson(Map<String, dynamic> json) =>
      _$HealthDataFromJson(json);

  factory HealthData.fromApiResponse(Map<String, dynamic> json) {
    return HealthData(
      userId: json['userId'] ?? json['id'],
      date: json['date'] ?? DateTime.now().toIso8601String().split('T')[0],
      stepsToday: json['steps_today'] ?? 0,
      stepsWeekAverage: json['steps_week_average'] ?? 0,
      activityMinutesToday: json['activity_minutes_today'] ?? 0,
      activityMinutesWeekAverage: json['activity_minutes_week_average'] ?? 0,
      restingHeartRate: json['resting_heart_rate'] ?? 60,
      sleepHoursLastNight: HealthDataHelpers._toDoubleFromJson(
        json['sleep_hours_last_night'],
        7.0,
      ),
      sleepHoursWeekAverage: HealthDataHelpers._toDoubleFromJson(
        json['sleep_hours_week_average'],
        7.0,
      ),
      sleepQuality: json['sleep_quality'] ?? 'good',
      caloriesToday: json['calories_burned_today'] ?? 0,
      workoutTypeLast: json['workout_type_last'] ?? 'Walking',
      workoutDurationLast: json['workout_duration_last'] ?? 0,
      workoutFrequencyWeek: json['workout_frequency_week'] ?? 0,
      stressLevel: json['stress_level'] ?? 'low',
      weightKg: HealthDataHelpers._toDoubleFromJson(json['weight_kg'], 70.0),
      bmi: HealthDataHelpers._toDoubleFromJson(json['bmi'], 22.0),
      bloodPressure: HealthDataHelpers._parseBloodPressureFromJson(
        json['blood_pressure'],
      ),
      activeEnergyBurnedToday: json['active_energy_burned_today'] ?? 0,
      hydrationMlToday: json['hydration_ml_today'] ?? 0,
      moodToday: json['mood_today'] ?? 'neutral',
      menstruationPhase: json['menstruation_phase'] ?? 'none',
    );
  }
}

extension HealthDataExtension on HealthData {
  Map<String, dynamic> toApiJson() {
    return {
      if (userId != null) 'userId': userId,
      'date': date,
      'steps_today': stepsToday,
      'steps_week_average': stepsWeekAverage,
      'activity_minutes_today': activityMinutesToday,
      'activity_minutes_week_average': activityMinutesWeekAverage,
      'resting_heart_rate': restingHeartRate,
      'sleep_hours_last_night': sleepHoursLastNight,
      'sleep_hours_week_average': sleepHoursWeekAverage,
      'sleep_quality': sleepQuality,
      'calories_burned_today': caloriesToday,
      'workout_type_last': workoutTypeLast,
      'workout_duration_last': workoutDurationLast,
      'workout_frequency_week': workoutFrequencyWeek,
      'stress_level': stressLevel,
      'weight_kg': weightKg,
      'bmi': bmi,
      'blood_pressure': {
        'systolic': bloodPressure.systolic,
        'diastolic': bloodPressure.diastolic,
      },
      'active_energy_burned_today': activeEnergyBurnedToday,
      'hydration_ml_today': hydrationMlToday,
      'mood_today': moodToday,
      'menstruation_phase': menstruationPhase,
    };
  }
}

class HealthDataHelpers {
  static double _toDoubleFromJson(dynamic value, double defaultValue) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  static BloodPressure _parseBloodPressureFromJson(dynamic bloodPressure) {
    if (bloodPressure is Map<String, dynamic>) {
      return BloodPressure(
        systolic: bloodPressure['systolic'] ?? 120,
        diastolic: bloodPressure['diastolic'] ?? 80,
      );
    }
    return const BloodPressure(systolic: 120, diastolic: 80);
  }
}

@freezed
class BloodPressure with _$BloodPressure {
  const factory BloodPressure({required int systolic, required int diastolic}) =
      _BloodPressure;

  factory BloodPressure.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureFromJson(json);
}

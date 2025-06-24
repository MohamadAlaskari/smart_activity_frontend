// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthDataImpl _$$HealthDataImplFromJson(Map<String, dynamic> json) =>
    _$HealthDataImpl(
      userId: json['userId'] as String?,
      date: json['date'] as String,
      stepsToday: (json['stepsToday'] as num).toInt(),
      stepsWeekAverage: (json['stepsWeekAverage'] as num).toInt(),
      activityMinutesToday: (json['activityMinutesToday'] as num).toInt(),
      activityMinutesWeekAverage:
          (json['activityMinutesWeekAverage'] as num).toInt(),
      restingHeartRate: (json['restingHeartRate'] as num).toInt(),
      sleepHoursLastNight: (json['sleepHoursLastNight'] as num).toDouble(),
      sleepHoursWeekAverage: (json['sleepHoursWeekAverage'] as num).toDouble(),
      sleepQuality: json['sleepQuality'] as String,
      caloriesToday: (json['caloriesToday'] as num).toInt(),
      workoutTypeLast: json['workoutTypeLast'] as String,
      workoutDurationLast: (json['workoutDurationLast'] as num).toInt(),
      workoutFrequencyWeek: (json['workoutFrequencyWeek'] as num).toInt(),
      stressLevel: json['stressLevel'] as String,
      weightKg: (json['weightKg'] as num).toDouble(),
      bmi: (json['bmi'] as num).toDouble(),
      bloodPressure:
          BloodPressure.fromJson(json['bloodPressure'] as Map<String, dynamic>),
      activeEnergyBurnedToday: (json['activeEnergyBurnedToday'] as num).toInt(),
      hydrationMlToday: (json['hydrationMlToday'] as num).toInt(),
      moodToday: json['moodToday'] as String,
      menstruationPhase: json['menstruationPhase'] as String,
    );

Map<String, dynamic> _$$HealthDataImplToJson(_$HealthDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'date': instance.date,
      'stepsToday': instance.stepsToday,
      'stepsWeekAverage': instance.stepsWeekAverage,
      'activityMinutesToday': instance.activityMinutesToday,
      'activityMinutesWeekAverage': instance.activityMinutesWeekAverage,
      'restingHeartRate': instance.restingHeartRate,
      'sleepHoursLastNight': instance.sleepHoursLastNight,
      'sleepHoursWeekAverage': instance.sleepHoursWeekAverage,
      'sleepQuality': instance.sleepQuality,
      'caloriesToday': instance.caloriesToday,
      'workoutTypeLast': instance.workoutTypeLast,
      'workoutDurationLast': instance.workoutDurationLast,
      'workoutFrequencyWeek': instance.workoutFrequencyWeek,
      'stressLevel': instance.stressLevel,
      'weightKg': instance.weightKg,
      'bmi': instance.bmi,
      'bloodPressure': instance.bloodPressure,
      'activeEnergyBurnedToday': instance.activeEnergyBurnedToday,
      'hydrationMlToday': instance.hydrationMlToday,
      'moodToday': instance.moodToday,
      'menstruationPhase': instance.menstruationPhase,
    };

_$BloodPressureImpl _$$BloodPressureImplFromJson(Map<String, dynamic> json) =>
    _$BloodPressureImpl(
      systolic: (json['systolic'] as num).toInt(),
      diastolic: (json['diastolic'] as num).toInt(),
    );

Map<String, dynamic> _$$BloodPressureImplToJson(_$BloodPressureImpl instance) =>
    <String, dynamic>{
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
    };

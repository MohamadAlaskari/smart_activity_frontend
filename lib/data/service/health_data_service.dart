import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/domain/model/health_data.dart';

class HealthDataService {
  final VibeDayRepository _vibeDayRepository;

  HealthDataService({required VibeDayRepository vibeDayRepository})
    : _vibeDayRepository = vibeDayRepository;

  Future<List<HealthData>> loadDummyHealthData() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/mock_data.json',
      );
      final List<dynamic> jsonList = jsonDecode(jsonString);

      return jsonList
          .map((json) => HealthData.fromJson(_convertFieldNames(json)))
          .toList();
    } catch (e) {
      log('Error loading dummy health data: $e');
      return [];
    }
  }

  Map<String, dynamic> _convertFieldNames(Map<String, dynamic> json) {
    return {
      'date': json['date'],
      'stepsToday': json['steps_today'],
      'stepsWeekAverage': json['steps_week_average'],
      'activityMinutesToday': json['activity_minutes_today'],
      'activityMinutesWeekAverage': json['activity_minutes_week_average'],
      'restingHeartRate': json['resting_heart_rate'],
      'sleepHoursLastNight': json['sleep_hours_last_night'],
      'sleepHoursWeekAverage': json['sleep_hours_week_average'],
      'sleepQuality': json['sleep_quality'],
      'caloriesToday': json['calories_burned_today'],
      'workoutTypeLast': json['workout_type_last'],
      'workoutDurationLast': json['workout_duration_last'],
      'workoutFrequencyWeek': json['workout_frequency_week'],
      'stressLevel': json['stress_level'],
      'weightKg': json['weight_kg'],
      'bmi': json['bmi'],
      'bloodPressure': json['blood_pressure'],
      'activeEnergyBurnedToday': json['active_energy_burned_today'],
      'hydrationMlToday': json['hydration_ml_today'],
      'moodToday': json['mood_today'],
      'menstruationPhase': json['menstruation_phase'],
    };
  }

  Future<HealthData?> submitHealthData(HealthData healthData) async {
    try {
      final result = await _vibeDayRepository.submitHealthData(
        healthData: healthData,
      );
      return result;
    } catch (e) {
      log('Error submitting health data for date ${healthData.date}: $e');
      return null;
    }
  }

  Future<HealthData?> submitHealthDataForToday() async {
    try {
      final today = DateTime.now().toIso8601String().split('T')[0];

      final allHealthData = await getAllHealthData();
      final todayCompleteData =
          allHealthData
              .where(
                (data) =>
                    data.date == today &&
                    data.stepsToday > 0 &&
                    data.moodToday != 'neutral' &&
                    data.sleepHoursLastNight > 0,
              )
              .firstOrNull;

      if (todayCompleteData != null) {
        return todayCompleteData;
      }

      final dummyData = await loadDummyHealthData();
      if (dummyData.isEmpty) {
        log('No dummy health data available');
        return null;
      }

      final randomIndex =
          DateTime.now().millisecondsSinceEpoch % dummyData.length;
      final selectedDummyData = dummyData[randomIndex];

      final healthDataForToday = selectedDummyData.copyWith(
        date: today,
        userId: null,
      );

      final result = await submitHealthData(healthDataForToday);
      if (result != null) {
        log('Successfully submitted complete health data for today: $today');
      } else {
        log('Failed to submit health data for today');
      }

      return result;
    } catch (e) {
      log('Error submitting health data for today: $e');
      return null;
    }
  }

  Future<HealthData?> forceSubmitHealthDataForToday() async {
    try {
      final today = DateTime.now().toIso8601String().split('T')[0];
      final dummyData = await loadDummyHealthData();
      if (dummyData.isEmpty) {
        log('No dummy health data available');
        return null;
      }

      final randomIndex =
          DateTime.now().millisecondsSinceEpoch % dummyData.length;
      final selectedDummyData = dummyData[randomIndex];

      final healthDataForToday = selectedDummyData.copyWith(
        date: today,
        userId: null,
      );

      final result = await submitHealthData(healthDataForToday);
      return result;
    } catch (e) {
      log('Error force submitting health data: $e');
      return null;
    }
  }

  Future<List<HealthData>> submitAllDummyData() async {
    final dummyData = await loadDummyHealthData();
    final List<HealthData> submittedData = [];

    for (final healthData in dummyData) {
      final result = await submitHealthData(healthData);
      if (result != null) {
        submittedData.add(result);
      }

      await Future.delayed(const Duration(milliseconds: 500));
    }
    return submittedData;
  }

  Future<HealthData?> submitHealthDataForDate(String date) async {
    final dummyData = await loadDummyHealthData();
    final healthDataForDate =
        dummyData.where((data) => data.date == date).firstOrNull;

    if (healthDataForDate != null) {
      return await submitHealthData(healthDataForDate);
    } else {
      log('No dummy data found for date: $date');
      return null;
    }
  }

  Future<List<HealthData>> getAllHealthData() async {
    try {
      final healthDataList = await _vibeDayRepository.getHealthData();
      log(
        'Retrieved ${healthDataList.length} health data entries from backend',
      );
      return healthDataList;
    } catch (e) {
      log('Error retrieving health data: $e');
      return [];
    }
  }

  Future<HealthData?> getHealthDataForDate(String date) async {
    try {
      final allHealthData = await getAllHealthData();
      return allHealthData.where((data) => data.date == date).firstOrNull;
    } catch (e) {
      log('Error retrieving health data for date $date: $e');
      return null;
    }
  }

  Future<HealthData?> getLatestHealthData() async {
    try {
      final allHealthData = await getAllHealthData();
      if (allHealthData.isEmpty) return null;

      allHealthData.sort((a, b) => b.date.compareTo(a.date));
      return allHealthData.first;
    } catch (e) {
      log('Error retrieving latest health data: $e');
      return null;
    }
  }

  Future<HealthData?> submitRandomDummyData() async {
    try {
      final dummyData = await loadDummyHealthData();
      if (dummyData.isEmpty) {
        log('No dummy health data available');
        return null;
      }

      final randomIndex =
          DateTime.now().millisecondsSinceEpoch % dummyData.length;
      final randomHealthData = dummyData[randomIndex];
      final result = await submitHealthData(randomHealthData);
      if (result != null) {
        log(
          'Successfully submitted random health data: ${randomHealthData.date}',
        );
      }

      return result;
    } catch (e) {
      log('Error submitting random health data: $e');
      return null;
    }
  }

  Future<HealthData?> submitRandomHealthDataIfNeeded() async {
    try {
      final existingData = await getAllHealthData();
      if (existingData.isNotEmpty) {
        return existingData.first;
      }

      return await submitRandomDummyData();
    } catch (e) {
      log('Error checking/submitting random health data: $e');
      return null;
    }
  }
}

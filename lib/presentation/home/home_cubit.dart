import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/home/home_state.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/domain/model/activity.dart';
import 'dart:developer';

import 'package:vibe_day/data/service/location_servicee.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required VibeDayRepository vibeDayRepository,
    required UserStorageRepository userStorageRepository,
  }) : _vibeDayRepository = vibeDayRepository,
       _userStorageRepository = userStorageRepository,
       super(HomeState()) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;
  final UserStorageRepository _userStorageRepository;

  Future<void> _init() async {
    await _detectLocationAndLoadData();
  }

  Future<void> _detectLocationAndLoadData() async {
    if (isClosed) return;

    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    try {
      final locationResult =
          await LocationServicee.getCurrentLocationWithCoordinates();
      log(
        'Detected location: ${locationResult.cityName} (${locationResult.latitude}, ${locationResult.longitude})',
      );

      if (isClosed) return;

      emit(
        state.copyWith(
          location: locationResult.cityName,
          latitude: locationResult.latitude,
          longitude: locationResult.longitude,
        ),
      );
      await loadData();
    } catch (e) {
      log('Error detecting location: $e');

      if (isClosed) return;

      emit(
        state.copyWith(
          location: 'Bremen',
          latitude: 53.0793,
          longitude: 8.8017,
        ),
      );
      await loadData();
    }
  }

  Future<void> loadData() async {
    if (isClosed) return;

    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    try {
      // Load weather data
      log('Loading weather data for: ${state.location}');
      final weatherData = await _vibeDayRepository.getWeeklyWeather(
        state.location,
      );

      // Load suggestions instead of dummy activities
      final activities = await _loadSuggestions();

      if (isClosed) return;

      emit(
        state.copyWith(
          screenStatus: const ScreenStatus.success(),
          weatherData: weatherData,
          activities: activities, // This can now be an empty list
        ),
      );
    } catch (e) {
      log('Error loading home data: $e');
      if (isClosed) return;

      emit(
        state.copyWith(
          screenStatus: ScreenStatus.error(e.toString()),
          activities: [], // Empty list instead of dummy activities
          weatherData: [],
        ),
      );
    }
  }

  Future<List<Activity>> _loadSuggestions() async {
    try {
      final userId = await _getUserId();

      if (userId == null) {
        log('No user ID available, returning empty list');
        return []; // Return empty list instead of dummy activities
      }

      // Format current date for API
      final currentDate =
          DateTime.now().toIso8601String().split('T')[0]; // YYYY-MM-DD format

      final suggestions = await _vibeDayRepository.getSuggestions(
        userId: userId,
        latitude: state.latitude,
        longitude: state.longitude,
        date: currentDate,
      );

      return suggestions;
    } catch (e) {
      log('Error loading suggestions: $e');
      // Return empty list instead of dummy activities
      return [];
    }
  }

  Future<String?> _getUserId() async {
    try {
      final user = await _userStorageRepository.getUser();
      return user?.id;
    } catch (e) {
      log('Error getting user ID: $e');
      return null;
    }
  }

  Future<List<Activity>> _loadSuggestionsForDate(
    DateTime date,
    int dayIndex,
  ) async {
    try {
      final userId = await _getUserId();

      if (userId == null) {
        log('No user ID available for date $date, returning empty list');
        return []; // Return empty list instead of dummy activities
      }

      final dateStr = date.toIso8601String().split('T')[0]; // YYYY-MM-DD format

      final suggestions = await _vibeDayRepository.getSuggestions(
        userId: userId,
        latitude: state.latitude,
        longitude: state.longitude,
        date: dateStr,
      );

      return suggestions;
    } catch (e) {
      log('Error loading suggestions for date: $e');
      // Return empty list instead of dummy activities
      return [];
    }
  }

  Future<void> loadActivitiesForDay(
    int dayIndex,
    Map<String, dynamic> weatherInfo,
  ) async {
    if (isClosed) return;

    emit(
      state.copyWith(
        screenStatus: const ScreenStatus.loading(),
        activities: [],
      ),
    );

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final date =
          weatherInfo['date'] as String? ?? DateTime.now().toIso8601String();
      final selectedDate = DateTime.parse(date);

      final activities = await _loadSuggestionsForDate(selectedDate, dayIndex);

      if (isClosed) return;

      emit(
        state.copyWith(
          screenStatus: const ScreenStatus.success(),
          activities: activities,
          selectedDayIndex: dayIndex,
        ),
      );
    } catch (e) {
      log('Error loading activities for day: $e');
      if (isClosed) return;

      emit(state.copyWith(screenStatus: ScreenStatus.error(e.toString())));
    }
  }

  Future<void> resetToToday() async {
    await loadData();
  }

  Future<void> refreshLocation() async {
    await _detectLocationAndLoadData();
  }

  void refreshData() {
    loadData();
  }
}

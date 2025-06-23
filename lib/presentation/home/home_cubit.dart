import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/data/service/location_service.dart';
import 'package:vibe_day/presentation/home/home_state.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/domain/model/activity.dart';
import 'dart:developer';

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
          await LocationService.getCurrentLocationWithCoordinates();
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
      final weatherData = await _vibeDayRepository.getWeeklyWeather(
        state.location,
      );

      if (isClosed) return;

      emit(state.copyWith(weatherData: weatherData, activities: []));

      log('Starting user preferences check...');
      final hasUserPreferences = await _checkUserPreferences();
      log('User preferences check result: $hasUserPreferences');

      if (hasUserPreferences) {
        log('Loading suggestions because user has preferences');
        final activities = await _loadSuggestions();

        if (isClosed) return;

        emit(
          state.copyWith(
            screenStatus: const ScreenStatus.success(),
            activities: activities,
            hasUserPreferences: true,
          ),
        );
      } else {
        log('User has no preferences, showing no preferences message');
        if (isClosed) return;

        emit(
          state.copyWith(
            screenStatus: const ScreenStatus.success(),
            activities: [],
            hasUserPreferences: false,
          ),
        );
      }
    } catch (e) {
      log('Error loading home data: $e');
      if (isClosed) return;

      emit(
        state.copyWith(
          screenStatus: ScreenStatus.error(e.toString()),
          activities: [],
          weatherData: [],
          hasUserPreferences: false,
        ),
      );
    }
  }

  Future<bool> _checkUserPreferences() async {
    try {
      log('Getting user ID for preferences check...');
      final userId = await _getUserId();

      if (userId == null) {
        log('No user ID available, assuming no preferences');
        return false;
      }

      log('User ID found: $userId, fetching preferences...');
      final preferences = await _vibeDayRepository.getUserPreferences(userId);

      if (preferences == null) {
        log('getUserPreferences returned null - no preferences found');
        return false;
      }

      log('User preferences found: ${preferences.selectedVibes}');
      log('Preferences object: $preferences');

      if (preferences.selectedVibes.isEmpty &&
          preferences.selectedLifeVibes.isEmpty &&
          preferences.selectedExperienceTypes.isEmpty) {
        log('Preferences exist but are empty - treating as no preferences');
        return false;
      }

      return true;
    } catch (e) {
      log('Error checking user preferences: $e');
      log('Stack trace: ${StackTrace.current}');
      return false;
    }
  }

  Future<List<Activity>> _loadSuggestions() async {
    try {
      final userId = await _getUserId();

      if (userId == null) {
        log('No user ID available, returning empty list');
        return [];
      }

      final currentDate = DateTime.now().toIso8601String().split('T')[0];

      final suggestions = await _vibeDayRepository.getSuggestions(
        userId: userId,
        latitude: state.latitude,
        longitude: state.longitude,
        date: currentDate,
      );

      return suggestions;
    } catch (e) {
      log('Error loading suggestions: $e');
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
        return [];
      }

      final dateStr = date.toIso8601String().split('T')[0];

      log(
        'Requesting suggestions for userId: $userId, date: $dateStr, lat: ${state.latitude}, lng: ${state.longitude}',
      );

      final suggestions = await _vibeDayRepository.getSuggestions(
        userId: userId,
        latitude: state.latitude,
        longitude: state.longitude,
        date: dateStr,
      );

      log('Received ${suggestions.length} suggestions for date: $dateStr');

      return suggestions;
    } catch (e) {
      log('Error loading suggestions for date: $e');
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

      final today = DateTime.now();
      final selectedDate = today.add(Duration(days: dayIndex));

      log(
        'Loading activities for day index: $dayIndex, calculated date: ${selectedDate.toIso8601String().split('T')[0]}',
      );

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

  Future<void> onUserPreferencesUpdated() async {
    if (isClosed) return;

    log('User preferences were updated, refreshing data...');

    emit(state.copyWith(hasUserPreferences: true));

    await loadData();
  }

  Future<void> onUserAuthenticated() async {
    if (isClosed) return;

    log('User authenticated, loading home data...');
    await _detectLocationAndLoadData();
  }
}

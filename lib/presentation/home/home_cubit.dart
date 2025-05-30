import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/home/home_state.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/domain/model/activity.dart';
import 'dart:developer';

import 'package:vibe_day/data/service/location_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required VibeDayRepository vibeDayRepository})
    : _vibeDayRepository = vibeDayRepository,
      super(HomeState()) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;

  Future<void> _init() async {
    await _detectLocationAndLoadData();
  }

  Future<void> _detectLocationAndLoadData() async {
    if (isClosed) return;

    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    try {

      final detectedLocation = await LocationService.getCurrentLocation();
      log('Detected location: $detectedLocation');

      if (isClosed) return;

      emit(state.copyWith(location: detectedLocation));
      await loadData();
    } catch (e) {
      log('Error detecting location: $e');

      if (isClosed) return;

      emit(
        state.copyWith(
          screenStatus: ScreenStatus.error('Location error: ${e.toString()}'),
          location: 'Location Error',
          activities: [],
          weatherData: [],
        ),
      );
    }
  }

  Future<void> loadData() async {
    if (isClosed) return;

    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    try {
      final activities = _vibeDayRepository.getDummyActivities();

      if (isClosed) return;

      log('Loading weather data for: ${state.location}');
      final weatherData = await _vibeDayRepository.getWeeklyWeather(
        state.location,
      );

      if (isClosed) return;

      emit(
        state.copyWith(
          screenStatus: const ScreenStatus.success(),
          weatherData: weatherData,
          activities: activities,
        ),
      );
    } catch (e) {
      log('Error loading home data: $e');
      if (isClosed) return;

      emit(
        state.copyWith(
          screenStatus: ScreenStatus.error(e.toString()),
          activities: _vibeDayRepository.getDummyActivities(),
          weatherData: [],
        ),
      );
    }
  }

  Future<void> loadActivitiesForDay(
      int dayIndex,
      Map<String, dynamic> weatherInfo,
      ) async {
    if (isClosed) return;

    emit(state.copyWith(
      screenStatus: const ScreenStatus.loading(),
      activities: [],
    ));

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final date =
          weatherInfo['date'] as String? ?? DateTime.now().toIso8601String();
      final selectedDate = DateTime.parse(date);

      final activities = _generateActivitiesForDate(selectedDate, dayIndex);

      if (isClosed) return;

      emit(state.copyWith(
        screenStatus: const ScreenStatus.success(),
        activities: activities,
        selectedDayIndex: dayIndex,
      ));

    } catch (e) {
      log('Error loading activities for day: $e');
      if (isClosed) return;

      emit(state.copyWith(
        screenStatus: ScreenStatus.error(e.toString()),
      ));
    }
  }

  List<Activity> _generateActivitiesForDate(DateTime date, int dayIndex) {
    final baseActivities = _vibeDayRepository.getDummyActivities();
    final dateStr =
        "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}";

    return baseActivities.map((activity) {
      final daySpecificTime = _getDaySpecificTime(dayIndex);

      return Activity(
        id: '${activity.id}_day_$dayIndex',
        title: activity.title,
        location: activity.location,
        date: dateStr,
        time: daySpecificTime,
        cost: activity.cost,
        imageUrl: activity.imageUrl,
        description: activity.description,
        category: activity.category,
      );
    }).toList();
  }

  String _getDaySpecificTime(int dayIndex) {
    final times = [
      '10:00',
      '14:00',
      '16:00',
      '11:00',
    ];

    return times[dayIndex % times.length];
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

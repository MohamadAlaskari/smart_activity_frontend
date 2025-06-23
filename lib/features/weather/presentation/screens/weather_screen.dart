// lib/features/weather/application/weather_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/weather/domain/weather_state.dart';
import 'package:smart_activity_frontend/features/weather/infrastructure/weather_service.dart';
import 'package:smart_activity_frontend/features/weather/model/weather_model.dart';

class WeatherViewModel extends StateNotifier<WeatherState> {
  final WeatherService _weatherService;

  WeatherViewModel(this._weatherService) : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final List<WeatherModel> forecast = await _weatherService.fetchWeather(city);
      state = state.copyWith(
        isLoading: false,
        forecast: forecast,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Fehler beim Laden des Wetters',
      );
    }
  }
}

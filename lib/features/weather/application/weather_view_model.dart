import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/weather_state.dart';
import '../infrastructure/weather_service.dart';

class WeatherViewModel extends StateNotifier<WeatherState> {
  final WeatherService _service;
  WeatherViewModel(this._service) : super(WeatherState.initial());

  Future<void> load(String city) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final weather = await _service.fetchWeather(city);
      state = state.copyWith(isLoading: false, weather: weather);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final weatherProvider = StateNotifierProvider<WeatherViewModel, WeatherState>((
  ref,
) {
  return WeatherViewModel(WeatherService());
});

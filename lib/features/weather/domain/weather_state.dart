// lib/features/weather/domain/weather_state.dart
import '../model/weather_model.dart';

class WeatherState {
  final bool isLoading;
  final WeatherModel? weather;
  final String? error;

  WeatherState({required this.isLoading, this.weather, this.error});

  factory WeatherState.initial() => WeatherState(isLoading: false);
  WeatherState copyWith({
    bool? isLoading,
    WeatherModel? weather,
    String? error,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }
}

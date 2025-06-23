import '../model/weather_model.dart';

class WeatherState {
  final bool isLoading;
  final List<WeatherModel> forecast;
  final String? errorMessage;

  WeatherState({
    required this.isLoading,
    required this.forecast,
    this.errorMessage,
  });

  factory WeatherState.initial() {
    return WeatherState(isLoading: false, forecast: []);
  }

  WeatherState copyWith({
    bool? isLoading,
    List<WeatherModel>? forecast,
    String? errorMessage,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      forecast: forecast ?? this.forecast,
      errorMessage: errorMessage,
    );
  }
}

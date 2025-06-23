import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/weather/application/weather_view_model.dart';
import 'package:smart_activity_frontend/features/weather/domain/weather_state.dart';
import 'package:smart_activity_frontend/features/weather/infrastructure/weather_service.dart';
import 'package:smart_activity_frontend/core/api/dio_provider.dart';

final weatherViewModelProvider =
    StateNotifierProvider<WeatherViewModel, WeatherState>((ref) {
      final dio = ref.watch(dioProvider);
      final weatherService = WeatherService(dio: dio);
      return WeatherViewModel(weatherService);
    });

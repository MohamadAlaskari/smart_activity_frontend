import 'package:dio/dio.dart';
import 'package:smart_activity_frontend/core/constants/api_constants.dart';
import 'package:smart_activity_frontend/features/weather/model/weather_model.dart';

class WeatherService {
  final Dio _dio;

  WeatherService({required Dio dio}) : _dio = dio;

  Future<List<WeatherModel>> fetchWeather(String city) async {
    try {
      final response = await _dio.get(
        ApiConstants.weatherWeekLocation,
        queryParameters: {'location': city},
      );

      final List data = response.data;
      return data.map((e) => WeatherModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Fehler beim Laden des Wetters: $e');
    }
  }
}

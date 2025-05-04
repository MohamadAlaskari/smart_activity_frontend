// lib/features/weather/infrastructure/weather_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class WeatherService {
  final String baseUrl = 'https://smart-activity-backend.alaskaritech.com';

  Future<WeatherModel> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl/weather?location=$city'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Fehler beim Laden des Wetters');
    }
  }
}

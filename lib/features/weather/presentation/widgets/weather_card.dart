import 'package:flutter/material.dart';

import '../../model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final iconUrl = 'https://openweathermap.org/img/wn/${weather.icon}@2x.png';

    return Card(
      child: ListTile(
        leading: Image.network(iconUrl, width: 50, height: 50),
        title: Text("${weather.temperature}°C"),
        subtitle: Text(weather.condition),
      ),
    );
  }
}

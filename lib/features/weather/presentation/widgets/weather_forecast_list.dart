// lib/features/weather/presentation/widgets/weather_forecast_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/weather/application/weather_service_provider.dart';
import 'package:smart_activity_frontend/features/weather/presentation/widgets/weather_day_card.dart';

class WeatherForecastList extends ConsumerWidget {
  const WeatherForecastList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherViewModelProvider);

    if (weatherState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (weatherState.errorMessage != null) {
      return Center(child: Text(weatherState.errorMessage!));
    }

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: weatherState.forecast.length,
        itemBuilder: (context, index) {
          final weather = weatherState.forecast[index];
          return WeatherDayCard(
            weather: weather,
            index: index,
            isSelected: index == 0,
            onTap: () {},
          );
        },
      ),
    );
  }
}

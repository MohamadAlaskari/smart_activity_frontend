// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/location/application/location_provider.dart';
import 'package:smart_activity_frontend/features/location/presentation/widgets/location_input_field.dart';
import 'package:smart_activity_frontend/features/weather/application/weather_service_provider.dart';
import 'package:smart_activity_frontend/features/weather/presentation/widgets/weather_day_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationViewModelProvider);
    final weatherState = ref.watch(weatherViewModelProvider);

    // Listen for city change
    ref.listen(locationViewModelProvider, (previous, next) {
      if (previous?.city != next.city && next.city.isNotEmpty) {
        ref.read(weatherViewModelProvider.notifier).fetchWeather(next.city);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LocationInputField(),
            ),
            const SizedBox(height: 16),
            if (weatherState.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (weatherState.errorMessage != null)
              Center(child: Text(weatherState.errorMessage!))
            else if (weatherState.forecast.isNotEmpty)
              SizedBox(
                height: 110,
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
              ),
          ],
        ),
      ),
    );
  }
}

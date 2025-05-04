import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/weather_card.dart';
import '../widgets/clothing_advice.dart';
import '../../application/weather_view_model.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  final TextEditingController _controller = TextEditingController(
    text: "Berlin",
  );

  @override
  void initState() {
    super.initState();
    // Initiale Ladung
    Future.microtask(() {
      ref.read(weatherProvider.notifier).load(_controller.text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Wetter')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Eingabe + Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Stadt eingeben z. B. Berlin",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final city = _controller.text.trim();
                    if (city.isNotEmpty) {
                      ref.read(weatherProvider.notifier).load(city);
                    }
                  },
                  child: const Text("Suche"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Wetteranzeige
            if (state.isLoading)
              const CircularProgressIndicator()
            else if (state.error != null)
              Text("Fehler: ${state.error}")
            else if (state.weather != null)
              Expanded(
                child: ListView(
                  children: [
                    WeatherCard(weather: state.weather!),
                    const SizedBox(height: 16),
                    ClothingAdvice(condition: state.weather!.condition),
                  ],
                ),
              )
            else
              const Text("Keine Wetterdaten gefunden."),
          ],
        ),
      ),
    );
  }
}

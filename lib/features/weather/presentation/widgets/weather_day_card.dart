import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/weather_model.dart';

class WeatherDayCard extends StatelessWidget {
  final WeatherModel weather;
  final bool isSelected;
  final VoidCallback? onTap;
  final int index;

  const WeatherDayCard({
    super.key,
    required this.weather,
    required this.index,
    this.isSelected = false,
    this.onTap,
  });

  // Generate the label: Today, Tomorrow, or weekday (e.g., Wed)
  String _getDayLabel() {
    if (index == 0) return 'Today';
    if (index == 1) return 'Tomorrow';
    final date = DateTime.parse(weather.date);
    return DateFormat.E('en_US').format(date); // Mon, Tue, Wed, etc.
  }

  // Map weather icon name to Flutter icons
  IconData _getWeatherIcon(String icon) {
    switch (icon) {
      case 'rain':
        return Icons.grain;
      case 'partly-cloudy-day':
        return Icons.cloud;
      case 'clear-day':
        return Icons.wb_sunny;
      default:
        return Icons.wb_cloudy;
    }
  }

  // Choose text color based on background contrast
  Color _getContrastColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.dark
        ? Colors.white
        : Colors.black87;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor =
        isSelected
            ? Colors
                .deepPurple
                .shade100 // Selected card background
            : isDark
            ? Colors.grey.shade800
            : Colors.white;

    final borderColor =
        isSelected ? Colors.deepPurple : Colors.grey.withOpacity(0.4);

    final textColor = _getContrastColor(bgColor);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90, // 👈 الآن الارتفاع ثابت
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 👈 لتوسيط العناصر
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _getDayLabel(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 6),
            Icon(_getWeatherIcon(weather.icon), color: Colors.orange, size: 20),
            const SizedBox(height: 6),
            Text(
              '${weather.tempMax.round()}° / ${weather.tempMin.round()}°C',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

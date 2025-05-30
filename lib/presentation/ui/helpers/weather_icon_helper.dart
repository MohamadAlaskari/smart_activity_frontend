import 'package:flutter/material.dart';

class WeatherIconHelper {
  WeatherIconHelper._();

  static Widget getWeatherIcon(String iconCode, {double size = 20}) {
    final iconData = _getIconData(iconCode);
    final iconColor = _getIconColor(iconCode);

    return Icon(iconData, size: size, color: iconColor);
  }

  static IconData _getIconData(String iconCode) {
    switch (iconCode.toLowerCase()) {
      case 'sunny':
      case 'clear':
      case 'clear-day':
        return Icons.wb_sunny;

      case 'clear-night':
        return Icons.nights_stay;

      case 'cloudy':
      case 'overcast':
        return Icons.cloud;

      case 'partly-cloudy':
      case 'partly-cloudy-day':
        return Icons.wb_cloudy;

      case 'partly-cloudy-night':
        return Icons.cloud_queue;

      case 'rain':
      case 'showers':
        return Icons.grain;

      case 'snow':
        return Icons.ac_unit;

      case 'wind':
        return Icons.air;

      case 'fog':
        return Icons.foggy;

      case 'thunderstorm':
        return Icons.flash_on;

      default:
        return Icons.wb_cloudy;
    }
  }

  static Color _getIconColor(String iconCode) {
    switch (iconCode.toLowerCase()) {
      case 'sunny':
      case 'clear':
      case 'clear-day':
        return Colors.orange;

      case 'clear-night':
        return Colors.indigo;

      case 'cloudy':
      case 'overcast':
      case 'fog':
        return Colors.grey;

      case 'partly-cloudy':
      case 'partly-cloudy-day':
        return Colors.orange;

      case 'partly-cloudy-night':
        return Colors.blueGrey;

      case 'rain':
      case 'showers':
        return Colors.blue;

      case 'snow':
        return Colors.lightBlue;

      case 'wind':
        return Colors.grey;

      case 'thunderstorm':
        return Colors.purple;

      default:
        return Colors.grey;
    }
  }

  static IconData getIconData(String iconCode) {
    return _getIconData(iconCode);
  }

  static Color getIconColor(String iconCode) {
    return _getIconColor(iconCode);
  }
}

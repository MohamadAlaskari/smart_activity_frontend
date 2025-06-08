import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:developer';

class WebLocationService {
  static Future<String> getCityWebOnly() async {
    if (!kIsWeb) {
      throw UnsupportedError('This method is for Web only.');
    }

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled in the browser.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permission denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission permanently denied.');
      }

      Position position = await Geolocator.getCurrentPosition();
      log('Web Position: ${position.latitude}, ${position.longitude}');

      return await _getCityFromCoordinates(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      log('Error retrieving location on web: $e');
      rethrow;
    }
  }

  static Future<String> _getCityFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        final city =
            placemark.locality ??
            placemark.subAdministrativeArea ??
            placemark.administrativeArea;

        if (city != null && city.isNotEmpty) {
          return city;
        }
      }

      throw Exception('Could not determine city from coordinates.');
    } catch (e) {
      log('Geocoding error: $e');
      rethrow;
    }
  }
}

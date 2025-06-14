import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:vibe_day/domain/model/location_result.dart';
import 'dart:developer';

class WebLocationService {
  static Future<String> getCityWebOnly() async {
    if (!kIsWeb) {
      throw UnsupportedError('This method is for Web only');
    }

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled in browser');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied in browser');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Location permissions are permanently denied in browser',
        );
      }

      Position position = await Geolocator.getCurrentPosition();

      log('Web Position: ${position.latitude}, ${position.longitude}');

      return await _getCityFromCoordinates(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      log('Error getting location in Web: $e');
      log('Fallback to Bremen');
      return 'Bremen';
    }
  }

  static Future<LocationResult> getLocationWebOnly() async {
    if (!kIsWeb) {
      throw UnsupportedError('This method is for Web only');
    }

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled in browser');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied in browser');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Location permissions are permanently denied in browser',
        );
      }

      Position position = await Geolocator.getCurrentPosition();

      log('Web Position: ${position.latitude}, ${position.longitude}');

      final cityName = await _getCityFromCoordinates(
        position.latitude,
        position.longitude,
      );

      return LocationResult(
        cityName: cityName,
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      log('Error getting location in Web: $e');
      log('Fallback to Bremen');
      return const LocationResult(
        cityName: 'Bremen',
        latitude: 53.0793,
        longitude: 8.8017,
      );
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
          log('Detected city from coordinates ($lat, $lng): $city');
          return city;
        }
      }

      throw Exception('Could not determine city name from coordinates');
    } catch (e) {
      log('Error in Geocoding: $e');
      return 'Bremen';
    }
  }
}

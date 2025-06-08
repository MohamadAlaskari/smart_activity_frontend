import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:developer';

class MobileLocationService {
  static Future<String> getCityMobileOnly() async {
    if (kIsWeb) {
      throw UnsupportedError('This method is for Mobile only.');
    }

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied');
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 15),
      );

      log('Mobile Position: ${position.latitude}, ${position.longitude}');

      return await _getCityFromCoordinates(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      log('Error getting location on mobile: $e');
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

      throw Exception('Could not determine city name from coordinates');
    } catch (e) {
      log('Geocoding error: $e');
      rethrow;
    }
  }
}

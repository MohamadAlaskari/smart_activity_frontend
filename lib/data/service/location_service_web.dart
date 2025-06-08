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
        throw Exception('Standortdienste sind im Browser deaktiviert.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Standortberechtigung wurde verweigert.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Standortberechtigung dauerhaft verweigert.');
      }

      // ⚠️ Keine Parameter wie desiredAccuracy oder timeLimit im Web!
      Position position = await Geolocator.getCurrentPosition();

      log('📍 Web Position: ${position.latitude}, ${position.longitude}');

      return await _getCityFromCoordinates(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      log('❌ Fehler beim Abrufen der Position im Web: $e');
      log('⚠️ Fallback auf Standardstadt: Berlin');
      return 'Berlin'; // fallback city
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
          log('🏙️ Erkannte Stadt: $city');
          return city;
        }
      }

      throw Exception('Stadt konnte nicht aus Koordinaten ermittelt werden.');
    } catch (e) {
      log('❌ Fehler beim Geocoding: $e');
      return 'Berlin'; // fallback
    }
  }
}

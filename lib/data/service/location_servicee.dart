import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vibe_day/domain/model/location_result.dart';
import 'location_service_web.dart';
import 'location_service_mobile.dart';

class LocationServicee {
  static Future<String> getCurrentCity() {
    if (kIsWeb) {
      return WebLocationService.getCityWebOnly();
    } else {
      return MobileLocationService.getCityMobileOnly();
    }
  }

  static Future<LocationResult> getCurrentLocationWithCoordinates() {
    if (kIsWeb) {
      return WebLocationService.getLocationWebOnly();
    } else {
      return MobileLocationService.getLocationMobileOnly();
    }
  }
}

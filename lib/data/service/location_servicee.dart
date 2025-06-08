import 'package:flutter/foundation.dart' show kIsWeb;
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
}

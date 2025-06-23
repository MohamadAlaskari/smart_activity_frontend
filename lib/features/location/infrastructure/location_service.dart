import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:smart_activity_frontend/core/constants/api_constants.dart';

class LocationService {
  final Dio dio;

  LocationService({required this.dio});

  Future<Position> getCurrentCoordinates() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
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

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

 Future<String> resolveCityFromCoordinates(double lat, double lon) async {
  final response = await dio.get(
    ApiConstants.locationResolveCity,
    queryParameters: {'latitude': lat, 'longitude': lon}, // ✅ هنا التصحيح!
  );

  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception('Failed to resolve city');
  }
}

}

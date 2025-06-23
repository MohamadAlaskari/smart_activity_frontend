import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/location/domain/location_state.dart';
import 'package:smart_activity_frontend/features/location/infrastructure/location_service.dart';

class LocationViewModel extends StateNotifier<LocationState> {
  final LocationService locationService;

  LocationViewModel({required this.locationService})
    : super(LocationState.initial());

  Future<void> useCurrentLocation() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final position = await locationService.getCurrentCoordinates();
      final city = await locationService.resolveCityFromCoordinates(
        position.latitude,
        position.longitude,
      );
      state = state.copyWith(city: city, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void updateCity(String city) {
    state = state.copyWith(city: city);
  }
}

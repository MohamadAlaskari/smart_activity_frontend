import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/core/api/dio_provider.dart';
import 'package:smart_activity_frontend/features/location/application/location_view_model.dart';
import 'package:smart_activity_frontend/features/location/domain/location_state.dart';
import 'package:smart_activity_frontend/features/location/infrastructure/location_service.dart';

final locationServiceProvider = Provider<LocationService>((ref) {
  final dio = ref.watch(dioProvider);
  return LocationService(dio: dio);
});

final locationViewModelProvider =
    StateNotifierProvider<LocationViewModel, LocationState>((ref) {
      final service = ref.watch(locationServiceProvider);
      return LocationViewModel(locationService: service);
    });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/auth/services/auth_service.dart';
import 'package:smart_activity_frontend/core/api/dio_provider.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio: dio);
});

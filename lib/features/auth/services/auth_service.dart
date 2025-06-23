import 'package:dio/dio.dart';
import 'package:smart_activity_frontend/core/constants/api_constants.dart';
import 'package:smart_activity_frontend/core/services/secure_storage.dart';
import 'package:smart_activity_frontend/features/user/models/user_model.dart';

class AuthService {
  final Dio _dio;
  final SecureStorage _storage;

  AuthService({required Dio dio}) : _dio = dio, _storage = SecureStorage();

  Future<void> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      ApiConstants.register,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
      },
    );

    final token = response.data['accessToken'];
    await _storage.saveToken(token);
  }

  Future<void> login({required String email, required String password}) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );

    final token = response.data['accessToken'];
    await _storage.saveToken(token);
  }

  Future<void> logout() async {
    await _storage.deleteToken();
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _dio.get(ApiConstants.currentUser);
      return UserModel.fromJson(response.data);
    } catch (_) {
      return null;
    }
  }

  Future<String?> getToken() => _storage.getToken();
}

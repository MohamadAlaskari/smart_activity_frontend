import 'package:dio/dio.dart';
import 'package:smart_activity_frontend/core/services/secure_storage.dart';
import 'package:smart_activity_frontend/features/user/models/user_model.dart';

class UserService {
  final Dio _dio;
  final SecureStorage _storage;

  UserService(this._dio, this._storage);

  Future<UserModel> getCurrentUser() async {
    final token = await _storage.getToken();
    final response = await _dio.get(
      '/auth/current-user',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> updateUser(UserModel updatedUser) async {
    final token = await _storage.getToken();
    final response = await _dio.put(
      '/users/${updatedUser.id}',
      data: updatedUser.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return UserModel.fromJson(response.data);
  }
}

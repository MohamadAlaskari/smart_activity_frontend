import 'package:dio/dio.dart';
import 'package:smart_activity_frontend/core/constants/api_constants.dart';
import '../services/secure_storage.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage().getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (e, handler) {
          // يمكنك إضافة لوجيك إضافي هنا مثل التوجيه للّوغين عند 401
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}

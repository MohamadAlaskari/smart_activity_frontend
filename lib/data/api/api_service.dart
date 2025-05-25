import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/auth/login')
  Future<dynamic> login(@Body() Map<String, dynamic> credentials);

  @POST('/auth/register')
  Future<dynamic> register(@Body() Map<String, dynamic> userData);

  @POST('/auth/current-user')
  Future<dynamic> getCurrentUser();

  @POST('/auth/request-reset')
  Future<dynamic> requestPasswordReset(@Body() Map<String, dynamic> requestData);
}
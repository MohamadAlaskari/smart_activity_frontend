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

  @GET('/auth/current-user')
  Future<dynamic> getCurrentUser();

  @POST('/auth/request-reset')
  Future<dynamic> requestPasswordReset(
    @Body() Map<String, dynamic> requestData,
  );

  @GET('/weather/week/location')
  Future<dynamic> getWeeklyWeather(@Query('location') String location);

  @GET('/suggestions')
  Future<dynamic> getSuggestions(
      @Query('lat') double lat,
      @Query('lon') double lon,
      @Query('date') String date,
      );

  @POST('/user-preferences')
  Future<dynamic> createUserPreferences(
      @Body() Map<String, dynamic> preferences,
      );

  @GET('/user-preferences')
  Future<dynamic> getUserPreferences();

  @PATCH('/user-preferences')
  Future<dynamic> updateUserPreferences(
      @Body() Map<String, dynamic> preferences,
      );

  @POST('/health-data')
  Future<dynamic> submitHealthData(@Body() Map<String, dynamic> healthData);

  @GET('/health-data')
  Future<dynamic> getHealthData();
}

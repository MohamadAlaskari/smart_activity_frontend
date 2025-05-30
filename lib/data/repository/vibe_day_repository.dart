import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:vibe_day/data/api/api_service.dart';
import 'package:vibe_day/data/repository/auth_data_repository.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/domain/model/auth_result.dart';
import 'package:vibe_day/domain/model/user.dart';
import 'package:vibe_day/domain/model/activity.dart';

class VibeDayRepository {
  late final ApiService _client;
  final AuthDataRepository _tokenStorageRepository;
  final UserStorageRepository _userStorageRepository;
  final String _baseUrl;
  late Dio _dio;
  late final Fresh _fresh;
  final _controller = StreamController<AuthResult>();

  VibeDayRepository({
    required AuthDataRepository tokenStorageRepository,
    required String baseUrl,
    required UserStorageRepository userStorageRepository,
  }) : _baseUrl = baseUrl,
       _userStorageRepository = userStorageRepository,
       _tokenStorageRepository = tokenStorageRepository {
    _init();
  }

  Stream<AuthResult> get status async* {
    final token = await _fresh.token;
    if (token != null) {
      final user = await _userStorageRepository.getUser();
      if (user != null) {
        yield AuthResult.authenticated(user);
      }
    }
    yield* _controller.stream;
  }

  Future<List<dynamic>> getWeeklyWeather(String location) async {
    try {
      final token = await getToken();

      if (token == null) {
        throw Exception('Authentication required. Please login again.');
      }

      final authHeader = 'Bearer ${token.accessToken}';

      final response = await _dio.get(
        '/weather/week',
        queryParameters: {'location': location},
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': authHeader,
          },
        ),
      );

      log('Weather API Response: ${response.data}');

      if (response.data is List) {
        return response.data as List<dynamic>;
      } else {
        throw Exception('Unexpected response format for weather data');
      }
    } catch (e) {
      log('Error fetching weather data: $e');

      if (e is DioException) {
        log('DioException details:');
        log('- Status Code: ${e.response?.statusCode}');
        log('- Request URL: ${e.requestOptions.uri}');
        log('- Request Headers: ${e.requestOptions.headers}');
        log('- Response Data: ${e.response?.data}');

        if (e.response?.statusCode == 401) {
          log('401 error - forcing logout');
          await logout();
          throw Exception('Session expired. Please login again.');
        }
      }

      rethrow;
    }
  }

  List<Activity> getDummyActivities() {
    return [
      const Activity(
        id: '1',
        title: 'Going for a Walk @ Hasbruch Park',
        description: 'Entspannter Spaziergang durch den schönen Hasbruch Park',
        imageUrl:
            'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=500',
        location: 'Wildeshausen',
        date: 'Today, 15. May',
        time: '19:30-21:00',
        cost: '0€',
        category: 'nature',
      ),
      const Activity(
        id: '2',
        title: 'Summer Sounds',
        description: 'Live Musik Festival mit verschiedenen Künstlern',
        imageUrl:
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=500',
        location: 'Bremen Wallanlagen',
        date: 'Today, 15. May',
        time: '19:30-21:00',
        cost: '0€',
        category: 'music',
      ),
      const Activity(
        id: '3',
        title: 'Bremen City Street Art Tour',
        description: 'Entdecke die vielfältige Street Art Szene Bremens',
        imageUrl:
            'https://images.unsplash.com/photo-1541961017774-22349e4a1262?w=500',
        location: 'Bremen',
        date: 'Today, 15. May',
        time: '19:30-21:00',
        cost: '5€',
        category: 'culture',
      ),
    ];
  }

  Future<AuthResult> login(String email, String password) async {
    AuthResult status;
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
        options: Options(headers: {'Accept': 'application/json'}),
      );

      final accessToken = response.data['accessToken'];

      if (accessToken == null) {
        log('Error: Token not found in response: ${response.data}');
        return AuthResult.unauthenticated(401, 'Token not found in response');
      }

      OAuth2Token token = OAuth2Token(
        accessToken: accessToken,
        refreshToken: accessToken,
        tokenType: 'Bearer',
      );
      await setToken(token);

      try {
        final userResponse = await Dio().post(
          '${_dio.options.baseUrl}/auth/current-user',
          options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
              'Accept': 'application/json',
            },
          ),
        );

        log('User response: ${userResponse.data}');
        final user = User.fromJson(userResponse.data);
        status = AuthResult.authenticated(user);
        await _userStorageRepository.saveUser(user);
      } catch (userError) {
        log('Error fetching user details: $userError');
        status = AuthResult.unauthenticated(
          500,
          'Failed to fetch user details: $userError',
        );
      }
    } on DioException catch (e) {
      String errorMessage = 'DioException: ';

      if (e.response != null) {
        errorMessage += 'Status ${e.response!.statusCode}: ${e.response!.data}';
        log(errorMessage);
        status = AuthResult.unauthenticated(
          e.response!.statusCode,
          errorMessage,
        );
      } else {
        log(errorMessage);
        status = AuthResult.unauthenticated(500, errorMessage);
      }
    } catch (e) {
      log('Unexpected error during login: $e');
      status = AuthResult.unauthenticated(500, e.toString());
    }
    _controller.add(status);
    return status;
  }

  Future<AuthResult> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String username,
  }) async {
    AuthResult status;
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'username': username,
          'password': password,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Registration successful: ${response.data}');

        final accessToken = response.data['accessToken'];

        if (accessToken != null) {
          status = const AuthResult.unauthenticated(
            200,
            'Registration successful. Please verify your email and log in.',
          );
        } else {
          status = const AuthResult.unauthenticated(
            200,
            'Registration successful. Please log in.',
          );
        }
      } else {
        status = AuthResult.unauthenticated(
          response.statusCode,
          'Registration failed',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data;

        if ((statusCode == 200 || statusCode == 201) && responseData != null) {
          log('Registration successful despite DioException: $responseData');
          status = const AuthResult.unauthenticated(
            200,
            'Registration successful. Please verify your email and log in.',
          );
        } else if (statusCode == 400 && responseData != null) {
          final errorMessage = responseData.toString();

          if (errorMessage.contains(
            'password must be longer than or equal to 6 characters',
          )) {
            status = const AuthResult.unauthenticated(
              400,
              'PASSWORD_TOO_SHORT',
            );
          } else {
            log('Validation error during registration: $errorMessage');
            status = AuthResult.unauthenticated(
              statusCode,
              'Validation error: $errorMessage',
            );
          }
        } else if (statusCode == 500 && responseData != null) {
          final errorMessage = responseData.toString();

          if (errorMessage.contains('Duplicate entry') &&
              errorMessage.contains('IDX_97672ac88f789774dd47f7c8be')) {
            status = const AuthResult.unauthenticated(
              500,
              'EMAIL_ALREADY_EXISTS',
            );
          } else if (errorMessage.contains('Duplicate entry') &&
              errorMessage.contains('IDX_fe0bb3f6520ee0469504521e71')) {
            status = const AuthResult.unauthenticated(
              500,
              'USERNAME_ALREADY_EXISTS',
            );
          } else {
            log('Server error during registration: $errorMessage');
            status = AuthResult.unauthenticated(
              statusCode,
              'Registration failed: Server error',
            );
          }
        } else {
          log(
            'HTTP error during registration: Status $statusCode: $responseData',
          );
          status = AuthResult.unauthenticated(
            statusCode,
            'Registration failed',
          );
        }
      } else {
        log('Network error during registration: ${e.message}');
        status = AuthResult.unauthenticated(500, 'Network error');
      }
    } catch (e) {
      log('Unexpected error during registration: $e');
      status = AuthResult.unauthenticated(500, e.toString());
    }
    _controller.add(status);
    return status;
  }

  Future<void> requestPasswordReset(String email) async {
    try {
      final response = await _dio.post(
        '/auth/request-reset',
        data: {'email': email},
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to send reset email');
      }

      log('Password reset email sent successfully: ${response.data}');
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data;

        if (statusCode == 404 &&
            responseData is Map &&
            responseData['error']?['message'] == 'User not found') {
          throw Exception('Status 404: User not found');
        }

        String errorMessage = 'Status $statusCode: $responseData';
        log('Failed to send reset email: $errorMessage');
        throw Exception(errorMessage);
      } else {
        String errorMessage = e.message ?? 'Unknown network error';
        log('Network error during password reset request: $errorMessage');
        throw Exception(errorMessage);
      }
    } catch (e) {
      log('Unexpected error during password reset request: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    await _fresh.setToken(null);
    await _userStorageRepository.deleteUser();
    _controller.add(const AuthResult.unauthenticated(403, 'logged out'));
  }

  Future<OAuth2Token?> getToken() async => await _fresh.token;

  Future<void> setToken(OAuth2Token? token) async {
    await _fresh.setToken(token);
  }

  void dispose() {
    _controller.close();
  }

  Future<void> _init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        contentType: 'application/json',
        headers: {'Accept': 'application/json'},
        validateStatus: (status) {
          return status! < 400;
        },
        followRedirects: false,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          if (response.statusCode == 303) {
            var location = response.headers.value(HttpHeaders.locationHeader);
            var res = await _dio.get(location!);
            return handler.resolve(res);
          }
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 ||
              error.response?.statusCode == 403) {}
          return handler.next(error);
        },
      ),
    );

    _fresh = Fresh.oAuth2(
      tokenStorage: _tokenStorageRepository,
      refreshToken: (token, client) async {
        log(
          'Token refresh requested, but no refresh endpoint available - forcing logout',
        );
        await logout();
        throw DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
          message: 'Token expired - please login again',
        );
      },
      tokenHeader: (token) {
        log(
          'Fresh: tokenHeader called with token: ${token.accessToken.substring(0, 10)}...',
        );
        return {HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'};
      },
      shouldRefresh: (response) {
        log(
          'Fresh: shouldRefresh called, status: ${response?.statusCode}, but refresh disabled',
        );
        return false;
      },
    );

    _dio.interceptors.add(_fresh);

    _client = ApiService(_dio, baseUrl: _baseUrl);
    final token = await _fresh.token;
    if (token != null) {
      final user = await _userStorageRepository.getUser();
      if (user != null) {
        _controller.add(AuthResult.authenticated(user));
      } else {
        await logout();
      }
    } else {
      _controller.add(const AuthResult.unauthenticated(null, null));
    }
  }
}

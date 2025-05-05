import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:smart_activity_frontend/data/api/api_service.dart';
import 'package:smart_activity_frontend/data/repository/auth_data_repository.dart';
import 'package:smart_activity_frontend/data/repository/user_storage_repository.dart'
    show UserStorageRepository;
import 'package:smart_activity_frontend/domain/model/auth_result.dart';
import 'package:smart_activity_frontend/domain/model/user.dart';

class VibeDayRepository {
  late final ApiService _client;
  final AuthDataRepository _tokenStorageRepository;
  final UserStorageRepository _userStorageRepository;
  final String _baseUrl;
  late Dio _dio;
  late final Fresh _fresh;
  final _controller = StreamController<AuthResult>();
  bool _isTokenRefreshing = false;

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

  // Future<AuthResult> login(String email, String password) async {
  //   AuthResult status;
  //   try {
  //     var clientId = FlavorConfig.appFlavor.clientId;
  //     var clientSecret = FlavorConfig.appFlavor.clientSecret;
  //     final String encodedData =
  //         'grant_type=password'
  //         '&username=${Uri.encodeComponent(email)}'
  //         '&password=${Uri.encodeComponent(password)}'
  //         '&client_id=${Uri.encodeComponent(clientId)}'
  //         '&client_secret=${Uri.encodeComponent(clientSecret)}';
  //
  //     final response = await _dio.post(
  //       '/api/v2/auth/login',
  //       data: encodedData,
  //       options: Options(
  //         contentType: 'application/x-www-form-urlencoded',
  //         headers: {'Accept': 'application/json'},
  //       ),
  //     );
  //     final accessToken = response.data['access_token'];
  //     final refreshToken = response.data['refresh_token'];
  //     final tokenType = response.data['token_type'] ?? 'bearer';
  //
  //     OAuth2Token token = OAuth2Token(
  //       accessToken: accessToken,
  //       refreshToken: refreshToken,
  //       tokenType: tokenType,
  //     );
  //     await setToken(token);
  //
  //     try {
  //       final userResponse = await _dio.get(
  //         '/api/v2/accounts/self',
  //         options: Options(
  //           headers: {
  //             'Authorization': '${token.tokenType} ${token.accessToken}',
  //           },
  //         ),
  //       );
  //       final user = User.fromJson(userResponse.data);
  //       status = AuthResult.authenticated(user);
  //       await _userStorageRepository.saveUser(user);
  //
  //       await getReportCategories();
  //     } catch (userError) {
  //       status = AuthResult.unauthenticated(500);
  //     }
  //   } on DioException catch (e) {
  //     log(e.stackTrace.toString());
  //     if (e.response != null) {
  //       status = AuthResult.unauthenticated(
  //         e.response!.statusCode,
  //         e.response!.data.toString(),
  //       );
  //     } else {
  //       status = AuthResult.unauthenticated(500, e.error.toString());
  //     }
  //     _controller.add(status);
  //     return status;
  //   } catch (e) {
  //     status = AuthResult.unauthenticated(500, e.toString());
  //   }
  //   _controller.add(status);
  //   return status;
  // }

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
              error.response?.statusCode == 403) {
            if (error.requestOptions.path.contains('/api/v2/auth/login')) {
              await logout();
            }
          }
          return handler.next(error);
        },
      ),
    );

    _fresh = Fresh.oAuth2(
      tokenStorage: _tokenStorageRepository,
      refreshToken: (token, client) async {
        if (_isTokenRefreshing) {
          await Future.delayed(const Duration(milliseconds: 500));
          return await _fresh.token;
        }

        _isTokenRefreshing = true;
        try {
          if (token?.refreshToken == null) {
            await logout();
            _isTokenRefreshing = false;
            throw DioException(
              requestOptions: RequestOptions(path: ''),
              type: DioExceptionType.badResponse,
              message: 'No refresh token available',
            );
          }
          final String encodedData =
              'grant_type=refresh_token'
              '&refresh_token=${Uri.encodeComponent(token?.refreshToken ?? '')}';

          final refreshDio = Dio(
            BaseOptions(
              baseUrl: _baseUrl,
              headers: {'Accept': 'application/json'},
            ),
          );

          final response = await refreshDio.post(
            '/api/v2/auth/login',
            data: encodedData,
            options: Options(
              contentType: 'application/x-www-form-urlencoded',
              headers: {'Accept': 'application/json'},
            ),
          );

          if (response.statusCode != 200) {
            await logout();
            _isTokenRefreshing = false;
            throw DioException(
              requestOptions: response.requestOptions,
              response: response,
              type: DioExceptionType.badResponse,
            );
          }

          final accessToken = response.data['access_token'];
          final refreshToken = response.data['refresh_token'];
          final tokenType = response.data['token_type'] ?? 'bearer';

          final newToken = OAuth2Token(
            accessToken: accessToken,
            refreshToken: refreshToken,
            tokenType: tokenType,
          );

          try {
            final userResponse = await refreshDio.get(
              '/api/v2/accounts/self',
              options: Options(
                headers: {
                  'Authorization':
                      '${newToken.tokenType} ${newToken.accessToken}',
                  'Accept': 'application/json',
                },
              ),
            );

            final user = User.fromJson(userResponse.data);
            _controller.add(AuthResult.authenticated(user));
            await _userStorageRepository.saveUser(user);
          } catch (userError) {
            log('Failed to get user info after token refresh: $userError');
          }

          _isTokenRefreshing = false;
          return newToken;
        } catch (e) {
          await logout();
          _isTokenRefreshing = false;
          rethrow;
        }
      },
      tokenHeader: (token) {
        return {
          HttpHeaders.authorizationHeader:
              '${token.tokenType} ${token.accessToken}',
        };
      },
      shouldRefresh: (response) {
        return response?.statusCode == 401 || response?.statusCode == 403;
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

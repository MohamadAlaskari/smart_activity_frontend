import 'dart:convert';
import 'package:http/http.dart' as http;
import 'secure_storage.dart';

class ApiClient {
  final String baseUrl;
  final SecureStorage _storage = SecureStorage();

  ApiClient({required this.baseUrl});

  Future<http.Response> get(String path, {Map<String, String>? query}) async {
    final uri = Uri.parse('$baseUrl$path').replace(queryParameters: query);
    final token = await _storage.getToken();

    return http.get(uri, headers: _buildHeaders(token));
  }

  Future<http.Response> post(
    String path, {
    Map<String, dynamic>? body,
    bool withAuth = true, // 👈 يسمح لك بتعطيل التوكن
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final token = withAuth ? await _storage.getToken() : null;

    return http.post(
      uri,
      headers: _buildHeaders(token),
      body: jsonEncode(body),
    );
  }

  Map<String, String> _buildHeaders(String? token) {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}

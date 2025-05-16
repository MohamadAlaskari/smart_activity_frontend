import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl =
      'https://smart-activity-backend.alaskaritech.com/auth';

  Future<bool> registerUser(Map<String, String> userData) async {
    final url = Uri.parse('$baseUrl/register');
    print('Request URL: $url');
    print('Request Body: ${jsonEncode(userData)}');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to register user: ${response.body}');
    }
  }

  Future<String> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    print('Request URL: $url');
    print(
      'Request Body: ${jsonEncode({'email': email, 'password': password})}',
    );
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.containsKey('accessToken')) {
        return data['accessToken'];
      } else {
        throw Exception('Unexpected response format: ${response.body}');
      }
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid email or password.');
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> getCurrentUser(String token) async {
    final url = Uri.parse('$baseUrl/current-user');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch current user: ${response.body}');
    }
  }
}

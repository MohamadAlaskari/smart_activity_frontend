// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../auth/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authService = AuthService();
  final _storage = FlutterSecureStorage();
  String? _firstName;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    try {
      final token = await _storage.read(key: 'jwt_token');
      if (token != null) {
        final userData = await _authService.getCurrentUser(token);
        setState(() {
          _firstName = userData['firstName'];
        });
      } else {
        setState(() {
          _errorMessage = 'Token not found. Please log in again.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to fetch user: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child:
            _errorMessage != null
                ? Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                )
                : _firstName == null
                ? const CircularProgressIndicator()
                : Text(
                  '👋 Hallo $_firstName',
                  style: const TextStyle(fontSize: 24),
                ),
      ),
    );
  }
}

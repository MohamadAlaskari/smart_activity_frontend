import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  final _storage = FlutterSecureStorage();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final token = await _authService.loginUser(
          _emailController.text,
          _passwordController.text,
        );

        await _storage.write(key: 'jwt_token', value: token);

        final userData = await _authService.getCurrentUser(token);
        final firstName = userData['firstName'];

        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {'firstName': firstName},
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login erfolgreich!')));
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login fehlgeschlagen: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anmelden')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-Mail'),
                validator:
                    (value) => value!.isEmpty ? 'Bitte E-Mail eingeben' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Passwort'),
                obscureText: true,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Bitte Passwort eingeben' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: Text('Anmelden')),
            ],
          ),
        ),
      ),
    );
  }
}

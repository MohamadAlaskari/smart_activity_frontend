import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        final success = await _authService.registerUser({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'username': _usernameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        });

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Bitte überprüfe deine E-Mail zur Verifizierung.'),
            ),
          );
          Navigator.pushReplacementNamed(context, '/login');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registrierung fehlgeschlagen: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrieren')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'Vorname'),
                validator:
                    (value) => value!.isEmpty ? 'Bitte Vorname eingeben' : null,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Nachname'),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Bitte Nachname eingeben' : null,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Benutzername'),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Bitte Benutzername eingeben' : null,
              ),
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
              ElevatedButton(onPressed: _register, child: Text('Registrieren')),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_activity_frontend/features/auth/services/auth_service.dart';
import 'package:smart_activity_frontend/features/auth/providers/auth_service_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final authService = ref.read(authServiceProvider);

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await authService.register(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (mounted) {
        _clearForm();
        context.go('/weather');
      }
    } catch (e) {
      setState(() => _errorMessage = _formatError(e));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _clearForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  String _formatError(Object error) {
    final msg = error.toString();
    if (msg.contains('Register failed')) {
      return 'Registrierung fehlgeschlagen. Prüfe deine Eingaben.';
    }
    return 'Ein unerwarteter Fehler ist aufgetreten.';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrieren')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              _buildTextField(_firstNameController, 'Vorname'),
              const SizedBox(height: 16),
              _buildTextField(_lastNameController, 'Nachname'),
              const SizedBox(height: 16),
              _buildTextField(_usernameController, 'Benutzername'),
              const SizedBox(height: 16),
              _buildTextField(
                _emailController,
                'E-Mail',
                keyboardType: TextInputType.emailAddress,
                validator:
                    (val) =>
                        val == null || !val.contains('@')
                            ? 'Gültige E-Mail eingeben'
                            : null,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                _passwordController,
                'Passwort',
                obscureText: true,
                validator:
                    (val) =>
                        val != null && val.length >= 6
                            ? null
                            : 'Mind. 6 Zeichen erforderlich',
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleRegister,
                  child:
                      _isLoading
                          ? const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          )
                          : const Text('Registrieren'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.push('/login'),
                child: const Text('Bereits registriert? Jetzt einloggen'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator:
          validator ??
          (val) =>
              val == null || val.isEmpty ? '$label ist erforderlich' : null,
    );
  }
}

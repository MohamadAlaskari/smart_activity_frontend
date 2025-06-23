import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_activity_frontend/features/auth/services/auth_service.dart';
import 'package:smart_activity_frontend/features/auth/providers/auth_service_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final authService = ref.read(authServiceProvider);

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await authService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (mounted) {
        _emailController.clear();
        _passwordController.clear();
        context.go('/home');
      }
    } catch (e) {
      setState(() => _errorMessage = _formatError(e));
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String _formatError(Object error) {
    final msg = error.toString();
    if (msg.contains('Login failed')) {
      return 'Login fehlgeschlagen. Bitte überprüfe deine Zugangsdaten.';
    }
    return 'Ein unbekannter Fehler ist aufgetreten.';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-Mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator:
                    (val) =>
                        val == null || val.isEmpty
                            ? 'E-Mail ist erforderlich'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Passwort',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator:
                    (val) =>
                        val != null && val.length >= 6
                            ? null
                            : 'Mindestens 6 Zeichen erforderlich',
                onFieldSubmitted: (_) => _handleLogin(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  child:
                      _isLoading
                          ? const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          )
                          : const Text('Login'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.push('/register'),
                child: const Text('Noch kein Konto? Jetzt registrieren'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/features/user/application/user_view_model.dart';
import 'package:smart_activity_frontend/features/user/models/user_model.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider).user;

    // Wenn der User noch nicht geladen ist, lade ihn jetzt!
    if (user == null) {
      Future.microtask(() {
        ref.read(userProvider.notifier).loadCurrentUser();
      });
      _firstNameController = TextEditingController();
      _lastNameController = TextEditingController();
      _usernameController = TextEditingController();
    } else {
      _firstNameController = TextEditingController(text: user.firstName);
      _lastNameController = TextEditingController(text: user.lastName);
      _usernameController = TextEditingController(text: user.username);
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    final user = userState.user;

    // Ladeindikator zeigen, wenn User geladen wird
    if (userState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Fehler oder noch kein User geladen
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Kein Benutzer geladen.')),
      );
    }

    // Textfelder aktualisieren, falls User gerade geladen wurde (Edge Case!)
    _firstNameController.text = user.firstName;
    _lastNameController.text = user.lastName;
    _usernameController.text = user.username;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil bearbeiten')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'Vorname'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Nachname'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Benutzername'),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Speichern'),
                onPressed: () async {
                  final updatedUser = user.copyWith(
                    firstName: _firstNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                    username: _usernameController.text.trim(),
                  );
                  await ref.read(userProvider.notifier).updateUser(updatedUser);

                  if (context.mounted) {
                    if (ref.read(userProvider).error == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profil erfolgreich aktualisiert'),
                        ),
                      );
                      Navigator.of(context).pop(); // zurück zur Profilseite
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ref.read(userProvider).error!)),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

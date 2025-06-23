// lib/features/shared/presentation/layout/main_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_activity_frontend/features/auth/cubit/auth_cubit.dart';
import '../../../../core/theme/theme_cubit.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  void _showBottomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profil'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/profile');
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  Navigator.pop(context);
                  context.read<AuthCubit>().logout();
                  if (context.mounted) {
                    context.go('/login');
                  }
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.brightness_6),
                title: const Text('Toggle Theme'),
                onTap: () {
                  context.read<ThemeCubit>().toggleTheme();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthCubit cubit) => cubit.state.user);
    final username = user?.firstName ?? 'Gast';

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hallo $username',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => _showBottomMenu(context),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

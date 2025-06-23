import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_activity_frontend/features/user/presentation/screens/edit_profile_screen.dart';
import 'package:smart_activity_frontend/features/user/presentation/screens/profile_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/shared/presentation/layout/main_layout.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/cubit/auth_cubit.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),

      ShellRoute(
        builder: (_, __, child) => MainLayout(child: child),
        routes: [
          GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
          GoRoute(
            path: '/profile',
            builder: (_, __) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'edit',
                builder: (_, __) => const EditProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

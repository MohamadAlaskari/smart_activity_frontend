// lib/routes/app_router.dart
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/weather/presentation/screens/weather_screen.dart';
import '../../features/shared/presentation/layout/main_layout.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/login_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/register',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: '/register',
            builder: (context, state) => RegisterScreen(),
          ),
          GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
          GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
          GoRoute(
            path: '/weather',
            builder: (context, state) => const WeatherScreen(),
          ),
        ],
      ),
    ],
  );
}

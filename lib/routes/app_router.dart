// lib/routes/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/weather/presentation/screens/weather_screen.dart';
import '../../features/shared/presentation/layout/main_layout.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
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

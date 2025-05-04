// lib/features/shared/presentation/layout/main_layout.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;
    if (location.startsWith('/weather')) currentIndex = 1;

    return Scaffold(
      appBar: AppBar(title: const Text('Smart Activity'), centerTitle: false),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) context.go('/');
          if (index == 1) context.go('/weather');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Wetter'),
        ],
      ),
    );
  }
}

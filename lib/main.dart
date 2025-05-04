// Ich beginne jetzt mit dem Schreiben der kompletten Flutter-Dateien entsprechend deiner Struktur. Ich fange mit main.dart und den wichtigsten Core-Dateien an. Danach folgen Router, Layout, WeatherScreen, ViewModel, Service und Widgets. Die einzelnen Dateien werden schrittweise erstellt. Sag einfach "weiter", wenn du bereit bist für den nächsten Teil.

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: SmartActivityApp()));
}

class SmartActivityApp extends StatelessWidget {
  const SmartActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smart Activity',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/api/dio_provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/services/auth_service.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('de_DE', null);

  runApp(const ProviderScope(child: AppBootstrapper()));
}

class AppBootstrapper extends ConsumerWidget {
  const AppBootstrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dio = ref.read(dioProvider); // نحصل على Dio من الـ Provider
    final authService = AuthService(dio: dio); // نمرر dio إلى AuthService

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => AuthCubit(authService)..loadCurrentUser()),
      ],
      child: const SmartActivityApp(),
    );
  }
}

class SmartActivityApp extends StatelessWidget {
  const SmartActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          title: 'VibeDay',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}

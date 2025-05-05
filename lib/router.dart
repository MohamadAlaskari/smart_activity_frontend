import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_activity_frontend/presentation/app/app_cubit.dart';
import 'package:smart_activity_frontend/presentation/login/login_provider.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return state.status.maybeWhen(
              // authenticated: (_) => const HomeProvider(),
              orElse: () => const LoginProvider(),
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/${LoginProvider.routeName}',
      name: LoginProvider.routeName,
      builder: (_, __) => const LoginProvider(),
    ),
    // GoRoute(
    //   path: '/${ForgotPasswordProvider.routeName}',
    //   name: ForgotPasswordProvider.routeName,
    //   builder: (_, __) => const ForgotPasswordProvider(),
    // ),
    // GoRoute(
    //   path: '/${HomeProvider.routeName}',
    //   name: HomeProvider.routeName,
    //   builder: (_, __) => const HomeProvider(),
    // ),
    // GoRoute(
    //   path: '/${SettingsProvider.routeName}',
    //   name: SettingsProvider.routeName,
    //   builder: (_, __) => const SettingsProvider(),
    // ),
  ],
);
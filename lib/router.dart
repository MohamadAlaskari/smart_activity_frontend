import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/presentation/app/app_cubit.dart';
import 'package:vibe_day/presentation/detail/activity_detail_provider.dart';
import 'package:vibe_day/presentation/home/home_cubit.dart';
import 'package:vibe_day/presentation/home/home_provider.dart';
import 'package:vibe_day/presentation/login/login_provider.dart';
import 'package:vibe_day/presentation/register/register_provider.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_provider.dart';

import 'domain/model/activity.dart';
import 'presentation/forgot_password/forgot_password_provider.dart';

class AuthenticatedHomeWrapper extends StatelessWidget {
  const AuthenticatedHomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().onUserAuthenticated();
    });

    return const HomeProvider();
  }
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return state.status.maybeWhen(
              authenticated: (_) => const AuthenticatedHomeWrapper(),
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
    GoRoute(
      path: '/${RegisterProvider.routeName}',
      name: RegisterProvider.routeName,
      builder: (_, __) => const RegisterProvider(),
    ),
    GoRoute(
      path: '/${ForgotPasswordProvider.routeName}',
      name: ForgotPasswordProvider.routeName,
      builder: (_, __) => const ForgotPasswordProvider(),
    ),
    GoRoute(
      path: '/${HomeProvider.routeName}',
      name: HomeProvider.routeName,
      builder: (_, __) => const HomeProvider(),
    ),
    GoRoute(
      path: '/${VibeSelectionProvider.routeName}',
      name: VibeSelectionProvider.routeName,
      builder: (_, __) => const VibeSelectionProvider(),
    ),
    GoRoute(
      path: '/${ActivityDetailProvider.routeName}',
      name: ActivityDetailProvider.routeName,
      builder: (context, state) {
        final activity = state.extra as Activity;
        return ActivityDetailProvider(activity: activity);
      },
    ),
  ],
);

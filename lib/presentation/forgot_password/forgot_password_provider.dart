import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/forgot_password/forgot_password_cubit.dart';
import 'package:vibe_day/presentation/forgot_password/forgot_password_view.dart';

class ForgotPasswordProvider extends StatelessWidget {
  const ForgotPasswordProvider({super.key});

  static String get routeName => 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(
        vibeDayRepository: context.read<VibeDayRepository>(),
      ),
      child: const ForgotPasswordView(),
    );
  }
}
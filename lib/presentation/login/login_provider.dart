import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_activity_frontend/data/repository/vibe_day_repository.dart';
import 'package:smart_activity_frontend/presentation/login/login_cubit.dart';
import 'package:smart_activity_frontend/presentation/login/login_state.dart';
import 'package:smart_activity_frontend/presentation/login/login_view.dart';
import 'package:smart_activity_frontend/presentation/ui/widgets/validation_dialog.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final vibeDayRepository = context.read<VibeDayRepository>();

        return LoginCubit(vibeDayRepository: vibeDayRepository);
      },
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (prev, cur) => prev.status != cur.status,
        listener: _onStatusChanged,
        child: const LoginView(),
      ),
    );
  }

  void _onStatusChanged(BuildContext context, LoginState state) {
    if (state.status == FormzSubmissionStatus.success) {
      // context.goNamed(HomeProvider.routeName);
    } else if (state.status == FormzSubmissionStatus.failure) {
      ValidationDialog.show(
        context: context,
        title: 'LOGIN.DIALOG.INVALID.TITLE'.tr(),
        description: 'LOGIN.DIALOG.INVALID.DESCRIPTION'.tr(),
      );
    }
  }
}

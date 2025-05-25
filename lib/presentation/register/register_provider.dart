import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/home/home_provider.dart';
import 'package:vibe_day/presentation/login/login_provider.dart';
import 'package:vibe_day/presentation/register/register_cubit.dart'
    show RegisterCubit;
import 'package:vibe_day/presentation/register/register_state.dart';
import 'package:vibe_day/presentation/register/register_view.dart';
import 'package:vibe_day/presentation/ui/widgets/validation_dialog.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final vibeDayRepository = context.read<VibeDayRepository>();
        return RegisterCubit(vibeDayRepository: vibeDayRepository);
      },
      child: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (prev, cur) => prev.status != cur.status,
        listener: _onStatusChanged,
        child: const RegisterView(),
      ),
    );
  }

  void _onStatusChanged(BuildContext context, RegisterState state) {
    if (state.status == FormzSubmissionStatus.success) {
      if (state.needsEmailVerification) {
        _showEmailVerificationDialog(context);
      } else {
        context.goNamed(HomeProvider.routeName);
      }
    } else if (state.status == FormzSubmissionStatus.failure) {
      if (state.emailAlreadyExists) {
        ValidationDialog.show(
          context: context,
          title: 'REGISTER.DIALOG.EMAIL_EXISTS.TITLE'.tr(),
          description: 'REGISTER.DIALOG.EMAIL_EXISTS.DESCRIPTION'.tr(),
        );
      } else if (state.usernameAlreadyExists) {
        ValidationDialog.show(
          context: context,
          title: 'REGISTER.DIALOG.USERNAME_EXISTS.TITLE'.tr(),
          description: 'REGISTER.DIALOG.USERNAME_EXISTS.DESCRIPTION'.tr(),
        );
      } else if (state.passwordTooShort) {
        ValidationDialog.show(
          context: context,
          title: 'REGISTER.DIALOG.PASSWORD_TOO_SHORT.TITLE'.tr(),
          description: 'REGISTER.DIALOG.PASSWORD_TOO_SHORT.DESCRIPTION'.tr(),
        );
      } else {
        ValidationDialog.show(
          context: context,
          title: 'REGISTER.DIALOG.INVALID.TITLE'.tr(),
          description: 'REGISTER.DIALOG.INVALID.DESCRIPTION'.tr(),
        );
      }
    }
  }

  void _showEmailVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('REGISTER.EMAIL_VERIFICATION.TITLE'.tr()),
          content: Text('REGISTER.EMAIL_VERIFICATION.DESCRIPTION'.tr()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.goNamed(LoginProvider.routeName);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

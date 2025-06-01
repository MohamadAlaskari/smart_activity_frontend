import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/forgot_password/forgot_password_cubit.dart';
import 'package:vibe_day/presentation/forgot_password/forgot_password_state.dart';
import 'package:vibe_day/presentation/ui/buttons/vibe_day_button.dart';
import 'package:vibe_day/presentation/ui/widgets/custom_text_field.dart';
import 'package:vibe_day/presentation/ui/widgets/validation_dialog.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(
        backgroundColor: ColorName.white,
        title: Text(
          'FORGOT_PASSWORD.TITLE'.tr(),
          style: const TextStyle(fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 160),
                  const EmailInput(),
                  const SizedBox(height: 60),
                  const _SubmitButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Widget contentWithListener =
        BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listenWhen:
              (previous, current) =>
                  previous.screenStatus != current.screenStatus,
          listener: (context, state) {
            state.screenStatus.maybeWhen(
              success: () {
                ValidationDialog.show(
                  context: context,
                  title: 'FORGOT_PASSWORD.DIALOG.SUCCESS_RESET.TITLE'.tr(),
                  description:
                      'FORGOT_PASSWORD.DIALOG.SUCCESS_RESET.DESCRIPTION'.tr(),
                );
              },
              error: (errorType) {
                String title;
                String description;

                if (errorType == 'USER_NOT_FOUND') {
                  title = 'FORGOT_PASSWORD.DIALOG.USER_NOT_FOUND.TITLE'.tr();
                  description =
                      'FORGOT_PASSWORD.DIALOG.USER_NOT_FOUND.DESCRIPTION'.tr();
                } else {
                  title = 'FORGOT_PASSWORD.DIALOG.ERROR_RESET.TITLE'.tr();
                  description =
                      'FORGOT_PASSWORD.DIALOG.ERROR_RESET.DESCRIPTION'.tr();
                }

                ValidationDialog.show(
                  context: context,
                  title: title,
                  description: description,
                );
              },
              orElse: () {},
            );
          },
          child: content,
        );
    return contentWithListener;
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return CustomTextField(
          errorText:
              !state.emailOrUser.isPure && !state.emailOrUser.isValid
                  ? 'LOGIN.ERROR.ERROR_MESSAGE'.tr()
                  : null,
          labelText: 'LOGIN.MAIL_OR_USER'.tr(),
          initialValue: state.emailOrUser.value,
          onChanged:
              (value) => context.read<ForgotPasswordCubit>().setEmail(value),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return VibeDayButton(
          text: 'FORGOT_PASSWORD.ACTION'.tr(),
          isLoading: state.screenStatus.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onPressed: () {
            final cubit = context.read<ForgotPasswordCubit>();
            if (!cubit.isValidEmail) {
              ValidationDialog.show(
                context: context,
                title: 'FORGOT_PASSWORD.DIALOG.INCOMPLETE.TITLE'.tr(),
                description:
                    'FORGOT_PASSWORD.DIALOG.INCOMPLETE.DESCRIPTION'.tr(),
              );
              return;
            }
            cubit.submit();
          },
        );
      },
    );
  }
}

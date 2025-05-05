import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smart_activity_frontend/assets/colors.gen.dart';
import 'package:smart_activity_frontend/presentation/login/login_cubit.dart';
import 'package:smart_activity_frontend/presentation/login/login_state.dart';
import 'package:smart_activity_frontend/presentation/ui/buttons/vibe_day_button.dart';
import 'package:smart_activity_frontend/presentation/ui/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBar(
            title: Text(
              'LOGIN.TITLE'.tr(),
              style: const TextStyle(fontSize: 28, color: ColorName.black),
            ),
            centerTitle: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const SizedBox(height: 160),
                      const EmailField(),
                      const SizedBox(height: 20),
                      const PasswordField(),
                      const SizedBox(height: 60),
                      const _ForgotPasswordButton(),
                      const SizedBox(height: 20),
                      const _LoginButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'LOGIN.MAIL_OR_USER'.tr(),
          initialValue: state.email.value,
          onChanged: (value) => context.read<LoginCubit>().emailChanged(value),
          autofillHints: const [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          errorText:
              !state.email.isPure && !state.email.isValid
                  ? 'LOGIN.ERROR.ERROR_MESSAGE'.tr()
                  : null,
        );
      },
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'LOGIN.PASSWORD'.tr(),
          suffixIcon: IconButton(
            icon: Icon(
              state.obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: ColorName.colorAccent,
            ),
            onPressed: () {
              context.read<LoginCubit>().toggleObscurePassword();
            },
          ),
          initialValue: state.password.value,
          onChanged:
              (value) => context.read<LoginCubit>().passwordChanged(value),
          obscureText: state.obscurePassword,
          autofillHints: const [AutofillHints.password],
          errorText:
              !state.password.isPure && !state.password.isValid
                  ? 'LOGIN.ERROR.ERROR_MESSAGE'.tr()
                  : null,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return VibeDayButton(
          text: 'LOGIN.ACTION'.tr(),
          isLoading: state.status.isInProgress,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onPressed: () {
            // final cubit = context.read<LoginCubit>();
            // if (!cubit.isValidInput) {
            //   ValidationDialog.show(
            //     context: context,
            //     title: 'LOGIN.DIALOG.INCOMPLETE.TITLE'.tr(),
            //     description: 'LOGIN.DIALOG.INCOMPLETE.DESCRIPTION'.tr(),
            //   );
            //   return;
            // }
            // // cubit.login();
          },
        );
      },
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          // context.pushNamed(ForgotPasswordProvider.routeName);
        },
        child: Text(
          'LOGIN.FORGOT_PASSWORD'.tr(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: ColorName.black,
            decorationColor: ColorName.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

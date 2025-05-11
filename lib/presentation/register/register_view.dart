import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/presentation/register/register_cubit.dart';
import 'package:vibe_day/presentation/register/register_state.dart';
import 'package:vibe_day/presentation/ui/buttons/vibe_day_button.dart';
import 'package:vibe_day/presentation/ui/widgets/custom_text_field.dart';
import 'package:vibe_day/presentation/ui/widgets/validation_dialog.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBar(
            title: Text(
              'REGISTER.TITLE'.tr(),
              style: const TextStyle(fontSize: 28, color: ColorName.black),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 30),
                    _EmailField(),
                    SizedBox(height: 20),
                    _FirstNameField(),
                    SizedBox(height: 20),
                    _LastNameField(),
                    SizedBox(height: 20),
                    _PasswordField(),
                    SizedBox(height: 20),
                    _ConfirmPasswordField(),
                    SizedBox(height: 30),
                    _RegisterButton(),
                    SizedBox(height: 20),
                    _LoginButton(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'REGISTER.EMAIL'.tr(),
          initialValue: state.email.value,
          onChanged:
              (value) => context.read<RegisterCubit>().emailChanged(value),
          autofillHints: const [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          errorText:
              !state.email.isPure && !state.email.isValid
                  ? 'REGISTER.ERROR.EMAIL'.tr()
                  : null,
        );
      },
    );
  }
}

class _FirstNameField extends StatelessWidget {
  const _FirstNameField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'REGISTER.FIRST_NAME'.tr(),
          initialValue: state.firstName.value,
          onChanged:
              (value) => context.read<RegisterCubit>().firstNameChanged(value),
          autofillHints: const [AutofillHints.givenName],
          keyboardType: TextInputType.name,
          errorText:
              !state.firstName.isPure && !state.firstName.isValid
                  ? 'REGISTER.ERROR.FIRST_NAME'.tr()
                  : null,
        );
      },
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'REGISTER.LAST_NAME'.tr(),
          initialValue: state.lastName.value,
          onChanged:
              (value) => context.read<RegisterCubit>().lastNameChanged(value),
          autofillHints: const [AutofillHints.familyName],
          keyboardType: TextInputType.name,
          errorText:
              !state.lastName.isPure && !state.lastName.isValid
                  ? 'REGISTER.ERROR.LAST_NAME'.tr()
                  : null,
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'REGISTER.PASSWORD'.tr(),
          suffixIcon: IconButton(
            icon: Icon(
              state.obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: ColorName.colorAccent,
            ),
            onPressed: () {
              context.read<RegisterCubit>().toggleObscurePassword();
            },
          ),
          initialValue: state.password.value,
          onChanged:
              (value) => context.read<RegisterCubit>().passwordChanged(value),
          obscureText: state.obscurePassword,
          autofillHints: const [AutofillHints.newPassword],
          errorText:
              !state.password.isPure && !state.password.isValid
                  ? 'REGISTER.ERROR.PASSWORD'.tr()
                  : null,
        );
      },
    );
  }
}

class _ConfirmPasswordField extends StatelessWidget {
  const _ConfirmPasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'REGISTER.CONFIRM_PASSWORD'.tr(),
          suffixIcon: IconButton(
            icon: Icon(
              state.obscureConfirmPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: ColorName.colorAccent,
            ),
            onPressed: () {
              context.read<RegisterCubit>().toggleObscureConfirmPassword();
            },
          ),
          initialValue: state.confirmPassword.value,
          onChanged:
              (value) =>
                  context.read<RegisterCubit>().confirmPasswordChanged(value),
          obscureText: state.obscureConfirmPassword,
          autofillHints: const [AutofillHints.newPassword],
          errorText:
              !state.confirmPassword.isPure && !state.confirmPassword.isValid
                  ? 'REGISTER.ERROR.PASSWORD'.tr()
                  : (!state.confirmPassword.isPure &&
                      !context.read<RegisterCubit>().isPasswordsMatch)
                  ? 'REGISTER.ERROR.PASSWORDS_DONT_MATCH'.tr()
                  : null,
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return VibeDayButton(
          text: 'REGISTER.ACTION'.tr(),
          isLoading: state.status.isInProgress,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onPressed: () {
            final cubit = context.read<RegisterCubit>();
            if (cubit.isValidRegister) {
              // cubit.register();
            } else {
              ValidationDialog.show(
                context: context,
                title: 'REGISTER.DIALOG.INCOMPLETE.TITLE'.tr(),
                description: 'REGISTER.DIALOG.INCOMPLETE.DESCRIPTION'.tr(),
              );
            }
          },
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'REGISTER.LOGIN_INSTEAD'.tr(),
          style: const TextStyle(
            fontSize: 16,
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

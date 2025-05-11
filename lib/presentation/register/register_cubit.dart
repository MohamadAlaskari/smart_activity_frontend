import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/register/register_state.dart'
    show RegisterState;
import 'package:vibe_day/presentation/ui/helpers/debouncer.dart';
import 'package:vibe_day/presentation/ui/validation/email_or_user.dart';
import 'package:vibe_day/presentation/ui/validation/name_validator.dart';
import 'package:vibe_day/presentation/ui/validation/password.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required VibeDayRepository vibeDayRepository})
    : _vibeDayRepository = vibeDayRepository,
      super(RegisterState()) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;
  final Debouncer _debouncerEmail = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerFirstName = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerLastName = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerPassword = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerConfirmPassword = Debouncer(milliSeconds: 200);

  Future<void> _init() async {
    emit(
      state.copyWith(
        email: const EmailOrUser.pure(),
        firstName: const Name.pure(),
        lastName: const Name.pure(),
        password: const Password.pure(),
        confirmPassword: const Password.pure(),
      ),
    );
  }

  void emailChanged(String value) {
    _debouncerEmail(() {
      final email = EmailOrUser.dirty(value: value);
      emit(state.copyWith(email: email));
    });
  }

  void firstNameChanged(String value) {
    _debouncerFirstName(() {
      final firstName = Name.dirty(value);
      emit(state.copyWith(firstName: firstName));
    });
  }

  void lastNameChanged(String value) {
    _debouncerLastName(() {
      final lastName = Name.dirty(value);
      emit(state.copyWith(lastName: lastName));
    });
  }

  void passwordChanged(String value) {
    _debouncerPassword(() {
      final password = Password.dirty(value);
      emit(state.copyWith(password: password));
    });
  }

  void confirmPasswordChanged(String value) {
    _debouncerConfirmPassword(() {
      final confirmPassword = Password.dirty(value);
      emit(state.copyWith(confirmPassword: confirmPassword));
    });
  }

  void toggleObscurePassword() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void toggleObscureConfirmPassword() {
    emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));
  }

  bool get isValidRegister =>
      !state.email.isPure &&
      state.email.isValid &&
      !state.firstName.isPure &&
      state.firstName.isValid &&
      !state.lastName.isPure &&
      state.lastName.isValid &&
      !state.password.isPure &&
      state.password.isValid &&
      !state.confirmPassword.isPure &&
      state.confirmPassword.isValid &&
      state.password.value == state.confirmPassword.value;

  bool get isPasswordsMatch =>
      state.password.value == state.confirmPassword.value;

  // void register() async {
  //   if (!isValidRegister) return;
  //
  //   emit(
  //     state.copyWith(
  //       status: FormzSubmissionStatus.inProgress,
  //       screenStatus: const ScreenStatusLoading(),
  //     ),
  //   );
  //
  //   var response = await _vibeDayRepository.register(
  //     email: state.email.value,
  //     firstName: state.firstName.value,
  //     lastName: state.lastName.value,
  //     password: state.password.value,
  //   );
  //
  //   await response.whenOrNull(
  //     authenticated: (data) async {
  //       emit(
  //         state.copyWith(
  //           user: data,
  //           status: FormzSubmissionStatus.success,
  //           screenStatus: const ScreenStatusSuccess(),
  //         ),
  //       );
  //     },
  //     unauthenticated: (error, message) {
  //       emit(
  //         state.copyWith(
  //           status: FormzSubmissionStatus.failure,
  //           screenStatus: ScreenStatus.error(message ?? 'Registration failed'),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Future<void> close() {
    _debouncerEmail.dispose();
    _debouncerFirstName.dispose();
    _debouncerLastName.dispose();
    _debouncerPassword.dispose();
    _debouncerConfirmPassword.dispose();
    return super.close();
  }
}

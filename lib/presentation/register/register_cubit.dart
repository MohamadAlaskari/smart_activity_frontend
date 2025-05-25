import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:vibe_day/common/screen_status.dart';
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
  final Debouncer _debouncerUsername = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerFirstName = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerLastName = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerPassword = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerConfirmPassword = Debouncer(milliSeconds: 200);

  Future<void> _init() async {
    emit(
      state.copyWith(
        email: const EmailOrUser.pure(),
        username: const Name.pure(),
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

  void usernameChanged(String value) {
    _debouncerUsername(() {
      final username = Name.dirty(value);
      emit(state.copyWith(username: username));
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
      !state.username.isPure &&
      state.username.isValid &&
      !state.password.isPure &&
      state.password.isValid &&
      !state.confirmPassword.isPure &&
      state.confirmPassword.isValid &&
      state.password.value == state.confirmPassword.value;

  bool get isPasswordsMatch =>
      state.password.value == state.confirmPassword.value;

  void register() async {
    if (!isValidRegister) return;

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        screenStatus: const ScreenStatusLoading(),
        needsEmailVerification: false,
        emailAlreadyExists: false,
        usernameAlreadyExists: false,
        passwordTooShort: false,
      ),
    );

    var response = await _vibeDayRepository.register(
      email: state.email.value,
      firstName: state.firstName.value,
      lastName: state.lastName.value,
      password: state.password.value,
      username: state.username.value,
    );

    response.when(
      initial: () {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            screenStatus: const ScreenStatus.error('Unexpected error'),
            needsEmailVerification: false,
          ),
        );
      },
      authenticated: (data) {
        emit(
          state.copyWith(
            user: data,
            status: FormzSubmissionStatus.success,
            screenStatus: const ScreenStatusSuccess(),
            needsEmailVerification: false,
          ),
        );
      },
      unauthenticated: (error, message) {
        if (error == 200 || error == 201) {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.success,
              screenStatus: const ScreenStatusSuccess(),
              needsEmailVerification: true,
            ),
          );
        } else if (message == 'EMAIL_ALREADY_EXISTS') {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              screenStatus: const ScreenStatus.error('EMAIL_ALREADY_EXISTS'),
              emailAlreadyExists: true,
            ),
          );
        } else if (message == 'USERNAME_ALREADY_EXISTS') {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              screenStatus: const ScreenStatus.error('USERNAME_ALREADY_EXISTS'),
              usernameAlreadyExists: true,
            ),
          );
        } else if (message == 'PASSWORD_TOO_SHORT') {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              screenStatus: const ScreenStatus.error('PASSWORD_TOO_SHORT'),
              passwordTooShort: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              screenStatus: ScreenStatus.error(
                message ?? 'Registration failed',
              ),
              needsEmailVerification: false,
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    _debouncerEmail.dispose();
    _debouncerUsername.dispose();
    _debouncerFirstName.dispose();
    _debouncerLastName.dispose();
    _debouncerPassword.dispose();
    _debouncerConfirmPassword.dispose();
    return super.close();
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/login/login_state.dart';
import 'package:vibe_day/presentation/ui/helpers/debouncer.dart';
import 'package:vibe_day/presentation/ui/validation/email_or_user.dart';
import 'package:vibe_day/presentation/ui/validation/password.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required VibeDayRepository vibeDayRepository})
    : super(LoginState()) {
    _init();
  }

  Future<void> _init() async {
    emit(
      state.copyWith(
        email: const EmailOrUser.pure(),
        password: const Password.pure(),
      ),
    );
  }

  final Debouncer _debouncerEmail = Debouncer(milliSeconds: 200);
  final Debouncer _debouncerPassword = Debouncer(milliSeconds: 200);

  void emailChanged(String value) {
    _debouncerEmail(() {
      final username = EmailOrUser.dirty(value: value);
      emit(state.copyWith(email: username));
    });
  }

  void setEmail(String email) {
    final emailOrUser = EmailOrUser.dirty(value: email);
    emit(state.copyWith(email: emailOrUser));
  }

  void passwordChanged(String value) {
    _debouncerPassword(() {
      final password = Password.dirty(value);
      emit(state.copyWith(password: password));
    });
  }

  bool get isValidLogin =>
      !state.email.isPure &&
      state.email.isValid &&
      !state.password.isPure &&
      state.password.isValid;

  void toggleObscurePassword() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  // void login() async {
  //   if (!isValidLogin) return;
  //
  //   emit(
  //     state.copyWith(
  //       status: FormzSubmissionStatus.inProgress,
  //       screenStatus: const ScreenStatusLoading(),
  //     ),
  //   );
  //
  //   var response = await _vibeDayRepository.login(
  //     state.email.value,
  //     state.password.value,
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
  //           screenStatus: ScreenStatus.error(message ?? 'Authentication failed'),
  //         ),
  //       );
  //     },
  //   );
  // }

  bool get isValidInput =>
      state.email.value.isNotEmpty && state.password.value.isNotEmpty;

  @override
  Future<void> close() {
    _debouncerEmail.dispose();
    _debouncerPassword.dispose();
    return super.close();
  }
}

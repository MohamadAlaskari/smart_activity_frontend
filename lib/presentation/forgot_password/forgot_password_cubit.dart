import 'package:bloc/bloc.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/forgot_password/forgot_password_state.dart';
import 'package:vibe_day/presentation/ui/validation/email_or_user.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required VibeDayRepository vibeDayRepository})
      : _vibeDayRepository = vibeDayRepository,
        super(ForgotPasswordState());

  final VibeDayRepository _vibeDayRepository;

  void setEmail(String email) {
    final emailOrUser = EmailOrUser.dirty(value: email);
    emit(state.copyWith(emailOrUser: emailOrUser));
  }

  Future<void> submit() async {
    if (!isValidEmail) return;

    emit(state.copyWith(screenStatus: const ScreenStatusLoading()));

    try {
      await _vibeDayRepository.requestPasswordReset(state.emailOrUser.value);
      emit(state.copyWith(screenStatus: const ScreenStatusSuccess()));
    } catch (e) {
      String errorMessage = e.toString();
      ScreenStatus errorStatus;

      if (errorMessage.contains('Status 404') && errorMessage.contains('User not found')) {
        errorStatus = const ScreenStatus.error('USER_NOT_FOUND');
      } else {
        errorStatus = const ScreenStatus.error('GENERAL_ERROR');
      }

      emit(state.copyWith(screenStatus: errorStatus));
    }
  }

  bool get isValidEmail =>
      !state.emailOrUser.isPure && state.emailOrUser.isValid;
}
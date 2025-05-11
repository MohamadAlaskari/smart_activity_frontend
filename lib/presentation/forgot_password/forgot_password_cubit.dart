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

  //   Future<void> submit() async {
  //     emit(state.copyWith(screenStatus: const ScreenStatus.loading()));
  //     try {
  //       final result =
  //       await _vibeDayRepository.resetPassword(state.emailOrUser.value);
  //
  //       result.when(
  //         success: (_) {
  //           emit(state.copyWith(screenStatus: const ScreenStatus.success()));
  //         },
  //         failure: (error) {
  //           emit(state.copyWith(screenStatus: const ScreenStatus.error()));
  //         },
  //       );
  //     } catch (e) {
  //       emit(state.copyWith(screenStatus: const ScreenStatus.error()));
  //     }
  //   }
  //
  //   bool get isValidEmail =>
  //       !state.emailOrUser.isPure && state.emailOrUser.isValid;
}

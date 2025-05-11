import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/presentation/ui/validation/email_or_user.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  factory ForgotPasswordState({
    @Default(ScreenStatusPure()) ScreenStatus screenStatus,
    @Default(EmailOrUser.pure()) EmailOrUser emailOrUser,
  }) = _ForgotPasswordState;
}
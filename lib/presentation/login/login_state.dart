import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/domain/model/user.dart';
import 'package:vibe_day/presentation/ui/validation/email_or_user.dart';
import 'package:vibe_day/presentation/ui/validation/password.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();

  factory LoginState({
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(EmailOrUser.pure()) EmailOrUser email,
    @Default(Password.pure()) Password password,
    @Default(true) bool obscurePassword,
    User? user,
  }) = _LoginState;
}

import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/domain/model/user.dart';
import 'package:vibe_day/presentation/ui/validation/email_or_user.dart';
import 'package:vibe_day/presentation/ui/validation/name_validator.dart';
import 'package:vibe_day/presentation/ui/validation/password.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  factory RegisterState({
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(EmailOrUser.pure()) EmailOrUser email,
    @Default(Name.pure()) Name firstName,
    @Default(Name.pure()) Name lastName,
    @Default(Name.pure()) Name username,
    @Default(Password.pure()) Password password,
    @Default(Password.pure()) Password confirmPassword,
    @Default(true) bool obscurePassword,
    @Default(true) bool obscureConfirmPassword,
    User? user,
  }) = _RegisterState;
}

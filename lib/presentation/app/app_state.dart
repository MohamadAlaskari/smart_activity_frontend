part of 'app_cubit.dart';

@Freezed(fromJson: true, toJson: true)
class AppState with _$AppState {
  const factory AppState({
    required DateTime selectedDate,
    @Default(AuthResult.initial()) AuthResult status,
    User? user,
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
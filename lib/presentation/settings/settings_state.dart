import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const SettingsState._();

  factory SettingsState({
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
  }) = _SettingsState;
}
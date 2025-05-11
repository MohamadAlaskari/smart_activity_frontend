import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  factory HomeState({@Default(ScreenStatus.pure()) ScreenStatus screenStatus}) =
      _HomeState;
}

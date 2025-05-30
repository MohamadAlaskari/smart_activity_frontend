import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/domain/model/activity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  factory HomeState({
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
    @Default([]) List<dynamic> weatherData,
    @Default([]) List<Activity> activities,
    @Default('') String location,
    @Default(0) int selectedDayIndex,
  }) = _HomeState;
}

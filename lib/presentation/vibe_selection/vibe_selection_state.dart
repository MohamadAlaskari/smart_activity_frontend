import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';

part 'vibe_selection_state.freezed.dart';

@freezed
class VibeSelectionState with _$VibeSelectionState {
  const VibeSelectionState._();

  factory VibeSelectionState({
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
    @Default([]) List<String> selectedVibes,
    @Default(false) bool rememberVibe,
    @Default(20.0) double budget,
    @Default(false) bool rememberBudget,
    @Default(10.0) double distanceRadius,
    @Default(false) bool rememberDistance,
    String? selectedTimeWindow,
    @Default(false) bool rememberTimeWindow,
    String? selectedGroupSize,
  }) = _VibeSelectionState;
}
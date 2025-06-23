import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/common/screen_status.dart';

part 'vibe_selection_state.freezed.dart';

@freezed
class VibeSelectionState with _$VibeSelectionState {
  const VibeSelectionState._();

  factory VibeSelectionState({
    @Default(ScreenStatus.pure()) ScreenStatus screenStatus,
    @Default([]) List<String> selectedVibes,
    @Default(0.0) double budget,
    @Default(0.0) double distanceRadius,
    String? selectedTimeWindow,
    String? selectedGroupSize,
    @Default(false) bool showAdvancedSettings,
    @Default([]) List<String> selectedLifeVibes,
    @Default([]) List<String> selectedExperienceTypes,
  }) = _VibeSelectionState;
}
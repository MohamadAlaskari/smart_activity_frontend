import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'dart:developer';

class VibeSelectionCubit extends Cubit<VibeSelectionState> {
  VibeSelectionCubit() : super(VibeSelectionState()) {
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(screenStatus: const ScreenStatus.success()));
  }

  void toggleVibe(String vibe) {
    final currentVibes = List<String>.from(state.selectedVibes);
    if (currentVibes.contains(vibe)) {
      currentVibes.remove(vibe);
    } else {
      currentVibes.add(vibe);
    }
    emit(state.copyWith(selectedVibes: currentVibes));
  }

  void toggleRememberVibe(bool value) {
    emit(state.copyWith(rememberVibe: value));
  }

  void updateBudget(double value) {
    emit(state.copyWith(budget: value));
  }

  void toggleRememberBudget(bool value) {
    emit(state.copyWith(rememberBudget: value));
  }

  void updateDistanceRadius(double value) {
    emit(state.copyWith(distanceRadius: value));
  }

  void toggleRememberDistance(bool value) {
    emit(state.copyWith(rememberDistance: value));
  }

  void selectTimeWindow(String timeWindow) {
    final newTimeWindow =
        state.selectedTimeWindow == timeWindow ? null : timeWindow;
    emit(state.copyWith(selectedTimeWindow: newTimeWindow));
  }

  void toggleRememberTimeWindow(bool value) {
    emit(state.copyWith(rememberTimeWindow: value));
  }

  void selectGroupSize(String groupSize) {
    final newGroupSize =
        state.selectedGroupSize == groupSize ? null : groupSize;
    emit(state.copyWith(selectedGroupSize: newGroupSize));
  }

  void toggleAdvancedSettings() {
    emit(state.copyWith(showAdvancedSettings: !state.showAdvancedSettings));
  }

  void toggleLifeVibe(String lifeVibe) {
    final currentLifeVibes = List<String>.from(state.selectedLifeVibes);
    if (currentLifeVibes.contains(lifeVibe)) {
      currentLifeVibes.remove(lifeVibe);
    } else {
      if (currentLifeVibes.length < 3) {
        currentLifeVibes.add(lifeVibe);
      }
    }
    emit(state.copyWith(selectedLifeVibes: currentLifeVibes));
  }

  void toggleExperienceType(String experienceType) {
    final currentExperienceTypes = List<String>.from(
      state.selectedExperienceTypes,
    );
    if (currentExperienceTypes.contains(experienceType)) {
      currentExperienceTypes.remove(experienceType);
    } else {
      currentExperienceTypes.add(experienceType);
    }
    emit(state.copyWith(selectedExperienceTypes: currentExperienceTypes));
  }

  Future<void> finishSelection() async {
    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      log('Vibe Selection completed: ${state.selectedVibes}');
      log('Budget: €${state.budget}');
      log('Distance: ${state.distanceRadius}km');
      log('Time: ${state.selectedTimeWindow}');
      log('Group: ${state.selectedGroupSize}');
      log('Life Vibes: ${state.selectedLifeVibes}');
      log('Experience Types: ${state.selectedExperienceTypes}');
      log('Life Vibes: ${state.selectedLifeVibes}');

      emit(state.copyWith(screenStatus: const ScreenStatus.success()));
    } catch (e) {
      log('Error finishing selection: $e');
      emit(state.copyWith(screenStatus: ScreenStatus.error(e.toString())));
    }
  }
}

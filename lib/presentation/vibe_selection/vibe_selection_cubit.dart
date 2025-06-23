import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/domain/model/user.dart';
import 'package:vibe_day/domain/model/user_preferences.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';

class VibeSelectionCubit extends Cubit<VibeSelectionState> {
  VibeSelectionCubit({
    required VibeDayRepository vibeDayRepository,
    required UserStorageRepository userStorageRepository,
  }) : _vibeDayRepository = vibeDayRepository,
       _userStorageRepository = userStorageRepository,
       super(VibeSelectionState()) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;
  final UserStorageRepository _userStorageRepository;

  Future<void> _init() async {
    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    try {
      await _loadUserPreferences();
      emit(state.copyWith(screenStatus: const ScreenStatus.success()));
    } catch (e) {
      log('Error loading user preferences: $e');
      emit(state.copyWith(screenStatus: const ScreenStatus.success()));
    }
  }

  void resetToDefaults() {
    emit(VibeSelectionState());
  }

  Future<void> _loadUserPreferences() async {
    try {
      final user = await _userStorageRepository.getUser();
      if (user?.id == null) {
        log('No user found, resetting to default state');
        resetToDefaults();
        return;
      }

      final preferences = await _vibeDayRepository.getUserPreferences(
        user!.id!,
      );

      if (preferences != null) {
        log('Loaded user preferences: ${preferences.selectedVibes}');

        emit(
          state.copyWith(
            selectedVibes: preferences.selectedVibes,
            selectedLifeVibes: preferences.selectedLifeVibes,
            selectedExperienceTypes: preferences.selectedExperienceTypes,
            budget: preferences.budget,
            distanceRadius: preferences.distanceRadius,
            selectedTimeWindow:
                preferences.selectedTimeWindows.isNotEmpty
                    ? preferences.selectedTimeWindows.first
                    : null,
            selectedGroupSize:
                preferences.selectedGroupSizes.isNotEmpty
                    ? preferences.selectedGroupSizes.first
                    : null,
          ),
        );
      } else {
        log('No preferences found for user ${user.id}, resetting to defaults');
        // WICHTIG: State auf Default-Werte zurücksetzen
        emit(VibeSelectionState());
      }
    } catch (e) {
      log('Error loading user preferences: $e');
      // Bei Fehler auch auf Default zurücksetzen
      resetToDefaults();
    }
  }

  Future<User?> _getUser() async {
    try {
      return await _userStorageRepository.getUser();
    } catch (e) {
      log('Error getting user: $e');
      return null;
    }
  }

  UserPreferences _createUserPreferencesFromState() {
    final timeWindows =
        state.selectedTimeWindow != null
            ? [state.selectedTimeWindow!]
            : <String>[];
    final groupSizes =
        state.selectedGroupSize != null
            ? [state.selectedGroupSize!]
            : <String>[];

    return UserPreferences(
      selectedVibes: state.selectedVibes,
      selectedLifeVibes: state.selectedLifeVibes,
      selectedExperienceTypes: state.selectedExperienceTypes,
      budget: state.budget,
      distanceRadius: state.distanceRadius,
      selectedTimeWindows: timeWindows,
      selectedGroupSizes: groupSizes,
    );
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

  void updateBudget(double value) {
    emit(state.copyWith(budget: value));
  }

  void updateDistanceRadius(double value) {
    emit(state.copyWith(distanceRadius: value));
  }

  void selectTimeWindow(String timeWindow) {
    final newTimeWindow =
        state.selectedTimeWindow == timeWindow ? null : timeWindow;
    emit(state.copyWith(selectedTimeWindow: newTimeWindow));
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
      final user = await _getUser();
      if (user?.id == null) {
        throw Exception('User not found. Please login again.');
      }

      final preferences = _createUserPreferencesFromState();

      try {
        await _vibeDayRepository.updateUserPreferences(
          userId: user!.id!,
          preferences: preferences,
        );
        log('Updated user preferences successfully');
      } catch (e) {
        log('Update failed, trying to create new preferences: $e');
        await _vibeDayRepository.createUserPreferences(
          userId: user!.id!,
          preferences: preferences,
        );
        log('Created new user preferences successfully');
      }

      log('Vibe Selection completed: ${state.selectedVibes}');
      log('Budget: €${state.budget}');
      log('Distance: ${state.distanceRadius}km');
      log('Time: ${state.selectedTimeWindow}');
      log('Group: ${state.selectedGroupSize}');
      log('Life Vibes: ${state.selectedLifeVibes}');
      log('Experience Types: ${state.selectedExperienceTypes}');

      emit(state.copyWith(screenStatus: const ScreenStatus.success()));

      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      log('Error finishing selection: $e');
      emit(state.copyWith(screenStatus: ScreenStatus.error(e.toString())));
    }
  }
}

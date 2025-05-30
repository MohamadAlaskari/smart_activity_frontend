import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/settings/settings_state.dart';
import 'package:vibe_day/presentation/login/login_provider.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'dart:developer';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required VibeDayRepository vibeDayRepository})
    : _vibeDayRepository = vibeDayRepository,
      super(SettingsState()) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;

  Future<void> _init() async {
    emit(state.copyWith(screenStatus: const ScreenStatus.success()));
  }

  Future<void> logout(BuildContext context) async {
    if (isClosed) return;

    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));
    await _vibeDayRepository.logout();

    if (context.mounted) {
      context.pushNamed(LoginProvider.routeName);
    }
  }

  Future<void> refreshData() async {
    if (isClosed) return;

    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      if (isClosed) return;

      emit(state.copyWith(screenStatus: const ScreenStatus.success()));
    } catch (e) {
      log('Error refreshing settings: $e');
      if (isClosed) return;

      emit(state.copyWith(screenStatus: ScreenStatus.error(e.toString())));
    }
  }
}

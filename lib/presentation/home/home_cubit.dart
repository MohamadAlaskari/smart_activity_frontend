import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/presentation/home/home_state.dart';
import 'package:vibe_day/presentation/login/login_provider.dart';

import 'package:vibe_day/common/screen_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required VibeDayRepository vibeDayRepository})
    : _vibeDayRepository = vibeDayRepository,
      super(HomeState()) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;

  Future<void> _init() async {}

  Future<void> logout(BuildContext context) async {
    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));
    await _vibeDayRepository.logout();
    context.pushNamed(LoginProvider.routeName);
  }
}

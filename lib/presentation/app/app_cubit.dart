import 'dart:async';
import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:vibe_day/common/screen_status.dart';
import 'package:vibe_day/data/repository/user_storage_repository.dart';
import 'package:vibe_day/data/repository/vibe_day_repository.dart';
import 'package:vibe_day/domain/model/auth_result.dart';
import 'package:vibe_day/domain/model/user.dart';
import 'package:vibe_day/presentation/vibe_selection/vibe_selection_state.dart';

part 'app_cubit.freezed.dart';

part 'app_cubit.g.dart';

part 'app_state.dart';

class AppCubit extends HydratedCubit<AppState> {
  AppCubit({
    required VibeDayRepository vibeDayRepository,
    required UserStorageRepository userStorageRepository,
  }) : _vibeDayRepository = vibeDayRepository,
       _userStorageRepository = userStorageRepository,
       super(AppState(selectedDate: DateTime.now())) {
    _init();
  }

  final VibeDayRepository _vibeDayRepository;
  final UserStorageRepository _userStorageRepository;

  late StreamSubscription<AuthResult> _vibeDayStatusSubscription;
  late final StreamSubscription<User?> _vibeDayUserSubscription;
  bool _initialized = false;

  void _init() async {
    try {
      final savedUser = await _userStorageRepository.getUser();
      if (savedUser != null) {
        emit(
          state.copyWith(
            user: savedUser,
            status: AuthResult.authenticated(savedUser),
          ),
        );
      }

      _vibeDayUserSubscription = _userStorageRepository.watchUser().listen((
        user,
      ) {
        if (user != null) {
          emit(state.copyWith(user: user));
        } else if (_initialized) {
          emit(state.copyWith(user: null));
        }
      });

      _vibeDayStatusSubscription = _vibeDayRepository.status.listen(
        _onStatusChanged,
      );

      _initialized = true;

      final token = await _vibeDayRepository.getToken();
      if (token != null) {
      } else if (savedUser != null) {
        emit(
          state.copyWith(
            status: const AuthResult.unauthenticated(null, null),
            user: null,
          ),
        );
      }
    } catch (e) {
      log('Error in AppCubit: $e');
    }
  }

  void _onStatusChanged(AuthResult status) {
    emit(
      state.copyWith(
        status: status,
        user: status.when(
          initial: () => state.user,
          authenticated: (user) => user,
          unauthenticated: (_, __) => null,
        ),
      ),
    );
  }

  Future<void> logout() async {
    try {
      await _vibeDayRepository.logout();
      emit(
        state.copyWith(
          status: const AuthResult.unauthenticated(null, null),
          user: null,
        ),
      );
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  @override
  Future<void> close() async {
    await _vibeDayUserSubscription.cancel();
    await _vibeDayStatusSubscription.cancel();
    return super.close();
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    final savedState = AppState.fromJson(json);
    return savedState.copyWith(selectedDate: DateTime.now());
  }

  @override
  Map<String, dynamic>? toJson(AppState state) => state.toJson();
}

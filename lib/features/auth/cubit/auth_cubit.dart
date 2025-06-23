import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_activity_frontend/features/auth/cubit/auth_state.dart';
import 'package:smart_activity_frontend/features/auth/services/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  bool get isLoggedIn => state.user != null;

  AuthCubit(this._authService) : super(AuthState.initial());

  Future<void> loadCurrentUser() async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _authService.getCurrentUser();
      emit(state.copyWith(user: user, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false));
    }
  }

  // auth_cubit.dart
  Future<void> logout() async {
    await _authService.logout(); // مثلاً حذف التوكن أو غيره
    emit(state.copyWith(user: null));
  }
}

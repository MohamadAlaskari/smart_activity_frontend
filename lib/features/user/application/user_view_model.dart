import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_activity_frontend/core/services/secure_storage.dart';
import 'package:smart_activity_frontend/features/shared/api/dio_provider.dart';
import 'package:smart_activity_frontend/features/user/domain/user_state.dart';
import 'package:smart_activity_frontend/features/user/infrastructure/user_service.dart';
import 'package:smart_activity_frontend/features/user/models/user_model.dart';

class UserViewModel extends StateNotifier<UserState> {
  final UserService _userService;

  UserViewModel(this._userService) : super(UserState.initial());

  Future<void> loadCurrentUser() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _userService.getCurrentUser();
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> updateUser(UserModel updatedUser) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _userService.updateUser(updatedUser);
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}

final userProvider = StateNotifierProvider<UserViewModel, UserState>((ref) {
  final dio = ref.watch(dioProvider);
  final storage = SecureStorage();
  return UserViewModel(UserService(dio, storage));
});

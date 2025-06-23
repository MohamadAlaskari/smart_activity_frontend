import 'package:smart_activity_frontend/features/user/models/user_model.dart';

class AuthState {
  final UserModel? user;
  final bool isLoading;

  const AuthState({this.user, this.isLoading = false});

  factory AuthState.initial() {
    return const AuthState(user: null, isLoading: false);
  }

  AuthState copyWith({UserModel? user, bool? isLoading}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

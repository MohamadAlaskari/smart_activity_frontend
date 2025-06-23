import 'package:equatable/equatable.dart';
import 'package:smart_activity_frontend/features/user/models/user_model.dart';

class UserState extends Equatable {
  final bool isLoading;
  final String? error;
  final UserModel? user;

  const UserState({required this.isLoading, this.error, this.user});

  factory UserState.initial() {
    return const UserState(isLoading: false, error: null, user: null);
  }

  UserState copyWith({bool? isLoading, String? error, UserModel? user}) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, user];
}

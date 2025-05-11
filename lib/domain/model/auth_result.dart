import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_day/domain/model/user.dart';

part 'auth_result.g.dart';
part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  const factory AuthResult.initial() = Initial;
  const factory AuthResult.authenticated(User user) = Authenticated;
  const factory AuthResult.unauthenticated([int? code, String? message])
  = Unauthenticated;

  factory AuthResult.fromJson(Map<String, dynamic> json) =>
      _$AuthResultFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:smart_activity_frontend/domain/model/user.dart';

part 'login_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LoginResult {
  const LoginResult({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    this.mastodonToken,
  });

  final User user;
  final String accessToken;
  final String refreshToken;
  final String? mastodonToken;

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    try {
      return _$LoginResultFromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
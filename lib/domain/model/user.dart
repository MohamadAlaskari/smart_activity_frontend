import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@Freezed(toJson: true, fromJson: true)
class User with _$User {
  const User._();

  const factory User({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    bool? active,
    String? name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
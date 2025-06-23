class UserModel {
  final String id;
  final String username;
  final String firstName;
  final String lastName;

  UserModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  UserModel copyWith({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}

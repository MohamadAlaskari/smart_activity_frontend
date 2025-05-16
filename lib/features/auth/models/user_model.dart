class UserModel {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}

// models/user.dart
class User {
  final String id;
  final String userName;
  final String email;
  final String password;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password
  });

  // Convert JSON to User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
    userName: json['username'],
      email: json['email'],
      password: json['password']
    );
  }

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': userName,
      'email': email,
      'password':password
    };
  }
}

class LoginData {
  String phoneNumber = '';
  String password = '';
}

class UserData {
  int id = 0;
  String password = '';
  String phoneNumber = '';
  String email = '';
}

class User {
  final id;
  final phoneNumber;
  final password;
  final email;

  const User({
    required this.id,
    required this.phoneNumber,
    required this.password,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User (
      id: json['id'] as int,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
    );
  }
}
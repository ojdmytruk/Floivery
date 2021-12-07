class LoginData {
  String phoneNumber = '';
  String password = '';
}

class UserData {
  int id = 0;
  String name = '';
  String password = '';
  String phoneNumber = '';
  String email = '';
}

class User {
  final id;
  final name;
  final phoneNumber;
  final password;
  final email;

  const User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User (
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
    );
  }
}

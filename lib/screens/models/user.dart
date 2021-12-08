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
    this.id,
    this.name,
    this.phoneNumber,
    this.password,
    this.email,
  });

  User copy({
    String? id,
    String? name,
    String? phoneNumber,
    String? password,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        email: email ?? this.email,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User (
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phoneNumber': phoneNumber,
    'password': password,
    'email': email,
  };

  @override
  String toString() => 'User{id: $id, name: $name}';
}
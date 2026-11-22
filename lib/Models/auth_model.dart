class AuthModel {
  final String message;
  final bool status;
  final User? user;

  AuthModel({required this.message, required this.status, this.user});
  factory AuthModel.fromjson(Map json) {
    if (json["user"] == null) {
      return AuthModel(message: json["message"], status: json["status"]);
    } else {
      return AuthModel(
        message: json["message"],
        status: json["status"],
        user: User.fromjson(json["user"]),
      );
    }
  }
}

class User {
  final String name;
  final String phone;
  final String password;
  final String email;

  User({
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
  });
  factory User.fromjson(Map json) {
    return User(
      name: json["name"],
      phone: json["phone"],
      password: json["password"],
      email: json["email"],
    );
  }
}

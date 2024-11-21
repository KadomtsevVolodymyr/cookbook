class UserModel {
  final int id;
  final String email;
  final String username;
  final String name;
  final bool isActive;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as int,
      email: json["email"] as String,
      username: json["username"] as String,
      name: json["name"] as String,
      isActive: json["is_active"] as bool,
    );
  }
}

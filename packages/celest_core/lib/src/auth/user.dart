final class AuthenticatedUser {
  const AuthenticatedUser({
    required this.cork,
    required this.user,
  });

  factory AuthenticatedUser.fromJson(Map<String, Object?> json) {
    return AuthenticatedUser(
      cork: json['cork'] as String,
      user: User.fromJson(json['user'] as Map<String, Object?>),
    );
  }

  final String cork;
  final User user;

  Map<String, Object?> toJson() {
    return {
      'cork': cork,
      'user': user.toJson(),
    };
  }

  @override
  String toString() {
    return 'Authenticated$user';
  }
}

final class User {
  const User({
    required this.id,
    required this.email,
  });

  factory User.fromJson(Map<String, Object?> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
    );
  }

  final String id;
  final String email;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email)';
  }
}

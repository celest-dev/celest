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

  Map<String, Object?> toJson() => {
        'cork': cork,
        'user': user.toJson(),
      };

  @override
  String toString() {
    return 'Authenticated$user';
  }
}

final class User {
  const User({
    required this.userId,
    this.displayName,
    required this.email,
    bool? emailVerified,
  }) : emailVerified = emailVerified ?? false;

  factory User.fromJson(Map<String, Object?> json) {
    return User(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String,
      emailVerified: json['emailVerified'] as bool?,
    );
  }

  final String userId;
  final String? displayName;
  final String email;
  final bool emailVerified;

  Map<String, Object?> toJson() => {
        'userId': userId,
        if (displayName != null) 'displayName': displayName,
        'email': email,
        'emailVerified': emailVerified,
      };

  @override
  String toString() => 'User(userId: $userId, displayName: $displayName, '
      'email: $email, emailVerified: $emailVerified)';
}

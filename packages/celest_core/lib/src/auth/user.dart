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
    required this.id,
    this.organizationId,
    required this.email,
    bool? emailVerified,
  }) : emailVerified = emailVerified ?? false;

  factory User.fromJson(Map<String, Object?> json) {
    return User(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String?,
      email: json['email'] as String,
      emailVerified: json['emailVerified'] as bool?,
    );
  }

  final String id;
  final String? organizationId;
  final String email;
  final bool emailVerified;

  Map<String, Object?> toJson() => {
        'id': id,
        if (organizationId != null) 'organizationId': organizationId,
        'email': email,
        'emailVerified': emailVerified,
      };

  @override
  String toString() => 'User(id: $id, orgId: $organizationId, '
      'email: $email, emailVerified: $emailVerified)';
}

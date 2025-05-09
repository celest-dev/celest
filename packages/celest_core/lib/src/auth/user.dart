import 'package:cedar/src/model/value.dart' show EntityUid;
import 'package:collection/collection.dart'
    show IterableExtension, ListExtensions;
import 'package:meta/meta.dart';

final class AuthenticatedUser {
  const AuthenticatedUser({required this.cork, required this.user});

  factory AuthenticatedUser.fromJson(Map<String, Object?> json) {
    return AuthenticatedUser(
      cork: json['cork'] as String,
      user: User.fromJson(json['user'] as Map<String, Object?>),
    );
  }

  final String cork;
  final User user;

  Map<String, Object?> toJson() => {'cork': cork, 'user': user.toJson()};

  @override
  String toString() {
    return 'Authenticated$user';
  }
}

@immutable
final class User {
  const User({
    required this.userId,
    this.createTime,
    this.updateTime,
    this.givenName,
    this.familyName,
    this.timeZone,
    this.languageCode,
    List<Email> emails = const [],
    List<PhoneNumber> phoneNumbers = const [],
    this.roles = const [EntityUid.of('Celest::Role', 'authenticated')],
    this.etag,
  }) : emails = emails as Emails,
       phoneNumbers = phoneNumbers as PhoneNumbers;

  factory User.fromJson(Map<String, Object?> json) {
    return User(
      userId: json['userId'] as String,
      createTime: DateTime.parse(json['createTime'] as String),
      updateTime:
          json['updateTime'] == null
              ? null
              : DateTime.parse(json['updateTime'] as String),
      givenName: json['givenName'] as String?,
      familyName: json['familyName'] as String?,
      timeZone: json['timeZone'] as String?,
      languageCode: json['languageCode'] as String?,
      emails:
          (json['emails'] as List<Object?>?)
              ?.map((e) => Email.fromJson(e as Map<String, Object?>))
              .toList() ??
          const [],
      phoneNumbers:
          (json['phoneNumbers'] as List<Object?>?)
              ?.map((pn) => PhoneNumber.fromJson(pn as Map<String, Object?>))
              .toList() ??
          const [],
      roles:
          (json['roles'] as List<Object?>?)
              ?.cast<Map<String, Object?>>()
              .map(EntityUid.fromJson)
              .toList() ??
          const [],
      etag: json['etag'] as String?,
    );
  }

  String get id => userId;

  final String userId;
  final DateTime? createTime;
  final DateTime? updateTime;

  final String? givenName;
  final String? familyName;
  final String? timeZone;
  final String? languageCode;

  final Emails emails;
  Email? get primaryEmail => emails.primary;

  final PhoneNumbers phoneNumbers;
  PhoneNumber? get primaryPhoneNumber => phoneNumbers.primary;

  final List<EntityUid> roles;
  final String? etag;

  Map<String, Object?> toJson() => {
    'userId': userId,
    if (createTime case final createTime?)
      'createTime': createTime.toIso8601String(),
    if (updateTime case final updateTime?)
      'updateTime': updateTime.toIso8601String(),
    if (givenName != null) 'givenName': givenName,
    if (familyName != null) 'familyName': familyName,
    if (timeZone != null) 'timeZone': timeZone,
    if (languageCode != null) 'languageCode': languageCode,
    if (emails.isNotEmpty) 'emails': emails.map((e) => e.toJson()).toList(),
    if (phoneNumbers.isNotEmpty)
      'phoneNumbers': phoneNumbers.map((pn) => pn.toJson()).toList(),
    if (roles.isNotEmpty)
      'roles': roles.map((uid) => uid.normalized.toJson()).toList(),
    if (etag != null) 'etag': etag,
  };

  User copyWith({
    DateTime? createTime,
    DateTime? updateTime,
    String? givenName,
    String? familyName,
    String? timeZone,
    String? languageCode,
    List<Email>? emails,
    List<PhoneNumber>? phoneNumbers,
    List<EntityUid>? roles,
    String? etag,
  }) {
    return User(
      userId: id,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      timeZone: timeZone ?? this.timeZone,
      languageCode: languageCode ?? this.languageCode,
      emails: emails ?? this.emails,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      roles: roles ?? this.roles,
      etag: etag ?? this.etag,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is User &&
            userId == other.userId &&
            createTime?.toUtc() == other.createTime?.toUtc() &&
            updateTime?.toUtc() == other.updateTime?.toUtc() &&
            givenName == other.givenName &&
            familyName == other.familyName &&
            emails.equals(other.emails) &&
            phoneNumbers.equals(other.phoneNumbers) &&
            timeZone == other.timeZone &&
            languageCode == other.languageCode &&
            roles.equals(other.roles) &&
            etag == other.etag;
  }

  @override
  int get hashCode => Object.hash(
    userId,
    createTime,
    updateTime,
    givenName,
    familyName,
    Object.hashAllUnordered(emails),
    Object.hashAllUnordered(phoneNumbers),
    timeZone,
    languageCode,
    Object.hashAllUnordered(roles),
    etag,
  );

  @override
  String toString() {
    final buf = StringBuffer('User(id: $userId');
    if (givenName != null) {
      buf.write(', givenName: $givenName');
    }
    if (familyName != null) {
      buf.write(', familyName: $familyName');
    }
    if (emails.isNotEmpty) {
      buf.write(', emails: $emails');
    }
    if (phoneNumbers.isNotEmpty) {
      buf.write(', phoneNumbers: $phoneNumbers');
    }
    if (timeZone != null) {
      buf.write(', timeZone: $timeZone');
    }
    if (languageCode != null) {
      buf.write(', languageCode: $languageCode');
    }
    if (createTime != null) {
      buf.write(', createTime: $createTime');
    }
    if (updateTime != null) {
      buf.write(', updateTime: $updateTime');
    }
    if (roles.isNotEmpty) {
      buf.write(', roles: $roles');
    }
    if (etag != null) {
      buf.write(', etag: $etag');
    }
    buf.write(')');
    return buf.toString();
  }
}

@immutable
final class Email {
  const Email({
    required this.email,
    this.isVerified = false,
    this.isPrimary = false,
  });

  factory Email.fromJson(Map<String, Object?> json) {
    return Email(
      email: json['email'] as String,
      isVerified: json['isVerified'] as bool? ?? false,
      isPrimary: json['isPrimary'] as bool? ?? false,
    );
  }

  final String email;
  final bool isVerified;
  final bool isPrimary;

  Map<String, Object?> toJson() => {
    'email': email,
    'isVerified': isVerified,
    'isPrimary': isPrimary,
  };

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Email &&
            runtimeType == other.runtimeType &&
            email == other.email &&
            isVerified == other.isVerified &&
            isPrimary == other.isPrimary;
  }

  @override
  int get hashCode => Object.hash(email, isVerified, isPrimary);

  @override
  String toString() => email;
}

extension type const Emails(List<Email> _) implements List<Email> {
  Email? get primary => firstWhereOrNull((e) => e.isPrimary) ?? firstOrNull;
}

@immutable
final class PhoneNumber {
  const PhoneNumber({
    required this.phoneNumber,
    this.isVerified = false,
    this.isPrimary = false,
  });

  factory PhoneNumber.fromJson(Map<String, Object?> json) {
    return PhoneNumber(
      phoneNumber: json['phoneNumber'] as String,
      isVerified: json['isVerified'] as bool? ?? false,
      isPrimary: json['isPrimary'] as bool? ?? false,
    );
  }

  final String phoneNumber;
  final bool isVerified;
  final bool isPrimary;

  Map<String, Object?> toJson() => {
    'phoneNumber': phoneNumber,
    'isVerified': isVerified,
    'isPrimary': isPrimary,
  };

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PhoneNumber &&
            runtimeType == other.runtimeType &&
            phoneNumber == other.phoneNumber &&
            isVerified == other.isVerified &&
            isPrimary == other.isPrimary;
  }

  @override
  int get hashCode => Object.hash(phoneNumber, isVerified, isPrimary);

  @override
  String toString() => phoneNumber;
}

extension type const PhoneNumbers(List<PhoneNumber> _)
    implements List<PhoneNumber> {
  PhoneNumber? get primary =>
      firstWhereOrNull((pn) => pn.isPrimary) ?? firstOrNull;
}

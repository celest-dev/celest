import 'package:cedar/cedar.dart';
import 'package:celest_cloud/src/proto.dart' as pb;
import 'package:celest_core/celest_core.dart';

extension UserInterop on User {
  pb.User toProto() {
    return pb.User(
      name: 'users/$userId',
      userId: userId,
      familyName: familyName,
      givenName: givenName,
      phoneNumbers: phoneNumbers.map((pn) => pn.toProto()),
      emails: emails.map((e) => e.toProto()),
      languageCode: languageCode,
      timeZone: timeZone,
      createTime: createTime?.toProto(),
      updateTime: updateTime?.toProto(),
    );
  }

  Entity toEntity({List<EntityUid>? parents}) {
    final userUid = EntityUid.of('Celest::User', userId);
    return Entity(
      uid: userUid,
      parents: {...roles, ...?parents}.toList(),
      attributes: RecordValue.fromJson(toJson()).attributes,
    );
  }
}

extension UserProtoInterop on pb.User {
  User toModel() {
    return User(
      userId: userId,
      familyName: hasFamilyName() ? familyName : null,
      givenName: hasGivenName() ? givenName : null,
      phoneNumbers: phoneNumbers.map((pn) => pn.toModel()).toList(),
      emails: emails.map((e) => e.toModel()).toList(),
      languageCode: hasLanguageCode() ? languageCode : null,
      timeZone: hasTimeZone() ? timeZone : null,
      createTime: hasCreateTime() ? createTime.toDateTime() : null,
      updateTime: hasUpdateTime() ? updateTime.toDateTime() : null,
    );
  }
}

extension EmailInterop on Email {
  pb.Email toProto() {
    return pb.Email(email: email, isVerified: isVerified, isPrimary: isPrimary);
  }
}

extension EmailProtoInterop on pb.Email {
  Email toModel() {
    return Email(email: email, isVerified: isVerified, isPrimary: isPrimary);
  }
}

extension PhoneNumberInterop on PhoneNumber {
  pb.PhoneNumber toProto() {
    return pb.PhoneNumber(
      phoneNumber: phoneNumber,
      isVerified: isVerified,
      isPrimary: isPrimary,
    );
  }
}

extension PhoneNumberProtoInterop on pb.PhoneNumber {
  PhoneNumber toModel() {
    return PhoneNumber(
      phoneNumber: phoneNumber,
      isVerified: isVerified,
      isPrimary: isPrimary,
    );
  }
}

@internal
library;

import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';

extension ToCelestUser on cloud.User {
  User toCelest() => User(
    userId: userId,
    createTime: createTime.toDateTime(),
    updateTime: hasUpdateTime() ? updateTime.toDateTime() : null,
    givenName: hasGivenName() ? givenName : null,
    familyName: hasFamilyName() ? familyName : null,
    timeZone: hasTimeZone() ? timeZone : null,
    languageCode: hasLanguageCode() ? languageCode : null,
    emails: emails.map((e) => e.toCelest()).toList(),
    phoneNumbers: phoneNumbers.map((pn) => pn.toCelest()).toList(),
  );
}

extension ToCelestEmail on cloud.Email {
  Email toCelest() =>
      Email(email: email, isVerified: isVerified, isPrimary: isPrimary);
}

extension ToCelestPhoneNumber on cloud.PhoneNumber {
  PhoneNumber toCelest() => PhoneNumber(
    phoneNumber: phoneNumber,
    isVerified: isVerified,
    isPrimary: isPrimary,
  );
}

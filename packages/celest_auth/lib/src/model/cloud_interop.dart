@internal
library;

import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';

extension ToCelestUser on cloud.User {
  User toCelest() => User(
        userId: userId,
        email: hasEmail() ? email.email : null,
        emailVerified: hasEmail() ? email.verified : null,
        displayName: hasGivenName()
            ? hasFamilyName()
                ? '$givenName $familyName'
                : givenName
            : null,
      );
}

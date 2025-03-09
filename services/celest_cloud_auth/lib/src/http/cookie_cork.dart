import 'dart:io';

import 'package:celest_cloud_auth/src/context.dart';
import 'package:clock/clock.dart';
import 'package:corks_cedar/corks_cedar.dart';

/// A wrapper over a [Cookie] for corks.
extension type Corkie._(Cookie cookie) implements Cookie {
  Corkie.set(Cork cork) : this._create(cork.toString());

  Corkie.clear() : this._create('');

  Corkie._create(String cork)
      : cookie = Cookie(cookieName, cork)
          ..domain = context.hostname
          ..httpOnly = true
          ..secure = context.isRunningInCloud
          ..path = '/'
          ..sameSite = SameSite.lax
          ..expires = clock.now().add(const Duration(days: 30));

  static const String cookieName = 'cork';
}

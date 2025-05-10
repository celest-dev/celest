import 'dart:io';

import 'package:cedar/ast.dart';
import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/sessions/sessions_repository.dart';
import 'package:clock/clock.dart';
import 'package:corks_cedar/corks_cedar.dart';

/// A wrapper over a [Cookie] for corks.
extension type Corkie._(Cookie cookie) implements Cookie {
  Corkie.set(CedarCork cork)
    : this._create(
        cork.toString(),
        expiration: switch (cork.claims?.attributes['expireTime']) {
          LongValue(:final value) => DateTime.fromMillisecondsSinceEpoch(
            value.toInt() * 1000,
          ),
          _ => clock.now().add(SessionsRepository.postAuthSessionDuration),
        },
      );

  Corkie.clear() : this._create('', expiration: clock.now());

  Corkie._create(String cork, {required DateTime expiration})
    : cookie =
          Cookie(cookieName, cork)
            ..domain = context.hostname
            ..httpOnly = true
            ..secure = context.isRunningInCloud
            ..path = '/'
            ..sameSite = SameSite.lax
            ..expires = expiration;

  static const String cookieName = 'cork';
}

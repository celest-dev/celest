import 'dart:typed_data';

import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/crypto/crypto_key_repository.dart';
import 'package:celest_cloud_auth/src/database/auth_database_accessors.dart';
import 'package:celest_cloud_auth/src/database/schema/auth.drift.dart';
import 'package:celest_cloud_auth/src/email/email_provider.dart';
import 'package:celest_cloud_auth/src/util/typeid.dart';
import 'package:clock/clock.dart';
import 'package:corks_cedar/corks_cedar.dart';
import 'package:meta/meta.dart';

typedef OtpData = ({
  OtpCode data,
  String code,
});

typedef _Deps = ({
  CryptoKeyRepository cryptoKeys,
  CloudAuthDatabaseMixin db,
});

/// A provider for generating and verifying OTP codes.
extension type OtpRepository._(_Deps _deps) implements Object {
  OtpRepository({
    required CryptoKeyRepository cryptoKeys,
    required CloudAuthDatabaseMixin db,
  }) : this._(
          (
            cryptoKeys: cryptoKeys,
            db: db,
          ),
        );

  CryptoKeyRepository get _cryptoKeys => _deps.cryptoKeys;
  CloudAuthDatabaseAccessors get _db => _deps.db.cloudAuth;

  /// The rate limiting options for resending of an OTP code for a single
  /// session.
  static const Duration resendDelay = Duration(minutes: 1);
  static const int maxResendAttempts = 3;

  /// The rate limiting options for verification of an OTP code for a single
  /// session.
  static const Duration verifyDelay = Duration(seconds: 10);
  static const int maxVerifyAttempts = 3;

  Future<(bool, DateTime?)> send({
    required TypeId<Session> sessionId,
    required String to,
    required EmailOtpProvider provider,
  }) async {
    final data =
        (await _db.authDrift.upsertOtpCode(sessionId: sessionId.encoded)).first;
    if (canResend(data) case (false, final nextResend)) {
      return (false, nextResend);
    }
    final session = await _db.authDrift
        .getSession(sessionId: sessionId.encoded)
        .getSingle();
    final key = await _cryptoKeys.getKey(cryptoKeyId: session.cryptoKeyId);
    final code = await generate(
      counter: data.rowid,
      signer: key.signer,
    );
    await provider.send((to: to, code: code));
    context.logger.fine('Sent OTP code to $to: $code');
    return (true, await _incrementResend(data));
  }

  /// Verifies an OTP code.
  Future<(bool, DateTime?)> verify({
    required TypeId<Session> sessionId,
    required String code,
  }) async {
    final data = await _db.authDrift
        .getOtpCode(sessionId: sessionId.encoded)
        .getSingle();
    if (canVerify(data) case (false, final nextVerify)) {
      context.logger.warning('Cannot verify OTP code again until $nextVerify');
      return (false, nextVerify);
    }
    final session = await _db.authDrift
        .getSession(sessionId: sessionId.encoded)
        .getSingle();
    final key = await _cryptoKeys.getKey(cryptoKeyId: session.cryptoKeyId);
    final expected = await generate(
      counter: data.rowid,
      signer: key.signer,
    );
    if (expected != code) {
      context.logger.warning('Invalid OTP code: $code');
      return (false, await _incrementVerify(data));
    }
    context.logger.fine('Verified OTP code');
    return (true, null);
  }

  /// Generates a 6-digit [OtpCode] as specified in [RFC 4226](https://tools.ietf.org/html/rfc4226).
  @visibleForTesting
  Future<String> generate({
    required int counter,
    required Signer signer,
  }) async {
    final buf = Uint8List(8);
    buf.buffer.asByteData().setUint64(0, counter, Endian.big);

    context.logger.finest('HOTP counter: $counter');

    final sum = await signer.sign(buf);

    // Dynamic truncation per RFC 4226.
    // http://tools.ietf.org/html/rfc4226#section-5.4
    final offset = sum.last & 0x0F;
    var code =
        sum.buffer.asByteData().getUint32(offset, Endian.big) & 0x7FFFFFFF;

    // Generate a six-digit code.
    code %= 1000000;
    final codeUnits = Uint8List(6);
    for (var i = 5; i >= 0; i--) {
      const asciiZero = 0x30;
      codeUnits[i] = asciiZero + code % 10;
      code ~/= 10;
    }

    return String.fromCharCodes(codeUnits);
  }

  Future<DateTime> _incrementResend(OtpCode otpCode) async {
    final data = await _db.authDrift.updateOtpCode(
      sessionId: otpCode.sessionId,
      resendAttempt: otpCode.resendAttempt + 1,
    );
    return nextResend(data.first);
  }

  Future<DateTime> _incrementVerify(OtpCode otpCode) async {
    final data = await _db.authDrift.updateOtpCode(
      sessionId: otpCode.sessionId,
      verifyAttempt: otpCode.verifyAttempt + 1,
    );
    return nextVerify(data.first);
  }

  DateTime nextResend(OtpCode otpCode) {
    return otpCode.updateTime.add(resendDelay);
  }

  (bool, DateTime?) canResend(OtpCode otpCode) {
    if (otpCode.resendAttempt == 0) {
      return (true, nextResend(otpCode));
    }
    if (otpCode.resendAttempt > maxResendAttempts) {
      return (false, null);
    }
    final expectedResendAt = otpCode.updateTime.add(resendDelay);
    if (clock.now().isBefore(expectedResendAt)) {
      return (false, expectedResendAt);
    }
    return (true, null);
  }

  DateTime nextVerify(OtpCode otpCode) {
    return otpCode.updateTime.add(verifyDelay);
  }

  (bool, DateTime?) canVerify(OtpCode otpCode) {
    if (otpCode.verifyAttempt == 0) {
      return (true, nextVerify(otpCode));
    }
    if (otpCode.verifyAttempt >= maxVerifyAttempts) {
      return (false, null);
    }
    if (otpCode.verifyAttempt == 0) {
      return (true, null);
    }
    final expectedVerifyAt = otpCode.updateTime.add(verifyDelay);
    if (clock.now().isBefore(expectedVerifyAt)) {
      return (false, expectedVerifyAt);
    }
    return (true, null);
  }
}

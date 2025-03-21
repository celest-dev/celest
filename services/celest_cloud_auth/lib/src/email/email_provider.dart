import 'dart:developer' as developer;

import 'package:celest_cloud_auth/src/context.dart';
import 'package:celest_cloud_auth/src/otp/otp_provider.dart';

/// A provider for sending OTP codes via email.
extension type const EmailOtpProvider._(OtpSender _send) implements Object {
  /// Creates a new [EmailOtpProvider] with the given [send] function.
  const EmailOtpProvider([OtpSender send = _defaultSend]) : this._(send);

  static Future<void> _defaultSend(Otp message) async {
    developer.postEvent('celest.cloud_auth.emailOtpSent', message.toJson());
    context.logger.info('Verification code for ${message.to}: ${message.code}');
  }

  /// Sends an email [message] and returns the message ID.
  Future<void> send(Otp message) {
    return _send(message);
  }
}

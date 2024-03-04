import 'package:celest_core/celest_core.dart';

// TODO(dnys1): Make sealed
final class PasskeyExceptionImpl implements PasskeyException {
  const PasskeyExceptionImpl({required this.message});

  @override
  final String message;

  @override
  String toString() => 'PasskeyException: $message';
}

final class PasskeyCancellationException extends PasskeyExceptionImpl {
  const PasskeyCancellationException()
      : super(message: 'Passkey registration was canceled by the user');
}

final class PasskeyUnknownException extends PasskeyExceptionImpl {
  const PasskeyUnknownException([String? message])
      : super(
          message: message ??
              'An unknown error occurred during passkey registration',
        );
}

final class PasskeyUnsupportedException extends PasskeyExceptionImpl {
  const PasskeyUnsupportedException()
      : super(message: 'Passkeys are not supported on this platform');
}

final class PasskeyFailedException extends PasskeyExceptionImpl {
  const PasskeyFailedException([String? message])
      : super(message: message ?? 'Passkey registration failed');
}

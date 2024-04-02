abstract interface class PlatformStorageException {
  const factory PlatformStorageException([String? message]) =
      PlatformStorageUnknownException;

  String get message;
}

final class PlatformStorageUnknownException
    implements PlatformStorageException {
  const PlatformStorageUnknownException([String? message])
      : message = message ?? 'An unknown error occurred in platform storage';

  @override
  final String message;

  @override
  String toString() => 'UnknownException: $message';
}

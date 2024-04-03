abstract interface class NativeStorageException {
  const factory NativeStorageException([String? message]) =
      NativeStorageUnknownException;

  String get message;
}

final class NativeStorageUnknownException implements NativeStorageException {
  const NativeStorageUnknownException([String? message])
      : message = message ?? 'An unknown error occurred in platform storage';

  @override
  final String message;

  @override
  String toString() => 'UnknownException: $message';
}

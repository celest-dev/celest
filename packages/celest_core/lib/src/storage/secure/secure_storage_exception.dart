import 'package:celest_core/src/exception/celest_exception.dart';
import 'package:celest_core/src/util/globals.dart';

sealed class SecureStorageException implements CelestException {
  const SecureStorageException();
}

final class SecureStorageItemNotFoundException extends SecureStorageException {
  const SecureStorageItemNotFoundException({
    String? message,
    this.key,
  }) : message = message ?? 'The item was not found in secure storage';

  @override
  final String message;
  final String? key;

  @override
  String toString() {
    final sb = StringBuffer('ItemNotFoundException: $message');
    if (!kReleaseMode && key != null) {
      sb.write(' (key: $key)');
    }
    return sb.toString();
  }
}

final class SecureStorageDuplicateItemException extends SecureStorageException {
  const SecureStorageDuplicateItemException({
    String? message,
    this.key,
  }) : message = message ?? 'The item already exists in secure storage';

  @override
  final String message;
  final String? key;

  @override
  String toString() {
    final sb = StringBuffer('DuplicateItemException: $message');
    if (!kReleaseMode && key != null) {
      sb.write(' (key: $key)');
    }
    return sb.toString();
  }
}

final class SecureStorageAccessDeniedException extends SecureStorageException {
  const SecureStorageAccessDeniedException({
    String? message,
  }) : message = message ?? 'Access to secure storage was denied';

  @override
  final String message;

  @override
  String toString() => 'AccessDeniedException: $message';
}

final class SecureStorageUnknownException extends SecureStorageException {
  const SecureStorageUnknownException([String? message])
      : message = message ?? 'An unknown error occurred in secure storage';

  @override
  final String message;

  @override
  String toString() => 'UnknownException: $message';
}

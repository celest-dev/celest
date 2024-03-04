import 'package:celest_core/celest_core.dart';

sealed class SecureStorageExceptionImpl implements SecureStorageException {
  const SecureStorageExceptionImpl();
}

final class SecureStorageItemNotFoundException
    extends SecureStorageExceptionImpl {
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
    if (key != null) {
      sb.write(' (key: $key)');
    }
    return sb.toString();
  }
}

final class SecureStorageDuplicateItemException
    extends SecureStorageExceptionImpl {
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
    if (key != null) {
      sb.write(' (key: $key)');
    }
    return sb.toString();
  }
}

final class SecureStorageAccessDeniedException
    extends SecureStorageExceptionImpl {
  const SecureStorageAccessDeniedException({
    String? message,
  }) : message = message ?? 'Access to secure storage was denied';

  @override
  final String message;

  @override
  String toString() => 'AccessDeniedException: $message';
}

final class SecureStorageUnknownException extends SecureStorageExceptionImpl {
  const SecureStorageUnknownException([String? message])
      : message = message ?? 'An unknown error occurred in secure storage';

  @override
  final String message;

  @override
  String toString() => 'UnknownException: $message';
}

import 'package:native_storage/native_storage.dart';
import 'package:stack_trace/stack_trace.dart';

enum IsolatedStorageCommand { read, write, delete, clear }

final class IsolatedStorageRequest {
  const IsolatedStorageRequest({
    required this.id,
    required this.command,
    this.key,
    this.value,
    this.error,
  });

  factory IsolatedStorageRequest.fromMap(Map<String, dynamic> map) {
    return IsolatedStorageRequest(
      id: (map['id'] as num).toInt(),
      command: IsolatedStorageCommand.values.byName(map['command'] as String),
      key: map['key'] as String?,
      value: map['value'] as String?,
      error: map['error'] == null
          ? null
          : (NativeStorageException(map['error'] as String), StackTrace.empty),
    );
  }

  final int id;
  final IsolatedStorageCommand command;
  final String? key;
  final String? value;
  final (NativeStorageException, StackTrace)? error;

  Map<String, Object?> toMap() => {
        'id': id,
        'command': command.name,
        'key': key,
        'value': value,
        'error': error?.$1.message,
      };

  IsolatedStorageRequest result({
    String? value,
    (NativeStorageException, StackTrace)? error,
  }) {
    return IsolatedStorageRequest(
      id: id,
      command: command,
      key: key,
      value: value,
      error: error,
    );
  }

  String? unwrap() {
    if (error case (final error, final stackTrace)) {
      Error.throwWithStackTrace(
        error,
        Chain([stackTrace, Chain.current()].map(Trace.from)),
      );
    }
    return value;
  }
}

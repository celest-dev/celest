import 'package:crypto/crypto.dart';
import 'package:sqlite3/common.dart';

extension DatabaseFunctions on CommonDatabase {
  /// Adds functions which are available in Turso to local databases.
  void addHelperFunctions() {
    createFunction(
      functionName: 'md5',
      argumentCount: const AllowedArgumentCount(1),
      deterministic: true,
      directOnly: false,
      function: (List<Object?> args) {
        return switch (args.first) {
          final List<int> value => md5.convert(value).bytes,
          final String value => md5.convert(value.codeUnits).bytes,
          final invalid => throw ArgumentError(
            'Invalid argument type. Expected BLOB or TEXT, got: '
            '$invalid (${invalid.runtimeType}).',
          ),
        };
      },
    );
    createFunction(
      functionName: 'text_split',
      argumentCount: const AllowedArgumentCount(3),
      deterministic: true,
      directOnly: false,
      function: (List<Object?> args) {
        final text = args[0] as String;
        final separator = args[1] as String;
        final parts = text.split(separator);
        var index = args[2] as int;
        if (index < 0) {
          index = parts.length + index - 1;
        }
        if (index > parts.length) {
          return '';
        }
        return parts[index];
      },
    );
  }
}

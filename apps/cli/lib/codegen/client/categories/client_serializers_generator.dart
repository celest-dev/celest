import 'package:code_builder/code_builder.dart';

final class ClientSerializersGenerator {
  ClientSerializersGenerator({
    required this.customSerializers,
    required this.anonymousRecordTypes,
  });

  final Map<Class, Expression?> customSerializers;
  final Map<String, RecordType> anonymousRecordTypes;

  Library generate() => Library(
        (lib) => lib.body
          ..addAll(
            anonymousRecordTypes.entries
                .map(
                  (recordType) => TypeDef(
                    (t) => t
                      ..name = recordType.key
                      ..definition = recordType.value,
                  ),
                )
                .toList()
              ..sort((a, b) => a.name.compareTo(b.name)),
          )
          ..addAll(
            customSerializers.keys.toList()
              ..sort((a, b) => a.name.compareTo(b.name)),
          ),
      );
}

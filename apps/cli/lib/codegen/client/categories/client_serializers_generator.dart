import 'package:code_builder/code_builder.dart';

final class ClientSerializersGenerator {
  ClientSerializersGenerator({
    required this.customSerializers,
    required this.anonymousRecordTypes,
  });

  final Set<Class> customSerializers;
  final Map<String, RecordType> anonymousRecordTypes;

  Library generate() => Library(
        (lib) => lib.body
          ..addAll(customSerializers)
          ..addAll(
            anonymousRecordTypes.entries.map(
              (recordType) => TypeDef(
                (t) => t
                  ..name = recordType.key
                  ..definition = recordType.value,
              ),
            ),
          ),
      );
}

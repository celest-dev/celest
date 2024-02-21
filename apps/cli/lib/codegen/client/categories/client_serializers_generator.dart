import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:code_builder/code_builder.dart';

final class ClientSerializersGenerator {
  ClientSerializersGenerator({
    required this.customSerializers,
    required this.anonymousRecordTypes,
  });

  final Set<SerializerDefinition> customSerializers;
  final Map<String, RecordType> anonymousRecordTypes;

  Method get _initSerializers {
    return Method(
      (m) => m
        ..returns = DartTypes.core.void$
        ..name = 'initSerializers'
        ..body = Block.of(customSerializers.map((s) => s.initAll)),
    );
  }

  Library generate() => Library(
        (lib) => lib.body
          ..add(_initSerializers)
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
            customSerializers.map((s) => s.genericClass).nonNulls.toList()
              ..sort((a, b) => a.name.compareTo(b.name)),
          ),
      );
}

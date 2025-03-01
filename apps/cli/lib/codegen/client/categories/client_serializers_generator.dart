import 'package:celest_cli/serialization/serializer_generator.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

final class ClientSerializersGenerator {
  ClientSerializersGenerator({
    required this.customSerializers,
    required this.anonymousRecordTypes,
  });

  final Set<SerializerDefinition> customSerializers;
  final Map<String, RecordType> anonymousRecordTypes;

  Method get _initSerializers {
    return Method(
      (m) =>
          m
            ..returns = DartTypes.core.void$
            ..name = 'initSerializers'
            ..optionalParameters.add(
              Parameter(
                (p) =>
                    p
                      ..name = 'serializers'
                      ..type = DartTypes.celest.serializers.nullable
                      ..named = true,
              ),
            )
            ..body =
                DartTypes.async.runZoned
                    .call(
                      [
                        Method(
                          (m) =>
                              m
                                ..body = Block.of(
                                  customSerializers
                                      .sorted((a, b) {
                                        final aLoc = a.type.url;
                                        final bLoc = b.type.url;
                                        if (aLoc == null) {
                                          return -1;
                                        }
                                        if (bLoc == null) {
                                          return 1;
                                        }
                                        final loc = aLoc.compareTo(bLoc);
                                        if (loc != 0) {
                                          return loc;
                                        }
                                        final aSym = a.type.symbol!;
                                        final bSym = b.type.symbol!;
                                        return aSym.compareTo(bSym);
                                      })
                                      .map((s) => s.initAll),
                                ),
                        ).closure,
                      ],
                      {
                        'zoneValues': literalMap({
                          DartTypes.celest.serializers: refer('serializers'),
                        }),
                      },
                    )
                    .returned
                    .statement,
    );
  }

  Library generate() => Library(
    (lib) =>
        lib.body
          ..add(_initSerializers)
          ..addAll(
            anonymousRecordTypes.entries
                .map(
                  (recordType) => TypeDef(
                    (t) =>
                        t
                          ..name = recordType.key
                          ..definition = recordType.value,
                  ),
                )
                .toList()
              ..sort((a, b) => a.name.compareTo(b.name)),
          )
          ..addAll(
            customSerializers.map((s) => s.serializerClass).nonNulls.toList()
              ..sort((a, b) => a.name.compareTo(b.name)),
          ),
  );
}

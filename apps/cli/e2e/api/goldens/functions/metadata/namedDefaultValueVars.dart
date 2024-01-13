// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i4;

import '../../../functions/metadata.dart' as _i2;

final class NamedDefaultValueVarsTarget extends _i1.CelestFunctionTarget {
  NamedDefaultValueVarsTarget()
      : super(
          (
            request,
            context,
          ) async {
            _i2.namedDefaultValueVars(
              value: ((request[r'value'] as num?)?.toInt()) ?? _i2.defaultInt,
              doubleValue: ((request[r'doubleValue'] as num?)?.toDouble()) ??
                  _i2.defaultDouble,
              boolValue: ((request[r'boolValue'] as bool?)) ?? _i2.defaultBool,
              stringValue:
                  ((request[r'stringValue'] as String?)) ?? _i2.defaultString,
              listValue: ((request[r'listValue'] as Iterable<Object?>?)
                      ?.map((el) => (el as String))
                      .toList()) ??
                  _i2.defaultList,
              mapValue: ((request[r'mapValue'] as Map<String, Object?>?)?.map((
                    key,
                    value,
                  ) =>
                      MapEntry(
                        key,
                        (value as String),
                      ))) ??
                  _i2.defaultMap,
              enumValue: (_i3.Serializers.scoped
                      .deserialize<_i2.LiteralEnum?>(request[r'enumValue'])) ??
                  _i2.defaultEnum,
              recordValue: (_i3.Serializers.scoped
                      .deserialize<({String a, String b, String c})?>(
                          request[r'recordValue'])) ??
                  _i2.defaultRecord,
              exportable: (_i3.Serializers.scoped
                      .deserialize<_i2.Exportable?>(request[r'exportable'])) ??
                  _i2.defaultExportable,
              serializable: (_i3.Serializers.scoped
                      .deserialize<_i2.Serializable?>(
                          request[r'serializable'])) ??
                  _i2.defaultSerializable,
            );
            return (statusCode: 200, body: null);
          },
          installSerializers: (serializers) {
            serializers.put(const LiteralEnumSerializer());
            serializers.put(const Record$k7x4l9Serializer());
            serializers.put(const ExportableSerializer());
            serializers.put(const SerializableSerializer());
          },
          middleware: [],
        );
}

Future<void> main(List<String> args) async {
  await _i4.serve(
    args,
    (_) => NamedDefaultValueVarsTarget(),
  );
}

typedef Record$k7x4l9 = ({String a, String b, String c});

final class LiteralEnumSerializer extends _i3.Serializer<_i2.LiteralEnum> {
  const LiteralEnumSerializer();

  @override
  String get dartType => r'project:functions/metadata.dart#LiteralEnum';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.LiteralEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.LiteralEnum.values.byName(serialized);
  }

  @override
  String serialize(_i2.LiteralEnum value) => value.name;
}

final class Record$k7x4l9Serializer extends _i3.Serializer<Record$k7x4l9> {
  const Record$k7x4l9Serializer();

  @override
  String get dartType => r'#Record$k7x4l9';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$k7x4l9 deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      a: (serialized[r'a'] as String),
      b: (serialized[r'b'] as String),
      c: (serialized[r'c'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$k7x4l9 value) => {
        r'a': value.a,
        r'b': value.b,
        r'c': value.c,
      };
}

final class ExportableSerializer extends _i3.Serializer<_i2.Exportable> {
  const ExportableSerializer();

  @override
  String get dartType => r'project:functions/metadata.dart#Exportable';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Exportable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.Exportable();
  }

  @override
  Map<String, Object?> serialize(_i2.Exportable value) => {};
}

final class SerializableSerializer extends _i3.Serializer<_i2.Serializable> {
  const SerializableSerializer();

  @override
  String get dartType => r'project:functions/metadata.dart#Serializable';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Serializable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.Serializable(((serialized?[r'type'] as String?)) ?? null);
  }

  @override
  Map<String, Object?> serialize(_i2.Serializable value) =>
      {r'type': value.type};
}

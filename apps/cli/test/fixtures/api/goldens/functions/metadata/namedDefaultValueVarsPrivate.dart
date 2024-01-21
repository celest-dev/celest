// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/metadata.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/metadata.dart' as _i2;

final class NamedDefaultValueVarsPrivateTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'namedDefaultValueVarsPrivate';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    _i2.namedDefaultValueVarsPrivate(
      value: ((request[r'value'] as num?)?.toInt()) ?? 42,
      doubleValue: ((request[r'doubleValue'] as num?)?.toDouble()) ?? 42.0,
      boolValue: ((request[r'boolValue'] as bool?)) ?? true,
      stringValue: ((request[r'stringValue'] as String?)) ?? 'default',
      listValue: ((request[r'listValue'] as Iterable<Object?>?)
              ?.map((el) => (el as String))
              .toList()) ??
          const ['default'],
      mapValue: ((request[r'mapValue'] as Map<String, Object?>?)?.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as String),
              ))) ??
          const {'default': 'default'},
      enumValue: (_i3.Serializers.instance
              .deserialize<_i4.LiteralEnum?>(request[r'enumValue'])) ??
          _i4.LiteralEnum.a,
      recordValue: (_i3.Serializers.instance
              .deserialize<({String a, String b, String c})?>(
                  request[r'recordValue'])) ??
          const (a: 'a', b: 'b', c: 'c'),
      exportable: (_i3.Serializers.instance
              .deserialize<_i4.Exportable?>(request[r'exportable'])) ??
          const _i4.Exportable(),
      serializable: (_i3.Serializers.instance
              .deserialize<_i4.Serializable?>(request[r'serializable'])) ??
          const _i4.Serializable.forType('String'),
    );
    return (statusCode: 200, body: {'response': null});
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const LiteralEnumSerializer());
    _i3.Serializers.instance.put(const Record$k7x4l9Serializer());
    _i3.Serializers.instance.put(const ExportableSerializer());
    _i3.Serializers.instance.put(const SerializableSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NamedDefaultValueVarsPrivateTarget()},
  );
}

typedef Record$k7x4l9 = ({String a, String b, String c});

final class LiteralEnumSerializer extends _i3.Serializer<_i4.LiteralEnum> {
  const LiteralEnumSerializer();

  @override
  _i4.LiteralEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.LiteralEnum.values.byName(serialized);
  }

  @override
  String serialize(_i4.LiteralEnum value) => value.name;
}

final class Record$k7x4l9Serializer extends _i3.Serializer<Record$k7x4l9> {
  const Record$k7x4l9Serializer();

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

final class ExportableSerializer extends _i3.Serializer<_i4.Exportable> {
  const ExportableSerializer();

  @override
  _i4.Exportable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.Exportable();
  }

  @override
  Map<String, Object?> serialize(_i4.Exportable value) => {};
}

final class SerializableSerializer extends _i3.Serializer<_i4.Serializable> {
  const SerializableSerializer();

  @override
  _i4.Serializable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.Serializable(((serialized?[r'type'] as String?)) ?? null);
  }

  @override
  Map<String, Object?> serialize(_i4.Serializable value) =>
      {r'type': value.type};
}

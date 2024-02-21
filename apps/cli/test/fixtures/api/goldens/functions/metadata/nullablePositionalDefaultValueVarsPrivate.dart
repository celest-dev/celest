// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/metadata.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;

import '../../../functions/metadata.dart' as _i2;

final class NullablePositionalDefaultValueVarsPrivateTarget
    extends _i1.CloudFunctionTarget {
  @override
  String get name => 'nullablePositionalDefaultValueVarsPrivate';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      _i2.nullablePositionalDefaultValueVarsPrivate(
        ((request[r'value'] as num?)?.toInt()) ?? 42,
        ((request[r'doubleValue'] as num?)?.toDouble()) ?? 42.0,
        ((request[r'boolValue'] as bool?)) ?? true,
        ((request[r'stringValue'] as String?)) ?? 'default',
        ((request[r'listValue'] as Iterable<Object?>?)
                ?.map((el) => (el as String))
                .toList()) ??
            const ['default'],
        ((request[r'mapValue'] as Map<String, Object?>?)?.map((
              key,
              value,
            ) =>
                MapEntry(
                  key,
                  (value as String),
                ))) ??
            const {'default': 'default'},
        (_i3.Serializers.instance
                .deserialize<_i4.LiteralEnum?>(request[r'enumValue'])) ??
            _i4.LiteralEnum.a,
        (_i3.Serializers.instance
                .deserialize<({String a, String b, String c})?>(
                    request[r'recordValue'])) ??
            const (a: 'a', b: 'b', c: 'c'),
        (_i3.Serializers.instance
                .deserialize<_i4.Exportable?>(request[r'exportable'])) ??
            const _i4.Exportable(),
        (_i3.Serializers.instance
                .deserialize<_i4.Serializable?>(request[r'serializable'])) ??
            const _i4.Serializable.forType('String'),
      );
      return (statusCode: 200, body: {'response': null});
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i6.InternalServerException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.InternalServerException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerException',
            'details': error,
          }
        }
      );
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.BadRequestException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'BadRequestException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const LiteralEnumSerializer());
    _i3.Serializers.instance.put(const Record$k7x4l9Serializer());
    _i3.Serializers.instance.put(const ExportableSerializer());
    _i3.Serializers.instance.put(const SerializableSerializer());
    _i3.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i3.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i3.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NullablePositionalDefaultValueVarsPrivateTarget()},
  );
}

typedef Record$k7x4l9 = ({String a, String b, String c});

final class BadRequestExceptionSerializer
    extends _i3.Serializer<_i6.BadRequestException> {
  const BadRequestExceptionSerializer();

  @override
  _i6.BadRequestException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.BadRequestException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i6.BadRequestException value) =>
      {r'message': value.message};
}

final class ExportableSerializer extends _i3.Serializer<_i4.Exportable> {
  const ExportableSerializer();

  @override
  _i4.Exportable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.Exportable();
  }

  @override
  Object? serialize(_i4.Exportable value) => {};
}

final class InternalServerExceptionSerializer
    extends _i3.Serializer<_i6.InternalServerException> {
  const InternalServerExceptionSerializer();

  @override
  _i6.InternalServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.InternalServerException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i6.InternalServerException value) =>
      {r'message': value.message};
}

final class LiteralEnumSerializer extends _i3.Serializer<_i4.LiteralEnum> {
  const LiteralEnumSerializer();

  @override
  _i4.LiteralEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.LiteralEnum.values.byName(serialized);
  }

  @override
  Object? serialize(_i4.LiteralEnum value) => value.name;
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
  Object? serialize(Record$k7x4l9 value) => {
        r'a': value.a,
        r'b': value.b,
        r'c': value.c,
      };
}

final class SerializableSerializer extends _i3.Serializer<_i4.Serializable> {
  const SerializableSerializer();

  @override
  _i4.Serializable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.Serializable(((serialized?[r'type'] as String?)) ?? null);
  }

  @override
  Object? serialize(_i4.Serializable value) => {r'type': value.type};
}

final class SerializationExceptionSerializer
    extends _i3.Serializer<_i5.SerializationException> {
  const SerializationExceptionSerializer();

  @override
  _i5.SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}

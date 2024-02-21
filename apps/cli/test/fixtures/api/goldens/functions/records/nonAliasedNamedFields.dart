// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i4;

import '../../../functions/records.dart' as _i2;

final class NonAliasedNamedFieldsTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'nonAliasedNamedFields';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.nonAliasedNamedFields(
          value: _i3.Serializers.instance
              .deserialize<({String anotherField, String field})>(
                  request[r'value']));
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance
              .serialize<({String anotherField, String field})>(response)
        }
      );
    } on _i4.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i4.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i5.InternalServerException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.InternalServerException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerException',
            'details': error,
          }
        }
      );
    } on _i5.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.BadRequestException>(e);
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
    _i3.Serializers.instance.put(const Record$rmm4wtSerializer());
    _i3.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i3.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i3.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NonAliasedNamedFieldsTarget()},
  );
}

typedef Record$rmm4wt = ({String anotherField, String field});

final class BadRequestExceptionSerializer
    extends _i3.Serializer<_i5.BadRequestException> {
  const BadRequestExceptionSerializer();

  @override
  _i5.BadRequestException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.BadRequestException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.BadRequestException value) =>
      {r'message': value.message};
}

final class InternalServerExceptionSerializer
    extends _i3.Serializer<_i5.InternalServerException> {
  const InternalServerExceptionSerializer();

  @override
  _i5.InternalServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i5.InternalServerException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i5.InternalServerException value) =>
      {r'message': value.message};
}

final class Record$rmm4wtSerializer extends _i3.Serializer<Record$rmm4wt> {
  const Record$rmm4wtSerializer();

  @override
  Record$rmm4wt deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Object? serialize(Record$rmm4wt value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

final class SerializationExceptionSerializer
    extends _i3.Serializer<_i4.SerializationException> {
  const SerializationExceptionSerializer();

  @override
  _i4.SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i4.SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}

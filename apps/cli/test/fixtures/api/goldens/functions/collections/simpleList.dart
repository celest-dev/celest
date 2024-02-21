// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i3;

import '../../../functions/collections.dart' as _i2;

final class SimpleListTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'simpleList';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = await _i2.simpleList(
          (request[r'list'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList());
      return (statusCode: 200, body: {'response': response});
    } on _i3.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.SerializationException>(e);
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
          _i4.Serializers.instance.serialize<_i5.InternalServerException>(e);
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
          _i4.Serializers.instance.serialize<_i5.BadRequestException>(e);
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
    _i4.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i4.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i4.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SimpleListTarget()},
  );
}

final class BadRequestExceptionSerializer
    extends _i4.Serializer<_i5.BadRequestException> {
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
    extends _i4.Serializer<_i5.InternalServerException> {
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

final class SerializationExceptionSerializer
    extends _i4.Serializer<_i3.SerializationException> {
  const SerializationExceptionSerializer();

  @override
  _i3.SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_i3.SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}

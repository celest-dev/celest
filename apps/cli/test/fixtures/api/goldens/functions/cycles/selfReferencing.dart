// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/cycles.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;

import '../../../functions/cycles.dart' as _i2;

final class SelfReferencingTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'selfReferencing';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.selfReferencing(_i3.Serializers.instance
          .deserialize<_i4.SelfReferencing>(request[r'selfReferencing']));
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.SelfReferencing>(response)
        }
      );
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
    _i3.Serializers.instance.put(const SelfReferencingSerializer());
    _i3.Serializers.instance.put(const SelfReferencingWrapperSerializer());
    _i3.Serializers.instance.put(const BadRequestExceptionSerializer());
    _i3.Serializers.instance.put(const InternalServerExceptionSerializer());
    _i3.Serializers.instance.put(const SerializationExceptionSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SelfReferencingTarget()},
  );
}

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

final class SelfReferencingSerializer
    extends _i3.Serializer<_i4.SelfReferencing> {
  const SelfReferencingSerializer();

  @override
  _i4.SelfReferencing deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.SelfReferencing(
      value: (_i3.Serializers.instance
              .deserialize<_i4.SelfReferencing?>(serialized[r'value'])) ??
          null,
      wrapper: (_i3.Serializers.instance
              .deserialize<_i4.SelfReferencingWrapper?>(
                  serialized[r'wrapper'])) ??
          null,
      list: (serialized[r'list'] as Iterable<Object?>)
          .map((el) =>
              _i3.Serializers.instance.deserialize<_i4.SelfReferencing>(el))
          .toList(),
    );
  }

  @override
  Object? serialize(_i4.SelfReferencing value) => {
        r'value': _i3.Serializers.instance
            .serialize<_i4.SelfReferencing?>(value.value),
        r'wrapper': _i3.Serializers.instance
            .serialize<_i4.SelfReferencingWrapper?>(value.wrapper),
        r'list': value.list
            .map((el) =>
                _i3.Serializers.instance.serialize<_i4.SelfReferencing>(el))
            .toList(),
      };
}

final class SelfReferencingWrapperSerializer
    extends _i3.Serializer<_i4.SelfReferencingWrapper> {
  const SelfReferencingWrapperSerializer();

  @override
  _i4.SelfReferencingWrapper deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.SelfReferencingWrapper(
        value: _i3.Serializers.instance
            .deserialize<_i4.SelfReferencing>(serialized[r'value']));
  }

  @override
  Object? serialize(_i4.SelfReferencingWrapper value) => {
        r'value':
            _i3.Serializers.instance.serialize<_i4.SelfReferencing>(value.value)
      };
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

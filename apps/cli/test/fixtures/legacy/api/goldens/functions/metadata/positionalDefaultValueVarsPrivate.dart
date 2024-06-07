// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/metadata.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;

import '../../../functions/metadata.dart' as _i2;

final class PositionalDefaultValueVarsPrivateTarget
    extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'positionalDefaultValueVarsPrivate';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      _i2.positionalDefaultValueVarsPrivate(
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
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.InternalServerError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerError',
            'details': error,
          }
        }
      );
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.UnauthorizedException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UnauthorizedException',
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<Record$k7x4l9, Map<String, Object?>>(
      serialize: ($value) => {
        r'a': $value.a,
        r'b': $value.b,
        r'c': $value.c,
      },
      deserialize: ($serialized) {
        return (
          a: ($serialized[r'a'] as String),
          b: ($serialized[r'b'] as String),
          c: ($serialized[r'c'] as String)
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Exportable, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return _i4.Exportable();
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.LiteralEnum, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.LiteralEnum.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Serializable, Map<String, Object?>?>(
      serialize: ($value) => {r'type': $value.type},
      deserialize: ($serialized) {
        return _i4.Serializable(($serialized?[r'type'] as String?));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': PositionalDefaultValueVarsPrivateTarget()});
}

typedef Record$k7x4l9 = ({String a, String b, String c});

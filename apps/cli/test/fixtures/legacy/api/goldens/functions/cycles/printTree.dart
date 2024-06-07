// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/cycles.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;

import '../../../functions/cycles.dart' as _i2;

final class PrintTreeTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'printTree';

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
      _i2.printTree(
          _i3.Serializers.instance.deserialize<_i4.Node>(request[r'node']));
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
        .put(_i3.Serializer.define<_i4.Child, Map<String, Object?>>(
      serialize: ($value) => {r'name': $value.name},
      deserialize: ($serialized) {
        return _i4.Child(($serialized[r'name'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Node, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i4.Parent) {
          return {
            ...(_i3.Serializers.instance.serialize<_i4.Parent>($value)
                as Map<String, Object?>),
            r'$type': r'Parent',
          };
        }
        if ($value is _i4.Child) {
          return {
            ...(_i3.Serializers.instance.serialize<_i4.Child>($value)
                as Map<String, Object?>),
            r'$type': r'Child',
          };
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Node')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'Parent') {
          return _i3.Serializers.instance.deserialize<_i4.Parent>($serialized);
        }
        if ($serialized[r'$type'] == r'Child') {
          return _i3.Serializers.instance.deserialize<_i4.Child>($serialized);
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Node')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Parent, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'children': $value.children
            .map((el) => _i3.Serializers.instance.serialize<_i4.Node>(el))
            .toList(),
      },
      deserialize: ($serialized) {
        return _i4.Parent(
          ($serialized[r'name'] as String),
          ($serialized[r'children'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<_i4.Node>(el))
              .toList(),
        );
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
  await _i1.serve(targets: {'/': PrintTreeTarget()});
}

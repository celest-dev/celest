// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _i6;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i5;
import 'package:celest_backend/models/overrides.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i8;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i7;

import '../../../functions/overrides.dart' as _i2;

final class NestedGrandparentTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'nestedGrandparent';

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
      final response = _i2.nestedGrandparent(_i3.Serializers.instance
          .deserialize<_i4.NestedGrandparent>(request[r'grandparent']));
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance
              .serialize<_i4.NestedGrandparent>(response)
        }
      );
    } on _i5.OverriddenException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.OverriddenException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'OverriddenException',
            'details': error,
          }
        }
      );
    } on _i6.CommonException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i6.CommonException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CommonException',
            'details': error,
          }
        }
      );
    } on _i6.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i6.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    } on _i7.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i8.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i8.InternalServerError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerError',
            'details': error,
          }
        }
      );
    } on _i8.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i8.UnauthorizedException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UnauthorizedException',
            'details': error,
          }
        }
      );
    } on _i8.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i8.BadRequestException>(e);
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
        .put(_i3.Serializer.define<_i6.CommonException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.CommonException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.CustomException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.CustomException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.OverriddenException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return (_i6.OverriddenException(($serialized[r'message'] as String))
            as _i5.OverriddenException);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.NestedChild, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.NestedChild.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.NestedGrandparent, Map<String, Object?>>(
      serialize: ($value) => {
        r'parent':
            _i3.Serializers.instance.serialize<_i6.NestedParent>($value.parent)
      },
      deserialize: ($serialized) {
        return _i4.NestedGrandparent(_i3.Serializers.instance
            .deserialize<_i6.NestedParent>($serialized[r'parent']));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.NestedParent, Map<String, Object?>>(
      serialize: ($value) => {
        r'child':
            _i3.Serializers.instance.serialize<_i6.NestedChild>($value.child)
      },
      deserialize: ($serialized) {
        return (_i6.NestedParent(_i3.Serializers.instance
                .deserialize<_i6.NestedChild>($serialized[r'child']))
            as _i4.NestedParent);
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i8.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i8.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i8.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i7.SerializationException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': NestedGrandparentTarget()});
}

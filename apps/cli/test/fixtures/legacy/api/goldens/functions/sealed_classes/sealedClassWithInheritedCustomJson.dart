// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/exceptions.dart' as _i5;
import 'package:celest_backend/models/sealed_classes.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;
import 'package:celest_core/src/serialization/json_value.dart' as _i8;

import '../../../functions/sealed_classes.dart' as _i2;

final class SealedClassWithInheritedCustomJsonTarget
    extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'sealedClassWithInheritedCustomJson';

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
      final response = _i2.sealedClassWithInheritedCustomJson(
          shapes: (request[r'shapes'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance
                  .deserialize<_i4.ShapeWithInheritedCustomJson>(el))
              .toList());
      return (
        statusCode: 200,
        body: {
          'response': response
              .map((el) => _i3.Serializers.instance
                  .serialize<_i4.ShapeWithInheritedCustomJson>(el))
              .toList()
        }
      );
    } on _i5.CustomErrorWithStackTrace catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.CustomErrorWithStackTrace>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorWithStackTrace',
            'details': error,
          }
        }
      );
    } on _i5.CustomErrorToFromJson catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.CustomErrorToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomErrorToFromJson',
            'details': error,
          }
        }
      );
    } on _i5.CustomError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.CustomError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomError',
            'details': error,
          }
        }
      );
    } on _i5.CustomExceptionToFromJson catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.CustomExceptionToFromJson>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomExceptionToFromJson',
            'details': error,
          }
        }
      );
    } on _i5.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i5.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.SerializationException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'SerializationException',
            'details': error,
          }
        }
      );
    } on _i7.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.InternalServerError>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerError',
            'details': error,
          }
        }
      );
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.UnauthorizedException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'UnauthorizedException',
            'details': error,
          }
        }
      );
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.BadRequestException>(e);
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
        .put(_i3.Serializer.define<_i5.CustomError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CustomError();
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.CustomErrorToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.CustomErrorToFromJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.CustomErrorWithStackTrace, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.stackTrace),
        r'message': $value.message,
        r'additionalInfo': $value.additionalInfo,
      },
      deserialize: ($serialized) {
        return _i5.CustomErrorWithStackTrace(
            stackTrace: _i3.Serializers.instance
                .deserialize<StackTrace?>($serialized?[r'stackTrace']));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.CustomException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'additionalInfo': _i3.Serializers.instance.serialize<_i8.JsonMap>(
          $value.additionalInfo,
          const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CustomException();
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.CustomExceptionToFromJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.CustomExceptionToFromJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.CircleWithInheritedCustomJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return (_i4.ShapeWithInheritedCustomJson.fromJson({
          r'$type': r'CircleWithInheritedCustomJson',
          ...$serialized,
        }) as _i4.CircleWithInheritedCustomJson);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.RectangleWithInheritedCustomJson, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return (_i4.ShapeWithInheritedCustomJson.fromJson({
          r'$type': r'RectangleWithInheritedCustomJson',
          ...$serialized,
        }) as _i4.RectangleWithInheritedCustomJson);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i4.ShapeWithInheritedCustomJson, Map<String, Object?>>(
      serialize: ($value) => {
        ...$value.toJson(),
        r'$type': switch ($value) {
          _i4.CircleWithInheritedCustomJson() =>
            r'CircleWithInheritedCustomJson',
          _i4.RectangleWithInheritedCustomJson() =>
            r'RectangleWithInheritedCustomJson',
        },
      },
      deserialize: ($serialized) {
        return _i4.ShapeWithInheritedCustomJson.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i6.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i8.JsonMap, Map<String, Object?>>(
        serialize: ($value) => $value,
        deserialize: ($serialized) {
          return _i8.JsonMap(($serialized as Map<String, Object?>));
        },
      ),
      const _i3.TypeToken<_i8.JsonMap>('JsonMap'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': SealedClassWithInheritedCustomJsonTarget()});
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i3;
import 'dart:isolate' as _i8;

import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/person.dart' as _i5;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;

import '../../../functions/injected.dart' as _i2;

final class SayHelloPersonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'sayHelloPerson';

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
      final response = _i2.sayHelloPerson(
        name: _i3.Platform.environment[r'MY_NAME']!,
        age: int.parse(_i3.Platform.environment[r'MY_AGE']!),
        height: double.parse(_i3.Platform.environment[r'MY_HEIGHT']!),
        weight: num.parse(_i3.Platform.environment[r'MY_WEIGHT']!),
        isCool: bool.parse(_i3.Platform.environment[r'IM_COOL']!),
        website: Uri.parse(_i3.Platform.environment[r'MY_WEBSITE']!),
      );
      return (
        statusCode: 200,
        body: {
          'response': _i4.Serializers.instance.serialize<_i5.Person>(response)
        }
      );
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i6.SerializationException>(e);
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
          _i4.Serializers.instance.serialize<_i7.InternalServerError>(e);
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
          _i4.Serializers.instance.serialize<_i7.UnauthorizedException>(e);
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
          _i4.Serializers.instance.serialize<_i7.BadRequestException>(e);
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
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.Person, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'age': $value.age,
        r'height': $value.height,
        r'weight': $value.weight,
        r'isCool': $value.isCool,
        r'website': _i4.Serializers.instance.serialize<Uri>($value.website),
      },
      deserialize: ($serialized) {
        return _i5.Person(
          name: ($serialized[r'name'] as String),
          age: ($serialized[r'age'] as num).toInt(),
          height: ($serialized[r'height'] as num).toDouble(),
          weight: ($serialized[r'weight'] as num),
          isCool: ($serialized[r'isCool'] as bool),
          website: _i4.Serializers.instance
              .deserialize<Uri>($serialized[r'website']),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i7.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i6.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i6.SerializationException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i3.Platform.numberOfProcessors; i++)
      _i8.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i1.serve(targets: {'/': SayHelloPersonTarget()});
}

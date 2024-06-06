// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i5;
import 'dart:io' as _i8;
import 'dart:isolate' as _i9;

import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/auth/user.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i7;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i6;

import '../../../functions/lib.dart' as _i2;

final class StreamHelloAuthenticatedTarget extends _i1.CloudEventSourceTarget {
  @override
  String get name => 'streamHelloAuthenticated';

  @override
  Stream<Map<String, Object?>> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async* {
    try {
      await for (final response in _i2.streamHelloAuthenticated(
          user: _i3.Serializers.instance
              .deserialize<_i4.User>(_i5.jsonDecode(context[r'$user']!)))) {
        yield {'response': response};
      }
    } on _i6.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.SerializationException>(e);
      yield {
        'error': {
          'code': r'SerializationException',
          'details': error,
        }
      };
    } on _i7.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.InternalServerError>(e);
      yield {
        'error': {
          'code': r'InternalServerError',
          'details': error,
        }
      };
    } on _i7.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.UnauthorizedException>(e);
      yield {
        'error': {
          'code': r'UnauthorizedException',
          'details': error,
        }
      };
    } on _i7.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i7.BadRequestException>(e);
      yield {
        'error': {
          'code': r'BadRequestException',
          'details': error,
        }
      };
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.User, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.User.fromJson($serialized);
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
  }
}

Future<void> main() async {
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i8.Platform.numberOfProcessors; i++)
      _i9.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i1.serve(targets: {'/': StreamHelloAuthenticatedTarget()});
}

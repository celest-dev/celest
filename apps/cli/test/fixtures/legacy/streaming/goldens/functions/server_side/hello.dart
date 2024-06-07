// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i4;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i3;

import '../../../functions/server_side.dart' as _i2;

final class HelloTarget extends _i1.CloudEventSourceTarget {
  @override
  String get name => 'hello';

  @override
  bool get hasBody => true;

  @override
  Stream<Map<String, Object?>> handle(
    Map<String, Object?> request, {
    required Map<String, String> context,
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async* {
    try {
      await for (final response in _i2.hello(
          (request[r'names'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList())) {
        yield {'response': response};
      }
    } on _i3.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i3.SerializationException>(e);
      yield {
        'error': {
          'code': r'SerializationException',
          'details': error,
        }
      };
    } on _i5.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.InternalServerError>(e);
      yield {
        'error': {
          'code': r'InternalServerError',
          'details': error,
        }
      };
    } on _i5.UnauthorizedException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.UnauthorizedException>(e);
      yield {
        'error': {
          'code': r'UnauthorizedException',
          'details': error,
        }
      };
    } on _i5.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i4.Serializers.instance.serialize<_i5.BadRequestException>(e);
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
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.InternalServerError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i5.UnauthorizedException(
            (($serialized?[r'message'] as String?)) ?? 'Unauthorized');
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i3.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
      },
      deserialize: ($serialized) {
        return _i3.SerializationException(($serialized[r'message'] as String));
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': HelloTarget()});
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i7;
import 'dart:isolate' as _i8;

import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/http_header_query.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;

import '../../../functions/http_header.dart' as _i2;

final class HeadersTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'headers';

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
      final response = await _i2.headers(
        headers['aString']!.first,
        int.parse(headers['anInt']!.first),
        double.parse(headers['aDouble']!.first),
        num.parse(headers['aNum']!.first),
        bool.parse(headers['aBool']!.first),
        DateTime.parse(headers['aDateTime']!.first),
        headers['aNullableString'] == null
            ? null
            : headers['aNullableString']!.first,
        headers['aNullableInt'] == null
            ? null
            : int.parse(headers['aNullableInt']!.first),
        headers['aNullableDouble'] == null
            ? null
            : double.parse(headers['aNullableDouble']!.first),
        headers['aNullableNum'] == null
            ? null
            : num.parse(headers['aNullableNum']!.first),
        headers['aNullableBool'] == null
            ? null
            : bool.parse(headers['aNullableBool']!.first),
        headers['aNullableDateTime'] == null
            ? null
            : DateTime.parse(headers['aNullableDateTime']!.first),
      );
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.HttpHeaderParams>(response)
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
        .put(_i3.Serializer.define<_i4.HttpHeaderParams, Map<String, Object?>>(
      serialize: ($value) => {
        r'aString': $value.aString,
        r'anInt': $value.anInt,
        r'aDouble': $value.aDouble,
        r'aNum': $value.aNum,
        r'aBool': $value.aBool,
        r'aDateTime':
            _i3.Serializers.instance.serialize<DateTime>($value.aDateTime),
        r'aNullableString': $value.aNullableString,
        r'aNullableInt': $value.aNullableInt,
        r'aNullableDouble': $value.aNullableDouble,
        r'aNullableNum': $value.aNullableNum,
        r'aNullableBool': $value.aNullableBool,
        r'aNullableDateTime': _i3.Serializers.instance
            .serialize<DateTime?>($value.aNullableDateTime),
      },
      deserialize: ($serialized) {
        return _i4.HttpHeaderParams(
          aString: ($serialized[r'aString'] as String),
          anInt: ($serialized[r'anInt'] as num).toInt(),
          aDouble: ($serialized[r'aDouble'] as num).toDouble(),
          aNum: ($serialized[r'aNum'] as num),
          aBool: ($serialized[r'aBool'] as bool),
          aDateTime: _i3.Serializers.instance
              .deserialize<DateTime>($serialized[r'aDateTime']),
          aNullableString: ($serialized[r'aNullableString'] as String?),
          aNullableInt: ($serialized[r'aNullableInt'] as num?)?.toInt(),
          aNullableDouble:
              ($serialized[r'aNullableDouble'] as num?)?.toDouble(),
          aNullableNum: ($serialized[r'aNullableNum'] as num?),
          aNullableBool: ($serialized[r'aNullableBool'] as bool?),
          aNullableDateTime: _i3.Serializers.instance
              .deserialize<DateTime?>($serialized[r'aNullableDateTime']),
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
  await Future.wait(eagerError: true, [
    for (var i = 0; i < _i7.Platform.numberOfProcessors; i++)
      _i8.Isolate.run(start),
  ]);
}

Future<void> start() async {
  await _i1.serve(targets: {'/': HeadersTarget()});
}

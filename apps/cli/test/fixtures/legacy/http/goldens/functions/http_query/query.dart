// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/http_header_query.dart' as _i4;
import 'package:celest_backend/src/functions/http_query.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i7;

final class QueryTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'query';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i2.query(
        queryParameters['aString']!.first,
        int.parse(queryParameters['anInt']!.first),
        double.parse(queryParameters['aDouble']!.first),
        num.parse(queryParameters['aNum']!.first),
        bool.parse(queryParameters['aBool']!.first),
        DateTime.parse(queryParameters['aDateTime']!.first),
        queryParameters['aNullableString'] == null
            ? null
            : queryParameters['aNullableString']!.first,
        queryParameters['aNullableInt'] == null
            ? null
            : int.parse(queryParameters['aNullableInt']!.first),
        queryParameters['aNullableDouble'] == null
            ? null
            : double.parse(queryParameters['aNullableDouble']!.first),
        queryParameters['aNullableNum'] == null
            ? null
            : num.parse(queryParameters['aNullableNum']!.first),
        queryParameters['aNullableBool'] == null
            ? null
            : bool.parse(queryParameters['aNullableBool']!.first),
        queryParameters['aNullableDateTime'] == null
            ? null
            : DateTime.parse(queryParameters['aNullableDateTime']!.first),
        queryParameters['aListOfString']!.map((String el) => el).toList(),
        queryParameters['aListOfInt']!
            .map((String el) => int.parse(el))
            .toList(),
        queryParameters['aListOfDouble']!
            .map((String el) => double.parse(el))
            .toList(),
        queryParameters['aListOfNum']!
            .map((String el) => num.parse(el))
            .toList(),
        queryParameters['aListOfBool']!
            .map((String el) => bool.parse(el))
            .toList(),
        queryParameters['aListOfDateTime']!
            .map((String el) => DateTime.parse(el))
            .toList(),
        queryParameters['aNullableListOfString']
            ?.map((String el) => el)
            .toList(),
        queryParameters['aNullableListOfInt']
            ?.map((String el) => int.parse(el))
            .toList(),
        queryParameters['aNullableListOfDouble']
            ?.map((String el) => double.parse(el))
            .toList(),
        queryParameters['aNullableListOfNum']
            ?.map((String el) => num.parse(el))
            .toList(),
        queryParameters['aNullableListOfBool']
            ?.map((String el) => bool.parse(el))
            .toList(),
        queryParameters['aNullableListOfDateTime']
            ?.map((String el) => DateTime.parse(el))
            .toList(),
      );
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.HttpQueryParams>(response)
        }
      );
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.HttpQueryParams, Map<String, Object?>>(
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
        r'aListOfString': $value.aListOfString,
        r'aListOfInt': $value.aListOfInt,
        r'aListOfDouble': $value.aListOfDouble,
        r'aListOfNum': $value.aListOfNum,
        r'aListOfBool': $value.aListOfBool,
        r'aListOfDateTime': $value.aListOfDateTime
            .map((el) => _i3.Serializers.instance.serialize<DateTime>(el))
            .toList(),
        r'aNullableListOfString': $value.aNullableListOfString,
        r'aNullableListOfInt': $value.aNullableListOfInt,
        r'aNullableListOfDouble': $value.aNullableListOfDouble,
        r'aNullableListOfNum': $value.aNullableListOfNum,
        r'aNullableListOfBool': $value.aNullableListOfBool,
        r'aNullableListOfDateTime': $value.aNullableListOfDateTime
            ?.map((el) => _i3.Serializers.instance.serialize<DateTime>(el))
            .toList(),
      },
      deserialize: ($serialized) {
        return _i4.HttpQueryParams(
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
          aListOfString: ($serialized[r'aListOfString'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList(),
          aListOfInt: ($serialized[r'aListOfInt'] as Iterable<Object?>)
              .map((el) => (el as num).toInt())
              .toList(),
          aListOfDouble: ($serialized[r'aListOfDouble'] as Iterable<Object?>)
              .map((el) => (el as num).toDouble())
              .toList(),
          aListOfNum: ($serialized[r'aListOfNum'] as Iterable<Object?>)
              .map((el) => (el as num))
              .toList(),
          aListOfBool: ($serialized[r'aListOfBool'] as Iterable<Object?>)
              .map((el) => (el as bool))
              .toList(),
          aListOfDateTime: ($serialized[r'aListOfDateTime']
                  as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<DateTime>(el))
              .toList(),
          aNullableListOfString:
              ($serialized[r'aNullableListOfString'] as Iterable<Object?>?)
                  ?.map((el) => (el as String))
                  .toList(),
          aNullableListOfInt:
              ($serialized[r'aNullableListOfInt'] as Iterable<Object?>?)
                  ?.map((el) => (el as num).toInt())
                  .toList(),
          aNullableListOfDouble:
              ($serialized[r'aNullableListOfDouble'] as Iterable<Object?>?)
                  ?.map((el) => (el as num).toDouble())
                  .toList(),
          aNullableListOfNum:
              ($serialized[r'aNullableListOfNum'] as Iterable<Object?>?)
                  ?.map((el) => (el as num))
                  .toList(),
          aNullableListOfBool:
              ($serialized[r'aNullableListOfBool'] as Iterable<Object?>?)
                  ?.map((el) => (el as bool))
                  .toList(),
          aNullableListOfDateTime: ($serialized[r'aNullableListOfDateTime']
                  as Iterable<Object?>?)
              ?.map((el) => _i3.Serializers.instance.deserialize<DateTime>(el))
              .toList(),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i7.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i3.Serializers.instance.serialize<_i7.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i7.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i7.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i7.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': QueryTarget()});
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i8;
import 'dart:typed_data' as _i5;

import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/parameter_types.dart' as _i4;
import 'package:celest_backend/src/functions/parameter_types.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i9;
import 'package:celest_core/src/serialization/json_value.dart' as _i10;

final class SimpleOptionalTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'simpleOptional';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      await _i2.simpleOptional(
        (request[r'aString'] as String?),
        (request[r'anInt'] as num?)?.toInt(),
        (request[r'aDouble'] as num?)?.toDouble(),
        (request[r'aBool'] as bool?),
        _i3.Serializers.instance.deserialize<_i4.MyEnum?>(request[r'anEnum']),
        (request[r'aNull'] as Null),
        _i3.Serializers.instance.deserialize<BigInt?>(request[r'aBigInt']),
        _i3.Serializers.instance.deserialize<DateTime?>(request[r'aDateTime']),
        _i3.Serializers.instance.deserialize<Duration?>(request[r'aDuration']),
        _i3.Serializers.instance.deserialize<RegExp?>(request[r'aRegExp']),
        _i3.Serializers.instance
            .deserialize<StackTrace?>(request[r'aStackTrace']),
        _i3.Serializers.instance.deserialize<Uri?>(request[r'aUri']),
        _i3.Serializers.instance.deserialize<UriData?>(request[r'aUriData']),
        _i3.Serializers.instance
            .deserialize<_i5.Uint8List?>(request[r'aUint8List']),
        (request[r'anIterableOfString'] as Iterable<Object?>?)
            ?.map((el) => (el as String))
            .toList(),
        (request[r'anIterableOfUint8List'] as Iterable<Object?>?)
            ?.map(
                (el) => _i3.Serializers.instance.deserialize<_i5.Uint8List>(el))
            .toList(),
        (request[r'aListOfString'] as Iterable<Object?>?)
            ?.map((el) => (el as String))
            .toList(),
        (request[r'aListOfInt'] as Iterable<Object?>?)
            ?.map((el) => (el as num).toInt())
            .toList(),
        (request[r'aListOfDouble'] as Iterable<Object?>?)
            ?.map((el) => (el as num).toDouble())
            .toList(),
        (request[r'aListOfBool'] as Iterable<Object?>?)
            ?.map((el) => (el as bool))
            .toList(),
        (request[r'aListOfEnum'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<_i4.MyEnum>(el))
            .toList(),
        (request[r'aListOfNull'] as Iterable<Object?>?)
            ?.map((el) => (el as Null))
            .toList(),
        (request[r'aListOfBigInt'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<BigInt>(el))
            .toList(),
        (request[r'aListOfDateTime'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<DateTime>(el))
            .toList(),
        (request[r'aListOfDuration'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<Duration>(el))
            .toList(),
        (request[r'aListOfRegExp'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<RegExp>(el))
            .toList(),
        (request[r'aListOfStackTrace'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<StackTrace>(el))
            .toList(),
        (request[r'aListOfUri'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<Uri>(el))
            .toList(),
        (request[r'aListOfUriData'] as Iterable<Object?>?)
            ?.map((el) => _i3.Serializers.instance.deserialize<UriData>(el))
            .toList(),
        (request[r'aListOfUint8List'] as Iterable<Object?>?)
            ?.map(
                (el) => _i3.Serializers.instance.deserialize<_i5.Uint8List>(el))
            .toList(),
        (request[r'aMapOfString'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as String),
            )),
        (request[r'aMapOfInt'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as num).toInt(),
            )),
        (request[r'aMapOfDouble'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as num).toDouble(),
            )),
        (request[r'aMapOfBool'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as bool),
            )),
        (request[r'aMapOfEnum'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<_i4.MyEnum>(value),
            )),
        (request[r'aMapOfNull'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as Null),
            )),
        (request[r'aMapOfBigInt'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<BigInt>(value),
            )),
        (request[r'aMapOfDateTime'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<DateTime>(value),
            )),
        (request[r'aMapOfDuration'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<Duration>(value),
            )),
        (request[r'aMapOfRegExp'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<RegExp>(value),
            )),
        (request[r'aMapOfStackTrace'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<StackTrace>(value),
            )),
        (request[r'aMapOfUri'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<Uri>(value),
            )),
        (request[r'aMapOfUriData'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<UriData>(value),
            )),
        (request[r'aMapOfUint8List'] as Map<String, Object?>?)?.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.deserialize<_i5.Uint8List>(value),
            )),
      );
      return (statusCode: 200, body: {'response': null});
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
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
    } on AssertionError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.AssertionError',
        'details': _i3.Serializers.instance.serialize<AssertionError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.AsyncError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.AsyncError',
        'details': _i3.Serializers.instance.serialize<_i7.AsyncError>(e),
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
    } on ConcurrentModificationError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ConcurrentModificationError',
        'details':
            _i3.Serializers.instance.serialize<ConcurrentModificationError>(e),
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
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
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
    } on IndexError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IndexError',
        'details': _i3.Serializers.instance.serialize<IndexError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on IntegerDivisionByZeroException catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'details': _i3.Serializers.instance
            .serialize<IntegerDivisionByZeroException>(e),
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
    } on _i8.JsonUnsupportedObjectError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'details': _i3.Serializers.instance
            .serialize<_i8.JsonUnsupportedObjectError>(e),
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
    } on OutOfMemoryError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.OutOfMemoryError',
        'details': _i3.Serializers.instance.serialize<OutOfMemoryError>(e),
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
    } on _i6.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on RangeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.RangeError',
        'details': _i3.Serializers.instance.serialize<RangeError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on ArgumentError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.ArgumentError',
        'details': _i3.Serializers.instance.serialize<ArgumentError>(e),
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
    } on _i9.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
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
    } on FormatException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.FormatException',
        'details': _i3.Serializers.instance.serialize<FormatException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StackOverflowError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StackOverflowError',
        'details': _i3.Serializers.instance.serialize<StackOverflowError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on StateError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.StateError',
        'details': _i3.Serializers.instance.serialize<StateError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.TimeoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.TimeoutException',
        'details': _i3.Serializers.instance.serialize<_i7.TimeoutException>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on TypeError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.TypeError',
        'details': _i3.Serializers.instance.serialize<TypeError>(e),
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
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
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
    } on UnimplementedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnimplementedError',
        'details': _i3.Serializers.instance.serialize<UnimplementedError>(e),
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
    } on _i6.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on UnsupportedError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.UnsupportedError',
        'details': _i3.Serializers.instance.serialize<UnsupportedError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on Error catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.core.Error',
        'details': _i3.Serializers.instance.serialize<Error>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.AsyncError, Map<String, Object?>>(
      serialize: ($value) => {
        r'error': $value.error,
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i7.AsyncError(
          $serialized[r'error']!,
          _i3.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'duration':
            _i3.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i7.TimeoutException(
          ($serialized[r'message'] as String?),
          _i3.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i8.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => {
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
      },
      deserialize: ($serialized) {
        return _i8.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<ArgumentError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'invalidValue': $value.invalidValue,
        r'name': $value.name,
        r'message': $value.message,
      },
      deserialize: ($serialized) {
        return ArgumentError(
          $serialized?[r'message'],
          ($serialized?[r'name'] as String?),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => {r'modifiedObject': $value.modifiedObject},
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => {
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<FormatException, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'source': $value.source,
        r'offset': $value.offset,
      },
      deserialize: ($serialized) {
        return FormatException(
          (($serialized?[r'message'] as String?)) ?? '',
          $serialized?[r'source'],
          ($serialized?[r'offset'] as num?)?.toInt(),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<IndexError, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'message': $value.message,
        r'indexable': $value.indexable,
        r'length': $value.length,
        r'invalidValue': $value.invalidValue,
        r'start': $value.start,
        r'end': $value.end,
      },
      deserialize: ($serialized) {
        return IndexError(
          ($serialized[r'invalidValue'] as num).toInt(),
          $serialized[r'indexable'],
          ($serialized[r'name'] as String?),
          ($serialized[r'message'] as String?),
          ($serialized[r'length'] as num?)?.toInt(),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<RangeError, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'message': $value.message,
        r'start': $value.start,
        r'end': $value.end,
        r'invalidValue': $value.invalidValue,
      },
      deserialize: ($serialized) {
        return RangeError($serialized[r'message']);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.MyEnum, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.MyEnum.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
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
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i6.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i9.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i9.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i10.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i10.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
    );
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': SimpleOptionalTarget()});
}

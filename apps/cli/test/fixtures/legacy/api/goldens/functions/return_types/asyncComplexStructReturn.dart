// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i7;
import 'dart:typed_data' as _i9;

import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/parameter_types.dart' as _i4;
import 'package:celest_backend/src/functions/return_types.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i5;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i8;
import 'package:celest_core/src/serialization/json_value.dart' as _i10;

final class AsyncComplexStructReturnTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'asyncComplexStructReturn';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = await _i2.asyncComplexStructReturn();
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.ComplexStruct>(response)
        }
      );
    } on _i5.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.AlreadyExistsException catch (e) {
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
    } on _i6.AsyncError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.AsyncError',
        'details': _i3.Serializers.instance.serialize<_i6.AsyncError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CancelledException catch (e) {
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
    } on _i5.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.FailedPreconditionException catch (e) {
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
    } on _i5.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i7.JsonUnsupportedObjectError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'details': _i3.Serializers.instance
            .serialize<_i7.JsonUnsupportedObjectError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.NotFoundException catch (e) {
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
    } on _i5.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.PermissionDeniedException catch (e) {
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
    } on _i5.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.BadRequestException catch (e) {
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
    } on _i6.TimeoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.TimeoutException',
        'details': _i3.Serializers.instance.serialize<_i6.TimeoutException>(e),
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
    } on _i5.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.UnimplementedError catch (e) {
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
    } on _i5.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i5.CloudException catch (e) {
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
        .put(_i3.Serializer.define<_i6.AsyncError, Map<String, Object?>>(
      serialize: ($value) => {
        r'error': $value.error,
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i6.AsyncError(
          $serialized[r'error']!,
          _i3.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'duration':
            _i3.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i6.TimeoutException(
          ($serialized[r'message'] as String?),
          _i3.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i7.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => {
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
      },
      deserialize: ($serialized) {
        return _i7.JsonUnsupportedObjectError(
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.ComplexStruct, Map<String, Object?>>(
      serialize: ($value) => {
        r'aBigInt': _i3.Serializers.instance.serialize<BigInt>($value.aBigInt),
        r'aBool': $value.aBool,
        r'aDateTime':
            _i3.Serializers.instance.serialize<DateTime>($value.aDateTime),
        r'aDouble': $value.aDouble,
        r'aDuration':
            _i3.Serializers.instance.serialize<Duration>($value.aDuration),
        r'aListOfBigInt': $value.aListOfBigInt
            .map((el) => _i3.Serializers.instance.serialize<BigInt>(el))
            .toList(),
        r'aListOfBool': $value.aListOfBool,
        r'aListOfDateTime': $value.aListOfDateTime
            .map((el) => _i3.Serializers.instance.serialize<DateTime>(el))
            .toList(),
        r'aListOfDouble': $value.aListOfDouble,
        r'aListOfDuration': $value.aListOfDuration
            .map((el) => _i3.Serializers.instance.serialize<Duration>(el))
            .toList(),
        r'aListOfEnum': $value.aListOfEnum
            .map((el) => _i3.Serializers.instance.serialize<_i4.MyEnum>(el))
            .toList(),
        r'aListOfInt': $value.aListOfInt,
        r'aListOfNull': $value.aListOfNull,
        r'aListOfRegExp': $value.aListOfRegExp
            .map((el) => _i3.Serializers.instance.serialize<RegExp>(el))
            .toList(),
        r'aListOfSimpleClass': $value.aListOfSimpleClass
            .map(
                (el) => _i3.Serializers.instance.serialize<_i4.SimpleClass>(el))
            .toList(),
        r'aListOfSimpleStruct': $value.aListOfSimpleStruct
            .map((el) =>
                _i3.Serializers.instance.serialize<_i4.SimpleStruct>(el))
            .toList(),
        r'aListOfStackTrace': $value.aListOfStackTrace
            .map((el) => _i3.Serializers.instance.serialize<StackTrace>(el))
            .toList(),
        r'aListOfString': $value.aListOfString,
        r'aListOfUint8List': $value.aListOfUint8List
            .map((el) => _i3.Serializers.instance.serialize<_i9.Uint8List>(el))
            .toList(),
        r'aListOfUri': $value.aListOfUri
            .map((el) => _i3.Serializers.instance.serialize<Uri>(el))
            .toList(),
        r'aListOfUriData': $value.aListOfUriData
            .map((el) => _i3.Serializers.instance.serialize<UriData>(el))
            .toList(),
        r'aMapOfBigInt': $value.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<BigInt>(value),
            )),
        r'aMapOfBool': $value.aMapOfBool,
        r'aMapOfDateTime': $value.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<DateTime>(value),
            )),
        r'aMapOfDouble': $value.aMapOfDouble,
        r'aMapOfDuration': $value.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<Duration>(value),
            )),
        r'aMapOfEnum': $value.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i4.MyEnum>(value),
            )),
        r'aMapOfInt': $value.aMapOfInt,
        r'aMapOfNull': $value.aMapOfNull,
        r'aMapOfRegExp': $value.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<RegExp>(value),
            )),
        r'aMapOfSimpleClass': $value.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i4.SimpleClass>(value),
            )),
        r'aMapOfSimpleStruct': $value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i4.SimpleStruct>(value),
            )),
        r'aMapOfStackTrace': $value.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<StackTrace>(value),
            )),
        r'aMapOfString': $value.aMapOfString,
        r'aMapOfUint8List': $value.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<_i9.Uint8List>(value),
            )),
        r'aMapOfUri': $value.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<Uri>(value),
            )),
        r'aMapOfUriData': $value.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.Serializers.instance.serialize<UriData>(value),
            )),
        r'aNull': $value.aNull,
        r'aRegExp': _i3.Serializers.instance.serialize<RegExp>($value.aRegExp),
        r'aSimpleClass': _i3.Serializers.instance
            .serialize<_i4.SimpleClass>($value.aSimpleClass),
        r'aSimpleStruct': _i3.Serializers.instance
            .serialize<_i4.SimpleStruct>($value.aSimpleStruct),
        r'aStackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.aStackTrace),
        r'aString': $value.aString,
        r'aUint8List': _i3.Serializers.instance
            .serialize<_i9.Uint8List>($value.aUint8List),
        r'aUri': _i3.Serializers.instance.serialize<Uri>($value.aUri),
        r'aUriData':
            _i3.Serializers.instance.serialize<UriData>($value.aUriData),
        r'anEnum':
            _i3.Serializers.instance.serialize<_i4.MyEnum>($value.anEnum),
        r'anInt': $value.anInt,
        r'anIterableOfSimpleClass': $value.anIterableOfSimpleClass
            .map(
                (el) => _i3.Serializers.instance.serialize<_i4.SimpleClass>(el))
            .toList(),
      },
      deserialize: ($serialized) {
        return (
          aBigInt: _i3.Serializers.instance
              .deserialize<BigInt>($serialized[r'aBigInt']),
          aBool: ($serialized[r'aBool'] as bool),
          aDateTime: _i3.Serializers.instance
              .deserialize<DateTime>($serialized[r'aDateTime']),
          aDouble: ($serialized[r'aDouble'] as num).toDouble(),
          aDuration: _i3.Serializers.instance
              .deserialize<Duration>($serialized[r'aDuration']),
          aListOfBigInt: ($serialized[r'aListOfBigInt'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<BigInt>(el))
              .toList(),
          aListOfBool: ($serialized[r'aListOfBool'] as Iterable<Object?>)
              .map((el) => (el as bool))
              .toList(),
          aListOfDateTime: ($serialized[r'aListOfDateTime']
                  as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<DateTime>(el))
              .toList(),
          aListOfDouble: ($serialized[r'aListOfDouble'] as Iterable<Object?>)
              .map((el) => (el as num).toDouble())
              .toList(),
          aListOfDuration: ($serialized[r'aListOfDuration']
                  as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<Duration>(el))
              .toList(),
          aListOfEnum: ($serialized[r'aListOfEnum'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<_i4.MyEnum>(el))
              .toList(),
          aListOfInt: ($serialized[r'aListOfInt'] as Iterable<Object?>)
              .map((el) => (el as num).toInt())
              .toList(),
          aListOfNull: ($serialized[r'aListOfNull'] as Iterable<Object?>)
              .map((el) => (el as Null))
              .toList(),
          aListOfRegExp: ($serialized[r'aListOfRegExp'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<RegExp>(el))
              .toList(),
          aListOfSimpleClass:
              ($serialized[r'aListOfSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.instance.deserialize<_i4.SimpleClass>(el))
                  .toList(),
          aListOfSimpleStruct: ($serialized[r'aListOfSimpleStruct']
                  as Iterable<Object?>)
              .map((el) =>
                  _i3.Serializers.instance.deserialize<_i4.SimpleStruct>(el))
              .toList(),
          aListOfStackTrace: ($serialized[r'aListOfStackTrace']
                  as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<StackTrace>(el))
              .toList(),
          aListOfString: ($serialized[r'aListOfString'] as Iterable<Object?>)
              .map((el) => (el as String))
              .toList(),
          aListOfUint8List:
              ($serialized[r'aListOfUint8List'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.instance.deserialize<_i9.Uint8List>(el))
                  .toList(),
          aListOfUri: ($serialized[r'aListOfUri'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<Uri>(el))
              .toList(),
          aListOfUriData: ($serialized[r'aListOfUriData'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<UriData>(el))
              .toList(),
          aMapOfBigInt:
              ($serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<BigInt>(value),
                  )),
          aMapOfBool: ($serialized[r'aMapOfBool'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as bool),
              )),
          aMapOfDateTime:
              ($serialized[r'aMapOfDateTime'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<DateTime>(value),
                  )),
          aMapOfDouble:
              ($serialized[r'aMapOfDouble'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    (value as num).toDouble(),
                  )),
          aMapOfDuration:
              ($serialized[r'aMapOfDuration'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<Duration>(value),
                  )),
          aMapOfEnum: ($serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _i3.Serializers.instance.deserialize<_i4.MyEnum>(value),
              )),
          aMapOfInt: ($serialized[r'aMapOfInt'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as num).toInt(),
              )),
          aMapOfNull: ($serialized[r'aMapOfNull'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as Null),
              )),
          aMapOfRegExp:
              ($serialized[r'aMapOfRegExp'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<RegExp>(value),
                  )),
          aMapOfSimpleClass:
              ($serialized[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance
                        .deserialize<_i4.SimpleClass>(value),
                  )),
          aMapOfSimpleStruct:
              ($serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance
                        .deserialize<_i4.SimpleStruct>(value),
                  )),
          aMapOfStackTrace:
              ($serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<StackTrace>(value),
                  )),
          aMapOfString:
              ($serialized[r'aMapOfString'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    (value as String),
                  )),
          aMapOfUint8List:
              ($serialized[r'aMapOfUint8List'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<_i9.Uint8List>(value),
                  )),
          aMapOfUri: ($serialized[r'aMapOfUri'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _i3.Serializers.instance.deserialize<Uri>(value),
              )),
          aMapOfUriData:
              ($serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
            key,
            value,
          ) =>
                  MapEntry(
                    key,
                    _i3.Serializers.instance.deserialize<UriData>(value),
                  )),
          aNull: ($serialized[r'aNull'] as Null),
          aRegExp: _i3.Serializers.instance
              .deserialize<RegExp>($serialized[r'aRegExp']),
          aSimpleClass: _i3.Serializers.instance
              .deserialize<_i4.SimpleClass>($serialized[r'aSimpleClass']),
          aSimpleStruct: _i3.Serializers.instance
              .deserialize<_i4.SimpleStruct>($serialized[r'aSimpleStruct']),
          aStackTrace: _i3.Serializers.instance
              .deserialize<StackTrace>($serialized[r'aStackTrace']),
          aString: ($serialized[r'aString'] as String),
          aUint8List: _i3.Serializers.instance
              .deserialize<_i9.Uint8List>($serialized[r'aUint8List']),
          aUri: _i3.Serializers.instance.deserialize<Uri>($serialized[r'aUri']),
          aUriData: _i3.Serializers.instance
              .deserialize<UriData>($serialized[r'aUriData']),
          anEnum: _i3.Serializers.instance
              .deserialize<_i4.MyEnum>($serialized[r'anEnum']),
          anInt: ($serialized[r'anInt'] as num).toInt(),
          anIterableOfSimpleClass:
              ($serialized[r'anIterableOfSimpleClass'] as Iterable<Object?>)
                  .map((el) =>
                      _i3.Serializers.instance.deserialize<_i4.SimpleClass>(el))
                  .toList()
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.MyEnum, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.MyEnum.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.SimpleClass, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.SimpleClass.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.SimpleStruct, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return ();
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i5.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i10.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i5.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i10.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i10.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.SerializationException, Map<String, Object?>>(
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
        return _i8.SerializationException(($serialized[r'message'] as String));
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
  await _i1.serve(targets: {'/': AsyncComplexStructReturnTarget()});
}

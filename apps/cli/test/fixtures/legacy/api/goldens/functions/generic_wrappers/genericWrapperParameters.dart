// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:convert' as _i10;

import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/generic_wrappers.dart' as _i7;
import 'package:celest_backend/models/parameter_types.dart' as _i5;
import 'package:celest_backend/src/functions/generic_wrappers.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i8;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i11;
import 'package:celest_core/src/serialization/json_value.dart' as _i12;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i4;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i6;

final class GenericWrapperParametersTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'genericWrapperParameters';

  @override
  String get method => 'POST';

  @override
  Future<_i1.CelestResponse> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i2.genericWrapperParameters(
        listOfString: _i3.Serializers.instance
            .deserialize<_i4.IList<String>>(request[r'listOfString']),
        listOfUri: _i3.Serializers.instance
            .deserialize<_i4.IList<Uri>>(request[r'listOfUri']),
        listOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i4.IList<_i5.SimpleClass>>(
                request[r'listOfSimpleClass']),
        listOfListOfString: _i3.Serializers.instance
            .deserialize<_i4.IList<_i4.IList<String>>>(
                request[r'listOfListOfString']),
        listOfListOfUri: _i3.Serializers.instance
            .deserialize<_i4.IList<_i4.IList<Uri>>>(
                request[r'listOfListOfUri']),
        listOfListOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i4.IList<_i4.IList<_i5.SimpleClass>>>(
                request[r'listOfListOfSimpleClass']),
        mapOfString: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, String>>(request[r'mapOfString']),
        mapOfUri: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, Uri>>(request[r'mapOfUri']),
        mapOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, _i5.SimpleClass>>(
                request[r'mapOfSimpleClass']),
        mapOfListOfString: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, _i4.IList<String>>>(
                request[r'mapOfListOfString']),
        mapOfListOfUri: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, _i4.IList<Uri>>>(
                request[r'mapOfListOfUri']),
        mapOfListOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, _i4.IList<_i5.SimpleClass>>>(
                request[r'mapOfListOfSimpleClass']),
        mapOfMapOfString: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, _i6.IMap<String, String>>>(
                request[r'mapOfMapOfString']),
        mapOfMapOfUri: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, _i6.IMap<String, Uri>>>(
                request[r'mapOfMapOfUri']),
        mapOfMapOfSimpleClass: _i3.Serializers.instance
            .deserialize<_i6.IMap<String, _i6.IMap<String, _i5.SimpleClass>>>(
                request[r'mapOfMapOfSimpleClass']),
      );
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i7.GenericWrappers>(response)
        }
      );
    } on _i8.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.AlreadyExistsException catch (e) {
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
    } on _i9.AsyncError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.AsyncError',
        'details': _i3.Serializers.instance.serialize<_i9.AsyncError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.CancelledException catch (e) {
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
    } on _i8.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.FailedPreconditionException catch (e) {
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
    } on _i8.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i10.JsonUnsupportedObjectError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'details': _i3.Serializers.instance
            .serialize<_i10.JsonUnsupportedObjectError>(e),
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.NotFoundException catch (e) {
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
    } on _i8.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.PermissionDeniedException catch (e) {
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
    } on _i8.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i11.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.BadRequestException catch (e) {
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
    } on _i9.TimeoutException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'code': 'dart.async.TimeoutException',
        'details': _i3.Serializers.instance.serialize<_i9.TimeoutException>(e),
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
    } on _i8.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.UnimplementedError catch (e) {
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
    } on _i8.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.v1.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i8.CloudException catch (e) {
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
        .put(_i3.Serializer.define<_i9.AsyncError, Map<String, Object?>>(
      serialize: ($value) => {
        r'error': $value.error,
        r'stackTrace':
            _i3.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i9.AsyncError(
          $serialized[r'error']!,
          _i3.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i9.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'duration':
            _i3.Serializers.instance.serialize<Duration?>($value.duration),
      },
      deserialize: ($serialized) {
        return _i9.TimeoutException(
          ($serialized[r'message'] as String?),
          _i3.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i10.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => {
        r'unsupportedObject': $value.unsupportedObject,
        r'cause': $value.cause,
        r'partialResult': $value.partialResult,
      },
      deserialize: ($serialized) {
        return _i10.JsonUnsupportedObjectError(
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
        .put(_i3.Serializer.define<_i7.GenericWrappers, Map<String, Object?>>(
      serialize: ($value) => {
        r'listOfString': _i3.Serializers.instance
            .serialize<_i4.IList<String>>($value.listOfString),
        r'listOfUri': _i3.Serializers.instance
            .serialize<_i4.IList<Uri>>($value.listOfUri),
        r'listOfSimpleClass': _i3.Serializers.instance
            .serialize<_i4.IList<_i5.SimpleClass>>($value.listOfSimpleClass),
        r'listOfListOfString': _i3.Serializers.instance
            .serialize<_i4.IList<_i4.IList<String>>>($value.listOfListOfString),
        r'listOfListOfUri': _i3.Serializers.instance
            .serialize<_i4.IList<_i4.IList<Uri>>>($value.listOfListOfUri),
        r'listOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i4.IList<_i4.IList<_i5.SimpleClass>>>(
                $value.listOfListOfSimpleClass),
        r'mapOfString': _i3.Serializers.instance
            .serialize<_i6.IMap<String, String>>($value.mapOfString),
        r'mapOfUri': _i3.Serializers.instance
            .serialize<_i6.IMap<String, Uri>>($value.mapOfUri),
        r'mapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i5.SimpleClass>>(
                $value.mapOfSimpleClass),
        r'mapOfListOfString': _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i4.IList<String>>>(
                $value.mapOfListOfString),
        r'mapOfListOfUri': _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i4.IList<Uri>>>($value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i4.IList<_i5.SimpleClass>>>(
                $value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i6.IMap<String, String>>>(
                $value.mapOfMapOfString),
        r'mapOfMapOfUri': _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i6.IMap<String, Uri>>>(
                $value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i6.IMap<String, _i5.SimpleClass>>>(
                $value.mapOfMapOfSimpleClass),
      },
      deserialize: ($serialized) {
        return _i7.GenericWrappers(
          listOfString: _i3.Serializers.instance
              .deserialize<_i4.IList<String>>($serialized[r'listOfString']),
          listOfUri: _i3.Serializers.instance
              .deserialize<_i4.IList<Uri>>($serialized[r'listOfUri']),
          listOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i4.IList<_i5.SimpleClass>>(
                  $serialized[r'listOfSimpleClass']),
          listOfListOfString: _i3.Serializers.instance
              .deserialize<_i4.IList<_i4.IList<String>>>(
                  $serialized[r'listOfListOfString']),
          listOfListOfUri: _i3.Serializers.instance
              .deserialize<_i4.IList<_i4.IList<Uri>>>(
                  $serialized[r'listOfListOfUri']),
          listOfListOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i4.IList<_i4.IList<_i5.SimpleClass>>>(
                  $serialized[r'listOfListOfSimpleClass']),
          mapOfString: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, String>>(
                  $serialized[r'mapOfString']),
          mapOfUri: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, Uri>>($serialized[r'mapOfUri']),
          mapOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i5.SimpleClass>>(
                  $serialized[r'mapOfSimpleClass']),
          mapOfListOfString: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i4.IList<String>>>(
                  $serialized[r'mapOfListOfString']),
          mapOfListOfUri: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i4.IList<Uri>>>(
                  $serialized[r'mapOfListOfUri']),
          mapOfListOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i4.IList<_i5.SimpleClass>>>(
                  $serialized[r'mapOfListOfSimpleClass']),
          mapOfMapOfString: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i6.IMap<String, String>>>(
                  $serialized[r'mapOfMapOfString']),
          mapOfMapOfUri: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i6.IMap<String, Uri>>>(
                  $serialized[r'mapOfMapOfUri']),
          mapOfMapOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i6.IMap<String, _i5.SimpleClass>>>(
                  $serialized[r'mapOfMapOfSimpleClass']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i5.SimpleClass, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i5.SimpleClass.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.AbortedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.CancelledException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.CloudException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.CloudException.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.DataLossError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i8.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i8.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i8.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i8.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.UnknownError, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i8.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i3.Serializers.instance.deserialize<_i12.JsonValue?>(
            $serialized[r'details'],
            const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i11.SerializationException, Map<String, Object?>>(
      serialize: ($value) => {
        r'message': $value.message,
        r'offset': $value.offset,
        r'source': $value.source,
        r'details': _i3.Serializers.instance.serialize<_i12.JsonValue?>(
          $value.details,
          const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
        ),
      },
      deserialize: ($serialized) {
        return _i11.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
      _i3.Serializer.define<_i12.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i12.JsonValue($serialized);
        },
      ),
      const _i3.TypeToken<_i12.JsonValue?>('JsonValue'),
    );
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.IList<Uri>, dynamic>(
      serialize: ($value) => $value
          .toJson((value) => _i3.Serializers.instance.serialize<Uri>(value)),
      deserialize: ($serialized) {
        return _i4.IList<Uri>.fromJson(
          $serialized,
          (value) => _i3.Serializers.instance.deserialize<Uri>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.IList<_i5.SimpleClass>, dynamic>(
      serialize: ($value) => $value.toJson((value) =>
          _i3.Serializers.instance.serialize<_i5.SimpleClass>(value)),
      deserialize: ($serialized) {
        return _i4.IList<_i5.SimpleClass>.fromJson(
          $serialized,
          (value) =>
              _i3.Serializers.instance.deserialize<_i5.SimpleClass>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.IList<_i4.IList<String>>, dynamic>(
      serialize: ($value) => $value.toJson((value) =>
          _i3.Serializers.instance.serialize<_i4.IList<String>>(value)),
      deserialize: ($serialized) {
        return _i4.IList<_i4.IList<String>>.fromJson(
          $serialized,
          (value) =>
              _i3.Serializers.instance.deserialize<_i4.IList<String>>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.IList<_i4.IList<Uri>>, dynamic>(
      serialize: ($value) => $value.toJson(
          (value) => _i3.Serializers.instance.serialize<_i4.IList<Uri>>(value)),
      deserialize: ($serialized) {
        return _i4.IList<_i4.IList<Uri>>.fromJson(
          $serialized,
          (value) =>
              _i3.Serializers.instance.deserialize<_i4.IList<Uri>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i4.IList<_i4.IList<_i5.SimpleClass>>, dynamic>(
      serialize: ($value) => $value.toJson((value) => _i3.Serializers.instance
          .serialize<_i4.IList<_i5.SimpleClass>>(value)),
      deserialize: ($serialized) {
        return _i4.IList<_i4.IList<_i5.SimpleClass>>.fromJson(
          $serialized,
          (value) => _i3.Serializers.instance
              .deserialize<_i4.IList<_i5.SimpleClass>>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.IList<String>, dynamic>(
      serialize: ($value) => $value.toJson((value) => value),
      deserialize: ($serialized) {
        return _i4.IList<String>.fromJson(
          $serialized,
          (value) => (value as String),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.IMap<String, String>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => value,
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, String>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => (value as String),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.IMap<String, Uri>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<Uri>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, Uri>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance.deserialize<Uri>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.IMap<String, _i5.SimpleClass>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i5.SimpleClass>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, _i5.SimpleClass>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i3.Serializers.instance.deserialize<_i5.SimpleClass>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.IMap<String, _i4.IList<String>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i4.IList<String>>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, _i4.IList<String>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i3.Serializers.instance.deserialize<_i4.IList<String>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.IMap<String, _i4.IList<Uri>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i4.IList<Uri>>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, _i4.IList<Uri>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i3.Serializers.instance.deserialize<_i4.IList<Uri>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.IMap<String, _i4.IList<_i5.SimpleClass>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i4.IList<_i5.SimpleClass>>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, _i4.IList<_i5.SimpleClass>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i4.IList<_i5.SimpleClass>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.IMap<String, _i6.IMap<String, String>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i6.IMap<String, String>>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, _i6.IMap<String, String>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i6.IMap<String, String>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.IMap<String, _i6.IMap<String, Uri>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i6.IMap<String, Uri>>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, _i6.IMap<String, Uri>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i6.IMap<String, Uri>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.IMap<String, _i6.IMap<String, _i5.SimpleClass>>,
        Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i6.IMap<String, _i5.SimpleClass>>(value),
      ),
      deserialize: ($serialized) {
        return _i6.IMap<String, _i6.IMap<String, _i5.SimpleClass>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i6.IMap<String, _i5.SimpleClass>>(value),
        );
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': GenericWrapperParametersTarget()});
}

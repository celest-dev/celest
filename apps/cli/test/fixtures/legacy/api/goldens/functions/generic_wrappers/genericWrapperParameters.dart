// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:convert' as _i12;

import 'package:celest/src/core/context.dart' as _i10;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/generic_wrappers.dart' as _i8;
import 'package:celest_backend/models/parameter_types.dart' as _i6;
import 'package:celest_backend/src/functions/generic_wrappers.dart' as _i3;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i9;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i13;
import 'package:celest_core/src/serialization/json_value.dart' as _i14;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i5;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i7;
import 'package:shelf/shelf.dart' as _i2;

final class GenericWrapperParametersTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'genericWrapperParameters';

  @override
  String get method => 'POST';

  @override
  Future<_i2.Response> handle(
    Map<String, Object?> request, {
    required Map<String, List<String>> headers,
    required Map<String, List<String>> queryParameters,
  }) async {
    try {
      final response = _i3.genericWrapperParameters(
        listOfString: _i4.Serializers.instance
            .deserialize<_i5.IList<String>>(request[r'listOfString']),
        listOfUri: _i4.Serializers.instance
            .deserialize<_i5.IList<Uri>>(request[r'listOfUri']),
        listOfSimpleClass: _i4.Serializers.instance
            .deserialize<_i5.IList<_i6.SimpleClass>>(
                request[r'listOfSimpleClass']),
        listOfListOfString: _i4.Serializers.instance
            .deserialize<_i5.IList<_i5.IList<String>>>(
                request[r'listOfListOfString']),
        listOfListOfUri: _i4.Serializers.instance
            .deserialize<_i5.IList<_i5.IList<Uri>>>(
                request[r'listOfListOfUri']),
        listOfListOfSimpleClass: _i4.Serializers.instance
            .deserialize<_i5.IList<_i5.IList<_i6.SimpleClass>>>(
                request[r'listOfListOfSimpleClass']),
        mapOfString: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, String>>(request[r'mapOfString']),
        mapOfUri: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, Uri>>(request[r'mapOfUri']),
        mapOfSimpleClass: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, _i6.SimpleClass>>(
                request[r'mapOfSimpleClass']),
        mapOfListOfString: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, _i5.IList<String>>>(
                request[r'mapOfListOfString']),
        mapOfListOfUri: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, _i5.IList<Uri>>>(
                request[r'mapOfListOfUri']),
        mapOfListOfSimpleClass: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>>(
                request[r'mapOfListOfSimpleClass']),
        mapOfMapOfString: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, _i7.IMap<String, String>>>(
                request[r'mapOfMapOfString']),
        mapOfMapOfUri: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, _i7.IMap<String, Uri>>>(
                request[r'mapOfMapOfUri']),
        mapOfMapOfSimpleClass: _i4.Serializers.instance
            .deserialize<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>>(
                request[r'mapOfMapOfSimpleClass']),
      );
      return _i2.Response(
        200,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode(
            _i4.Serializers.instance.serialize<_i8.GenericWrappers>(response)),
      );
    } on _i9.AbortedException catch (e, st) {
      const statusCode = 409;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.AbortedException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i9.AbortedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.AlreadyExistsException catch (e, st) {
      const statusCode = 409;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.AlreadyExistsException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.AlreadyExistsException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on AssertionError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.AssertionError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<AssertionError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i11.AsyncError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.AsyncError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i11.AsyncError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.CancelledException catch (e, st) {
      const statusCode = 499;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.CancelledException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.CancelledException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on ConcurrentModificationError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ConcurrentModificationError',
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<ConcurrentModificationError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.DataLossError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.DataLossError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i9.DataLossError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.DeadlineExceededError catch (e, st) {
      const statusCode = 504;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.DeadlineExceededError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.DeadlineExceededError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.FailedPreconditionException catch (e, st) {
      const statusCode = 412;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.FailedPreconditionException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance
          .serialize<_i9.FailedPreconditionException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on IndexError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.IndexError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<IndexError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on IntegerDivisionByZeroException catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.IntegerDivisionByZeroException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<IntegerDivisionByZeroException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.InternalServerError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.InternalServerError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.InternalServerError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i12.JsonUnsupportedObjectError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.convert.JsonUnsupportedObjectError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance
          .serialize<_i12.JsonUnsupportedObjectError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.NotFoundException catch (e, st) {
      const statusCode = 404;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.NotFoundException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.NotFoundException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on OutOfMemoryError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.OutOfMemoryError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<OutOfMemoryError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.OutOfRangeException catch (e, st) {
      const statusCode = 416;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.OutOfRangeException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.OutOfRangeException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.PermissionDeniedException catch (e, st) {
      const statusCode = 403;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.PermissionDeniedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.PermissionDeniedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on RangeError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.RangeError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<RangeError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on ArgumentError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.ArgumentError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<ArgumentError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.ResourceExhaustedException catch (e, st) {
      const statusCode = 429;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.ResourceExhaustedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.ResourceExhaustedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i13.SerializationException catch (e, st) {
      const statusCode = 400;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.SerializationException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i13.SerializationException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.BadRequestException catch (e, st) {
      const statusCode = 400;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.BadRequestException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.BadRequestException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on FormatException catch (e, st) {
      const statusCode = 400;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.FormatException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<FormatException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on StackOverflowError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StackOverflowError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<StackOverflowError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on StateError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.StateError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<StateError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i11.TimeoutException catch (e, st) {
      const statusCode = 400;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.async.TimeoutException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i11.TimeoutException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on TypeError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.TypeError',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<TypeError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.UnauthorizedException catch (e, st) {
      const statusCode = 401;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnauthorizedException',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.UnauthorizedException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.UnavailableError catch (e, st) {
      const statusCode = 503;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnavailableError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i9.UnavailableError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.UnimplementedError catch (e, st) {
      const statusCode = 501;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnimplementedError',
        'message': e.message,
        'status': statusCode,
      };
      final error =
          _i4.Serializers.instance.serialize<_i9.UnimplementedError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on UnimplementedError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnimplementedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<UnimplementedError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.UnknownError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.UnknownError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i9.UnknownError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on _i9.CloudException catch (e, st) {
      const statusCode = 400;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'celest.core.v1.CloudException',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<_i9.CloudException>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on UnsupportedError catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.message,
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.UnsupportedError',
        'message': e.message,
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<UnsupportedError>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    } on Error catch (e, st) {
      const statusCode = 500;
      _i10.context.logger.severe(
        e.toString(),
        e,
        st,
      );
      final meta = {
        'code': 'dart.core.Error',
        'status': statusCode,
      };
      final error = _i4.Serializers.instance.serialize<Error>(e);
      return _i2.Response(
        statusCode,
        headers: const {'Content-Type': 'application/json'},
        body: _i4.JsonUtf8.encode({
          '@error': meta,
          ...error is Map<String, Object?> ? error : {'@': error},
        }),
      );
    }
  }

  @override
  void init() {
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i11.AsyncError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'error': $value.error,
        r'stackTrace':
            _i4.Serializers.instance.serialize<StackTrace>($value.stackTrace),
      },
      deserialize: ($serialized) {
        return _i11.AsyncError(
          $serialized[r'error']!,
          _i4.Serializers.instance
              .deserialize<StackTrace?>($serialized[r'stackTrace']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i11.TimeoutException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message,
        if (_i4.Serializers.instance.serialize<Duration?>($value.duration)
            case final duration?)
          r'duration': duration,
      },
      deserialize: ($serialized) {
        return _i11.TimeoutException(
          ($serialized[r'message'] as String?),
          _i4.Serializers.instance
              .deserialize<Duration?>($serialized[r'duration']),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i12.JsonUnsupportedObjectError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.unsupportedObject case final unsupportedObject?)
          r'unsupportedObject': unsupportedObject,
        if ($value.cause case final cause?) r'cause': cause,
        if ($value.partialResult case final partialResult?)
          r'partialResult': partialResult,
      },
      deserialize: ($serialized) {
        return _i12.JsonUnsupportedObjectError(
          $serialized[r'unsupportedObject'],
          cause: $serialized[r'cause'],
          partialResult: ($serialized[r'partialResult'] as String?),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<ArgumentError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'invalidValue': $value.invalidValue,
        if ($value.name case final name?) r'name': name,
        r'message': $value.message,
      },
      deserialize: ($serialized) {
        return ArgumentError(
          $serialized?[r'message'],
          ($serialized?[r'name'] as String?),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<AssertionError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return AssertionError($serialized?[r'message']);
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        ConcurrentModificationError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.modifiedObject case final modifiedObject?)
          r'modifiedObject': modifiedObject
      },
      deserialize: ($serialized) {
        return ConcurrentModificationError($serialized?[r'modifiedObject']);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<Error, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if (_i4.Serializers.instance.serialize<StackTrace?>($value.stackTrace)
            case final stackTrace?)
          r'stackTrace': stackTrace
      },
      deserialize: ($serialized) {
        return Error();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<FormatException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        r'source': $value.source,
        if ($value.offset case final offset?) r'offset': offset,
      },
      deserialize: ($serialized) {
        return FormatException(
          (($serialized?[r'message'] as String?)) ?? '',
          $serialized?[r'source'],
          ($serialized?[r'offset'] as num?)?.toInt(),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<IndexError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.name case final name?) r'name': name,
        r'message': $value.message,
        if ($value.indexable case final indexable?) r'indexable': indexable,
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
    _i4.Serializers.instance.put(_i4.Serializer.define<
        IntegerDivisionByZeroException, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return IntegerDivisionByZeroException();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return OutOfMemoryError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<RangeError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.name case final name?) r'name': name,
        r'message': $value.message,
        if ($value.start case final start?) r'start': start,
        if ($value.end case final end?) r'end': end,
        if ($value.invalidValue case final invalidValue?)
          r'invalidValue': invalidValue,
      },
      deserialize: ($serialized) {
        return RangeError($serialized[r'message']);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StackOverflowError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return StackOverflowError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<StateError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{r'message': $value.message},
      deserialize: ($serialized) {
        return StateError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<TypeError, Map<String, Object?>?>(
      serialize: ($value) => const <String, Object?>{},
      deserialize: ($serialized) {
        return TypeError();
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<UnsupportedError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        if ($value.message case final message?) r'message': message
      },
      deserialize: ($serialized) {
        return UnsupportedError(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i8.GenericWrappers, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'listOfString': _i4.Serializers.instance
            .serialize<_i5.IList<String>>($value.listOfString),
        r'listOfUri': _i4.Serializers.instance
            .serialize<_i5.IList<Uri>>($value.listOfUri),
        r'listOfSimpleClass': _i4.Serializers.instance
            .serialize<_i5.IList<_i6.SimpleClass>>($value.listOfSimpleClass),
        r'listOfListOfString': _i4.Serializers.instance
            .serialize<_i5.IList<_i5.IList<String>>>($value.listOfListOfString),
        r'listOfListOfUri': _i4.Serializers.instance
            .serialize<_i5.IList<_i5.IList<Uri>>>($value.listOfListOfUri),
        r'listOfListOfSimpleClass': _i4.Serializers.instance
            .serialize<_i5.IList<_i5.IList<_i6.SimpleClass>>>(
                $value.listOfListOfSimpleClass),
        r'mapOfString': _i4.Serializers.instance
            .serialize<_i7.IMap<String, String>>($value.mapOfString),
        r'mapOfUri': _i4.Serializers.instance
            .serialize<_i7.IMap<String, Uri>>($value.mapOfUri),
        r'mapOfSimpleClass': _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i6.SimpleClass>>(
                $value.mapOfSimpleClass),
        r'mapOfListOfString': _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i5.IList<String>>>(
                $value.mapOfListOfString),
        r'mapOfListOfUri': _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i5.IList<Uri>>>($value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>>(
                $value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i7.IMap<String, String>>>(
                $value.mapOfMapOfString),
        r'mapOfMapOfUri': _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i7.IMap<String, Uri>>>(
                $value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>>(
                $value.mapOfMapOfSimpleClass),
      },
      deserialize: ($serialized) {
        return _i8.GenericWrappers(
          listOfString: _i4.Serializers.instance
              .deserialize<_i5.IList<String>>($serialized[r'listOfString']),
          listOfUri: _i4.Serializers.instance
              .deserialize<_i5.IList<Uri>>($serialized[r'listOfUri']),
          listOfSimpleClass: _i4.Serializers.instance
              .deserialize<_i5.IList<_i6.SimpleClass>>(
                  $serialized[r'listOfSimpleClass']),
          listOfListOfString: _i4.Serializers.instance
              .deserialize<_i5.IList<_i5.IList<String>>>(
                  $serialized[r'listOfListOfString']),
          listOfListOfUri: _i4.Serializers.instance
              .deserialize<_i5.IList<_i5.IList<Uri>>>(
                  $serialized[r'listOfListOfUri']),
          listOfListOfSimpleClass: _i4.Serializers.instance
              .deserialize<_i5.IList<_i5.IList<_i6.SimpleClass>>>(
                  $serialized[r'listOfListOfSimpleClass']),
          mapOfString: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, String>>(
                  $serialized[r'mapOfString']),
          mapOfUri: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, Uri>>($serialized[r'mapOfUri']),
          mapOfSimpleClass: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i6.SimpleClass>>(
                  $serialized[r'mapOfSimpleClass']),
          mapOfListOfString: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i5.IList<String>>>(
                  $serialized[r'mapOfListOfString']),
          mapOfListOfUri: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i5.IList<Uri>>>(
                  $serialized[r'mapOfListOfUri']),
          mapOfListOfSimpleClass: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>>(
                  $serialized[r'mapOfListOfSimpleClass']),
          mapOfMapOfString: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i7.IMap<String, String>>>(
                  $serialized[r'mapOfMapOfString']),
          mapOfMapOfUri: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i7.IMap<String, Uri>>>(
                  $serialized[r'mapOfMapOfUri']),
          mapOfMapOfSimpleClass: _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>>(
                  $serialized[r'mapOfMapOfSimpleClass']),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i6.SimpleClass, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i6.SimpleClass.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.AbortedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.AbortedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.AlreadyExistsException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.AlreadyExistsException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.BadRequestException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.CancelledException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.CancelledException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.CloudException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.CloudException.fromJson($serialized);
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.DataLossError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.DataLossError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.DeadlineExceededError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.DeadlineExceededError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i9.FailedPreconditionException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.FailedPreconditionException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.InternalServerError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.InternalServerError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.NotFoundException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.NotFoundException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.OutOfRangeException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.OutOfRangeException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i9.PermissionDeniedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.PermissionDeniedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i9.ResourceExhaustedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.ResourceExhaustedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.UnauthorizedException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.UnauthorizedException(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.UnavailableError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.UnavailableError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i9.UnimplementedError, Map<String, Object?>?>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.UnimplementedError(($serialized?[r'message'] as String?));
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i9.UnknownError, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i9.UnknownError(
          ($serialized[r'message'] as String?),
          details: _i4.Serializers.instance.deserialize<_i14.JsonValue?>(
            $serialized[r'details'],
            const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
          ),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i13.SerializationException, Map<String, Object?>>(
      serialize: ($value) => <String, Object?>{
        r'message': $value.message,
        if (_i4.Serializers.instance.serialize<_i14.JsonValue?>(
          $value.details,
          const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
        )
            case final details?)
          r'details': details,
      },
      deserialize: ($serialized) {
        return _i13.SerializationException(($serialized[r'message'] as String));
      },
    ));
    _i4.Serializers.instance.put(
      _i4.Serializer.define<_i14.JsonValue, Object>(
        serialize: ($value) => $value.value,
        deserialize: ($serialized) {
          return _i14.JsonValue($serialized);
        },
      ),
      const _i4.TypeToken<_i14.JsonValue?>('JsonValue'),
    );
    _i4.Serializers.instance.put(_i4.Serializer.define<_i5.IList<Uri>, dynamic>(
      serialize: ($value) => $value
          .toJson((value) => _i4.Serializers.instance.serialize<Uri>(value)),
      deserialize: ($serialized) {
        return _i5.IList<Uri>.fromJson(
          $serialized,
          (value) => _i4.Serializers.instance.deserialize<Uri>(value),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.IList<_i6.SimpleClass>, dynamic>(
      serialize: ($value) => $value.toJson((value) =>
          _i4.Serializers.instance.serialize<_i6.SimpleClass>(value)),
      deserialize: ($serialized) {
        return _i5.IList<_i6.SimpleClass>.fromJson(
          $serialized,
          (value) =>
              _i4.Serializers.instance.deserialize<_i6.SimpleClass>(value),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.IList<_i5.IList<String>>, dynamic>(
      serialize: ($value) => $value.toJson((value) =>
          _i4.Serializers.instance.serialize<_i5.IList<String>>(value)),
      deserialize: ($serialized) {
        return _i5.IList<_i5.IList<String>>.fromJson(
          $serialized,
          (value) =>
              _i4.Serializers.instance.deserialize<_i5.IList<String>>(value),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.IList<_i5.IList<Uri>>, dynamic>(
      serialize: ($value) => $value.toJson(
          (value) => _i4.Serializers.instance.serialize<_i5.IList<Uri>>(value)),
      deserialize: ($serialized) {
        return _i5.IList<_i5.IList<Uri>>.fromJson(
          $serialized,
          (value) =>
              _i4.Serializers.instance.deserialize<_i5.IList<Uri>>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i5.IList<_i5.IList<_i6.SimpleClass>>, dynamic>(
      serialize: ($value) => $value.toJson((value) => _i4.Serializers.instance
          .serialize<_i5.IList<_i6.SimpleClass>>(value)),
      deserialize: ($serialized) {
        return _i5.IList<_i5.IList<_i6.SimpleClass>>.fromJson(
          $serialized,
          (value) => _i4.Serializers.instance
              .deserialize<_i5.IList<_i6.SimpleClass>>(value),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i5.IList<String>, dynamic>(
      serialize: ($value) => $value.toJson((value) => value),
      deserialize: ($serialized) {
        return _i5.IList<String>.fromJson(
          $serialized,
          (value) => (value as String),
        );
      },
    ));
    _i4.Serializers.instance.put(
        _i4.Serializer.define<_i7.IMap<String, String>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => value,
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, String>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => (value as String),
        );
      },
    ));
    _i4.Serializers.instance
        .put(_i4.Serializer.define<_i7.IMap<String, Uri>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i4.Serializers.instance.serialize<Uri>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, Uri>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i4.Serializers.instance.deserialize<Uri>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.IMap<String, _i6.SimpleClass>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i4.Serializers.instance.serialize<_i6.SimpleClass>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, _i6.SimpleClass>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i4.Serializers.instance.deserialize<_i6.SimpleClass>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.IMap<String, _i5.IList<String>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i4.Serializers.instance.serialize<_i5.IList<String>>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, _i5.IList<String>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i4.Serializers.instance.deserialize<_i5.IList<String>>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.IMap<String, _i5.IList<Uri>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i4.Serializers.instance.serialize<_i5.IList<Uri>>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, _i5.IList<Uri>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i4.Serializers.instance.deserialize<_i5.IList<Uri>>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.IMap<String, _i5.IList<_i6.SimpleClass>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i4.Serializers.instance
            .serialize<_i5.IList<_i6.SimpleClass>>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, _i5.IList<_i6.SimpleClass>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i4.Serializers.instance
              .deserialize<_i5.IList<_i6.SimpleClass>>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.IMap<String, _i7.IMap<String, String>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) =>
            _i4.Serializers.instance.serialize<_i7.IMap<String, String>>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, _i7.IMap<String, String>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i4.Serializers.instance
              .deserialize<_i7.IMap<String, String>>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.IMap<String, _i7.IMap<String, Uri>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) =>
            _i4.Serializers.instance.serialize<_i7.IMap<String, Uri>>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, _i7.IMap<String, Uri>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i4.Serializers.instance
              .deserialize<_i7.IMap<String, Uri>>(value),
        );
      },
    ));
    _i4.Serializers.instance.put(_i4.Serializer.define<
        _i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>,
        Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i4.Serializers.instance
            .serialize<_i7.IMap<String, _i6.SimpleClass>>(value),
      ),
      deserialize: ($serialized) {
        return _i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i4.Serializers.instance
              .deserialize<_i7.IMap<String, _i6.SimpleClass>>(value),
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

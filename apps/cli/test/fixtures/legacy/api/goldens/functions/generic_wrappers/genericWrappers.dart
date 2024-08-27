// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/generic_wrappers.dart' as _i4;
import 'package:celest_backend/models/parameter_types.dart' as _i8;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:celest_core/src/serialization/json_value.dart' as _i10;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i7;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i9;

import '../../../functions/generic_wrappers.dart' as _i2;

final class GenericWrappersTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'genericWrappers';

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
      final response = _i2.genericWrappers(_i3.Serializers.instance
          .deserialize<_i4.GenericWrappers>(request[r'value']));
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.GenericWrappers>(response)
        }
      );
    } on _i5.SerializationException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.SerializationException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DeadlineExceededError catch (e) {
      const statusCode = 504;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DeadlineExceededError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.DataLossError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.DataLossError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnavailableError catch (e) {
      const statusCode = 503;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnavailableError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.InternalServerError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.InternalServerError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnimplementedError catch (e) {
      const statusCode = 501;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnimplementedError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.OutOfRangeException catch (e) {
      const statusCode = 416;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.OutOfRangeException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AbortedException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AbortedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.FailedPreconditionException catch (e) {
      const statusCode = 412;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.FailedPreconditionException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.ResourceExhaustedException catch (e) {
      const statusCode = 429;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.ResourceExhaustedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.PermissionDeniedException catch (e) {
      const statusCode = 403;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.PermissionDeniedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.AlreadyExistsException catch (e) {
      const statusCode = 409;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.AlreadyExistsException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.NotFoundException catch (e) {
      const statusCode = 404;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.NotFoundException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnauthorizedException catch (e) {
      const statusCode = 401;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnauthorizedException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.BadRequestException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.BadRequestException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.UnknownError catch (e) {
      const statusCode = 500;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.UnknownError',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CancelledException catch (e) {
      const statusCode = 499;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CancelledException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    } on _i6.CloudException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = {
        'message': e.message,
        'code': 'celest.core.CloudException',
        'details': e.details,
      };
      return (statusCode: statusCode, body: {'error': error});
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.GenericWrappers, Map<String, Object?>>(
      serialize: ($value) => {
        r'listOfString': _i3.Serializers.instance
            .serialize<_i7.IList<String>>($value.listOfString),
        r'listOfUri': _i3.Serializers.instance
            .serialize<_i7.IList<Uri>>($value.listOfUri),
        r'listOfSimpleClass': _i3.Serializers.instance
            .serialize<_i7.IList<_i8.SimpleClass>>($value.listOfSimpleClass),
        r'listOfListOfString': _i3.Serializers.instance
            .serialize<_i7.IList<_i7.IList<String>>>($value.listOfListOfString),
        r'listOfListOfUri': _i3.Serializers.instance
            .serialize<_i7.IList<_i7.IList<Uri>>>($value.listOfListOfUri),
        r'listOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i7.IList<_i7.IList<_i8.SimpleClass>>>(
                $value.listOfListOfSimpleClass),
        r'mapOfString': _i3.Serializers.instance
            .serialize<_i9.IMap<String, String>>($value.mapOfString),
        r'mapOfUri': _i3.Serializers.instance
            .serialize<_i9.IMap<String, Uri>>($value.mapOfUri),
        r'mapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i8.SimpleClass>>(
                $value.mapOfSimpleClass),
        r'mapOfListOfString': _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i7.IList<String>>>(
                $value.mapOfListOfString),
        r'mapOfListOfUri': _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i7.IList<Uri>>>($value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i7.IList<_i8.SimpleClass>>>(
                $value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i9.IMap<String, String>>>(
                $value.mapOfMapOfString),
        r'mapOfMapOfUri': _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i9.IMap<String, Uri>>>(
                $value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i9.IMap<String, _i8.SimpleClass>>>(
                $value.mapOfMapOfSimpleClass),
      },
      deserialize: ($serialized) {
        return _i4.GenericWrappers(
          listOfString: _i3.Serializers.instance
              .deserialize<_i7.IList<String>>($serialized[r'listOfString']),
          listOfUri: _i3.Serializers.instance
              .deserialize<_i7.IList<Uri>>($serialized[r'listOfUri']),
          listOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i7.IList<_i8.SimpleClass>>(
                  $serialized[r'listOfSimpleClass']),
          listOfListOfString: _i3.Serializers.instance
              .deserialize<_i7.IList<_i7.IList<String>>>(
                  $serialized[r'listOfListOfString']),
          listOfListOfUri: _i3.Serializers.instance
              .deserialize<_i7.IList<_i7.IList<Uri>>>(
                  $serialized[r'listOfListOfUri']),
          listOfListOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i7.IList<_i7.IList<_i8.SimpleClass>>>(
                  $serialized[r'listOfListOfSimpleClass']),
          mapOfString: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, String>>(
                  $serialized[r'mapOfString']),
          mapOfUri: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, Uri>>($serialized[r'mapOfUri']),
          mapOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i8.SimpleClass>>(
                  $serialized[r'mapOfSimpleClass']),
          mapOfListOfString: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i7.IList<String>>>(
                  $serialized[r'mapOfListOfString']),
          mapOfListOfUri: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i7.IList<Uri>>>(
                  $serialized[r'mapOfListOfUri']),
          mapOfListOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i7.IList<_i8.SimpleClass>>>(
                  $serialized[r'mapOfListOfSimpleClass']),
          mapOfMapOfString: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i9.IMap<String, String>>>(
                  $serialized[r'mapOfMapOfString']),
          mapOfMapOfUri: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i9.IMap<String, Uri>>>(
                  $serialized[r'mapOfMapOfUri']),
          mapOfMapOfSimpleClass: _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i9.IMap<String, _i8.SimpleClass>>>(
                  $serialized[r'mapOfMapOfSimpleClass']),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i8.SimpleClass, Map<String, dynamic>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i8.SimpleClass.fromJson($serialized);
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
        _i3.Serializer.define<_i5.SerializationException, Map<String, Object?>>(
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
        return _i5.SerializationException(($serialized[r'message'] as String));
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
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.IList<_i7.IList<String>>, dynamic>(
      serialize: ($value) => $value.toJson((value) =>
          _i3.Serializers.instance.serialize<_i7.IList<String>>(value)),
      deserialize: ($serialized) {
        return _i7.IList<_i7.IList<String>>.fromJson(
          $serialized,
          (value) =>
              _i3.Serializers.instance.deserialize<_i7.IList<String>>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.IList<_i8.SimpleClass>, dynamic>(
      serialize: ($value) => $value.toJson((value) =>
          _i3.Serializers.instance.serialize<_i8.SimpleClass>(value)),
      deserialize: ($serialized) {
        return _i7.IList<_i8.SimpleClass>.fromJson(
          $serialized,
          (value) =>
              _i3.Serializers.instance.deserialize<_i8.SimpleClass>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<_i7.IList<Uri>, dynamic>(
      serialize: ($value) => $value
          .toJson((value) => _i3.Serializers.instance.serialize<Uri>(value)),
      deserialize: ($serialized) {
        return _i7.IList<Uri>.fromJson(
          $serialized,
          (value) => _i3.Serializers.instance.deserialize<Uri>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.IList<String>, dynamic>(
      serialize: ($value) => $value.toJson((value) => value),
      deserialize: ($serialized) {
        return _i7.IList<String>.fromJson(
          $serialized,
          (value) => (value as String),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i7.IList<_i7.IList<_i8.SimpleClass>>, dynamic>(
      serialize: ($value) => $value.toJson((value) => _i3.Serializers.instance
          .serialize<_i7.IList<_i8.SimpleClass>>(value)),
      deserialize: ($serialized) {
        return _i7.IList<_i7.IList<_i8.SimpleClass>>.fromJson(
          $serialized,
          (value) => _i3.Serializers.instance
              .deserialize<_i7.IList<_i8.SimpleClass>>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i7.IList<_i7.IList<Uri>>, dynamic>(
      serialize: ($value) => $value.toJson(
          (value) => _i3.Serializers.instance.serialize<_i7.IList<Uri>>(value)),
      deserialize: ($serialized) {
        return _i7.IList<_i7.IList<Uri>>.fromJson(
          $serialized,
          (value) =>
              _i3.Serializers.instance.deserialize<_i7.IList<Uri>>(value),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i9.IMap<String, Uri>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<Uri>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, Uri>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance.deserialize<Uri>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.IMap<String, _i8.SimpleClass>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i8.SimpleClass>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, _i8.SimpleClass>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i3.Serializers.instance.deserialize<_i8.SimpleClass>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.IMap<String, _i7.IList<String>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i7.IList<String>>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, _i7.IList<String>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i3.Serializers.instance.deserialize<_i7.IList<String>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.IMap<String, _i7.IList<Uri>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance.serialize<_i7.IList<Uri>>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, _i7.IList<Uri>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) =>
              _i3.Serializers.instance.deserialize<_i7.IList<Uri>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.IMap<String, _i7.IList<_i8.SimpleClass>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i7.IList<_i8.SimpleClass>>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, _i7.IList<_i8.SimpleClass>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i7.IList<_i8.SimpleClass>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.IMap<String, _i9.IMap<String, String>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i9.IMap<String, String>>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, _i9.IMap<String, String>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i9.IMap<String, String>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.IMap<String, _i9.IMap<String, Uri>>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) =>
            _i3.Serializers.instance.serialize<_i9.IMap<String, Uri>>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, _i9.IMap<String, Uri>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i9.IMap<String, Uri>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i9.IMap<String, _i9.IMap<String, _i8.SimpleClass>>,
        Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => _i3.Serializers.instance
            .serialize<_i9.IMap<String, _i8.SimpleClass>>(value),
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, _i9.IMap<String, _i8.SimpleClass>>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => _i3.Serializers.instance
              .deserialize<_i9.IMap<String, _i8.SimpleClass>>(value),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i9.IMap<String, String>, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(
        (value) => value,
        (value) => value,
      ),
      deserialize: ($serialized) {
        return _i9.IMap<String, String>.fromJson(
          $serialized,
          (value) => (value as String),
          (value) => (value as String),
        );
      },
    ));
  }
}

Future<void> main() async {
  return start();
}

Future<void> start() async {
  await _i1.serve(targets: {'/': GenericWrappersTarget()});
}

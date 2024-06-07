// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/generic_wrappers.dart' as _i4;
import 'package:celest_backend/models/parameter_types.dart' as _i8;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i7;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i9;

import '../../../functions/generic_wrappers.dart' as _i2;

final class GenericWrappersAsyncTarget extends _i1.CloudFunctionHttpTarget {
  @override
  String get name => 'genericWrappersAsync';

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
      final response = await _i2.genericWrappersAsync(_i3.Serializers.instance
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
  await _i1.serve(targets: {'/': GenericWrappersAsyncTarget()});
}

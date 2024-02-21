// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/extension_types.dart' as _i4;
import 'package:celest_core/src/exception/cloud_exception.dart' as _i6;
import 'package:celest_core/src/exception/serialization_exception.dart' as _i5;

import '../../../functions/extension_types.dart' as _i2;

final class NestedResetTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'nestedReset';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response =
          _i2.nestedReset(_i3.Serializers.instance.deserialize<_i4.NestedReset>(
        request[r'parent'],
        const _i3.TypeToken<_i4.NestedReset>('NestedReset'),
      ));
      return (
        statusCode: 200,
        body: {
          'response': _i3.Serializers.instance.serialize<_i4.NestedReset>(
            response,
            const _i3.TypeToken<_i4.NestedReset>('NestedReset'),
          )
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
    } on _i6.InternalServerException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i6.InternalServerException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'InternalServerException',
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
    _i3.Serializers.instance.put(
      NestedResetSerializer(),
      const _i3.TypeToken<_i4.NestedReset>('NestedReset'),
    );
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i6.BadRequestException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.BadRequestException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<
        _i6.InternalServerException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i6.InternalServerException(($serialized[r'message'] as String));
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

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NestedResetTarget()},
  );
}

final class NestedResetSerializer extends _i3.Serializer<_i4.NestedReset> {
  NestedResetSerializer() {
    $serializers
      ..put(_i3.Serializer.define<_i4.NestedParent, Map<String, Object?>>(
        serialize: ($value) =>
            {r'child': $serializers.serialize<_i4.NestedChild>($value.child)},
        deserialize: ($serialized) {
          return _i4.NestedParent(
              $serializers.deserialize<_i4.NestedChild>($serialized[r'child']));
        },
      ))
      ..put(_i3.Serializer.define<_i4.NestedChild, Map<String, Object?>>(
        serialize: ($value) => {r'value': $value.value},
        deserialize: ($serialized) {
          return _i4.NestedChild(($serialized[r'value'] as String));
        },
      ));
  }

  final _i3.Serializers $serializers = _i3.Serializers();

  @override
  _i4.NestedReset deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _i4.NestedReset(
        $serializers.deserialize<_i4.NestedParent>($serialized));
  }

  @override
  Object? serialize(_i4.NestedReset $value) =>
      $serializers.serialize<_i4.NestedParent>($value.it);
}

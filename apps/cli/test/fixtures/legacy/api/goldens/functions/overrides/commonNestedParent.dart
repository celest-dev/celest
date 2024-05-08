// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/exceptions/overrides.dart' as _i5;
import 'package:celest_backend/models/overrides.dart' as _i6;

import '../../../functions/overrides.dart' as _i2;

final class CommonNestedParentTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'commonNestedParent';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    try {
      final response = _i2.commonNestedParent(_i3.Serializers.instance
          .deserialize<_i4.NestedParent>(request[r'parent']));
      return (
        statusCode: 200,
        body: {
          'response':
              _i3.Serializers.instance.serialize<_i4.NestedParent>(response)
        }
      );
    } on _i5.OverriddenException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error =
          _i3.Serializers.instance.serialize<_i5.OverriddenException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'OverriddenException',
            'details': error,
          }
        }
      );
    } on _i4.CommonException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i4.CommonException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CommonException',
            'details': error,
          }
        }
      );
    } on _i4.CustomException catch (e) {
      const statusCode = 400;
      print('$statusCode $e');
      final error = _i3.Serializers.instance.serialize<_i4.CustomException>(e);
      return (
        statusCode: statusCode,
        body: {
          'error': {
            'code': r'CustomException',
            'details': error,
          }
        }
      );
    }
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.CommonException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i4.CommonException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.CustomException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return _i4.CustomException(($serialized[r'message'] as String));
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i5.OverriddenException, Map<String, Object?>>(
      serialize: ($value) => {r'message': $value.message},
      deserialize: ($serialized) {
        return (_i4.OverriddenException(($serialized[r'message'] as String))
            as _i5.OverriddenException);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NestedChild, Map<String, Object?>>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i6.NestedChild.fromJson($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i6.NestedParent, Map<String, Object?>>(
      serialize: ($value) => {
        r'child':
            _i3.Serializers.instance.serialize<_i4.NestedChild>($value.child)
      },
      deserialize: ($serialized) {
        return (_i4.NestedParent(_i3.Serializers.instance
                .deserialize<_i4.NestedChild>($serialized[r'child']))
            as _i6.NestedParent);
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': CommonNestedParentTarget()},
  );
}

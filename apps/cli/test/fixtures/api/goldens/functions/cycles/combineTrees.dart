// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/cycles.dart' as _i4;

import '../../../functions/cycles.dart' as _i2;

final class CombineTreesTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'combineTrees';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.combineTrees(
      _i3.Serializers.instance.deserialize<_i4.Node>(request[r'tree1']),
      (_i3.Serializers.instance.deserialize<_i4.Parent?>(request[r'tree2'])) ??
          null,
      (_i3.Serializers.instance.deserialize<_i4.Node?>(request[r'tree3'])) ??
          null,
      ((request[r'additionalChildren'] as Iterable<Object?>?)
              ?.map((el) => _i3.Serializers.instance.deserialize<_i4.Node?>(el))
              .toList()) ??
          const [],
    );
    return (
      statusCode: 200,
      body: {'response': _i3.Serializers.instance.serialize<_i4.Node>(response)}
    );
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Node, Map<String, Object?>>(
      serialize: ($value) {
        if ($value is _i4.Parent) {
          return {
            ...(_i3.Serializers.instance.serialize<_i4.Parent>($value)
                as Map<String, Object?>),
            r'$type': r'Parent',
          };
        }
        if ($value is _i4.Child) {
          return {
            ...(_i3.Serializers.instance.serialize<_i4.Child>($value)
                as Map<String, Object?>),
            r'$type': r'Child',
          };
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Node')
              ..write(': ')
              ..write($value.runtimeType))
            .toString());
      },
      deserialize: ($serialized) {
        if ($serialized[r'$type'] == r'Parent') {
          return _i3.Serializers.instance.deserialize<_i4.Parent>($serialized);
        }
        if ($serialized[r'$type'] == r'Child') {
          return _i3.Serializers.instance.deserialize<_i4.Child>($serialized);
        }
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Node')
              ..write(': ')
              ..write($serialized[r'$type']))
            .toString());
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Parent, Map<String, Object?>>(
      serialize: ($value) => {
        r'name': $value.name,
        r'children': $value.children
            .map((el) => _i3.Serializers.instance.serialize<_i4.Node>(el))
            .toList(),
      },
      deserialize: ($serialized) {
        return _i4.Parent(
          ($serialized[r'name'] as String),
          ($serialized[r'children'] as Iterable<Object?>)
              .map((el) => _i3.Serializers.instance.deserialize<_i4.Node>(el))
              .toList(),
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Child, Map<String, Object?>>(
      serialize: ($value) => {r'name': $value.name},
      deserialize: ($serialized) {
        return _i4.Child(($serialized[r'name'] as String));
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': CombineTreesTarget()},
  );
}

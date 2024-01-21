// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/cycles.dart' as _i4;
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/cycles.dart' as _i2;

final class CombineTreesTarget extends _i1.CloudFunctionTarget {
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
    _i3.Serializers.instance.put(const NodeSerializer());
    _i3.Serializers.instance.put(const ParentSerializer());
    _i3.Serializers.instance.put(const ChildSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': CombineTreesTarget()},
  );
}

final class NodeSerializer extends _i3.Serializer<_i4.Node> {
  const NodeSerializer();

  @override
  _i4.Node deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return switch (serialized[r'$type']) {
      r'Parent' => _i3.Serializers.instance.deserialize<_i4.Parent>(serialized),
      r'Child' => _i3.Serializers.instance.deserialize<_i4.Child>(serialized),
      final unknownType =>
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Node')
              ..write(': $unknownType'))
            .toString()),
    };
  }

  @override
  Map<String, Object?> serialize(_i4.Node value) => switch (value) {
        _i4.Parent() => {
            ...(_i3.Serializers.instance.serialize<_i4.Parent>(value)
                as Map<String, Object?>),
            r'$type': r'Parent',
          },
        _i4.Child() => {
            ...(_i3.Serializers.instance.serialize<_i4.Child>(value)
                as Map<String, Object?>),
            r'$type': r'Child',
          },
      };
}

final class ParentSerializer extends _i3.Serializer<_i4.Parent> {
  const ParentSerializer();

  @override
  _i4.Parent deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Parent(
      (serialized[r'name'] as String),
      (serialized[r'children'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.instance.deserialize<_i4.Node>(el))
          .toList(),
    );
  }

  @override
  Map<String, Object?> serialize(_i4.Parent value) => {
        r'name': value.name,
        r'children': value.children
            .map((el) => _i3.Serializers.instance.serialize<_i4.Node>(el))
            .toList(),
      };
}

final class ChildSerializer extends _i3.Serializer<_i4.Child> {
  const ChildSerializer();

  @override
  _i4.Child deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.Child((serialized[r'name'] as String));
  }

  @override
  Map<String, Object?> serialize(_i4.Child value) => {r'name': value.name};
}

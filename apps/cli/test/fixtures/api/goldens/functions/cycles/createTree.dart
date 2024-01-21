// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/cycles.dart' as _i2;

final class CreateTreeTarget extends _i1.CloudFunctionTarget {
  CreateTreeTarget()
      : super(
          (request) async {
            final response = _i2.createTree();
            return (
              statusCode: 200,
              body: {
                'response': _i3.Serializers.scoped.serialize<_i2.Node>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const NodeSerializer());
            serializers.put(const ChildSerializer());
            serializers.put(const ParentSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': CreateTreeTarget()},
  );
}

final class NodeSerializer extends _i3.Serializer<_i2.Node> {
  const NodeSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#Node';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Node deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return switch (serialized[r'$type']) {
      r'Child' => _i3.Serializers.scoped.deserialize<_i2.Child>(serialized),
      r'Parent' => _i3.Serializers.scoped.deserialize<_i2.Parent>(serialized),
      final unknownType =>
        throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Node')
              ..write(': $unknownType'))
            .toString()),
    };
  }

  @override
  Map<String, Object?> serialize(_i2.Node value) => switch (value) {
        _i2.Child() => {
            ...(_i3.Serializers.scoped.serialize<_i2.Child>(value)
                as Map<String, Object?>),
            r'$type': r'Child',
          },
        _i2.Parent() => {
            ...(_i3.Serializers.scoped.serialize<_i2.Parent>(value)
                as Map<String, Object?>),
            r'$type': r'Parent',
          },
      };
}

final class ChildSerializer extends _i3.Serializer<_i2.Child> {
  const ChildSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#Child';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Child deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Child((serialized[r'name'] as String));
  }

  @override
  Map<String, Object?> serialize(_i2.Child value) => {r'name': value.name};
}

final class ParentSerializer extends _i3.Serializer<_i2.Parent> {
  const ParentSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#Parent';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Parent deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Parent(
      (serialized[r'name'] as String),
      (serialized[r'children'] as Iterable<Object?>)
          .map((el) => _i3.Serializers.scoped.deserialize<_i2.Node>(el))
          .toList(),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Parent value) => {
        r'name': value.name,
        r'children': value.children
            .map((el) => _i3.Serializers.scoped.serialize<_i2.Node>(el))
            .toList(),
      };
}

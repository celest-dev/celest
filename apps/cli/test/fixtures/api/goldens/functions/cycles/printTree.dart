// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/cycles.dart' as _i4;

import '../../../functions/cycles.dart' as _i2;

final class PrintTreeTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'printTree';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    _i2.printTree(
        _i3.Serializers.instance.deserialize<_i4.Node>(request[r'node']));
    return (statusCode: 200, body: {'response': null});
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
    targets: {'/': PrintTreeTarget()},
  );
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

final class NodeSerializer extends _i3.Serializer<_i4.Node> {
  const NodeSerializer();

  @override
  _i4.Node deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Parent') {
      return _i3.Serializers.instance.deserialize<_i4.Parent>(serialized);
    }
    if (serialized[r'$type'] == r'Child') {
      return _i3.Serializers.instance.deserialize<_i4.Child>(serialized);
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Node')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(_i4.Node value) {
    if (value is _i4.Parent) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.Parent>(value)
            as Map<String, Object?>),
        r'$type': r'Parent',
      };
    }
    if (value is _i4.Child) {
      return {
        ...(_i3.Serializers.instance.serialize<_i4.Child>(value)
            as Map<String, Object?>),
        r'$type': r'Child',
      };
    }
    throw _i3.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Node')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
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

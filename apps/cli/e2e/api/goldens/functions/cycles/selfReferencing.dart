// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/cycles.dart' as _i2;

final class SelfReferencingTarget extends _i1.CelestFunctionTarget {
  SelfReferencingTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.selfReferencing(_i3.Serializers.scoped
                .deserialize<_i2.SelfReferencing>(request[r'selfReferencing']));
            return (
              statusCode: 200,
              body: _i3.Serializers.scoped
                  .serialize<_i2.SelfReferencing>(response)
            );
          },
          installSerializers: (serializers) {
            serializers.put(const SelfReferencingWrapperSerializer());
            serializers.put(const SelfReferencingSerializer());
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  await _i5.serve(
    args,
    (_) => SelfReferencingTarget(),
  );
}

final class SelfReferencingWrapperSerializer
    extends _i3.Serializer<_i2.SelfReferencingWrapper> {
  const SelfReferencingWrapperSerializer();

  @override
  String get dartType =>
      r'project:functions/cycles.dart#SelfReferencingWrapper';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SelfReferencingWrapper deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.SelfReferencingWrapper(
        value: _i3.Serializers.scoped
            .deserialize<_i2.SelfReferencing>(serialized[r'value']));
  }

  @override
  Map<String, Object?> serialize(_i2.SelfReferencingWrapper value) => {
        r'value':
            _i3.Serializers.scoped.serialize<_i2.SelfReferencing>(value.value)
      };
}

final class SelfReferencingSerializer
    extends _i3.Serializer<_i2.SelfReferencing> {
  const SelfReferencingSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#SelfReferencing';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.SelfReferencing deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.SelfReferencing(
      value: _i3.Serializers.scoped
          .deserialize<_i2.SelfReferencing?>(serialized[r'value']),
      wrapper: _i3.Serializers.scoped
          .deserialize<_i2.SelfReferencingWrapper?>(serialized[r'wrapper']),
      list: (serialized[r'list'] as Iterable<Object?>)
          .map((el) =>
              _i3.Serializers.scoped.deserialize<_i2.SelfReferencing>(el))
          .toList(),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.SelfReferencing value) => {
        r'value':
            _i3.Serializers.scoped.serialize<_i2.SelfReferencing?>(value.value),
        r'wrapper': _i3.Serializers.scoped
            .serialize<_i2.SelfReferencingWrapper?>(value.wrapper),
        r'list': value.list
            .map((el) =>
                _i3.Serializers.scoped.serialize<_i2.SelfReferencing>(el))
            .toList(),
      };
}

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/cycles.dart' as _i4;

import '../../../functions/cycles.dart' as _i2;

final class SelfReferencingTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'selfReferencing';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.selfReferencing(_i3.Serializers.instance
        .deserialize<_i4.SelfReferencing>(request[r'selfReferencing']));
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.SelfReferencing>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.SelfReferencing, Map<String, Object?>>(
      serialize: ($value) => {
        r'value': _i3.Serializers.instance
            .serialize<_i4.SelfReferencing?>($value.value),
        r'wrapper': _i3.Serializers.instance
            .serialize<_i4.SelfReferencingWrapper?>($value.wrapper),
        r'list': $value.list
            .map((el) =>
                _i3.Serializers.instance.serialize<_i4.SelfReferencing>(el))
            .toList(),
      },
      deserialize: ($serialized) {
        return _i4.SelfReferencing(
          value: (_i3.Serializers.instance
                  .deserialize<_i4.SelfReferencing?>($serialized[r'value'])) ??
              null,
          wrapper: (_i3.Serializers.instance
                  .deserialize<_i4.SelfReferencingWrapper?>(
                      $serialized[r'wrapper'])) ??
              null,
          list: ($serialized[r'list'] as Iterable<Object?>)
              .map((el) =>
                  _i3.Serializers.instance.deserialize<_i4.SelfReferencing>(el))
              .toList(),
        );
      },
    ));
    _i3.Serializers.instance.put(
        _i3.Serializer.define<_i4.SelfReferencingWrapper, Map<String, Object?>>(
      serialize: ($value) => {
        r'value': _i3.Serializers.instance
            .serialize<_i4.SelfReferencing>($value.value)
      },
      deserialize: ($serialized) {
        return _i4.SelfReferencingWrapper(
            value: _i3.Serializers.instance
                .deserialize<_i4.SelfReferencing>($serialized[r'value']));
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SelfReferencingTarget()},
  );
}

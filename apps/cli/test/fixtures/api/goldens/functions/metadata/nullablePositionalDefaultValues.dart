// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/metadata.dart' as _i4;

import '../../../functions/metadata.dart' as _i2;

final class NullablePositionalDefaultValuesTarget
    extends _i1.CloudFunctionTarget {
  @override
  String get name => 'nullablePositionalDefaultValues';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    _i2.nullablePositionalDefaultValues(
      ((request[r'value'] as String?)) ?? 'value',
      ((request[r'intValue'] as num?)?.toInt()) ?? 1,
      ((request[r'doubleValue'] as num?)?.toDouble()) ?? 1.0,
      ((request[r'boolValue'] as bool?)) ?? true,
      ((request[r'list'] as Iterable<Object?>?)
              ?.map((el) => (el as String))
              .toList()) ??
          const ['list'],
      ((request[r'map'] as Map<String, Object?>?)?.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                (value as String),
              ))) ??
          const {'map': 'map'},
      (_i3.Serializers.instance
              .deserialize<_i4.Exportable?>(request[r'exportable'])) ??
          const _i4.Exportable(),
      (_i3.Serializers.instance
              .deserialize<_i4.Serializable?>(request[r'serializable'])) ??
          const _i4.Serializable.forType('String'),
      (_i3.Serializers.instance
              .deserialize<_i4.LiteralEnum?>(request[r'enumValue'])) ??
          _i4.LiteralEnum.a,
      (_i3.Serializers.instance.deserialize<({String a, String b, String c})?>(
              request[r'recordValue'])) ??
          const (a: 'a', b: 'b', c: 'c'),
    );
    return (statusCode: 200, body: {'response': null});
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<Record$k7x4l9, Map<String, Object?>>(
      serialize: ($value) => {
        r'a': $value.a,
        r'b': $value.b,
        r'c': $value.c,
      },
      deserialize: ($serialized) {
        return (
          a: ($serialized[r'a'] as String),
          b: ($serialized[r'b'] as String),
          c: ($serialized[r'c'] as String)
        );
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Exportable, Map<String, Object?>?>(
      serialize: ($value) => {},
      deserialize: ($serialized) {
        return _i4.Exportable();
      },
    ));
    _i3.Serializers.instance.put(_i3.Serializer.define<_i4.LiteralEnum, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _i4.LiteralEnum.values.byName($serialized);
      },
    ));
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.Serializable, Map<String, Object?>?>(
      serialize: ($value) => {r'type': $value.type},
      deserialize: ($serialized) {
        return _i4.Serializable(($serialized?[r'type'] as String?));
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': NullablePositionalDefaultValuesTarget()},
  );
}

typedef Record$k7x4l9 = ({String a, String b, String c});

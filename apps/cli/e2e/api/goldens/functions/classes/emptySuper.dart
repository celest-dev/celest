// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;
import 'package:functions_framework/serve.dart' as _i5;

import '../../../functions/classes.dart' as _i2;

final class EmptySuperTarget extends _i1.CelestFunctionTarget {
  EmptySuperTarget()
      : super(
          (
            request,
            context,
          ) async {
            final response = _i2.emptySuper(_i3.Serializers.instance
                .deserialize<_i2.EmptySuper>(request[r'value']));
            return (
              statusCode: 200,
              body: _i3.Serializers.instance.serialize<_i2.EmptySuper>(response)
            );
          },
          middleware: [],
        );
}

_i4.Future<void> main(List<String> args) async {
  _i3.Serializers.instance.put(const EmptySuperSerializer());
  await _i5.serve(
    args,
    (_) => EmptySuperTarget(),
  );
}

final class EmptySuperSerializer extends _i3.Serializer<_i2.EmptySuper> {
  const EmptySuperSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#EmptySuper';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.EmptySuper deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.EmptySuper();
  }

  @override
  Map<String, Object?> serialize(_i2.EmptySuper value) => {};
}

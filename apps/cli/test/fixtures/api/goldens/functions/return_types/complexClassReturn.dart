// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/src/runtime.dart' as _i1;
import 'package:celest_core/celest_core.dart' as _i3;

import '../../../functions/parameter_types.dart' as _i4;
import '../../../functions/return_types.dart' as _i2;

final class ComplexClassReturnTarget extends _i1.CloudFunctionTarget {
  ComplexClassReturnTarget()
      : super(
          (request) async {
            final response = _i2.complexClassReturn();
            return (
              statusCode: 200,
              body: {
                'response':
                    _i3.Serializers.scoped.serialize<_i4.ComplexClass>(response)
              }
            );
          },
          installSerializers: (serializers) {
            serializers.put(const ComplexClassSerializer());
          },
        );
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ComplexClassReturnTarget()},
  );
}

final class ComplexClassSerializer extends _i3.Serializer<_i4.ComplexClass> {
  const ComplexClassSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#ComplexClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.ComplexClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i4.ComplexClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i4.ComplexClass value) => value.toJson();
}

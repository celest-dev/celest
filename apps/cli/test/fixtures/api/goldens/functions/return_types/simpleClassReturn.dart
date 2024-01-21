// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/parameter_types.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/return_types.dart' as _i2;

final class SimpleClassReturnTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'simpleClassReturn';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.simpleClassReturn();
    return (
      statusCode: 200,
      body: {
        'response':
            _i3.Serializers.instance.serialize<_i4.SimpleClass>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const SimpleClassSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': SimpleClassReturnTarget()},
  );
}

final class SimpleClassSerializer extends _i3.Serializer<_i4.SimpleClass> {
  const SimpleClassSerializer();

  @override
  _i4.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i4.SimpleClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i4.SimpleClass value) => value.toJson();
}

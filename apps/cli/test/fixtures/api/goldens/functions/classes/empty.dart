// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/classes.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime.dart' as _i1;

import '../../../functions/classes.dart' as _i2;

final class EmptyTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'empty';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = _i2.empty(
        _i3.Serializers.instance.deserialize<_i4.Empty>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance.serialize<_i4.Empty>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const EmptySerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': EmptyTarget()},
  );
}

final class EmptySerializer extends _i3.Serializer<_i4.Empty> {
  const EmptySerializer();

  @override
  _i4.Empty deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.Empty();
  }

  @override
  Map<String, Object?> serialize(_i4.Empty value) => {};
}

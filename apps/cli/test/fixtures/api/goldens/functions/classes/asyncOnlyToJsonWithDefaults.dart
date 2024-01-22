// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/src/models/classes.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class AsyncOnlyToJsonWithDefaultsTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'asyncOnlyToJsonWithDefaults';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.asyncOnlyToJsonWithDefaults(_i3
        .Serializers.instance
        .deserialize<_i4.OnlyToJsonWithDefaults>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance
            .serialize<_i4.OnlyToJsonWithDefaults>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const OnlyToJsonWithDefaultsSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncOnlyToJsonWithDefaultsTarget()},
  );
}

final class OnlyToJsonWithDefaultsSerializer
    extends _i3.Serializer<_i4.OnlyToJsonWithDefaults> {
  const OnlyToJsonWithDefaultsSerializer();

  @override
  _i4.OnlyToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.OnlyToJsonWithDefaults(
        ((serialized?[r'field'] as String?)) ?? 'default');
  }

  @override
  Map<String, Object?> serialize(_i4.OnlyToJsonWithDefaults value) =>
      value.toJson();
}

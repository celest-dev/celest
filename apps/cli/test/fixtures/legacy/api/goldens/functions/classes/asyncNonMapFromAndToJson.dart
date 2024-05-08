// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;
import 'package:celest_backend/models/classes.dart' as _i4;

import '../../../functions/classes.dart' as _i2;

final class AsyncNonMapFromAndToJsonTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'asyncNonMapFromAndToJson';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    final response = await _i2.asyncNonMapFromAndToJson(_i3.Serializers.instance
        .deserialize<_i4.NonMapFromAndToJson>(request[r'value']));
    return (
      statusCode: 200,
      body: {
        'response': _i3.Serializers.instance
            .serialize<_i4.NonMapFromAndToJson>(response)
      }
    );
  }

  @override
  void init() {
    _i3.Serializers.instance
        .put(_i3.Serializer.define<_i4.NonMapFromAndToJson, String>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _i4.NonMapFromAndToJson.fromJson($serialized);
      },
    ));
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': AsyncNonMapFromAndToJsonTarget()},
  );
}

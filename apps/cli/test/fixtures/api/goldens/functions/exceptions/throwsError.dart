// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/src/models/exceptions.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime/serve.dart' as _i1;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsErrorTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsError';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    _i2.throwsError(
        type: _i3.Serializers.instance
            .deserialize<_i4.SupportedErrorType>(request[r'type']));
    return (statusCode: 200, body: {'response': null});
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const SupportedErrorTypeSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsErrorTarget()},
  );
}

final class SupportedErrorTypeSerializer
    extends _i3.Serializer<_i4.SupportedErrorType> {
  const SupportedErrorTypeSerializer();

  @override
  _i4.SupportedErrorType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.SupportedErrorType.values.byName(serialized);
  }

  @override
  String serialize(_i4.SupportedErrorType value) => value.name;
}

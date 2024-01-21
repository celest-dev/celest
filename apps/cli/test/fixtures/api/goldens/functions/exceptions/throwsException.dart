// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api/exceptions.dart' as _i4;
import 'package:celest/celest.dart' as _i3;
import 'package:celest/src/runtime.dart' as _i1;

import '../../../functions/exceptions.dart' as _i2;

final class ThrowsExceptionTarget extends _i1.CloudFunctionTarget {
  @override
  String get name => 'throwsException';

  @override
  Future<_i1.CelestResponse> handle(Map<String, Object?> request) async {
    _i2.throwsException(
        type: _i3.Serializers.instance
            .deserialize<_i4.SupportedExceptionType>(request[r'type']));
    return (statusCode: 200, body: {'response': null});
  }

  @override
  void init() {
    _i3.Serializers.instance.put(const SupportedExceptionTypeSerializer());
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    targets: {'/': ThrowsExceptionTarget()},
  );
}

final class SupportedExceptionTypeSerializer
    extends _i3.Serializer<_i4.SupportedExceptionType> {
  const SupportedExceptionTypeSerializer();

  @override
  _i4.SupportedExceptionType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.SupportedExceptionType.values.byName(serialized);
  }

  @override
  String serialize(_i4.SupportedExceptionType value) => value.name;
}

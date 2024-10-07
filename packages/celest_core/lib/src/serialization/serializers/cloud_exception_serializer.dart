import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/serialization/serializer.dart';

final class CloudExceptionSerializer extends Serializer<CloudException> {
  const CloudExceptionSerializer();

  @override
  CloudException deserialize(Object? value) {
    final json = assertWireType<Map<String, Object?>>(value);
    return CloudException.fromJson(json);
  }

  @override
  Map<String, Object?> serialize(CloudException value) {
    return {
      '@error': {
        'code': value.code,
        'message': value.message,
        'status': value.httpStatus,
      },
      'message': value.message,
      'details': value.details,
    };
  }
}

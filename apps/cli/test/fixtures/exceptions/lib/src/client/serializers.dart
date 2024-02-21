// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart';

final class BaseErrorSerializer extends Serializer<BaseError> {
  const BaseErrorSerializer();

  @override
  BaseError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return BaseError((serialized[r'message'] as String));
  }

  @override
  Object? serialize(BaseError value) => {r'message': value.message};
}

final class BaseExceptionSerializer extends Serializer<BaseException> {
  const BaseExceptionSerializer();

  @override
  BaseException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return BaseException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(BaseException value) => {r'message': value.message};
}

final class CustomErrorSerializer extends Serializer<CustomError> {
  const CustomErrorSerializer();

  @override
  CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return CustomError((serialized[r'message'] as String));
  }

  @override
  Object? serialize(CustomError value) => {r'message': value.message};
}

final class CustomExceptionSerializer extends Serializer<CustomException> {
  const CustomExceptionSerializer();

  @override
  CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return CustomException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(CustomException value) => {r'message': value.message};
}

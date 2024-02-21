// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:_common/_common.dart' as _$_common;
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart' as _$exceptions;

final class BaseErrorSerializer extends Serializer<_$exceptions.BaseError> {
  const BaseErrorSerializer();

  @override
  _$exceptions.BaseError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$exceptions.BaseError((serialized[r'fault'] as String));
  }

  @override
  Object? serialize(_$exceptions.BaseError value) => {r'fault': value.fault};
}

final class BaseExceptionSerializer
    extends Serializer<_$exceptions.BaseException> {
  const BaseExceptionSerializer();

  @override
  _$exceptions.BaseException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$exceptions.BaseException((serialized[r'fault'] as String));
  }

  @override
  Object? serialize(_$exceptions.BaseException value) =>
      {r'fault': value.fault};
}

final class CommonExceptionSerializer
    extends Serializer<_$_common.CommonException> {
  const CommonExceptionSerializer();

  @override
  _$_common.CommonException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$_common.CommonException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_$_common.CommonException value) =>
      {r'message': value.message};
}

final class CustomErrorSerializer extends Serializer<_$exceptions.CustomError> {
  const CustomErrorSerializer();

  @override
  _$exceptions.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$exceptions.CustomError((serialized[r'fault'] as String));
  }

  @override
  Object? serialize(_$exceptions.CustomError value) => {r'fault': value.fault};
}

final class CustomExceptionSerializer
    extends Serializer<_$_common.CustomException> {
  const CustomExceptionSerializer();

  @override
  _$_common.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$_common.CustomException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(_$_common.CustomException value) =>
      {r'message': value.message};
}

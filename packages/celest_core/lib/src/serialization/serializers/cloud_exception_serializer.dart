import 'package:celest_core/celest_core.dart';

/// A [Serializer] for [BadRequestException] objects.
final class BadRequestExceptionSerializer
    extends Serializer<BadRequestException> {
  /// Creates a [Serializer] for [BadRequestException] objects.
  const BadRequestExceptionSerializer();

  @override
  BadRequestException deserialize(Object? value) {
    final body = assertWireType<Map<String, Object?>>(value);
    return BadRequestException(
      (body[r'message'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(BadRequestException value) {
    return {
      'message': value.message,
    };
  }
}

/// A [Serializer] for [InternalServerException] objects.
final class InternalServerExceptionSerializer
    extends Serializer<InternalServerException> {
  /// Creates a [Serializer] for [InternalServerException] objects.
  const InternalServerExceptionSerializer();

  @override
  InternalServerException deserialize(Object? value) {
    final body = assertWireType<Map<String, Object?>>(value);
    return InternalServerException(
      (body[r'message'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(InternalServerException value) {
    return {
      'message': value.message,
    };
  }
}

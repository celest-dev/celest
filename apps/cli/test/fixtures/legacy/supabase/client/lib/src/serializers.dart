// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest/celest.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';
import 'package:gotrue/src/types/auth_exception.dart' as _$auth_exception;
import 'package:supabase/src/auth_user.dart' as _$auth_user;

void initSerializers() {
  Serializers.instance
      .put(Serializer.define<AbortedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return AbortedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<AlreadyExistsException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return AlreadyExistsException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<BadRequestException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return BadRequestException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<CancelledException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return CancelledException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<CloudException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return CloudException.fromJson($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<DataLossError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return DataLossError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<DeadlineExceededError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return DeadlineExceededError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<FailedPreconditionException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return FailedPreconditionException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<InternalServerError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return InternalServerError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<NotFoundException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return NotFoundException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<OutOfRangeException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return OutOfRangeException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<PermissionDeniedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return PermissionDeniedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<ResourceExhaustedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return ResourceExhaustedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnauthorizedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnauthorizedException(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnavailableError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnavailableError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnimplementedError, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnimplementedError(($serialized?[r'message'] as String?));
    },
  ));
  Serializers.instance
      .put(Serializer.define<UnknownError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return UnknownError(
        ($serialized[r'message'] as String?),
        details: Serializers.instance.deserialize<JsonValue?>(
          $serialized[r'details'],
          const TypeToken<JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<SerializationException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'offset': $value.offset,
      r'source': $value.source,
      r'details': Serializers.instance.serialize<JsonValue?>(
        $value.details,
        const TypeToken<JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return SerializationException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(
    Serializer.define<JsonValue, Object>(
      serialize: ($value) => $value.value,
      deserialize: ($serialized) {
        return JsonValue($serialized);
      },
    ),
    const TypeToken<JsonValue?>('JsonValue'),
  );
  Serializers.instance.put(Serializer.define<_$auth_exception.AuthApiException,
      Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'statusCode': $value.statusCode,
      r'code': $value.code,
    },
    deserialize: ($serialized) {
      return _$auth_exception.AuthApiException(
        ($serialized[r'message'] as String),
        statusCode: ($serialized[r'statusCode'] as String?),
        code: ($serialized[r'code'] as String?),
      );
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$auth_exception.AuthException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'statusCode': $value.statusCode,
      r'code': $value.code,
    },
    deserialize: ($serialized) {
      return _$auth_exception.AuthException(
        ($serialized[r'message'] as String),
        statusCode: ($serialized[r'statusCode'] as String?),
        code: ($serialized[r'code'] as String?),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$auth_exception.AuthPKCEGrantCodeExchangeError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'statusCode': $value.statusCode,
      r'code': $value.code,
    },
    deserialize: ($serialized) {
      return _$auth_exception.AuthPKCEGrantCodeExchangeError(
          ($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$auth_exception.AuthRetryableFetchException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'statusCode': $value.statusCode,
      r'code': $value.code,
    },
    deserialize: ($serialized) {
      return _$auth_exception.AuthRetryableFetchException(
        message: (($serialized?[r'message'] as String?)) ??
            'AuthRetryableFetchException',
        statusCode: ($serialized?[r'statusCode'] as String?),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$auth_exception.AuthSessionMissingException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'statusCode': $value.statusCode,
      r'code': $value.code,
    },
    deserialize: ($serialized) {
      return _$auth_exception.AuthSessionMissingException(
          ($serialized?[r'message'] as String?));
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$auth_exception.AuthWeakPasswordException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'statusCode': $value.statusCode,
      r'code': $value.code,
      r'reasons': $value.reasons,
    },
    deserialize: ($serialized) {
      return _$auth_exception.AuthWeakPasswordException(
        message: ($serialized[r'message'] as String),
        statusCode: ($serialized[r'statusCode'] as String?),
        reasons: ($serialized[r'reasons'] as Iterable<Object?>)
            .map((el) => (el as String))
            .toList(),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$auth_user.AuthUser, Map<String, dynamic>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$auth_user.AuthUser(
        id: ($serialized[r'id'] as String),
        appMetadata: ($serialized[r'appMetadata'] as Map<String, Object?>),
        userMetadata: ($serialized[r'userMetadata'] as Map<String, Object?>?),
        aud: ($serialized[r'aud'] as String),
        email: ($serialized[r'email'] as String?),
        phone: ($serialized[r'phone'] as String?),
        createdAt: ($serialized[r'createdAt'] as String),
        confirmedAt: ($serialized[r'confirmedAt'] as String?),
        emailConfirmedAt: ($serialized[r'emailConfirmedAt'] as String?),
        phoneConfirmedAt: ($serialized[r'phoneConfirmedAt'] as String?),
        lastSignInAt: ($serialized[r'lastSignInAt'] as String?),
        role: ($serialized[r'role'] as String?),
        updatedAt: ($serialized[r'updatedAt'] as String?),
      );
    },
  ));
}

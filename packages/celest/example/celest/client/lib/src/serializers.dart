// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest_backend/exceptions/bad_name_exception.dart'
    as _$bad_name_exception;
import 'package:celest_backend/models/person.dart' as _$person;
import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';

void initSerializers() {
  Serializers.instance.put(Serializer.define<
      _$bad_name_exception.BadNameException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return _$bad_name_exception.BadNameException(
          ($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$person.Person, Map<String, Object?>>(
    serialize: ($value) => {r'name': $value.name},
    deserialize: ($serialized) {
      return _$person.Person(name: ($serialized[r'name'] as String));
    },
  ));
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
}

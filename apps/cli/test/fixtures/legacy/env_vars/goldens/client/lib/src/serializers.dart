// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:celest_backend/models/person.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;

void initSerializers() {
  _$celest.Serializers.instance
      .put(_$celest.Serializer.define<Person, Map<String, Object?>>(
    serialize: ($value) => {
      r'name': $value.name,
      r'age': $value.age,
      r'height': $value.height,
      r'weight': $value.weight,
      r'isCool': $value.isCool,
      r'website': _$celest.Serializers.instance.serialize<Uri>($value.website),
    },
    deserialize: ($serialized) {
      return Person(
        name: ($serialized[r'name'] as String),
        age: ($serialized[r'age'] as num).toInt(),
        height: ($serialized[r'height'] as num).toDouble(),
        weight: ($serialized[r'weight'] as num),
        isCool: ($serialized[r'isCool'] as bool),
        website: _$celest.Serializers.instance
            .deserialize<Uri>($serialized[r'website']),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.AbortedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.AbortedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.AlreadyExistsException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.AlreadyExistsException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.BadRequestException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.BadRequestException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.CancelledException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.CancelledException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.CloudException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.CloudException.fromJson($serialized);
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.DataLossError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.DataLossError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.DeadlineExceededError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.DeadlineExceededError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.FailedPreconditionException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.FailedPreconditionException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.InternalServerError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.InternalServerError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.NotFoundException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.NotFoundException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.OutOfRangeException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.OutOfRangeException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.PermissionDeniedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.PermissionDeniedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.ResourceExhaustedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.ResourceExhaustedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.UnauthorizedException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnauthorizedException(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.UnavailableError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnavailableError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.UnimplementedError, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnimplementedError(($serialized?[r'message'] as String?));
    },
  ));
  _$celest.Serializers.instance.put(
      _$celest.Serializer.define<_$celest.UnknownError, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.UnknownError(
        ($serialized[r'message'] as String?),
        details: _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
          $serialized[r'details'],
          const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
        ),
      );
    },
  ));
  _$celest.Serializers.instance.put(_$celest.Serializer.define<
      _$celest.SerializationException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'offset': $value.offset,
      r'source': $value.source,
      r'details': _$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
        $value.details,
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      ),
    },
    deserialize: ($serialized) {
      return _$celest.SerializationException(
          ($serialized[r'message'] as String));
    },
  ));
  _$celest.Serializers.instance.put(
    _$celest.Serializer.define<_$celest.JsonValue, Object>(
      serialize: ($value) => $value.value,
      deserialize: ($serialized) {
        return _$celest.JsonValue($serialized);
      },
    ),
    const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
  );
}

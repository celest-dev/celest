import 'dart:async';
import 'dart:typed_data';

import 'package:celest_core/celest_core.dart';
import 'package:celest_core/src/serialization/serializers/big_int_serializer.dart';
import 'package:celest_core/src/serialization/serializers/cloud_exception_serializer.dart';
import 'package:celest_core/src/serialization/serializers/date_time_serializer.dart';
import 'package:celest_core/src/serialization/serializers/duration_serializer.dart';
import 'package:celest_core/src/serialization/serializers/regexp_serializer.dart';
import 'package:celest_core/src/serialization/serializers/stack_trace_serializer.dart';
import 'package:celest_core/src/serialization/serializers/uint8list_serializer.dart';
import 'package:celest_core/src/serialization/serializers/uri_data_serializer.dart';
import 'package:celest_core/src/serialization/serializers/uri_serializer.dart';
import 'package:celest_core/src/util/let.dart';
import 'package:meta/meta.dart';

/// {@template celest_core.serialization.serializer}
/// A JSON serializer for a [Dart] type.
/// {@endtemplate}
abstract base class Serializer<Dart extends Object?> {
  /// {@macro celest_core.serialization.serializer}
  const Serializer();

  /// Serializes [value] to the wire type.
  Object? serialize(Dart value);

  /// Deserializes [value] to [Dart].
  Dart deserialize(Object? value);

  /// Casts [value] to the wire type and throws a [SerializationException] if
  /// [value] is not of type [T].
  ///
  /// This is used by serializers to assert that the incoming [value] for
  /// deserialization is of the correct type.
  @protected
  @nonVirtual
  T assertWireType<T>(Object? value) {
    if (value is! T) {
      throw SerializationException(
        '$runtimeType expected $T, got ${value.runtimeType}: $value',
      );
    }
    return value;
  }
}

typedef _Nullable<T> = T?;
bool _isNullable<T>() => null is T;

/// A collection of [Serializer]s which is used as a hub to [serialize] and
/// [deserialize] values of various types.
abstract mixin class Serializers {
  /// Creates a new [Serializers] instance with a set of built-in [Serializer]s.
  factory Serializers() => _Serializers();

  const Serializers._();

  /// The current [Serializers] instance.
  static Serializers get instance =>
      Zone.current[Serializers] as Serializers? ?? _instance;
  static final Serializers _instance = Serializers();

  /// Serializes [value] to the wire type.
  Object? serialize<T>(T value) {
    final serializer = expect<T>();
    return _isNullable<T>()
        ? value?.let(serializer.serialize)
        : serializer.serialize(value);
  }

  /// Deserializes [value] to [T].
  T deserialize<T>(Object? value) {
    final serializer = expect<T>();
    return _isNullable<T>()
        ? value?.let(serializer.deserialize) as T
        : serializer.deserialize(value);
  }

  /// Gets the [Serializer] for type [Dart].
  Serializer<Dart>? get<Dart>();

  /// Gets the [Serializer] for type [Dart] and asserts its existence.
  Serializer<Dart> expect<Dart>();

  /// Puts a [Serializer] for type [Dart].
  ///
  /// Returns the previously registered [Serializer] if it existed.
  Serializer<Dart>? put<Dart>(Serializer<Dart> serializer);
}

final class _Serializers extends Serializers {
  _Serializers() : super._() {
    put<BigInt>(const BigIntSerializer());
    put<DateTime>(const DateTimeSerializer());
    put<Duration>(const DurationSerializer());
    put<RegExp>(const RegExpSerializer());
    put<StackTrace>(const StackTraceSerializer());
    put<Uri>(const UriSerializer());
    put<UriData>(const UriDataSerializer());
    put<Uint8List>(const Uint8ListSerializer());
    put<BadRequestException>(const BadRequestExceptionSerializer());
    put<InternalServerException>(const InternalServerExceptionSerializer());
  }

  final _serializersByType = <Type, Serializer>{};

  @override
  Serializer<Dart> expect<Dart>() {
    final serializer = get<Dart>();
    if (serializer == null) {
      throw SerializationException(
        'No serializer found for $Dart. Did you forget to put() it?',
      );
    }
    return serializer;
  }

  @override
  Serializer<Dart>? get<Dart>() =>
      _serializersByType[Dart] as Serializer<Dart>?;

  @override
  Serializer<Dart>? put<Dart>(Serializer<Dart> serializer) {
    final existing = get<Dart>();
    _serializersByType[Dart] = serializer;
    _serializersByType[_Nullable<Dart>] = serializer;
    return existing;
  }
}

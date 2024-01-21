import 'dart:collection';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// A wrapper over a JSON value.
///
/// Subclasses of this type are guaranteed to be one of the six JSON types.
/// - [String] -> [JsonString]
/// - [int] -> [JsonInt]
/// - [double] -> [JsonDouble]
/// - [bool] -> [JsonBool]
/// - [List] -> [JsonList]
/// - [Map] -> [JsonMap]
/// - `null` -> `null`
///
/// **Note**: While JSON does not distinguish between [int] and [double] types,
/// this class does. This is because [int] and [double] are not interchangeable
/// in Dart and we want to preserve the type information.
@immutable
sealed class JsonValue {
  const JsonValue._();

  /// Creates a [JsonString] from [value].
  const factory JsonValue.string(String value) = JsonString;

  /// Creates a [JsonInt] from [value].
  const factory JsonValue.int(int value) = JsonInt;

  /// Creates a [JsonDouble] from [value].
  const factory JsonValue.double(double value) = JsonDouble;

  /// Creates a [JsonBool] from [value].
  const factory JsonValue.bool(bool value) = JsonBool;

  /// Creates a [JsonList] from [value].
  const factory JsonValue.list(List<Object?> value) = JsonList;

  /// Creates a [JsonMap] from [value].
  const factory JsonValue.map(Map<String, Object?> value) = JsonMap;

  /// Creates a [JsonValue] from [value].
  static JsonValue? from(Object? value) {
    return switch (value) {
      null => null,
      JsonValue() => value,
      String() => JsonString(value),
      int() => JsonInt(value),
      double() => JsonDouble(value),
      bool() => JsonBool(value),
      List<Object?>() => JsonList(value),
      Map<String, Object?>() => JsonMap(value),
      Map() => JsonMap(value.cast()),
      _ => throw FormatException(
          'Unsupported JSON value: $value (${value.runtimeType})',
        ),
    };
  }

  /// The wrapped JSON value.
  Object? get wrapped;
  List<String> get _path;

  T _expect<T>(String key, Object? value) {
    if (value is T) {
      return value;
    }
    throw FormatException(
      'Expected $T for key "${[..._path, key].join('.')}" but got: $value',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JsonValue && wrapped == other.wrapped;

  @override
  int get hashCode => wrapped.hashCode;

  @override
  String toString() => wrapped.toString();
}

/// A [JsonValue] which is guaranteed to be a [String].
final class JsonString extends JsonValue {
  /// Creates a [JsonString] from [wrapped].
  const JsonString(this.wrapped)
      : _path = const [],
        super._();

  const JsonString._(this.wrapped, [this._path = const []]) : super._();

  @override
  final String wrapped;

  @override
  final List<String> _path;
}

/// A [JsonValue] which is guaranteed to be a [num].
mixin JsonNum on JsonValue {
  @override
  num get wrapped;

  /// Converts this [JsonNum] to an [JsonInt].
  JsonInt toInt() => JsonInt._(wrapped.toInt(), _path);

  /// Converts this [JsonNum] to an [JsonDouble].
  JsonDouble toDouble() => JsonDouble._(wrapped.toDouble(), _path);
}

/// A [JsonValue] which is guaranteed to be an [int].
final class JsonInt extends JsonValue with JsonNum {
  /// Creates a [JsonInt] from [wrapped].
  const JsonInt(this.wrapped)
      : _path = const [],
        super._();

  const JsonInt._(this.wrapped, [this._path = const []]) : super._();

  @override
  final int wrapped;

  @override
  final List<String> _path;
}

/// A [JsonValue] which is guaranteed to be a [double].
final class JsonDouble extends JsonValue with JsonNum {
  /// Creates a [JsonDouble] from [wrapped].
  const JsonDouble(this.wrapped)
      : _path = const [],
        super._();

  const JsonDouble._(this.wrapped, [this._path = const []]) : super._();

  @override
  final double wrapped;

  @override
  final List<String> _path;
}

/// A [JsonValue] which is guaranteed to be a [bool].
final class JsonBool extends JsonValue {
  /// Creates a [JsonBool] from [wrapped].
  const JsonBool(this.wrapped)
      : _path = const [],
        super._();

  const JsonBool._(this.wrapped, [this._path = const []]) : super._();

  @override
  final bool wrapped;

  @override
  final List<String> _path;
}

/// A [JsonValue] which is guaranteed to be a [List].
final class JsonList extends JsonValue with ListMixin<JsonValue?> {
  /// Creates a [JsonList] from [wrapped].
  const JsonList(this.wrapped)
      : _path = const [],
        super._();

  const JsonList._(this.wrapped, [this._path = const []]) : super._();

  @override
  final List<Object?> wrapped;

  @override
  final List<String> _path;

  @override
  int get length => wrapped.length;

  @override
  set length(int length) => wrapped.length = length;

  @override
  JsonValue? operator [](int index) => JsonValue.from(wrapped[index]);

  @override
  void operator []=(int index, JsonValue? value) {
    wrapped[index] = value?.wrapped;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonList && _deepEquals(wrapped, other.wrapped);

  @override
  int get hashCode => _deepHash(wrapped);

  @override
  String toString() => _jsonEncoder.convert(wrapped);
}

/// A [JsonValue] which is guaranteed to be a [Map].
final class JsonMap extends JsonValue with MapMixin<String, JsonValue?> {
  /// Creates a [JsonMap] from [wrapped].
  const JsonMap(this.wrapped)
      : _path = const [],
        super._();

  const JsonMap._(this.wrapped, [this._path = const []]) : super._();

  @override
  final Map<String, Object?> wrapped;

  @override
  final List<String> _path;

  /// Returns the string associated with [key] or `null` if [key] is not in the
  /// map.
  JsonString? optionalString(String key) {
    if (wrapped[key] case final value?) {
      return JsonString._(_expect(key, value), [..._path, key]);
    }
    return null;
  }

  /// Returns the string associated with [key] or throws if [key] is not in the
  /// map or if [key] is not a string.
  JsonString requiredString(String key) {
    return _expect(key, optionalString(key));
  }

  /// Returns the int associated with [key] or `null` if [key] is not in the
  /// map.
  JsonInt? optionalInt(String key) {
    if (wrapped[key] case final value?) {
      return JsonInt._(_expect<num>(key, value).toInt(), [..._path, key]);
    }
    return null;
  }

  /// Returns the int associated with [key] or throws if [key] is not in the
  /// map or if [key] is not an int.
  JsonInt requiredInt(String key) {
    return _expect(key, optionalInt(key));
  }

  /// Returns the double associated with [key] or `null` if [key] is not in the
  /// map.
  JsonDouble? optionalDouble(String key) {
    if (wrapped[key] case final value?) {
      return JsonDouble._(_expect<num>(key, value).toDouble(), [..._path, key]);
    }
    return null;
  }

  /// Returns the double associated with [key] or throws if [key] is not in the
  /// map or if [key] is not a double.
  JsonDouble requiredDouble(String key) {
    return _expect(key, optionalDouble(key));
  }

  /// Returns the bool associated with [key] or `null` if [key] is not in the
  /// map.
  JsonBool? optionalBool(String key) {
    if (wrapped[key] case final value?) {
      return JsonBool._(_expect(key, value), [..._path, key]);
    }
    return null;
  }

  /// Returns the bool associated with [key] or throws if [key] is not in the
  /// map or if [key] is not a bool.
  JsonBool requiredBool(String key) {
    return _expect(key, optionalBool(key));
  }

  /// Returns the list associated with [key] or `null` if [key] is not in the
  /// map.
  JsonList? optionalList(String key) {
    if (wrapped[key] case final value?) {
      return JsonList._(_expect(key, value), [..._path, key]);
    }
    return null;
  }

  /// Returns the list associated with [key] or throws if [key] is not in the
  /// map or if [key] is not a list.
  JsonList requiredList(String key) {
    return _expect(key, optionalList(key));
  }

  /// Returns the map associated with [key] or `null` if [key] is not in the
  /// map.
  JsonMap? optionalMap(String key) {
    if (wrapped[key] case final value?) {
      return JsonMap._(
        switch (value) {
          Map<String, Object?>() => value,
          _ => _expect<Map<Object?, Object?>>(key, value).cast(),
        },
        [..._path, key],
      );
    }
    return null;
  }

  /// Returns the map associated with [key] or throws if [key] is not in the
  /// map or if [key] is not a map.
  JsonMap requiredMap(String key) {
    return _expect(key, optionalMap(key));
  }

  @override
  JsonValue? operator [](Object? key) => JsonValue.from(wrapped[key]);

  @override
  void operator []=(String key, JsonValue? value) {
    wrapped[key] = value?.wrapped;
  }

  @override
  void clear() => wrapped.clear();

  @override
  Iterable<String> get keys => wrapped.keys;

  @override
  JsonValue? remove(Object? key) => JsonValue.from(wrapped.remove(key));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsonMap && _deepEquals(wrapped, other.wrapped);

  @override
  int get hashCode => _deepHash(wrapped);

  @override
  String toString() => _jsonEncoder.convert(wrapped);
}

const _jsonEncoder = JsonEncoder.withIndent('  ');
bool _deepEquals(Object? a, Object? b) =>
    const DeepCollectionEquality().equals(a, b);
int _deepHash(Object? a) => const DeepCollectionEquality().hash(a);

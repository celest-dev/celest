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
extension type const JsonValue._(Object value) {
  factory JsonValue(Object value) {
    return switch (value) {
      String() || num() || bool() || List() || Map() => value as JsonValue,
      _ => throw FormatException(
          'Unsupported JSON value: $value (${value.runtimeType})',
        ),
    };
  }

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

  T _expect<T>(String key, Object? value) {
    if (value is T) {
      return value;
    }
    throw FormatException('Expected $T for key "$key" but got: $value');
  }
}

/// A [JsonValue] which represents a [String].
extension type const JsonString(String value) implements JsonValue, String {}

/// A [JsonValue] which represents a [num].
extension type const JsonNum(num value) implements JsonValue, num {
  /// Converts this to a [JsonInt].
  JsonInt toInt() => JsonInt(value.toInt());

  /// Converts this to a [JsonDouble].
  JsonDouble toDouble() => JsonDouble(value.toDouble());
}

/// A [JsonValue] which represents an [int].
extension type const JsonInt(int value) implements JsonNum, int {
  @redeclare
  JsonInt toInt() => this;

  @redeclare
  JsonDouble toDouble() => JsonDouble(value.toDouble());
}

/// A [JsonValue] which represents a [double].
extension type const JsonDouble(double value) implements JsonNum, double {
  @redeclare
  JsonInt toInt() => JsonInt(value.toInt());

  @redeclare
  JsonDouble toDouble() => this;
}

/// A [JsonValue] which represents a [bool].
extension type const JsonBool(bool value) implements JsonValue, bool {}

/// A [JsonValue] which represents a [List].
extension type const JsonList._(List<JsonValue?> value)
    implements JsonValue, List<JsonValue?> {
  const JsonList(List<Object?> value) : this._(value as List<JsonValue?>);
}

/// A [JsonValue] which represents a [Map].
extension type const JsonMap._(Map<String, JsonValue?> value)
    implements JsonValue, Map<String, JsonValue?> {
  const JsonMap(Map<String, Object?> value)
      : this._(value as Map<String, JsonValue?>);

  /// Returns the string associated with [key] or `null` if [key] is not in the
  /// map.
  JsonString? optionalString(String key) {
    if (value[key] case final value?) {
      return JsonString(_expect(key, value));
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
    if (value[key] case final value?) {
      return JsonInt(_expect<num>(key, value).toInt());
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
    if (value[key] case final value?) {
      return JsonDouble(_expect<num>(key, value).toDouble());
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
    if (value[key] case final value?) {
      return JsonBool(_expect(key, value));
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
    if (value[key] case final value?) {
      return JsonList(_expect(key, value));
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
    if (value[key] case final value?) {
      return JsonMap(_expect(key, value));
    }
    return null;
  }

  /// Returns the map associated with [key] or throws if [key] is not in the
  /// map or if [key] is not a map.
  JsonMap requiredMap(String key) {
    return _expect(key, optionalMap(key));
  }
}

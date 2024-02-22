import 'package:_common/src/models/cash_balance.dart';
import 'package:_common/src/models/errors_and_exceptions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

typedef Json = Map<String, dynamic>;
typedef JsonList = List<dynamic>;

extension MapDeserializeExtension on Json {
  //

  /// If you don't provide [T] you'll get a dynamic List. That's fast, but that almost never
  /// what you want. So you should use it if you are going to transform the result anyway.
  ///
  /// If you write json.asList(key) you will get a List<dynamic>
  /// If you write json.asList<String>(key) you will get a List<String>
  /// If you write json.asList<int>(key) you will get a List<int>
  ///
  List<T> asList<T>(String key) {
    //
    List<dynamic>? value = this[key];
    value ??= <T>[];

    // Note: toList is not necessary, but I want to fail right away in case any
    // of the values is not as requested. This will also speed up the reads a bit.
    if (value is! List<T>) value = value.cast<T>().toList();

    return value;
  }

  /// If you don't provide [T] you'll get a dynamic List. That's fast, but that almost never
  /// what you want. So you should use it if you are going to transform the result anyway.
  ///
  /// If you write json.asList(key) you will get a List<dynamic>
  /// If you write json.asList<String>(key) you will get a List<String>
  /// If you write json.asList<int>(key) you will get a List<int>
  ///
  IList<T> asIList<T>(String key) => asList<T>(key).lockUnsafe;

  /// The source in [key] must be a List<Json>. It will be converted to IList of [T] by [fromJson].
  IList<T> asIListOf<T>(String key, T fromJson(Json json)) =>
      asListOfJson(key).map(fromJson).toIList();

  /// The source in [key] must be a List<Json>. It will be converted to List of [T] by [fromJson].
  List<T> asListOf<T>(String key, T fromJson(Json json)) =>
      asListOfJson(key).map(fromJson).toList();

  /// If possible, prefer using [asIListOf] or [asListOf].
  List<Json> asListOfJson(String key) => asList(key).cast<Json>();

  String? asString(String key) => this[key];

  String asStringOrEmpty(String key) => this[key] ?? '';

  int? asInt(String key) {
    dynamic value = this[key];
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return _toIntNullable(value);
    throw ValidateError('Cant accept ${value.runtimeType} as int.');
  }

  double? asDouble(String key) {
    dynamic value = this[key];
    if (value == null) return null;
    if (value is double) return value;
    if (value is String) return _toDoubleNullable(value);
    throw ValidateError('Cant accept ${value.runtimeType} as double.');
  }

  bool? asBool(String key) {
    //
    dynamic value = this[key];

    if (value == null) return null;

    if (value is String) {
      if (value == 'false') return false;
      if (value == 'true') return true;
    }

    if (value is! bool) throw ValidateError('Value is not bool: "$value".');
    return value;
  }

  Json asMap(String key) {
    //
    var result = this[key];

    if (result == null)
      return const {};
    else if (result is Json)
      return result;
    else if (result is Map)
      return result.cast<String, dynamic>();
    else
      throw ValidateError('Cant accept ${result.runtimeType} as Json.');
  }

  IMap<String, V> asIMap<V>(String key) {
    var map = asMap(key);
    return map.cast<String, V>().lock;
  }

  CashBalance? asCashBalance(String key) {
    var value = this[key];
    return (value == null) ? null : CashBalance.fromJson(value);
  }
}

int? _toIntNullable(String? intString) {
  if (intString == null) return null;
  try {
    // if receive a decimal, then remove decimal so int parse doesn't fail
    List<String> valueParts = intString.split('.');
    String intNumberPart = valueParts.first;

    return int.parse(intNumberPart);
  } catch (error) {
    return null;
  }
}

double? _toDoubleNullable(String? doubleString) {
  if (doubleString == null)
    return null;
  else
    return double.tryParse(doubleString);
}

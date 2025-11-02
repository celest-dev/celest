// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const JsonType _$array = const JsonType._('array');
const JsonType _$object = const JsonType._('object');
const JsonType _$boolean = const JsonType._('boolean');
const JsonType _$number = const JsonType._('number');
const JsonType _$integer = const JsonType._('integer');
const JsonType _$string = const JsonType._('string');
const JsonType _$null$ = const JsonType._('null\$');

JsonType _$JsonTypeValueOf(String name) {
  switch (name) {
    case 'array':
      return _$array;
    case 'object':
      return _$object;
    case 'boolean':
      return _$boolean;
    case 'number':
      return _$number;
    case 'integer':
      return _$integer;
    case 'string':
      return _$string;
    case 'null\$':
      return _$null$;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<JsonType> _$JsonTypeValues =
    new BuiltSet<JsonType>(const <JsonType>[
  _$array,
  _$object,
  _$boolean,
  _$number,
  _$integer,
  _$string,
  _$null$,
]);

Serializer<JsonType> _$jsonTypeSerializer = new _$JsonTypeSerializer();

class _$JsonTypeSerializer implements PrimitiveSerializer<JsonType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'null\$': 'null',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'null': 'null\$',
  };

  @override
  final Iterable<Type> types = const <Type>[JsonType];
  @override
  final String wireName = 'JsonType';

  @override
  Object serialize(Serializers serializers, JsonType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  JsonType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      JsonType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

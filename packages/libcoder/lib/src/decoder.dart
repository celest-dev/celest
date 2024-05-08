import 'package:libcoder/libcoder.dart';

abstract mixin class Decoder<V extends Object?> {
  const Decoder();

  KeyedDecodingContainer<Key, V> container<Key extends Object>(
    V value, {
    CoderKeys<Key>? keyedBy,
  });
  SingleValueDecodingContainer<V> singleValueContainer(V value);
  UnkeyedDecodingContainer<V> unkeyedContainer(V value);

  T decode<T extends Object>(V value, {Typeref<T>? as});
  bool decodeBool(V value);
  int decodeInt(V value);
  double decodeDouble(V value);
  String decodeString(V value);
  DateTime decodeDateTime(V value);
}

abstract mixin class SingleValueDecodingContainer<V extends Object?> {
  Decoder<V> get decoder;

  T decode<T extends Object>({Typeref<T>? as});
  bool decodeNull();
  bool decodeBool();
  int decodeInt();
  double decodeDouble();
  String decodeString();
  DateTime decodeDateTime();

  V get value;
}

abstract interface class KeyedDecodingContainer<K extends Object?,
    V extends Object?> {
  Decoder<V> get decoder;

  KeyedDecodingContainer<NestedKey, V>
      nestedContainer<NestedKey extends Object>(
    K key, {
    CoderKeys<NestedKey>? keyedBy,
  });
  SingleValueDecodingContainer<V> nestedSingleValueContainer(K key);
  UnkeyedDecodingContainer<V> nestedUnkeyedContainer(K key);

  T decode<T extends Object>(K key, {Typeref<T>? as});
  bool decodeNull(K key);
  bool decodeBool(K key);
  int decodeInt(K key);
  double decodeDouble(K key);
  String decodeString(K key);
  DateTime decodeDateTime(K key);

  V get value;
}

abstract interface class UnkeyedDecodingContainer<V extends Object?> {
  Decoder<V> get decoder;

  KeyedDecodingContainer<Key, V> nestedContainer<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  });
  SingleValueDecodingContainer<V> nestedSingleValueContainer();
  UnkeyedDecodingContainer<V> nestedUnkeyedContainer();

  T decode<T extends Object>({Typeref<T>? as});
  bool decodeNull();
  String decodeString();
  int decodeInt();
  double decodeDouble();
  bool decodeBool();
  DateTime decodeDateTime();

  V get value;
}

import 'package:libcoder/libcoder.dart';

abstract mixin class Encoder<V extends Object?> {
  const Encoder();

  KeyedEncodingContainer<Key, V> container<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  });
  SingleValueEncodingContainer<V> singleValueContainer();
  UnkeyedEncodingContainer<V> unkeyedContainer();

  V encode<T extends Object>(T value, {Typeref<T>? as});
  V encodeNull();
  V encodeBool(bool value);
  V encodeInt(int value);
  V encodeDouble(double value);
  V encodeString(String value);
  V encodeDateTime(DateTime value);
  V encodePrimitive(Object value);
}

abstract mixin class SingleValueEncodingContainer<V extends Object?> {
  Encoder<V> get encoder;

  void encode<T extends Object>(T value, {Typeref<T>? as});
  void encodeNull();
  void encodeBool(bool value);
  void encodeInt(int value);
  void encodeDouble(double value);
  void encodeString(String value);
  void encodeDateTime(DateTime value);
  void encodePrimitive(Object value);

  V get value;
  set value(covariant V value);
}

abstract interface class KeyedEncodingContainer<K extends Object,
    V extends Object?> {
  Encoder<V> get encoder;

  KeyedEncodingContainer<NestedKey, V>
      nestedContainer<NestedKey extends Object>(
    K key, {
    CoderKeys<NestedKey>? keyedBy,
  });
  SingleValueEncodingContainer<V> nestedSingleValueContainer(K key);
  UnkeyedEncodingContainer<V> nestedUnkeyedContainer(K key);

  void encode<T extends Object>(K key, T value, {Typeref<T>? as});
  void encodeNull(K key, [Null value]);
  void encodeString(K key, String value);
  void encodeInt(K key, int value);
  void encodeDouble(K key, double value);
  void encodeBool(K key, bool value);
  void encodeDateTime(K key, DateTime value);
  void encodePrimitive(K key, Object value);
  void encodeList(
    K key,
    void Function(UnkeyedEncodingContainer<V> container) callback,
  );
  void encodeMap<NestedKey extends Object>(
    K key,
    void Function(KeyedEncodingContainer<NestedKey, V> container) callback, {
    CoderKeys<NestedKey>? keyedBy,
  });

  V get value;
  set value(covariant V value);
}

abstract interface class UnkeyedEncodingContainer<V extends Object?> {
  Encoder<V> get encoder;

  KeyedEncodingContainer<Key, V> nestedContainer<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  });
  SingleValueEncodingContainer<V> nestedSingleValueContainer();
  UnkeyedEncodingContainer<V> nestedUnkeyedContainer();

  void encode<T extends Object>(T value, {Typeref<T>? as});
  void encodeNull();
  void encodeBool(bool value);
  void encodeInt(int value);
  void encodeDouble(double value);
  void encodeString(String value);
  void encodeDateTime(DateTime value);
  void encodePrimitive(Object value);
  void encodeList(
    void Function(UnkeyedEncodingContainer<V> container) callback,
  );
  void encodeMap<NestedKey extends Object>(
    void Function(KeyedEncodingContainer<NestedKey, V> container) callback, {
    CoderKeys<NestedKey>? keyedBy,
  });

  V get value;
  set value(covariant V value);
}

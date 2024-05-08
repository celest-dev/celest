import 'package:libcoder/libcoder.dart';

final class JsonDecoder extends Decoder<Object?> {
  JsonDecoder({
    required GlobalCoder coder,
  }) : _coder = coder;

  final GlobalCoder _coder;

  @override
  T decode<T extends Object>(Object? value, {Typeref<T>? as}) {
    final config = _coder.configFor<T>(type: as);
    return config.decode(value, this);
  }

  @override
  bool decodeBool(Object? value) => value as bool;

  @override
  DateTime decodeDateTime(Object? value) {
    final milliseconds = (value as num).toInt();
    return DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
  }

  @override
  double decodeDouble(Object? value) {
    return (value as num).toDouble();
  }

  @override
  int decodeInt(Object? value) {
    return (value as num).toInt();
  }

  @override
  String decodeString(Object? value) {
    return value as String;
  }

  @override
  JsonMapDecodingContainer<Key> container<Key extends Object>(
    Object? value, {
    CoderKeys<Key>? keyedBy,
  }) {
    return JsonMapDecodingContainer._(
      decoder: this,
      value: (value as Map).cast<String, Object?>(),
      coderKeys: keyedBy ?? CoderKeys<Key>.identity(),
    );
  }

  @override
  JsonValueDecodingContainer singleValueContainer(
    Object? value,
  ) {
    return JsonValueDecodingContainer._(
      decoder: this,
      value: value,
    );
  }

  @override
  JsonListDecodingContainer unkeyedContainer(Object? value) {
    return JsonListDecodingContainer._(
      decoder: this,
      value: (value as List).cast<Object?>(),
    );
  }
}

final class JsonMapDecodingContainer<Key extends Object>
    implements KeyedDecodingContainer<Key, Object?> {
  JsonMapDecodingContainer._({
    required this.decoder,
    required this.value,
    required CoderKeys<Key> coderKeys,
  }) : _coderKeys = coderKeys;

  final CoderKeys<Key> _coderKeys;

  @override
  final JsonDecoder decoder;

  @override
  final Map<String, Object?> value;

  @override
  T decode<T extends Object>(
    Key key, {
    Typeref<T>? as,
  }) {
    final codingKey = _coderKeys.keyFor(key);
    return decoder.decode(value[codingKey], as: as);
  }

  @override
  bool decodeBool(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return decoder.decodeBool(value[codingKey]);
  }

  @override
  DateTime decodeDateTime(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return decoder.decodeDateTime(value[codingKey]);
  }

  @override
  double decodeDouble(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return decoder.decodeDouble(value[codingKey]);
  }

  @override
  int decodeInt(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return decoder.decodeInt(value[codingKey]);
  }

  @override
  bool decodeNull(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return value.containsKey(codingKey) && value[codingKey] == null;
  }

  @override
  String decodeString(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return decoder.decodeString(value[codingKey]);
  }

  @override
  JsonMapDecodingContainer<NestedKey> nestedContainer<NestedKey extends Object>(
    Key key, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final codingKey = _coderKeys.keyFor(key);
    return JsonMapDecodingContainer<NestedKey>._(
      decoder: decoder,
      value: (value[codingKey] as Map).cast<String, Object?>(),
      coderKeys: keyedBy ?? CoderKeys<NestedKey>.identity(),
    );
  }

  @override
  JsonListDecodingContainer nestedUnkeyedContainer(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return JsonListDecodingContainer._(
      decoder: decoder,
      value: value[codingKey] as List<Object?>,
    );
  }

  @override
  JsonValueDecodingContainer nestedSingleValueContainer(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return JsonValueDecodingContainer._(
      decoder: decoder,
      value: value[codingKey],
    );
  }
}

final class JsonListDecodingContainer
    implements UnkeyedDecodingContainer<Object?> {
  JsonListDecodingContainer._({
    required this.decoder,
    required this.value,
  });

  @override
  final JsonDecoder decoder;

  @override
  final List<Object?> value;

  var _index = 0;

  @override
  T decode<T extends Object>({Typeref<T>? as}) {
    return decoder.decode(value[_index++], as: as);
  }

  @override
  bool decodeBool() {
    return decoder.decodeBool(value[_index++]);
  }

  @override
  DateTime decodeDateTime() {
    return decoder.decodeDateTime(value[_index++]);
  }

  @override
  double decodeDouble() {
    return decoder.decodeDouble(value[_index++]);
  }

  @override
  int decodeInt() {
    return decoder.decodeInt(value[_index++]);
  }

  @override
  bool decodeNull() {
    return value[_index++] == null;
  }

  @override
  String decodeString() {
    return decoder.decodeString(value[_index++]);
  }

  @override
  JsonMapDecodingContainer<Key> nestedContainer<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  }) {
    return JsonMapDecodingContainer<Key>._(
      decoder: decoder,
      value: (value[_index++] as Map).cast<String, Object?>(),
      coderKeys: keyedBy ?? CoderKeys<Key>.identity(),
    );
  }

  @override
  JsonListDecodingContainer nestedUnkeyedContainer() {
    return JsonListDecodingContainer._(
      decoder: decoder,
      value: value[_index++] as List<Object?>,
    );
  }

  @override
  JsonValueDecodingContainer nestedSingleValueContainer() {
    return JsonValueDecodingContainer._(
      decoder: decoder,
      value: value[_index++],
    );
  }
}

final class JsonValueDecodingContainer
    implements SingleValueDecodingContainer<Object?> {
  JsonValueDecodingContainer._({
    required this.decoder,
    required this.value,
  });

  @override
  final JsonDecoder decoder;

  @override
  final Object? value;

  @override
  T decode<T extends Object>({Typeref<T>? as}) {
    return decoder.decode(value, as: as);
  }

  @override
  bool decodeBool() {
    return decoder.decodeBool(value);
  }

  @override
  DateTime decodeDateTime() {
    return decoder.decodeDateTime(value);
  }

  @override
  double decodeDouble() {
    return decoder.decodeDouble(value);
  }

  @override
  int decodeInt() {
    return decoder.decodeInt(value);
  }

  @override
  bool decodeNull() {
    return value == null;
  }

  @override
  String decodeString() {
    return decoder.decodeString(value);
  }
}

import 'package:libcoder/libcoder.dart';

final class JsonEncoder extends Encoder<Object?> {
  JsonEncoder({
    required GlobalCoder coder,
  }) : _coder = coder;

  final GlobalCoder _coder;

  @override
  JsonValueEncodingContainer singleValueContainer() {
    return JsonValueEncodingContainer._(encoder: this);
  }

  @override
  JsonListEncodingContainer unkeyedContainer() {
    return JsonListEncodingContainer._(encoder: this);
  }

  @override
  JsonMapEncodingContainer<Key> container<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  }) {
    return JsonMapEncodingContainer<Key>._(
      encoder: this,
      coderKeys: keyedBy ?? CoderKeys<Key>.identity(),
    );
  }

  @override
  Object? encode<T extends Object>(
    T value, {
    Typeref<T>? as,
  }) {
    final config = _coder.configFor<T>(type: as);
    return config.encode(value, this);
  }

  @override
  Object? encodeBool(bool value) => value;

  @override
  Object? encodeDateTime(DateTime value) =>
      value.toUtc().millisecondsSinceEpoch;

  @override
  Object? encodeDouble(double value) => value;

  @override
  Object? encodeInt(int value) => value;

  @override
  Object? encodeNull() => null;

  @override
  Object? encodeString(String value) => value;

  @override
  Object? encodePrimitive(Object value) => value;
}

final class JsonMapEncodingContainer<Key extends Object>
    implements KeyedEncodingContainer<Key, Object?> {
  JsonMapEncodingContainer._({
    required this.encoder,
    required CoderKeys<Key> coderKeys,
    Map<String, Object?>? value,
  })  : _value = value ?? {},
        _coderKeys = coderKeys;

  @override
  final JsonEncoder encoder;

  final CoderKeys<Key> _coderKeys;

  @override
  JsonValueEncodingContainer nestedSingleValueContainer(Key key) {
    return JsonValueEncodingContainer._(
      encoder: encoder,
      sink: (value) => _value[_coderKeys.keyFor(key)] = value,
    );
  }

  @override
  JsonMapEncodingContainer<NestedKey> nestedContainer<NestedKey extends Object>(
    Key key, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final value = <String, Object?>{};
    _value[_coderKeys.keyFor(key)] = value;
    return JsonMapEncodingContainer<NestedKey>._(
      encoder: encoder,
      value: value,
      coderKeys: keyedBy ?? CoderKeys<NestedKey>.identity(),
    );
  }

  @override
  JsonListEncodingContainer nestedUnkeyedContainer(Key key) {
    final value = <Object?>[];
    _value[_coderKeys.keyFor(key)] = value;
    return JsonListEncodingContainer._(encoder: encoder, value: value);
  }

  Map<String, Object?> _value;

  @override
  Map<String, Object?> get value => _value;

  @override
  set value(Map<String, Object?> object) => _value = object;

  @override
  void encode<T extends Object>(
    Key key,
    T value, {
    Typeref<T>? as,
  }) {
    _value[_coderKeys.keyFor(key)] = encoder.encode(value, as: as);
  }

  @override
  void encodeNull(Key key, [Null value]) {
    _value[_coderKeys.keyFor(key)] = null;
  }

  @override
  void encodeBool(Key key, bool value) {
    _value[_coderKeys.keyFor(key)] = value;
  }

  @override
  void encodeDouble(Key key, double value) {
    _value[_coderKeys.keyFor(key)] = value;
  }

  @override
  void encodeInt(Key key, int value) {
    _value[_coderKeys.keyFor(key)] = value;
  }

  @override
  void encodeString(Key key, String value) {
    _value[_coderKeys.keyFor(key)] = value;
  }

  @override
  void encodeDateTime(Key key, DateTime value) {
    _value[_coderKeys.keyFor(key)] = value.millisecondsSinceEpoch;
  }

  @override
  void encodePrimitive(Key key, Object value) {
    _value[_coderKeys.keyFor(key)] = value;
  }

  @override
  void encodeList(
    Key key,
    void Function(JsonListEncodingContainer container) callback,
  ) {
    final container = JsonListEncodingContainer._(encoder: encoder);
    callback(container);
    _value[_coderKeys.keyFor(key)] = container.value;
  }

  @override
  void encodeMap<NestedKey extends Object>(
    Key key,
    void Function(JsonMapEncodingContainer<NestedKey> container) callback, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final container = JsonMapEncodingContainer<NestedKey>._(
      encoder: encoder,
      coderKeys: keyedBy ?? CoderKeys<NestedKey>.identity(),
    );
    callback(container);
    _value[_coderKeys.keyFor(key)] = container.value;
  }
}

final class JsonListEncodingContainer
    implements UnkeyedEncodingContainer<Object?> {
  JsonListEncodingContainer._({
    required this.encoder,
    List<Object?>? value,
  }) : _value = value ?? [];

  @override
  final JsonEncoder encoder;

  @override
  JsonValueEncodingContainer nestedSingleValueContainer() {
    return JsonValueEncodingContainer._(
      encoder: encoder,
      sink: (value) => _value.add(value),
    );
  }

  @override
  JsonMapEncodingContainer<NestedKey>
      nestedContainer<NestedKey extends Object>({
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final value = <String, Object?>{};
    _value.add(value);
    return JsonMapEncodingContainer<NestedKey>._(
      encoder: encoder,
      value: value,
      coderKeys: keyedBy ?? CoderKeys<NestedKey>.identity(),
    );
  }

  @override
  JsonListEncodingContainer nestedUnkeyedContainer() {
    final value = <Object?>[];
    _value.add(value);
    return JsonListEncodingContainer._(encoder: encoder, value: value);
  }

  List<Object?> _value;

  @override
  List<Object?> get value => _value;

  @override
  set value(List<Object?> object) => _value = object;

  @override
  void encode<T extends Object>(T value, {Typeref<T>? as}) {
    _value.add(encoder.encode(value, as: as));
  }

  @override
  void encodeNull([Null value]) {
    _value.add(null);
  }

  @override
  void encodeBool(bool value) {
    _value.add(value);
  }

  @override
  void encodeDouble(double value) {
    _value.add(value);
  }

  @override
  void encodeInt(int value) {
    _value.add(value);
  }

  @override
  void encodeString(String value) {
    _value.add(value);
  }

  @override
  void encodeDateTime(DateTime value) {
    _value.add(encoder.encodeDateTime(value));
  }

  @override
  void encodePrimitive(Object value) {
    _value.add(value);
  }

  @override
  void encodeList(
    void Function(JsonListEncodingContainer container) callback,
  ) {
    final container = JsonListEncodingContainer._(encoder: encoder);
    callback(container);
    _value.add(container.value);
  }

  @override
  void encodeMap<NestedKey extends Object>(
    void Function(JsonMapEncodingContainer<NestedKey> container) callback, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final container = JsonMapEncodingContainer<NestedKey>._(
      encoder: encoder,
      coderKeys: keyedBy ?? CoderKeys<NestedKey>.identity(),
    );
    callback(container);
    _value.add(container.value);
  }
}

typedef _JsonValueSink = void Function(Object? value);

final class JsonValueEncodingContainer
    implements SingleValueEncodingContainer<Object?> {
  JsonValueEncodingContainer._({
    required this.encoder,
    _JsonValueSink? sink,
  }) : _sink = sink;

  final _JsonValueSink? _sink;

  @override
  final JsonEncoder encoder;

  @override
  late final Object? value;

  @override
  void encode<T extends Object>(T value, {Typeref<T>? as}) {
    this.value = encoder.encode(value, as: as);
    _sink?.call(this.value);
  }

  @override
  void encodeNull([Null value]) {
    this.value = null;
    _sink?.call(this.value);
  }

  @override
  void encodeBool(bool value) {
    this.value = value;
    _sink?.call(this.value);
  }

  @override
  void encodeDouble(double value) {
    this.value = value;
    _sink?.call(this.value);
  }

  @override
  void encodeInt(int value) {
    this.value = value;
    _sink?.call(this.value);
  }

  @override
  void encodeString(String value) {
    this.value = value;
    _sink?.call(this.value);
  }

  @override
  void encodeDateTime(DateTime value) {
    this.value = encoder.encodeDateTime(value);
    _sink?.call(this.value);
  }

  @override
  void encodePrimitive(Object value) {
    this.value = value;
    _sink?.call(this.value);
  }
}

import 'package:libcoder/libcoder.dart';

final class FormDataEncoder extends Encoder<String> {
  FormDataEncoder({
    required GlobalCoder coder,
    String? key,
  })  : _key = key,
        _coder = coder;

  final String? _key;
  final GlobalCoder _coder;

  @override
  SingleValueEncodingContainer<String> singleValueContainer() {
    return _FormValueEncodingContainer(encoder: this);
  }

  @override
  UnkeyedEncodingContainer<String> unkeyedContainer() {
    if (_key == null) {
      throw StateError('Cannot create an unkeyed value container.');
    }
    return _FormFieldListContainer(
      key: _key,
      encoder: this,
    );
  }

  @override
  KeyedEncodingContainer<Key, String> container<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  }) {
    return _FormFieldsEncodingContainer<Key>._(
      key: _key,
      encoder: this,
      coderKeys: keyedBy ?? CoderKeys<Key>.identity(),
    );
  }

  @override
  String encode<T extends Object>(T value, {Typeref<T>? as}) {
    final config = _coder.configFor<T>(type: as);
    return config.encode(value, this);
  }

  @override
  String encodeBool(bool value) {
    return value.toString();
  }

  @override
  String encodeDateTime(DateTime value) {
    return value.millisecondsSinceEpoch.toString();
  }

  @override
  String encodeDouble(double value) {
    return value.toString();
  }

  @override
  String encodeInt(int value) {
    return value.toString();
  }

  @override
  String encodeNull() {
    return '';
  }

  @override
  String encodeString(String value) {
    return Uri.encodeQueryComponent(value);
  }

  @override
  String encodePrimitive(Object value) {
    if (value is String) {
      return encodeString(value);
    }
    return value.toString();
  }

  FormDataEncoder _withKey(String key) => FormDataEncoder(
        coder: _coder,
        key: key,
      );
}

final class _FormFieldsEncodingContainer<Key extends Object>
    implements KeyedEncodingContainer<Key, String> {
  _FormFieldsEncodingContainer._({
    required this.encoder,
    required CoderKeys<Key> coderKeys,
    StringBuffer? sink,
    String? key,
  })  : _key = key,
        _buffer = sink ?? StringBuffer(),
        _coderKeys = coderKeys;

  final String? _key;
  final StringBuffer _buffer;
  final CoderKeys<Key> _coderKeys;

  @override
  final FormDataEncoder encoder;

  @override
  String get value => _buffer.toString();

  @override
  set value(String value) {
    _buffer
      ..clear()
      ..write(value);
  }

  String _nextKey(Key key) {
    final codingKey = _coderKeys.keyFor(key);
    return _key == null ? codingKey : '$_key[$codingKey]';
  }

  @override
  void encode<T extends Object>(
    Key key,
    T value, {
    Typeref<T>? as,
  }) {
    final valueKey = _nextKey(key);
    _buffer.writeEncodedComponent(
      encoder._withKey(valueKey).encode(value, as: as),
    );
  }

  @override
  void encodeNull(Key key, [Null value]) {
    _buffer.writeComponent(_nextKey(key), encoder.encodeNull());
  }

  @override
  void encodeBool(Key key, bool value) {
    _buffer.writeComponent(_nextKey(key), encoder.encodeBool(value));
  }

  @override
  void encodeDouble(Key key, double value) {
    _buffer.writeComponent(_nextKey(key), encoder.encodeDouble(value));
  }

  @override
  void encodeInt(Key key, int value) {
    _buffer.writeComponent(_nextKey(key), encoder.encodeInt(value));
  }

  @override
  void encodeString(Key key, String value) {
    _buffer.writeComponent(_nextKey(key), encoder.encodeString(value));
  }

  @override
  void encodeDateTime(Key key, DateTime value) {
    _buffer.writeComponent(_nextKey(key), encoder.encodeDateTime(value));
  }

  @override
  void encodePrimitive(Key key, Object value) {
    _buffer.writeComponent(_nextKey(key), encoder.encodePrimitive(value));
  }

  @override
  void encodeList(
    Key key,
    void Function(UnkeyedEncodingContainer<String> container) callback,
  ) {
    final container = _FormFieldListContainer(
      encoder: encoder,
      key: _nextKey(key),
    );
    callback(container);
    _buffer.writeEncodedComponent(container.value);
  }

  @override
  void encodeMap<NestedKey extends Object>(
    Key key,
    void Function(_FormFieldsEncodingContainer<NestedKey> container) callback, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final coderKeys = keyedBy ?? CoderKeys<NestedKey>.identity();
    final container = _FormFieldsEncodingContainer._(
      encoder: encoder,
      key: _nextKey(key),
      coderKeys: coderKeys,
    );
    callback(container);
    _buffer.writeEncodedComponent(container.value);
  }

  @override
  KeyedEncodingContainer<NestedKey, String>
      nestedContainer<NestedKey extends Object>(
    Key key, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final coderKeys = keyedBy ?? CoderKeys<NestedKey>.identity();
    return _FormFieldsEncodingContainer._(
      encoder: encoder,
      coderKeys: coderKeys,
      key: _nextKey(key),
      sink: _buffer,
    );
  }

  @override
  SingleValueEncodingContainer<String> nestedSingleValueContainer(Key key) {
    final valueyKey = _nextKey(key);
    return _FormValueEncodingContainer(
      encoder: encoder._withKey(valueyKey),
      sink: (value) => _buffer.writeComponent(valueyKey, value),
    );
  }

  @override
  UnkeyedEncodingContainer<String> nestedUnkeyedContainer(Key key) {
    return _FormFieldListContainer(
      encoder: encoder,
      key: _nextKey(key),
      sink: _buffer,
    );
  }
}

final class _FormFieldListContainer
    implements UnkeyedEncodingContainer<String> {
  _FormFieldListContainer({
    required FormDataEncoder encoder,
    required this.key,
    StringBuffer? sink,
  })  : buffer = sink ?? StringBuffer(),
        encoder = encoder._withKey(key);

  final String key;
  final StringBuffer buffer;

  @override
  final FormDataEncoder encoder;

  @override
  String get value => buffer.toString();

  @override
  set value(String value) {
    buffer
      ..clear()
      ..write(value);
  }

  var _index = 0;

  String get _nextKey => '$key[${_index++}]';

  @override
  void encode<T extends Object>(T value, {Typeref<T>? as}) {
    buffer.writeEncodedComponent(
      encoder._withKey(_nextKey).encode(value, as: as),
    );
  }

  @override
  void encodeNull([Null value]) {
    buffer.writeComponent(_nextKey, encoder.encodeNull());
  }

  @override
  void encodeBool(bool value) {
    buffer.writeComponent(_nextKey, encoder.encodeBool(value));
  }

  @override
  void encodeDouble(double value) {
    buffer.writeComponent(_nextKey, encoder.encodeDouble(value));
  }

  @override
  void encodeInt(int value) {
    buffer.writeComponent(_nextKey, encoder.encodeInt(value));
  }

  @override
  void encodeString(String value) {
    buffer.writeComponent(_nextKey, encoder.encodeString(value));
  }

  @override
  void encodeDateTime(DateTime value) {
    buffer.writeComponent(_nextKey, encoder.encodeDateTime(value));
  }

  @override
  void encodePrimitive(Object value) {
    buffer.writeComponent(_nextKey, encoder.encodePrimitive(value));
  }

  @override
  void encodeList(void Function(_FormFieldListContainer container) callback) {
    final valueKey = _nextKey;
    final container = _FormFieldListContainer(
      encoder: encoder._withKey(valueKey),
      key: valueKey,
    );
    callback(container);
    buffer.writeEncodedComponent(container.value);
  }

  @override
  void encodeMap<NestedKey extends Object>(
    void Function(KeyedEncodingContainer<NestedKey, String> container)
        callback, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final container = _FormFieldsEncodingContainer._(
      encoder: encoder,
      key: _nextKey,
      coderKeys: keyedBy ?? CoderKeys<NestedKey>.identity(),
    );
    callback(container);
    buffer.writeEncodedComponent(container.value);
  }

  @override
  KeyedEncodingContainer<Key, String> nestedContainer<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  }) {
    final coderKeys = keyedBy ?? CoderKeys<Key>.identity();
    return _FormFieldsEncodingContainer._(
      encoder: encoder,
      coderKeys: coderKeys,
      key: _nextKey,
      sink: buffer,
    );
  }

  @override
  SingleValueEncodingContainer<String> nestedSingleValueContainer() {
    final key = _nextKey;
    return _FormValueEncodingContainer(
      encoder: encoder._withKey(key),
      sink: buffer.writeEncodedComponent,
    );
  }

  @override
  UnkeyedEncodingContainer<String> nestedUnkeyedContainer() {
    return _FormFieldListContainer(
      encoder: encoder,
      key: _nextKey,
      sink: buffer,
    );
  }
}

typedef _FormValueSink = void Function(String value);

final class _FormValueEncodingContainer
    implements SingleValueEncodingContainer<String> {
  _FormValueEncodingContainer({
    required this.encoder,
    this.sink,
  });

  @override
  final FormDataEncoder encoder;

  final _FormValueSink? sink;

  late final String _value;

  @override
  String get value => _value;

  @override
  set value(String value) {
    _value = value;
    sink?.call(value);
  }

  @override
  void encode<T extends Object>(T value, {Typeref<T>? as}) {
    this.value = encoder.encode(value, as: as);
    sink?.call(this.value);
  }

  @override
  void encodeNull([Null value]) {
    this.value = encoder.encodeNull();
    sink?.call(this.value);
  }

  @override
  void encodeBool(bool value) {
    this.value = encoder.encodeBool(value);
    sink?.call(this.value);
  }

  @override
  void encodeDouble(double value) {
    this.value = encoder.encodeDouble(value);
    sink?.call(this.value);
  }

  @override
  void encodeInt(int value) {
    this.value = encoder.encodeInt(value);
    sink?.call(this.value);
  }

  @override
  void encodeString(String value) {
    this.value = encoder.encodeString(value);
    sink?.call(this.value);
  }

  @override
  void encodeDateTime(DateTime value) {
    this.value = encoder.encodeDateTime(value);
    sink?.call(this.value);
  }

  @override
  void encodePrimitive(Object value) {
    this.value = encoder.encodePrimitive(value);
    sink?.call(this.value);
  }
}

extension on StringBuffer {
  void writeComponent(String key, String value) {
    if (isNotEmpty) {
      writeCharCode(0x26); // '&'
    }
    write(Uri.encodeQueryComponent(key));
    writeCharCode(0x3D); // '='
    write(value);
  }

  void writeEncodedComponent(String component) {
    if (isNotEmpty) {
      writeCharCode(0x26); // '&'
    }
    write(component);
  }
}

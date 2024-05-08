import 'package:libcoder/libcoder.dart';

final class FormFieldsEncoder extends Encoder<Object> {
  FormFieldsEncoder({
    required GlobalCoder coder,
    String? key,
    Map<String, String>? fields,
  })  : _key = key,
        _fields = fields,
        _coder = coder;

  final String? _key;
  final Map<String, String>? _fields;
  final GlobalCoder _coder;

  @override
  SingleValueEncodingContainer<Object> singleValueContainer() {
    if (_key == null || _fields == null) {
      throw StateError('Cannot create an unkeyed value container.');
    }
    return _FormValueEncodingContainer(
      encoder: this,
      sink: (value) {
        if (value is String) {
          _fields[_key] = value;
        }
      },
    );
  }

  @override
  UnkeyedEncodingContainer<Object> unkeyedContainer() {
    if (_key == null || _fields == null) {
      throw StateError('Cannot create an unkeyed value container.');
    }
    return _FormFieldListContainer(
      encoder: this,
      key: _key,
      fields: _fields,
    );
  }

  @override
  FormFieldsEncodingContainer<Key> container<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  }) {
    return FormFieldsEncodingContainer<Key>._(
      encoder: this,
      key: _key,
      coderKeys: keyedBy ?? CoderKeys<Key>.identity(),
      fields: _fields,
    );
  }

  @override
  Object encode<T extends Object>(T value, {Typeref<T>? as}) {
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
    return value;
  }

  @override
  String encodePrimitive(Object value) {
    return value.toString();
  }

  FormFieldsEncoder _nested({
    required String key,
    required Map<String, String> fields,
  }) =>
      FormFieldsEncoder(coder: _coder, key: key, fields: fields);
}

final class FormFieldsEncodingContainer<Key extends Object>
    implements KeyedEncodingContainer<Key, Object> {
  FormFieldsEncodingContainer._({
    required this.encoder,
    required CoderKeys<Key> coderKeys,
    Map<String, String>? fields,
    String? key,
  })  : _key = key,
        _fields = fields ?? {},
        _coderKeys = coderKeys;

  final String? _key;
  final Map<String, String> _fields;
  final CoderKeys<Key> _coderKeys;

  @override
  final FormFieldsEncoder encoder;

  @override
  Map<String, String> get value => _fields;

  @override
  set value(Map<String, String> value) {
    _fields
      ..clear()
      ..addAll(value);
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
    encoder._nested(key: valueKey, fields: _fields).encode(value, as: as);
  }

  @override
  void encodeNull(Key key, [Null value]) {
    _fields[_nextKey(key)] = encoder.encodeNull();
  }

  @override
  void encodeBool(Key key, bool value) {
    _fields[_nextKey(key)] = encoder.encodeBool(value);
  }

  @override
  void encodeDouble(Key key, double value) {
    _fields[_nextKey(key)] = encoder.encodeDouble(value);
  }

  @override
  void encodeInt(Key key, int value) {
    _fields[_nextKey(key)] = encoder.encodeInt(value);
  }

  @override
  void encodeString(Key key, String value) {
    _fields[_nextKey(key)] = encoder.encodeString(value);
  }

  @override
  void encodeDateTime(Key key, DateTime value) {
    _fields[_nextKey(key)] = encoder.encodeDateTime(value);
  }

  @override
  void encodePrimitive(Key key, Object value) {
    _fields[_nextKey(key)] = encoder.encodePrimitive(value);
  }

  @override
  void encodeList(
    Key key,
    void Function(UnkeyedEncodingContainer<Object> container) callback,
  ) {
    callback(nestedUnkeyedContainer(key));
  }

  @override
  void encodeMap<NestedKey extends Object>(
    Key key,
    void Function(FormFieldsEncodingContainer<NestedKey> container) callback, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    callback(nestedContainer(key, keyedBy: keyedBy));
  }

  @override
  FormFieldsEncodingContainer<NestedKey>
      nestedContainer<NestedKey extends Object>(
    Key key, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    final coderKeys = keyedBy ?? CoderKeys<NestedKey>.identity();
    final valueKey = _nextKey(key);
    return FormFieldsEncodingContainer._(
      encoder: encoder._nested(key: valueKey, fields: value),
      coderKeys: coderKeys,
      key: valueKey,
      fields: _fields,
    );
  }

  @override
  SingleValueEncodingContainer<Object> nestedSingleValueContainer(Key key) {
    final valueKey = _nextKey(key);
    return _FormValueEncodingContainer(
      encoder: encoder._nested(key: valueKey, fields: value),
      sink: (value) {
        if (value is String) {
          _fields[valueKey] = value;
        }
      },
    );
  }

  @override
  UnkeyedEncodingContainer<Object> nestedUnkeyedContainer(Key key) {
    final valueKey = _nextKey(key);
    return _FormFieldListContainer(
      encoder: encoder._nested(key: valueKey, fields: _fields),
      key: valueKey,
      fields: _fields,
    );
  }
}

final class _FormFieldListContainer
    implements UnkeyedEncodingContainer<Object> {
  _FormFieldListContainer({
    required this.encoder,
    required this.key,
    Map<String, String>? fields,
  }) : value = fields ?? {};

  final String key;

  @override
  final FormFieldsEncoder encoder;

  @override
  final Map<String, String> value;

  @override
  set value(Map<String, String> value) {
    this.value.addAll(value);
  }

  var _index = 0;

  String get _nextKey => '$key[${_index++}]';

  @override
  void encode<T extends Object>(T value, {Typeref<T>? as}) {
    encoder._nested(key: _nextKey, fields: this.value).encode(value, as: as);
  }

  @override
  void encodeNull([Null value]) {
    this.value[_nextKey] = encoder.encodeNull();
  }

  @override
  void encodeBool(bool value) {
    this.value[_nextKey] = encoder.encodeBool(value);
  }

  @override
  void encodeDouble(double value) {
    this.value[_nextKey] = encoder.encodeDouble(value);
  }

  @override
  void encodeInt(int value) {
    this.value[_nextKey] = encoder.encodeInt(value);
  }

  @override
  void encodeString(String value) {
    this.value[_nextKey] = encoder.encodeString(value);
  }

  @override
  void encodeDateTime(DateTime value) {
    this.value[_nextKey] = encoder.encodeDateTime(value);
  }

  @override
  void encodePrimitive(Object value) {
    this.value[_nextKey] = encoder.encodePrimitive(value);
  }

  @override
  void encodeList(
    void Function(UnkeyedEncodingContainer<Object> container) callback,
  ) {
    callback(nestedUnkeyedContainer());
  }

  @override
  void encodeMap<NestedKey extends Object>(
    void Function(FormFieldsEncodingContainer<NestedKey> container) callback, {
    CoderKeys<NestedKey>? keyedBy,
  }) {
    callback(nestedContainer(keyedBy: keyedBy));
  }

  @override
  FormFieldsEncodingContainer<Key> nestedContainer<Key extends Object>({
    CoderKeys<Key>? keyedBy,
  }) {
    final coderKeys = keyedBy ?? CoderKeys<Key>.identity();
    return FormFieldsEncodingContainer._(
      encoder: encoder,
      coderKeys: coderKeys,
      key: _nextKey,
      fields: value,
    );
  }

  @override
  SingleValueEncodingContainer<Object> nestedSingleValueContainer() {
    final key = _nextKey;
    return _FormValueEncodingContainer(
      encoder: encoder._nested(key: key, fields: value),
      sink: (value) {
        if (value is String) {
          this.value[key] = value;
        }
      },
    );
  }

  @override
  UnkeyedEncodingContainer<Object> nestedUnkeyedContainer() {
    return _FormFieldListContainer(
      encoder: encoder,
      key: _nextKey,
      fields: value,
    );
  }
}

typedef _FormValueSink = void Function(Object value);

final class _FormValueEncodingContainer
    implements SingleValueEncodingContainer<Object> {
  _FormValueEncodingContainer({
    required this.encoder,
    this.sink,
  });

  @override
  final FormFieldsEncoder encoder;

  final _FormValueSink? sink;

  late final Object _value;

  @override
  Object get value => _value;

  @override
  set value(Object value) {
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

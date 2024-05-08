library;

import 'dart:collection';

import 'package:libcoder/src/decoder.dart';
import 'package:libcoder/src/encoder.dart';
import 'package:libcoder/src/form_data/form_data_coder.dart';
import 'package:libcoder/src/form_fields/form_fields_coder.dart';
import 'package:libcoder/src/json/json_coder.dart';
import 'package:libcoder/src/typeref.dart';

export 'src/coder.dart';
export 'src/decoder.dart';
export 'src/encoder.dart';
export 'src/form_fields/form_fields_encoder.dart';
export 'src/json/json_coder.dart';
export 'src/json/json_decoder.dart';
export 'src/json/json_encoder.dart';
export 'src/typeref.dart';

final GlobalCoder coder = GlobalCoder();

abstract mixin class GlobalCoder implements Map<Typeref, CoderConfig> {
  factory GlobalCoder({
    /* TODO: @mustBeConst */ Map<Typeref, CoderConfig> staticConfig,
  }) = _GlobalCoder;

  const factory GlobalCoder.static(
    /* TODO: @mustBeConst */ Map<Typeref, CoderConfig> config,
  ) = _StaticGlobalCoder;

  CoderConfig<T> configFor<T extends Object>({Typeref<T>? type});
}

final class _StaticGlobalCoder extends UnmodifiableMapBase<Typeref, CoderConfig>
    with GlobalCoder {
  const _StaticGlobalCoder(this._config);

  final Map<Typeref, CoderConfig> _config;

  @override
  CoderConfig<Object>? operator [](Object? key) => _config[key];

  @override
  Iterable<Typeref<Object>> get keys => _config.keys;

  @override
  CoderConfig<T> configFor<T extends Object>({Typeref<T>? type}) {
    if (type == null) {
      throw ArgumentError('Static type must be specified');
    }
    final config = _config[type] as CoderConfig<T>?;
    if (config == null) {
      throw ArgumentError(
        'No config registered for "${type.typeName}". '
        'Did you add the Coding config to the registry?',
      );
    }
    return config;
  }
}

final class _GlobalCoder with GlobalCoder, MapMixin<Typeref, CoderConfig> {
  _GlobalCoder({
    /* TODO: @mustBeConst */ Map<Typeref, CoderConfig> staticConfig = const {},
  }) : _staticConfig = staticConfig {
    _runtimeConfig.addAll({
      const Typeref<String>(): CoderConfig.string,
      const Typeref<int>(): CoderConfig.int$,
      const Typeref<double>(): CoderConfig.double$,
      const Typeref<bool>(): CoderConfig.bool$,
      const Typeref<DateTime>(): CoderConfig.dateTime,
    });
  }

  final Map<Typeref, CoderConfig> _staticConfig;
  final Map<Typeref, CoderConfig> _runtimeConfig = HashMap(
    equals: (t1, t2) => identical(t1.type, t2.type),
    hashCode: (t) => t.type.hashCode,
    isValidKey: (t) => t.type != null,
  );

  @override
  CoderConfig<T> configFor<T extends Object>({Typeref<T>? type}) {
    assert(T != Object, 'Type must be specified');
    type ??= Typeref<T>();
    final config = this[type] as CoderConfig<T>?;
    if (config == null) {
      throw ArgumentError(
        'No config registered for "${type.typeName}". '
        'Did you add the Coding config to the registry?',
      );
    }
    return config;
  }

  @override
  CoderConfig<Object>? operator [](Object? key) =>
      _runtimeConfig[key] ?? _staticConfig[key];

  @override
  void operator []=(Typeref<Object> key, CoderConfig<Object> value) {
    _runtimeConfig[key] = value;
  }

  @override
  void clear() => _runtimeConfig.clear();

  @override
  Iterable<Typeref<Object>> get keys => HashSet(
        equals: (t1, t2) => identical(t1, t2) || identical(t1.type, t2.type),
        hashCode: (t) => Object.hash(t.typeName, t.type),
      )
        ..addAll(_staticConfig.keys)
        ..addAll(_runtimeConfig.keys);

  @override
  CoderConfig<Object>? remove(Object? key) {
    return _runtimeConfig.remove(key);
  }
}

extension CoreCoders on GlobalCoder {
  JsonCoder get json => JsonCoder(coder: this);
  FormDataCoder get formData => FormDataCoder(coder: this);
  FormFieldsCoder get formFields => FormFieldsCoder(coder: this);
}

typedef TypeDecoder<T extends Object> = T Function<V extends Object?>(
    V, Decoder<V>);
typedef TypeEncoder<T extends Object> = V Function<V extends Object?>(
    T, Encoder<V>);

abstract interface class CoderKeys<Field extends Object> {
  const factory CoderKeys.identity() = _CoderKeysIdentity<Field>;

  String keyFor(Field field);
}

final class _CoderKeysIdentity<Field extends Object>
    implements CoderKeys<Field> {
  const _CoderKeysIdentity();

  @override
  String keyFor(Field field) => field.toString();
}

abstract mixin class CoderConfig<T extends Object> {
  const factory CoderConfig({
    TypeEncoder<T>? encode,
    TypeDecoder<T>? decode,
  }) = _CoderConfig<T>;

  static final CoderConfig<String> string = CoderConfig<String>(
    encode: <V>(value, encoder) => encoder.encodeString(value),
    decode: <V>(value, decoder) => decoder.decodeString(value),
  );
  static final CoderConfig<int> int$ = CoderConfig<int>(
    encode: <V>(value, encoder) => encoder.encodeInt(value),
    decode: <V>(value, decoder) => decoder.decodeInt(value),
  );
  static final CoderConfig<double> double$ = CoderConfig<double>(
    encode: <V>(value, encoder) => encoder.encodeDouble(value),
    decode: <V>(value, decoder) => decoder.decodeDouble(value),
  );
  static final CoderConfig<bool> bool$ = CoderConfig<bool>(
    encode: <V>(value, encoder) => encoder.encodeBool(value),
    decode: <V>(value, decoder) => decoder.decodeBool(value),
  );
  static final CoderConfig<DateTime> dateTime = CoderConfig<DateTime>(
    encode: <V>(value, encoder) => encoder.encodeDateTime(value),
    decode: <V>(value, decoder) => decoder.decodeDateTime(value),
  );

  V encode<V extends Object?>(
    T instance,
    Encoder<V> encoder,
  );
  T decode<K extends Object?, V extends Object?>(
    Object? value,
    Decoder decoder,
  );
}

final class _CoderConfig<T extends Object> with CoderConfig<T> {
  const _CoderConfig({
    TypeEncoder<T>? encode,
    TypeDecoder<T>? decode,
  })  : assert(
          encode != null || decode != null,
          'Either encode or decode must be provided',
        ),
        _encode = encode ?? _noEncoder,
        _decode = decode ?? _noDecoder;

  static Never _noDecoder<V extends Object?>(V value, Decoder<V> decoder) {
    throw UnimplementedError('No decoder registered for type');
  }

  static Never _noEncoder<V extends Object?>(Object value, Encoder<V> encoder) {
    throw UnimplementedError('No encoder registered for type');
  }

  final TypeEncoder<T> _encode;
  final TypeDecoder<T> _decode;

  @override
  V encode<V extends Object?>(
    T instance,
    Encoder<V> encoder,
  ) =>
      _encode(instance, encoder);

  @override
  T decode<K extends Object?, V extends Object?>(
    Object? value,
    Decoder decoder,
  ) =>
      _decode(value, decoder);
}

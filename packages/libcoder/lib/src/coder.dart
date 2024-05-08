import 'package:libcoder/libcoder.dart';

abstract mixin class Coder<V extends Object?> {
  Encoder<V> get encoder;
  Decoder<V> get decoder;

  V encode<T extends Object>(
    T value, {
    required Typeref<T> as,
  }) =>
      encoder.encode(value, as: as);

  T decode<T extends Object>(
    V value, {
    required Typeref<T> as,
  }) =>
      decoder.decode<T>(value, as: as);
}

import 'dart:convert';
import 'dart:typed_data';

/// base64url encoding without padding, as defined by
/// [RFC 7515](https://datatracker.ietf.org/doc/html/rfc7515#appendix-C).
const base64RawUrl = _Base64RawUrlCodec();

class _Base64RawUrlCodec extends Codec<Uint8List, String> {
  const _Base64RawUrlCodec();

  @override
  Converter<String, Uint8List> get decoder =>
      const _StripPaddingDecoder().fuse(const Base64Decoder()).cast();

  @override
  Converter<Uint8List, String> get encoder =>
      const Base64Encoder.urlSafe().fuse(const _StripPaddingEncoder()).cast();
}

/// Strips padding from a base64-encoded string.
class _StripPaddingEncoder extends Converter<String, String> {
  const _StripPaddingEncoder();

  @override
  String convert(String input) {
    return input.split('=').first;
  }
}

/// Adds back stripped padding to a base64-encoded string.
class _StripPaddingDecoder extends Converter<String, String> {
  const _StripPaddingDecoder();

  @override
  String convert(String input) {
    final len = input.length;
    return input + '=' * ((4 - len % 4) % 4);
  }
}

import 'dart:convert';
import 'dart:typed_data';

/// {@macro celest.runtime.base64_raw_url_codec}
const base64RawUrl = Base64RawUrlCodec();

/// {@template celest.runtime.base64_raw_url_codec}
/// base64url encoding without padding, as defined by
/// [RFC 7515](https://datatracker.ietf.org/doc/html/rfc7515#appendix-C).
/// {@endtemplate}
class Base64RawUrlCodec extends Codec<List<int>, String> {
  /// {@macro celest.runtime.base64_raw_url_codec}
  const Base64RawUrlCodec();

  @override
  Converter<String, List<int>> get decoder =>
      const _StripPaddingDecoder().fuse(const Base64Decoder());

  @override
  Uint8List decode(String encoded) {
    return Uint8List.fromList(super.decode(encoded));
  }

  @override
  Converter<List<int>, String> get encoder =>
      const Base64Encoder.urlSafe().fuse(const _StripPaddingEncoder());
}

/// Strips padding from a base64-encoded string.
class _StripPaddingEncoder extends Converter<String, String> {
  const _StripPaddingEncoder();

  @override
  String convert(String input) {
    final int paddingStart = input.indexOf('=');
    if (paddingStart == -1) {
      return input;
    }
    return input.substring(0, paddingStart);
  }
}

/// Adds back stripped padding to a base64-encoded string.
class _StripPaddingDecoder extends Converter<String, String> {
  const _StripPaddingDecoder();

  @override
  String convert(String input) {
    final int len = input.length;
    final String padding = '=' * ((4 - len % 4) % 4);
    return '$input$padding';
  }
}

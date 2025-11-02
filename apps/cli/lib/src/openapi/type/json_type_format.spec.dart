// GENERATED CODE - run `tool/update_spec.dart` to update.
// ignore_for_file: type=lint

import 'json_type.dart';

extension type const JsonTypeFormat(String _) implements String {
  /// Base64url: Binary data encoded as a url-safe string as defined in [RFC4648](https://www.rfc-editor.org/rfc/rfc4648#section-5)
  static const JsonTypeFormat base64url = JsonTypeFormat('base64url');

  /// Binary: any sequence of octets
  static const JsonTypeFormat binary = JsonTypeFormat('binary');

  /// Byte: base64 encoded data as defined in [RFC4648](https://www.rfc-editor.org/rfc/rfc4648#section-4)
  static const JsonTypeFormat byte = JsonTypeFormat('byte');

  /// Char: A single character
  static const JsonTypeFormat char = JsonTypeFormat('char');

  /// Commonmark: commonmark-formatted text
  static const JsonTypeFormat commonmark = JsonTypeFormat('commonmark');

  /// Date Time: date and time as defined by date-time - [RFC3339](https://www.rfc-editor.org/rfc/rfc3339#section-5.6)
  static const JsonTypeFormat dateTime = JsonTypeFormat('date-time');

  /// Date: date as defined by full-date - [RFC3339](https://www.rfc-editor.org/rfc/rfc3339#section-5.6)
  static const JsonTypeFormat date = JsonTypeFormat('date');

  /// Decimal: A fixed point decimal number of unspecified precision and range
  static const JsonTypeFormat decimal = JsonTypeFormat('decimal');

  /// Decimal128: A decimal floating-point number with 34 significant decimal digits
  static const JsonTypeFormat decimal128 = JsonTypeFormat('decimal128');

  /// Double Int: an integer that can be stored in an IEEE 754 double-precision number without loss of precision
  static const JsonTypeFormat doubleInt = JsonTypeFormat('double-int');

  /// Double: double precision floating point number
  static const JsonTypeFormat double = JsonTypeFormat('double');

  /// Duration: duration as defined by duration - RFC3339
  static const JsonTypeFormat duration = JsonTypeFormat('duration');

  /// Email: An email address as defined as Mailbox in RFC5321
  static const JsonTypeFormat email = JsonTypeFormat('email');

  /// Float: single precision floating point number
  static const JsonTypeFormat float = JsonTypeFormat('float');

  /// Hostname: A host name as defined by RFC1123
  static const JsonTypeFormat hostname = JsonTypeFormat('hostname');

  /// Html: HTML-formatted text
  static const JsonTypeFormat html = JsonTypeFormat('html');

  /// Http Date: date and time as defined by HTTP-date - [RFC7231](https://datatracker.ietf.org/doc/html/rfc7231#section-7.1.1.1)
  static const JsonTypeFormat httpDate = JsonTypeFormat('http-date');

  /// Idn Email: An email address as defined as Mailbox in RFC6531
  static const JsonTypeFormat idnEmail = JsonTypeFormat('idn-email');

  /// Idn Hostname: An internationalized host name as defined by RFC5890
  static const JsonTypeFormat idnHostname = JsonTypeFormat('idn-hostname');

  /// Int16: signed 16-bit integer
  static const JsonTypeFormat int16 = JsonTypeFormat('int16');

  /// Int32: signed 32-bit integer
  static const JsonTypeFormat int32 = JsonTypeFormat('int32');

  /// Int64: signed 64-bit integer
  static const JsonTypeFormat int64 = JsonTypeFormat('int64');

  /// Int8: signed 8-bit integer
  static const JsonTypeFormat int8 = JsonTypeFormat('int8');

  /// Ipv4: An IPv4 address as defined as dotted-quad by RFC2673
  static const JsonTypeFormat ipv4 = JsonTypeFormat('ipv4');

  /// Ipv6: An IPv6 address as defined by RFC4673
  static const JsonTypeFormat ipv6 = JsonTypeFormat('ipv6');

  /// Iri Reference: A Internationalized Resource Identifier as defined in RFC3987
  static const JsonTypeFormat iriReference = JsonTypeFormat('iri-reference');

  /// Iri: A Internationalized Resource Identifier as defined in RFC3987
  static const JsonTypeFormat iri = JsonTypeFormat('iri');

  /// Json Pointer: A JSON string representation of a JSON Pointer as defined in RFC6901
  static const JsonTypeFormat jsonPointer = JsonTypeFormat('json-pointer');

  /// Media Range: A media type as defined by the `media-range` ABNF production in RFC9110.
  static const JsonTypeFormat mediaRange = JsonTypeFormat('media-range');

  /// Password: a string that hints to obscure the value.
  static const JsonTypeFormat password = JsonTypeFormat('password');

  /// Regex: A regular expression as defined in ECMA-262
  static const JsonTypeFormat regex = JsonTypeFormat('regex');

  /// Relative Json Pointer: A JSON string representation of a relative JSON Pointer as defined in draft RFC 01
  static const JsonTypeFormat relativeJsonPointer =
      JsonTypeFormat('relative-json-pointer');

  /// Sf Binary: structured fields byte sequence as defined in [RFC8941]
  static const JsonTypeFormat sfBinary = JsonTypeFormat('sf-binary');

  /// Sf Boolean: structured fields boolean as defined in [RFC8941]
  static const JsonTypeFormat sfBoolean = JsonTypeFormat('sf-boolean');

  /// Sf Decimal: structured fields decimal as defined in [RFC8941]
  static const JsonTypeFormat sfDecimal = JsonTypeFormat('sf-decimal');

  /// Sf Integer: structured fields integer as defined in [RFC8941]
  static const JsonTypeFormat sfInteger = JsonTypeFormat('sf-integer');

  /// Sf String: structured fields string as defined in [RFC8941]
  static const JsonTypeFormat sfString = JsonTypeFormat('sf-string');

  /// Sf Token: structured fields token as defined in [RFC8941]
  static const JsonTypeFormat sfToken = JsonTypeFormat('sf-token');

  /// Time: time as defined by full-time - RFC3339
  static const JsonTypeFormat time = JsonTypeFormat('time');

  /// Uint8: unsigned 8-bit integer
  static const JsonTypeFormat uint8 = JsonTypeFormat('uint8');

  /// Uri Reference: A URI reference as defined in [RFC3986](https://www.rfc-editor.org/info/rfc3986)
  static const JsonTypeFormat uriReference = JsonTypeFormat('uri-reference');

  /// Uri Template: A URI Template as defined in RFC6570
  static const JsonTypeFormat uriTemplate = JsonTypeFormat('uri-template');

  /// Uri: A Uniform Resource Identifier as defined in RFC3986
  static const JsonTypeFormat uri = JsonTypeFormat('uri');

  /// Uuid: A Universally Unique IDentifier as defined in RFC4122
  static const JsonTypeFormat uuid = JsonTypeFormat('uuid');

  /// Valid base types for this format.
  List<JsonType>? get baseTypes => switch (this) {
        JsonTypeFormat.base64url => [
            JsonType.string,
          ],
        JsonTypeFormat.binary => [
            JsonType.string,
          ],
        JsonTypeFormat.byte => [
            JsonType.string,
          ],
        JsonTypeFormat.char => [
            JsonType.string,
          ],
        JsonTypeFormat.commonmark => [
            JsonType.string,
          ],
        JsonTypeFormat.dateTime => [
            JsonType.string,
          ],
        JsonTypeFormat.date => [
            JsonType.string,
          ],
        JsonTypeFormat.decimal => [
            JsonType.string,
            JsonType.number,
          ],
        JsonTypeFormat.decimal128 => [
            JsonType.string,
            JsonType.number,
          ],
        JsonTypeFormat.doubleInt => [
            JsonType.integer,
          ],
        JsonTypeFormat.double => [
            JsonType.number,
          ],
        JsonTypeFormat.duration => [
            JsonType.string,
          ],
        JsonTypeFormat.email => [
            JsonType.string,
          ],
        JsonTypeFormat.float => [
            JsonType.number,
          ],
        JsonTypeFormat.hostname => [
            JsonType.string,
          ],
        JsonTypeFormat.html => [
            JsonType.string,
          ],
        JsonTypeFormat.httpDate => [
            JsonType.string,
          ],
        JsonTypeFormat.idnEmail => [
            JsonType.string,
          ],
        JsonTypeFormat.idnHostname => [
            JsonType.string,
          ],
        JsonTypeFormat.int16 => [
            JsonType.number,
          ],
        JsonTypeFormat.int32 => [
            JsonType.number,
          ],
        JsonTypeFormat.int64 => [
            JsonType.number,
            JsonType.string,
          ],
        JsonTypeFormat.int8 => [
            JsonType.number,
          ],
        JsonTypeFormat.ipv4 => [
            JsonType.string,
          ],
        JsonTypeFormat.ipv6 => [
            JsonType.string,
          ],
        JsonTypeFormat.iriReference => [
            JsonType.string,
          ],
        JsonTypeFormat.iri => [
            JsonType.string,
          ],
        JsonTypeFormat.jsonPointer => [
            JsonType.string,
          ],
        JsonTypeFormat.mediaRange => [
            JsonType.string,
          ],
        JsonTypeFormat.password => [
            JsonType.string,
          ],
        JsonTypeFormat.regex => [
            JsonType.string,
          ],
        JsonTypeFormat.relativeJsonPointer => [
            JsonType.string,
          ],
        JsonTypeFormat.sfBinary => [
            JsonType.string,
          ],
        JsonTypeFormat.sfBoolean => [
            JsonType.string,
          ],
        JsonTypeFormat.sfDecimal => [
            JsonType.number,
          ],
        JsonTypeFormat.sfInteger => [
            JsonType.integer,
            JsonType.number,
          ],
        JsonTypeFormat.sfString => [
            JsonType.string,
          ],
        JsonTypeFormat.sfToken => [
            JsonType.string,
          ],
        JsonTypeFormat.time => [
            JsonType.string,
          ],
        JsonTypeFormat.uint8 => [
            JsonType.number,
          ],
        JsonTypeFormat.uriReference => [
            JsonType.string,
          ],
        JsonTypeFormat.uriTemplate => [
            JsonType.string,
          ],
        JsonTypeFormat.uri => [
            JsonType.string,
          ],
        JsonTypeFormat.uuid => [
            JsonType.string,
          ],
        _ => null,
      };
}

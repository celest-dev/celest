//
//  Generated code. Do not modify.
//  source: buf/validate/validate.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Specifies how FieldConstraints.ignore behaves. See the documentation for
/// FieldConstraints.required for definitions of "populated" and "nullable".
class Ignore extends $pb.ProtobufEnum {
  ///  Validation is only skipped if it's an unpopulated nullable fields.
  ///
  ///  ```proto
  ///  syntax="proto3";
  ///
  ///  message Request {
  ///    // The uri rule applies to any value, including the empty string.
  ///    string foo = 1 [
  ///      (buf.validate.field).string.uri = true
  ///    ];
  ///
  ///    // The uri rule only applies if the field is set, including if it's
  ///    // set to the empty string.
  ///    optional string bar = 2 [
  ///      (buf.validate.field).string.uri = true
  ///    ];
  ///
  ///    // The min_items rule always applies, even if the list is empty.
  ///    repeated string baz = 3 [
  ///      (buf.validate.field).repeated.min_items = 3
  ///    ];
  ///
  ///    // The custom CEL rule applies only if the field is set, including if
  ///    // it's the "zero" value of that message.
  ///    SomeMessage quux = 4 [
  ///      (buf.validate.field).cel = {/* ... */}
  ///    ];
  ///  }
  ///  ```
  static const Ignore IGNORE_UNSPECIFIED =
      Ignore._(0, _omitEnumNames ? '' : 'IGNORE_UNSPECIFIED');

  ///  Validation is skipped if the field is unpopulated. This rule is redundant
  ///  if the field is already nullable.
  ///
  ///  ```proto
  ///  syntax="proto3
  ///
  ///  message Request {
  ///    // The uri rule applies only if the value is not the empty string.
  ///    string foo = 1 [
  ///      (buf.validate.field).string.uri = true,
  ///      (buf.validate.field).ignore = IGNORE_IF_UNPOPULATED
  ///    ];
  ///
  ///    // IGNORE_IF_UNPOPULATED is equivalent to IGNORE_UNSPECIFIED in this
  ///    // case: the uri rule only applies if the field is set, including if
  ///    // it's set to the empty string.
  ///    optional string bar = 2 [
  ///      (buf.validate.field).string.uri = true,
  ///      (buf.validate.field).ignore = IGNORE_IF_UNPOPULATED
  ///    ];
  ///
  ///    // The min_items rule only applies if the list has at least one item.
  ///    repeated string baz = 3 [
  ///      (buf.validate.field).repeated.min_items = 3,
  ///      (buf.validate.field).ignore = IGNORE_IF_UNPOPULATED
  ///    ];
  ///
  ///    // IGNORE_IF_UNPOPULATED is equivalent to IGNORE_UNSPECIFIED in this
  ///    // case: the custom CEL rule applies only if the field is set, including
  ///    // if it's the "zero" value of that message.
  ///    SomeMessage quux = 4 [
  ///      (buf.validate.field).cel = {/* ... */},
  ///      (buf.validate.field).ignore = IGNORE_IF_UNPOPULATED
  ///    ];
  ///  }
  ///  ```
  static const Ignore IGNORE_IF_UNPOPULATED =
      Ignore._(1, _omitEnumNames ? '' : 'IGNORE_IF_UNPOPULATED');

  ///  Validation is skipped if the field is unpopulated or if it is a nullable
  ///  field populated with its default value. This is typically the zero or
  ///  empty value, but proto2 scalars support custom defaults. For messages, the
  ///  default is a non-null message with all its fields unpopulated.
  ///
  ///  ```proto
  ///  syntax="proto3
  ///
  ///  message Request {
  ///    // IGNORE_IF_DEFAULT_VALUE is equivalent to IGNORE_IF_UNPOPULATED in
  ///    // this case; the uri rule applies only if the value is not the empty
  ///    // string.
  ///    string foo = 1 [
  ///      (buf.validate.field).string.uri = true,
  ///      (buf.validate.field).ignore = IGNORE_IF_DEFAULT_VALUE
  ///    ];
  ///
  ///    // The uri rule only applies if the field is set to a value other than
  ///    // the empty string.
  ///    optional string bar = 2 [
  ///      (buf.validate.field).string.uri = true,
  ///      (buf.validate.field).ignore = IGNORE_IF_DEFAULT_VALUE
  ///    ];
  ///
  ///    // IGNORE_IF_DEFAULT_VALUE is equivalent to IGNORE_IF_UNPOPULATED in
  ///    // this case; the min_items rule only applies if the list has at least
  ///    // one item.
  ///    repeated string baz = 3 [
  ///      (buf.validate.field).repeated.min_items = 3,
  ///      (buf.validate.field).ignore = IGNORE_IF_DEFAULT_VALUE
  ///    ];
  ///
  ///    // The custom CEL rule only applies if the field is set to a value other
  ///    // than an empty message (i.e., fields are unpopulated).
  ///    SomeMessage quux = 4 [
  ///      (buf.validate.field).cel = {/* ... */},
  ///      (buf.validate.field).ignore = IGNORE_IF_DEFAULT_VALUE
  ///    ];
  ///  }
  ///  ```
  ///
  ///  This rule is affected by proto2 custom default values:
  ///
  ///  ```proto
  ///  syntax="proto2";
  ///
  ///  message Request {
  ///    // The gt rule only applies if the field is set and it's value is not
  ///    the default (i.e., not -42). The rule even applies if the field is set
  ///    to zero since the default value differs.
  ///    optional int32 value = 1 [
  ///      default = -42,
  ///      (buf.validate.field).int32.gt = 0,
  ///      (buf.validate.field).ignore = IGNORE_IF_DEFAULT_VALUE
  ///    ];
  ///  }
  static const Ignore IGNORE_IF_DEFAULT_VALUE =
      Ignore._(2, _omitEnumNames ? '' : 'IGNORE_IF_DEFAULT_VALUE');

  ///  The validation rules of this field will be skipped and not evaluated. This
  ///  is useful for situations that necessitate turning off the rules of a field
  ///  containing a message that may not make sense in the current context, or to
  ///  temporarily disable constraints during development.
  ///
  ///  ```proto
  ///  message MyMessage {
  ///    // The field's rules will always be ignored, including any validation's
  ///    // on value's fields.
  ///    MyOtherMessage value = 1 [
  ///      (buf.validate.field).ignore = IGNORE_ALWAYS];
  ///  }
  ///  ```
  static const Ignore IGNORE_ALWAYS =
      Ignore._(3, _omitEnumNames ? '' : 'IGNORE_ALWAYS');

  static const $core.List<Ignore> values = <Ignore>[
    IGNORE_UNSPECIFIED,
    IGNORE_IF_UNPOPULATED,
    IGNORE_IF_DEFAULT_VALUE,
    IGNORE_ALWAYS,
  ];

  static final $core.Map<$core.int, Ignore> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Ignore? valueOf($core.int value) => _byValue[value];

  const Ignore._(super.v, super.n);
}

/// WellKnownRegex contain some well-known patterns.
class KnownRegex extends $pb.ProtobufEnum {
  static const KnownRegex KNOWN_REGEX_UNSPECIFIED =
      KnownRegex._(0, _omitEnumNames ? '' : 'KNOWN_REGEX_UNSPECIFIED');

  /// HTTP header name as defined by [RFC 7230](https://datatracker.ietf.org/doc/html/rfc7230#section-3.2).
  static const KnownRegex KNOWN_REGEX_HTTP_HEADER_NAME =
      KnownRegex._(1, _omitEnumNames ? '' : 'KNOWN_REGEX_HTTP_HEADER_NAME');

  /// HTTP header value as defined by [RFC 7230](https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.4).
  static const KnownRegex KNOWN_REGEX_HTTP_HEADER_VALUE =
      KnownRegex._(2, _omitEnumNames ? '' : 'KNOWN_REGEX_HTTP_HEADER_VALUE');

  static const $core.List<KnownRegex> values = <KnownRegex>[
    KNOWN_REGEX_UNSPECIFIED,
    KNOWN_REGEX_HTTP_HEADER_NAME,
    KNOWN_REGEX_HTTP_HEADER_VALUE,
  ];

  static final $core.Map<$core.int, KnownRegex> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static KnownRegex? valueOf($core.int value) => _byValue[value];

  const KnownRegex._(super.v, super.n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

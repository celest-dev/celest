//
//  Generated code. Do not modify.
//  source: i18n/phonenumbers/phonenumber.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The source from which the country_code is derived. This is not set in the
/// general parsing method, but in the method that parses and keeps raw_input.
/// New fields could be added upon request.
class PhoneNumber_CountryCodeSource extends $pb.ProtobufEnum {
  static const PhoneNumber_CountryCodeSource UNSPECIFIED =
      PhoneNumber_CountryCodeSource._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const PhoneNumber_CountryCodeSource FROM_NUMBER_WITH_PLUS_SIGN =
      PhoneNumber_CountryCodeSource._(
          1, _omitEnumNames ? '' : 'FROM_NUMBER_WITH_PLUS_SIGN');
  static const PhoneNumber_CountryCodeSource FROM_NUMBER_WITH_IDD =
      PhoneNumber_CountryCodeSource._(
          5, _omitEnumNames ? '' : 'FROM_NUMBER_WITH_IDD');
  static const PhoneNumber_CountryCodeSource FROM_NUMBER_WITHOUT_PLUS_SIGN =
      PhoneNumber_CountryCodeSource._(
          10, _omitEnumNames ? '' : 'FROM_NUMBER_WITHOUT_PLUS_SIGN');
  static const PhoneNumber_CountryCodeSource FROM_DEFAULT_COUNTRY =
      PhoneNumber_CountryCodeSource._(
          20, _omitEnumNames ? '' : 'FROM_DEFAULT_COUNTRY');

  static const $core.List<PhoneNumber_CountryCodeSource> values =
      <PhoneNumber_CountryCodeSource>[
    UNSPECIFIED,
    FROM_NUMBER_WITH_PLUS_SIGN,
    FROM_NUMBER_WITH_IDD,
    FROM_NUMBER_WITHOUT_PLUS_SIGN,
    FROM_DEFAULT_COUNTRY,
  ];

  static final $core.Map<$core.int, PhoneNumber_CountryCodeSource> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PhoneNumber_CountryCodeSource? valueOf($core.int value) =>
      _byValue[value];

  const PhoneNumber_CountryCodeSource._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

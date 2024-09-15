//
//  Generated code. Do not modify.
//  source: celest/ast/v1/resolved_ast.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The type of SDK.
class SdkType extends $pb.ProtobufEnum {
  static const SdkType SDK_TYPE_UNSPECIFIED =
      SdkType._(0, _omitEnumNames ? '' : 'SDK_TYPE_UNSPECIFIED');
  static const SdkType DART = SdkType._(1, _omitEnumNames ? '' : 'DART');
  static const SdkType FLUTTER = SdkType._(2, _omitEnumNames ? '' : 'FLUTTER');

  static const $core.List<SdkType> values = <SdkType>[
    SDK_TYPE_UNSPECIFIED,
    DART,
    FLUTTER,
  ];

  static final $core.Map<$core.int, SdkType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SdkType? valueOf($core.int value) => _byValue[value];

  const SdkType._($core.int v, $core.String n) : super(v, n);
}

/// The type of an auth provider.
class ResolvedAuthProvider_Type extends $pb.ProtobufEnum {
  static const ResolvedAuthProvider_Type AUTH_PROVIDER_TYPE_UNSPECIFIED =
      ResolvedAuthProvider_Type._(
          0, _omitEnumNames ? '' : 'AUTH_PROVIDER_TYPE_UNSPECIFIED');
  static const ResolvedAuthProvider_Type EMAIL_OTP =
      ResolvedAuthProvider_Type._(1, _omitEnumNames ? '' : 'EMAIL_OTP');
  static const ResolvedAuthProvider_Type SMS_OTP =
      ResolvedAuthProvider_Type._(2, _omitEnumNames ? '' : 'SMS_OTP');
  static const ResolvedAuthProvider_Type GOOGLE =
      ResolvedAuthProvider_Type._(3, _omitEnumNames ? '' : 'GOOGLE');
  static const ResolvedAuthProvider_Type GITHUB =
      ResolvedAuthProvider_Type._(4, _omitEnumNames ? '' : 'GITHUB');

  static const $core.List<ResolvedAuthProvider_Type> values =
      <ResolvedAuthProvider_Type>[
    AUTH_PROVIDER_TYPE_UNSPECIFIED,
    EMAIL_OTP,
    SMS_OTP,
    GOOGLE,
    GITHUB,
  ];

  static final $core.Map<$core.int, ResolvedAuthProvider_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResolvedAuthProvider_Type? valueOf($core.int value) => _byValue[value];

  const ResolvedAuthProvider_Type._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

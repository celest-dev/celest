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

/// The type of an auth provider.
class AuthProviderType extends $pb.ProtobufEnum {
  static const AuthProviderType AUTH_PROVIDER_TYPE_UNSPECIFIED =
      AuthProviderType._(
          0, _omitEnumNames ? '' : 'AUTH_PROVIDER_TYPE_UNSPECIFIED');
  static const AuthProviderType EMAIL_OTP =
      AuthProviderType._(1, _omitEnumNames ? '' : 'EMAIL_OTP');
  static const AuthProviderType SMS_OTP =
      AuthProviderType._(2, _omitEnumNames ? '' : 'SMS_OTP');

  static const $core.List<AuthProviderType> values = <AuthProviderType>[
    AUTH_PROVIDER_TYPE_UNSPECIFIED,
    EMAIL_OTP,
    SMS_OTP,
  ];

  static final $core.Map<$core.int, AuthProviderType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AuthProviderType? valueOf($core.int value) => _byValue[value];

  const AuthProviderType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

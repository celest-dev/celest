// This is a generated file - do not edit.
//
// Generated from celest/cloud/auth/v1alpha1/users.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The social provider to authenticate with.
class IdentityProviderType extends $pb.ProtobufEnum {
  /// Unspecified identity provider.
  static const IdentityProviderType IDENTITY_PROVIDER_TYPE_UNSPECIFIED =
      IdentityProviderType._(
          0, _omitEnumNames ? '' : 'IDENTITY_PROVIDER_TYPE_UNSPECIFIED');

  /// Authenticate using Google.
  static const IdentityProviderType GOOGLE =
      IdentityProviderType._(1, _omitEnumNames ? '' : 'GOOGLE');

  /// Authenticate using Apple.
  static const IdentityProviderType APPLE =
      IdentityProviderType._(2, _omitEnumNames ? '' : 'APPLE');

  /// Authenticate using GitHub.
  static const IdentityProviderType GITHUB =
      IdentityProviderType._(3, _omitEnumNames ? '' : 'GITHUB');

  static const $core.List<IdentityProviderType> values = <IdentityProviderType>[
    IDENTITY_PROVIDER_TYPE_UNSPECIFIED,
    GOOGLE,
    APPLE,
    GITHUB,
  ];

  static final $core.List<IdentityProviderType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static IdentityProviderType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IdentityProviderType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

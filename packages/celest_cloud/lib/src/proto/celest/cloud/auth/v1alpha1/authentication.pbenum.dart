//
//  Generated code. Do not modify.
//  source: celest/cloud/auth/v1alpha1/authentication.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The type of client initiating a session.
class ClientType extends $pb.ProtobufEnum {
  static const ClientType CLIENT_TYPE_UNSPECIFIED =
      ClientType._(0, _omitEnumNames ? '' : 'CLIENT_TYPE_UNSPECIFIED');
  static const ClientType WEB = ClientType._(1, _omitEnumNames ? '' : 'WEB');
  static const ClientType ANDROID =
      ClientType._(2, _omitEnumNames ? '' : 'ANDROID');
  static const ClientType IOS = ClientType._(3, _omitEnumNames ? '' : 'IOS');
  static const ClientType MACOS =
      ClientType._(4, _omitEnumNames ? '' : 'MACOS');
  static const ClientType WINDOWS =
      ClientType._(5, _omitEnumNames ? '' : 'WINDOWS');
  static const ClientType LINUX =
      ClientType._(6, _omitEnumNames ? '' : 'LINUX');
  static const ClientType HEADLESS =
      ClientType._(7, _omitEnumNames ? '' : 'HEADLESS');

  static const $core.List<ClientType> values = <ClientType>[
    CLIENT_TYPE_UNSPECIFIED,
    WEB,
    ANDROID,
    IOS,
    MACOS,
    WINDOWS,
    LINUX,
    HEADLESS,
  ];

  static final $core.Map<$core.int, ClientType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ClientType? valueOf($core.int value) => _byValue[value];

  const ClientType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

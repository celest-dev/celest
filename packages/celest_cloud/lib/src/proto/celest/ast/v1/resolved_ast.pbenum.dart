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

/// The type of the stream configuration.
class ResolvedStreamConfig_Type extends $pb.ProtobufEnum {
  static const ResolvedStreamConfig_Type STREAM_CONFIG_TYPE_UNSPECIFIED =
      ResolvedStreamConfig_Type._(
          0, _omitEnumNames ? '' : 'STREAM_CONFIG_TYPE_UNSPECIFIED');
  static const ResolvedStreamConfig_Type UNIDIRECTIONAL_CLIENT =
      ResolvedStreamConfig_Type._(
          1, _omitEnumNames ? '' : 'UNIDIRECTIONAL_CLIENT');
  static const ResolvedStreamConfig_Type UNIDIRECTIONAL_SERVER =
      ResolvedStreamConfig_Type._(
          2, _omitEnumNames ? '' : 'UNIDIRECTIONAL_SERVER');
  static const ResolvedStreamConfig_Type BIDIRECTIONAL =
      ResolvedStreamConfig_Type._(3, _omitEnumNames ? '' : 'BIDIRECTIONAL');

  static const $core.List<ResolvedStreamConfig_Type> values =
      <ResolvedStreamConfig_Type>[
    STREAM_CONFIG_TYPE_UNSPECIFIED,
    UNIDIRECTIONAL_CLIENT,
    UNIDIRECTIONAL_SERVER,
    BIDIRECTIONAL,
  ];

  static final $core.Map<$core.int, ResolvedStreamConfig_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResolvedStreamConfig_Type? valueOf($core.int value) => _byValue[value];

  const ResolvedStreamConfig_Type._($core.int v, $core.String n) : super(v, n);
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
  static const ResolvedAuthProvider_Type APPLE =
      ResolvedAuthProvider_Type._(5, _omitEnumNames ? '' : 'APPLE');

  static const $core.List<ResolvedAuthProvider_Type> values =
      <ResolvedAuthProvider_Type>[
    AUTH_PROVIDER_TYPE_UNSPECIFIED,
    EMAIL_OTP,
    SMS_OTP,
    GOOGLE,
    GITHUB,
    APPLE,
  ];

  static final $core.Map<$core.int, ResolvedAuthProvider_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResolvedAuthProvider_Type? valueOf($core.int value) => _byValue[value];

  const ResolvedAuthProvider_Type._($core.int v, $core.String n) : super(v, n);
}

/// The type of an auth provider.
class ResolvedExternalAuthProvider_Type extends $pb.ProtobufEnum {
  static const ResolvedExternalAuthProvider_Type
      EXTERNAL_AUTH_PROVIDER_TYPE_UNSPECIFIED =
      ResolvedExternalAuthProvider_Type._(
          0, _omitEnumNames ? '' : 'EXTERNAL_AUTH_PROVIDER_TYPE_UNSPECIFIED');
  static const ResolvedExternalAuthProvider_Type FIREBASE =
      ResolvedExternalAuthProvider_Type._(1, _omitEnumNames ? '' : 'FIREBASE');
  static const ResolvedExternalAuthProvider_Type SUPABASE =
      ResolvedExternalAuthProvider_Type._(2, _omitEnumNames ? '' : 'SUPABASE');

  static const $core.List<ResolvedExternalAuthProvider_Type> values =
      <ResolvedExternalAuthProvider_Type>[
    EXTERNAL_AUTH_PROVIDER_TYPE_UNSPECIFIED,
    FIREBASE,
    SUPABASE,
  ];

  static final $core.Map<$core.int, ResolvedExternalAuthProvider_Type>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResolvedExternalAuthProvider_Type? valueOf($core.int value) =>
      _byValue[value];

  const ResolvedExternalAuthProvider_Type._($core.int v, $core.String n)
      : super(v, n);
}

/// The type of the database.
class ResolvedDatabase_Type extends $pb.ProtobufEnum {
  static const ResolvedDatabase_Type DATABASE_TYPE_UNSPECIFIED =
      ResolvedDatabase_Type._(
          0, _omitEnumNames ? '' : 'DATABASE_TYPE_UNSPECIFIED');
  static const ResolvedDatabase_Type CELEST =
      ResolvedDatabase_Type._(1, _omitEnumNames ? '' : 'CELEST');

  static const $core.List<ResolvedDatabase_Type> values =
      <ResolvedDatabase_Type>[
    DATABASE_TYPE_UNSPECIFIED,
    CELEST,
  ];

  static final $core.Map<$core.int, ResolvedDatabase_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResolvedDatabase_Type? valueOf($core.int value) => _byValue[value];

  const ResolvedDatabase_Type._($core.int v, $core.String n) : super(v, n);
}

/// The type of the database schema.
class ResolvedDatabaseSchema_Type extends $pb.ProtobufEnum {
  static const ResolvedDatabaseSchema_Type DATABASE_SCHEMA_TYPE_UNSPECIFIED =
      ResolvedDatabaseSchema_Type._(
          0, _omitEnumNames ? '' : 'DATABASE_SCHEMA_TYPE_UNSPECIFIED');
  static const ResolvedDatabaseSchema_Type DRIFT =
      ResolvedDatabaseSchema_Type._(1, _omitEnumNames ? '' : 'DRIFT');

  static const $core.List<ResolvedDatabaseSchema_Type> values =
      <ResolvedDatabaseSchema_Type>[
    DATABASE_SCHEMA_TYPE_UNSPECIFIED,
    DRIFT,
  ];

  static final $core.Map<$core.int, ResolvedDatabaseSchema_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ResolvedDatabaseSchema_Type? valueOf($core.int value) =>
      _byValue[value];

  const ResolvedDatabaseSchema_Type._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/authz.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/api/auth.pb.dart' as $27;

class Authz {
  static final authn = $pb.Extension<$27.AuthenticationRule>(
      _omitMessageNames ? '' : 'google.protobuf.MethodOptions',
      _omitFieldNames ? '' : 'authn',
      32649046,
      $pb.PbFieldType.OM,
      defaultOrMaker: $27.AuthenticationRule.getDefault,
      subBuilder: $27.AuthenticationRule.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(authn);
  }
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

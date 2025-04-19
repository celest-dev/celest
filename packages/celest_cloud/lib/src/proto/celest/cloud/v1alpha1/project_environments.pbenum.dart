//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/project_environments.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The type of project asset.
class ProjectAsset_Type extends $pb.ProtobufEnum {
  static const ProjectAsset_Type TYPE_UNSPECIFIED =
      ProjectAsset_Type._(0, _omitEnumNames ? '' : 'TYPE_UNSPECIFIED');
  static const ProjectAsset_Type DART_KERNEL =
      ProjectAsset_Type._(1, _omitEnumNames ? '' : 'DART_KERNEL');
  static const ProjectAsset_Type FLUTTER_ASSETS =
      ProjectAsset_Type._(2, _omitEnumNames ? '' : 'FLUTTER_ASSETS');

  static const $core.List<ProjectAsset_Type> values = <ProjectAsset_Type>[
    TYPE_UNSPECIFIED,
    DART_KERNEL,
    FLUTTER_ASSETS,
  ];

  static final $core.Map<$core.int, ProjectAsset_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ProjectAsset_Type? valueOf($core.int value) => _byValue[value];

  const ProjectAsset_Type._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

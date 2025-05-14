//
//  Generated code. Do not modify.
//  source: celest/cloud/v1alpha1/project_environments.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The type of project asset.
class ProjectAsset_Type extends $pb.ProtobufEnum {
  /// The type is not specified.
  static const ProjectAsset_Type TYPE_UNSPECIFIED =
      ProjectAsset_Type._(0, _omitEnumNames ? '' : 'TYPE_UNSPECIFIED');

  /// The asset is a Dart kernel file.
  static const ProjectAsset_Type DART_KERNEL =
      ProjectAsset_Type._(1, _omitEnumNames ? '' : 'DART_KERNEL');

  /// The asset is a Dart executable, e.g. created with `dart compile exe`.
  static const ProjectAsset_Type DART_EXECUTABLE =
      ProjectAsset_Type._(3, _omitEnumNames ? '' : 'DART_EXECUTABLE');

  /// The asset is a flutter_assets bundle.
  static const ProjectAsset_Type FLUTTER_ASSETS =
      ProjectAsset_Type._(2, _omitEnumNames ? '' : 'FLUTTER_ASSETS');

  static const $core.List<ProjectAsset_Type> values = <ProjectAsset_Type>[
    TYPE_UNSPECIFIED,
    DART_KERNEL,
    DART_EXECUTABLE,
    FLUTTER_ASSETS,
  ];

  static final $core.Map<$core.int, ProjectAsset_Type> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ProjectAsset_Type? valueOf($core.int value) => _byValue[value];

  const ProjectAsset_Type._(super.v, super.n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

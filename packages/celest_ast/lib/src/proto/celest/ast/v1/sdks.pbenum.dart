//
//  Generated code. Do not modify.
//  source: celest/ast/v1/sdks.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The type of SDK.
class SdkType extends $pb.ProtobufEnum {
  /// The SDK type is unspecified.
  static const SdkType SDK_TYPE_UNSPECIFIED =
      SdkType._(0, _omitEnumNames ? '' : 'SDK_TYPE_UNSPECIFIED');

  /// The Dart SDK.
  static const SdkType DART = SdkType._(1, _omitEnumNames ? '' : 'DART');

  /// The Flutter SDK.
  static const SdkType FLUTTER = SdkType._(2, _omitEnumNames ? '' : 'FLUTTER');

  static const $core.List<SdkType> values = <SdkType>[
    SDK_TYPE_UNSPECIFIED,
    DART,
    FLUTTER,
  ];

  static final $core.Map<$core.int, SdkType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SdkType? valueOf($core.int value) => _byValue[value];

  const SdkType._(super.v, super.n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

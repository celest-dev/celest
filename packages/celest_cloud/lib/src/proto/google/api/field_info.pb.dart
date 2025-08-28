// This is a generated file - do not edit.
//
// Generated from google/api/field_info.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'field_info.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'field_info.pbenum.dart';

/// Rich semantic information of an API field beyond basic typing.
class FieldInfo extends $pb.GeneratedMessage {
  factory FieldInfo({
    FieldInfo_Format? format,
    $core.Iterable<TypeReference>? referencedTypes,
  }) {
    final result = create();
    if (format != null) result.format = format;
    if (referencedTypes != null) result.referencedTypes.addAll(referencedTypes);
    return result;
  }

  FieldInfo._();

  factory FieldInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FieldInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FieldInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'),
      createEmptyInstance: create)
    ..e<FieldInfo_Format>(
        1, _omitFieldNames ? '' : 'format', $pb.PbFieldType.OE,
        defaultOrMaker: FieldInfo_Format.FORMAT_UNSPECIFIED,
        valueOf: FieldInfo_Format.valueOf,
        enumValues: FieldInfo_Format.values)
    ..pc<TypeReference>(
        2, _omitFieldNames ? '' : 'referencedTypes', $pb.PbFieldType.PM,
        subBuilder: TypeReference.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FieldInfo clone() => FieldInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FieldInfo copyWith(void Function(FieldInfo) updates) =>
      super.copyWith((message) => updates(message as FieldInfo)) as FieldInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldInfo create() => FieldInfo._();
  @$core.override
  FieldInfo createEmptyInstance() => create();
  static $pb.PbList<FieldInfo> createRepeated() => $pb.PbList<FieldInfo>();
  @$core.pragma('dart2js:noInline')
  static FieldInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldInfo>(create);
  static FieldInfo? _defaultInstance;

  /// The standard format of a field value. This does not explicitly configure
  /// any API consumer, just documents the API's format for the field it is
  /// applied to.
  @$pb.TagNumber(1)
  FieldInfo_Format get format => $_getN(0);
  @$pb.TagNumber(1)
  set format(FieldInfo_Format value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFormat() => $_has(0);
  @$pb.TagNumber(1)
  void clearFormat() => $_clearField(1);

  /// The type(s) that the annotated, generic field may represent.
  ///
  /// Currently, this must only be used on fields of type `google.protobuf.Any`.
  /// Supporting other generic types may be considered in the future.
  @$pb.TagNumber(2)
  $pb.PbList<TypeReference> get referencedTypes => $_getList(1);
}

/// A reference to a message type, for use in [FieldInfo][google.api.FieldInfo].
class TypeReference extends $pb.GeneratedMessage {
  factory TypeReference({
    $core.String? typeName,
  }) {
    final result = create();
    if (typeName != null) result.typeName = typeName;
    return result;
  }

  TypeReference._();

  factory TypeReference.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TypeReference.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TypeReference',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'typeName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TypeReference clone() => TypeReference()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TypeReference copyWith(void Function(TypeReference) updates) =>
      super.copyWith((message) => updates(message as TypeReference))
          as TypeReference;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TypeReference create() => TypeReference._();
  @$core.override
  TypeReference createEmptyInstance() => create();
  static $pb.PbList<TypeReference> createRepeated() =>
      $pb.PbList<TypeReference>();
  @$core.pragma('dart2js:noInline')
  static TypeReference getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TypeReference>(create);
  static TypeReference? _defaultInstance;

  /// The name of the type that the annotated, generic field may represent.
  /// If the type is in the same protobuf package, the value can be the simple
  /// message name e.g., `"MyMessage"`. Otherwise, the value must be the
  /// fully-qualified message name e.g., `"google.library.v1.Book"`.
  ///
  /// If the type(s) are unknown to the service (e.g. the field accepts generic
  /// user input), use the wildcard `"*"` to denote this behavior.
  ///
  /// See [AIP-202](https://google.aip.dev/202#type-references) for more details.
  @$pb.TagNumber(1)
  $core.String get typeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set typeName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTypeName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeName() => $_clearField(1);
}

class Field_info {
  static final fieldInfo = $pb.Extension<FieldInfo>(
      _omitMessageNames ? '' : 'google.protobuf.FieldOptions',
      _omitFieldNames ? '' : 'fieldInfo',
      291403980,
      $pb.PbFieldType.OM,
      defaultOrMaker: FieldInfo.getDefault,
      subBuilder: FieldInfo.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(fieldInfo);
  }
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

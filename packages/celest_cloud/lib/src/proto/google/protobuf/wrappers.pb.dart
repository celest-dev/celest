// This is a generated file - do not edit.
//
// Generated from google/protobuf/wrappers.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/src/protobuf/mixins/well_known.dart' as $mixin;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Wrapper message for `double`.
///
/// The JSON representation for `DoubleValue` is JSON number.
class DoubleValue extends $pb.GeneratedMessage with $mixin.DoubleValueMixin {
  factory DoubleValue({
    $core.double? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  DoubleValue._();

  factory DoubleValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DoubleValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DoubleValue',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.DoubleValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.DoubleValueMixin.fromProto3JsonHelper)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DoubleValue clone() => DoubleValue()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DoubleValue copyWith(void Function(DoubleValue) updates) =>
      super.copyWith((message) => updates(message as DoubleValue))
          as DoubleValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DoubleValue create() => DoubleValue._();
  @$core.override
  DoubleValue createEmptyInstance() => create();
  static $pb.PbList<DoubleValue> createRepeated() => $pb.PbList<DoubleValue>();
  @$core.pragma('dart2js:noInline')
  static DoubleValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DoubleValue>(create);
  static DoubleValue? _defaultInstance;

  /// The double value.
  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `float`.
///
/// The JSON representation for `FloatValue` is JSON number.
class FloatValue extends $pb.GeneratedMessage with $mixin.FloatValueMixin {
  factory FloatValue({
    $core.double? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  FloatValue._();

  factory FloatValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FloatValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FloatValue',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.FloatValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.FloatValueMixin.fromProto3JsonHelper)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FloatValue clone() => FloatValue()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FloatValue copyWith(void Function(FloatValue) updates) =>
      super.copyWith((message) => updates(message as FloatValue)) as FloatValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FloatValue create() => FloatValue._();
  @$core.override
  FloatValue createEmptyInstance() => create();
  static $pb.PbList<FloatValue> createRepeated() => $pb.PbList<FloatValue>();
  @$core.pragma('dart2js:noInline')
  static FloatValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FloatValue>(create);
  static FloatValue? _defaultInstance;

  /// The float value.
  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double value) => $_setFloat(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `int64`.
///
/// The JSON representation for `Int64Value` is JSON string.
class Int64Value extends $pb.GeneratedMessage with $mixin.Int64ValueMixin {
  factory Int64Value({
    $fixnum.Int64? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  Int64Value._();

  factory Int64Value.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Int64Value.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Int64Value',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.Int64ValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.Int64ValueMixin.fromProto3JsonHelper)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Int64Value clone() => Int64Value()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Int64Value copyWith(void Function(Int64Value) updates) =>
      super.copyWith((message) => updates(message as Int64Value)) as Int64Value;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Int64Value create() => Int64Value._();
  @$core.override
  Int64Value createEmptyInstance() => create();
  static $pb.PbList<Int64Value> createRepeated() => $pb.PbList<Int64Value>();
  @$core.pragma('dart2js:noInline')
  static Int64Value getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Int64Value>(create);
  static Int64Value? _defaultInstance;

  /// The int64 value.
  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `uint64`.
///
/// The JSON representation for `UInt64Value` is JSON string.
class UInt64Value extends $pb.GeneratedMessage with $mixin.UInt64ValueMixin {
  factory UInt64Value({
    $fixnum.Int64? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  UInt64Value._();

  factory UInt64Value.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UInt64Value.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UInt64Value',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.UInt64ValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.UInt64ValueMixin.fromProto3JsonHelper)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UInt64Value clone() => UInt64Value()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UInt64Value copyWith(void Function(UInt64Value) updates) =>
      super.copyWith((message) => updates(message as UInt64Value))
          as UInt64Value;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UInt64Value create() => UInt64Value._();
  @$core.override
  UInt64Value createEmptyInstance() => create();
  static $pb.PbList<UInt64Value> createRepeated() => $pb.PbList<UInt64Value>();
  @$core.pragma('dart2js:noInline')
  static UInt64Value getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UInt64Value>(create);
  static UInt64Value? _defaultInstance;

  /// The uint64 value.
  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `int32`.
///
/// The JSON representation for `Int32Value` is JSON number.
class Int32Value extends $pb.GeneratedMessage with $mixin.Int32ValueMixin {
  factory Int32Value({
    $core.int? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  Int32Value._();

  factory Int32Value.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Int32Value.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Int32Value',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.Int32ValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.Int32ValueMixin.fromProto3JsonHelper)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Int32Value clone() => Int32Value()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Int32Value copyWith(void Function(Int32Value) updates) =>
      super.copyWith((message) => updates(message as Int32Value)) as Int32Value;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Int32Value create() => Int32Value._();
  @$core.override
  Int32Value createEmptyInstance() => create();
  static $pb.PbList<Int32Value> createRepeated() => $pb.PbList<Int32Value>();
  @$core.pragma('dart2js:noInline')
  static Int32Value getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Int32Value>(create);
  static Int32Value? _defaultInstance;

  /// The int32 value.
  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `uint32`.
///
/// The JSON representation for `UInt32Value` is JSON number.
class UInt32Value extends $pb.GeneratedMessage with $mixin.UInt32ValueMixin {
  factory UInt32Value({
    $core.int? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  UInt32Value._();

  factory UInt32Value.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UInt32Value.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UInt32Value',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.UInt32ValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.UInt32ValueMixin.fromProto3JsonHelper)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UInt32Value clone() => UInt32Value()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UInt32Value copyWith(void Function(UInt32Value) updates) =>
      super.copyWith((message) => updates(message as UInt32Value))
          as UInt32Value;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UInt32Value create() => UInt32Value._();
  @$core.override
  UInt32Value createEmptyInstance() => create();
  static $pb.PbList<UInt32Value> createRepeated() => $pb.PbList<UInt32Value>();
  @$core.pragma('dart2js:noInline')
  static UInt32Value getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UInt32Value>(create);
  static UInt32Value? _defaultInstance;

  /// The uint32 value.
  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `bool`.
///
/// The JSON representation for `BoolValue` is JSON `true` and `false`.
class BoolValue extends $pb.GeneratedMessage with $mixin.BoolValueMixin {
  factory BoolValue({
    $core.bool? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  BoolValue._();

  factory BoolValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoolValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoolValue',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.BoolValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.BoolValueMixin.fromProto3JsonHelper)
    ..aOB(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoolValue clone() => BoolValue()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoolValue copyWith(void Function(BoolValue) updates) =>
      super.copyWith((message) => updates(message as BoolValue)) as BoolValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoolValue create() => BoolValue._();
  @$core.override
  BoolValue createEmptyInstance() => create();
  static $pb.PbList<BoolValue> createRepeated() => $pb.PbList<BoolValue>();
  @$core.pragma('dart2js:noInline')
  static BoolValue getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolValue>(create);
  static BoolValue? _defaultInstance;

  /// The bool value.
  @$pb.TagNumber(1)
  $core.bool get value => $_getBF(0);
  @$pb.TagNumber(1)
  set value($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `string`.
///
/// The JSON representation for `StringValue` is JSON string.
class StringValue extends $pb.GeneratedMessage with $mixin.StringValueMixin {
  factory StringValue({
    $core.String? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  StringValue._();

  factory StringValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StringValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StringValue',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.StringValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.StringValueMixin.fromProto3JsonHelper)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StringValue clone() => StringValue()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StringValue copyWith(void Function(StringValue) updates) =>
      super.copyWith((message) => updates(message as StringValue))
          as StringValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StringValue create() => StringValue._();
  @$core.override
  StringValue createEmptyInstance() => create();
  static $pb.PbList<StringValue> createRepeated() => $pb.PbList<StringValue>();
  @$core.pragma('dart2js:noInline')
  static StringValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StringValue>(create);
  static StringValue? _defaultInstance;

  /// The string value.
  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// Wrapper message for `bytes`.
///
/// The JSON representation for `BytesValue` is JSON string.
class BytesValue extends $pb.GeneratedMessage with $mixin.BytesValueMixin {
  factory BytesValue({
    $core.List<$core.int>? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  BytesValue._();

  factory BytesValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BytesValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BytesValue',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'google.protobuf'),
      createEmptyInstance: create,
      toProto3Json: $mixin.BytesValueMixin.toProto3JsonHelper,
      fromProto3Json: $mixin.BytesValueMixin.fromProto3JsonHelper)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BytesValue clone() => BytesValue()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BytesValue copyWith(void Function(BytesValue) updates) =>
      super.copyWith((message) => updates(message as BytesValue)) as BytesValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BytesValue create() => BytesValue._();
  @$core.override
  BytesValue createEmptyInstance() => create();
  static $pb.PbList<BytesValue> createRepeated() => $pb.PbList<BytesValue>();
  @$core.pragma('dart2js:noInline')
  static BytesValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BytesValue>(create);
  static BytesValue? _defaultInstance;

  /// The bytes value.
  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

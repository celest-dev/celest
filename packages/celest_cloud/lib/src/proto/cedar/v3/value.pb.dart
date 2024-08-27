//
//  Generated code. Do not modify.
//  source: cedar/v3/value.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_id.pb.dart' as $48;

enum Value_Value {
  string,
  long,
  bool_3,
  set,
  record,
  extension_6,
  entity,
  notSet
}

class Value extends $pb.GeneratedMessage {
  factory Value({
    $core.String? string,
    $fixnum.Int64? long,
    $core.bool? bool_3,
    SetValue? set,
    RecordValue? record,
    ExtensionValue? extension_6,
    EntityValue? entity,
  }) {
    final $result = create();
    if (string != null) {
      $result.string = string;
    }
    if (long != null) {
      $result.long = long;
    }
    if (bool_3 != null) {
      $result.bool_3 = bool_3;
    }
    if (set != null) {
      $result.set = set;
    }
    if (record != null) {
      $result.record = record;
    }
    if (extension_6 != null) {
      $result.extension_6 = extension_6;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  Value._() : super();
  factory Value.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Value.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Value_Value> _Value_ValueByTag = {
    1: Value_Value.string,
    2: Value_Value.long,
    3: Value_Value.bool_3,
    4: Value_Value.set,
    5: Value_Value.record,
    6: Value_Value.extension_6,
    7: Value_Value.entity,
    0: Value_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Value',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7])
    ..aOS(1, _omitFieldNames ? '' : 'string')
    ..aInt64(2, _omitFieldNames ? '' : 'long')
    ..aOB(3, _omitFieldNames ? '' : 'bool')
    ..aOM<SetValue>(4, _omitFieldNames ? '' : 'set',
        subBuilder: SetValue.create)
    ..aOM<RecordValue>(5, _omitFieldNames ? '' : 'record',
        subBuilder: RecordValue.create)
    ..aOM<ExtensionValue>(6, _omitFieldNames ? '' : 'extension',
        subBuilder: ExtensionValue.create)
    ..aOM<EntityValue>(7, _omitFieldNames ? '' : 'entity',
        subBuilder: EntityValue.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Value clone() => Value()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Value copyWith(void Function(Value) updates) =>
      super.copyWith((message) => updates(message as Value)) as Value;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Value create() => Value._();
  Value createEmptyInstance() => create();
  static $pb.PbList<Value> createRepeated() => $pb.PbList<Value>();
  @$core.pragma('dart2js:noInline')
  static Value getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Value>(create);
  static Value? _defaultInstance;

  Value_Value whichValue() => _Value_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get string => $_getSZ(0);
  @$pb.TagNumber(1)
  set string($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasString() => $_has(0);
  @$pb.TagNumber(1)
  void clearString() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get long => $_getI64(1);
  @$pb.TagNumber(2)
  set long($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLong() => $_has(1);
  @$pb.TagNumber(2)
  void clearLong() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get bool_3 => $_getBF(2);
  @$pb.TagNumber(3)
  set bool_3($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBool_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearBool_3() => clearField(3);

  @$pb.TagNumber(4)
  SetValue get set => $_getN(3);
  @$pb.TagNumber(4)
  set set(SetValue v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSet() => $_has(3);
  @$pb.TagNumber(4)
  void clearSet() => clearField(4);
  @$pb.TagNumber(4)
  SetValue ensureSet() => $_ensure(3);

  @$pb.TagNumber(5)
  RecordValue get record => $_getN(4);
  @$pb.TagNumber(5)
  set record(RecordValue v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRecord() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecord() => clearField(5);
  @$pb.TagNumber(5)
  RecordValue ensureRecord() => $_ensure(4);

  @$pb.TagNumber(6)
  ExtensionValue get extension_6 => $_getN(5);
  @$pb.TagNumber(6)
  set extension_6(ExtensionValue v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasExtension_6() => $_has(5);
  @$pb.TagNumber(6)
  void clearExtension_6() => clearField(6);
  @$pb.TagNumber(6)
  ExtensionValue ensureExtension_6() => $_ensure(5);

  @$pb.TagNumber(7)
  EntityValue get entity => $_getN(6);
  @$pb.TagNumber(7)
  set entity(EntityValue v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEntity() => $_has(6);
  @$pb.TagNumber(7)
  void clearEntity() => clearField(7);
  @$pb.TagNumber(7)
  EntityValue ensureEntity() => $_ensure(6);
}

class SetValue extends $pb.GeneratedMessage {
  factory SetValue({
    $core.Iterable<Value>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  SetValue._() : super();
  factory SetValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..pc<Value>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.PM,
        subBuilder: Value.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetValue clone() => SetValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetValue copyWith(void Function(SetValue) updates) =>
      super.copyWith((message) => updates(message as SetValue)) as SetValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetValue create() => SetValue._();
  SetValue createEmptyInstance() => create();
  static $pb.PbList<SetValue> createRepeated() => $pb.PbList<SetValue>();
  @$core.pragma('dart2js:noInline')
  static SetValue getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetValue>(create);
  static SetValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Value> get values => $_getList(0);
}

class RecordValue extends $pb.GeneratedMessage {
  factory RecordValue({
    $core.Map<$core.String, Value>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  RecordValue._() : super();
  factory RecordValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecordValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecordValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..m<$core.String, Value>(1, _omitFieldNames ? '' : 'values',
        entryClassName: 'RecordValue.ValuesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Value.create,
        valueDefaultOrMaker: Value.getDefault,
        packageName: const $pb.PackageName('cedar.v3'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecordValue clone() => RecordValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecordValue copyWith(void Function(RecordValue) updates) =>
      super.copyWith((message) => updates(message as RecordValue))
          as RecordValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordValue create() => RecordValue._();
  RecordValue createEmptyInstance() => create();
  static $pb.PbList<RecordValue> createRepeated() => $pb.PbList<RecordValue>();
  @$core.pragma('dart2js:noInline')
  static RecordValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecordValue>(create);
  static RecordValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, Value> get values => $_getMap(0);
}

class ExtensionValue extends $pb.GeneratedMessage {
  factory ExtensionValue({
    $core.String? fn,
    Value? arg,
  }) {
    final $result = create();
    if (fn != null) {
      $result.fn = fn;
    }
    if (arg != null) {
      $result.arg = arg;
    }
    return $result;
  }
  ExtensionValue._() : super();
  factory ExtensionValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExtensionValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExtensionValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fn')
    ..aOM<Value>(2, _omitFieldNames ? '' : 'arg', subBuilder: Value.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExtensionValue clone() => ExtensionValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExtensionValue copyWith(void Function(ExtensionValue) updates) =>
      super.copyWith((message) => updates(message as ExtensionValue))
          as ExtensionValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtensionValue create() => ExtensionValue._();
  ExtensionValue createEmptyInstance() => create();
  static $pb.PbList<ExtensionValue> createRepeated() =>
      $pb.PbList<ExtensionValue>();
  @$core.pragma('dart2js:noInline')
  static ExtensionValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExtensionValue>(create);
  static ExtensionValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fn => $_getSZ(0);
  @$pb.TagNumber(1)
  set fn($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFn() => $_has(0);
  @$pb.TagNumber(1)
  void clearFn() => clearField(1);

  @$pb.TagNumber(2)
  Value get arg => $_getN(1);
  @$pb.TagNumber(2)
  set arg(Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasArg() => $_has(1);
  @$pb.TagNumber(2)
  void clearArg() => clearField(2);
  @$pb.TagNumber(2)
  Value ensureArg() => $_ensure(1);
}

class EntityValue extends $pb.GeneratedMessage {
  factory EntityValue({
    $48.EntityId? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  EntityValue._() : super();
  factory EntityValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EntityValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EntityValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOM<$48.EntityId>(1, _omitFieldNames ? '' : 'uid',
        subBuilder: $48.EntityId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EntityValue clone() => EntityValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EntityValue copyWith(void Function(EntityValue) updates) =>
      super.copyWith((message) => updates(message as EntityValue))
          as EntityValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EntityValue create() => EntityValue._();
  EntityValue createEmptyInstance() => create();
  static $pb.PbList<EntityValue> createRepeated() => $pb.PbList<EntityValue>();
  @$core.pragma('dart2js:noInline')
  static EntityValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EntityValue>(create);
  static EntityValue? _defaultInstance;

  @$pb.TagNumber(1)
  $48.EntityId get uid => $_getN(0);
  @$pb.TagNumber(1)
  set uid($48.EntityId v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
  @$pb.TagNumber(1)
  $48.EntityId ensureUid() => $_ensure(0);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

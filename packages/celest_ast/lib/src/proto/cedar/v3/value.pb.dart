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

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/wrappers.pb.dart' as $0;
import 'entity_uid.pb.dart' as $1;

enum Value_Value {
  string,
  long,
  bool_3,
  set,
  record,
  extensionCall,
  entity,
  decimal,
  notSet
}

class Value extends $pb.GeneratedMessage {
  factory Value({
    $0.StringValue? string,
    $0.Int64Value? long,
    $0.BoolValue? bool_3,
    SetValue? set,
    RecordValue? record,
    ExtensionCall? extensionCall,
    EntityValue? entity,
    DecimalValue? decimal,
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
    if (extensionCall != null) {
      $result.extensionCall = extensionCall;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    if (decimal != null) {
      $result.decimal = decimal;
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
    6: Value_Value.extensionCall,
    7: Value_Value.entity,
    8: Value_Value.decimal,
    0: Value_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Value',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8])
    ..aOM<$0.StringValue>(1, _omitFieldNames ? '' : 'string',
        subBuilder: $0.StringValue.create)
    ..aOM<$0.Int64Value>(2, _omitFieldNames ? '' : 'long',
        subBuilder: $0.Int64Value.create)
    ..aOM<$0.BoolValue>(3, _omitFieldNames ? '' : 'bool',
        subBuilder: $0.BoolValue.create)
    ..aOM<SetValue>(4, _omitFieldNames ? '' : 'set',
        subBuilder: SetValue.create)
    ..aOM<RecordValue>(5, _omitFieldNames ? '' : 'record',
        subBuilder: RecordValue.create)
    ..aOM<ExtensionCall>(6, _omitFieldNames ? '' : 'extensionCall',
        subBuilder: ExtensionCall.create)
    ..aOM<EntityValue>(7, _omitFieldNames ? '' : 'entity',
        subBuilder: EntityValue.create)
    ..aOM<DecimalValue>(8, _omitFieldNames ? '' : 'decimal',
        subBuilder: DecimalValue.create)
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
  $0.StringValue get string => $_getN(0);
  @$pb.TagNumber(1)
  set string($0.StringValue v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasString() => $_has(0);
  @$pb.TagNumber(1)
  void clearString() => clearField(1);
  @$pb.TagNumber(1)
  $0.StringValue ensureString() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Int64Value get long => $_getN(1);
  @$pb.TagNumber(2)
  set long($0.Int64Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLong() => $_has(1);
  @$pb.TagNumber(2)
  void clearLong() => clearField(2);
  @$pb.TagNumber(2)
  $0.Int64Value ensureLong() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.BoolValue get bool_3 => $_getN(2);
  @$pb.TagNumber(3)
  set bool_3($0.BoolValue v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBool_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearBool_3() => clearField(3);
  @$pb.TagNumber(3)
  $0.BoolValue ensureBool_3() => $_ensure(2);

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
  ExtensionCall get extensionCall => $_getN(5);
  @$pb.TagNumber(6)
  set extensionCall(ExtensionCall v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasExtensionCall() => $_has(5);
  @$pb.TagNumber(6)
  void clearExtensionCall() => clearField(6);
  @$pb.TagNumber(6)
  ExtensionCall ensureExtensionCall() => $_ensure(5);

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

  @$pb.TagNumber(8)
  DecimalValue get decimal => $_getN(7);
  @$pb.TagNumber(8)
  set decimal(DecimalValue v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDecimal() => $_has(7);
  @$pb.TagNumber(8)
  void clearDecimal() => clearField(8);
  @$pb.TagNumber(8)
  DecimalValue ensureDecimal() => $_ensure(7);
}

class SetValue extends $pb.GeneratedMessage {
  factory SetValue({
    $core.Iterable<Value>? elements,
  }) {
    final $result = create();
    if (elements != null) {
      $result.elements.addAll(elements);
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
    ..pc<Value>(1, _omitFieldNames ? '' : 'elements', $pb.PbFieldType.PM,
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
  $core.List<Value> get elements => $_getList(0);
}

class RecordValue extends $pb.GeneratedMessage {
  factory RecordValue({
    $core.Map<$core.String, Value>? attributes,
  }) {
    final $result = create();
    if (attributes != null) {
      $result.attributes.addAll(attributes);
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
    ..m<$core.String, Value>(1, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'RecordValue.AttributesEntry',
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
  $core.Map<$core.String, Value> get attributes => $_getMap(0);
}

class ExtensionCall extends $pb.GeneratedMessage {
  factory ExtensionCall({
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
  ExtensionCall._() : super();
  factory ExtensionCall.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExtensionCall.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExtensionCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fn')
    ..aOM<Value>(2, _omitFieldNames ? '' : 'arg', subBuilder: Value.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExtensionCall clone() => ExtensionCall()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExtensionCall copyWith(void Function(ExtensionCall) updates) =>
      super.copyWith((message) => updates(message as ExtensionCall))
          as ExtensionCall;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtensionCall create() => ExtensionCall._();
  ExtensionCall createEmptyInstance() => create();
  static $pb.PbList<ExtensionCall> createRepeated() =>
      $pb.PbList<ExtensionCall>();
  @$core.pragma('dart2js:noInline')
  static ExtensionCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExtensionCall>(create);
  static ExtensionCall? _defaultInstance;

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
    $1.EntityUid? uid,
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
    ..aOM<$1.EntityUid>(1, _omitFieldNames ? '' : 'uid',
        subBuilder: $1.EntityUid.create)
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
  $1.EntityUid get uid => $_getN(0);
  @$pb.TagNumber(1)
  set uid($1.EntityUid v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
  @$pb.TagNumber(1)
  $1.EntityUid ensureUid() => $_ensure(0);
}

class DecimalValue extends $pb.GeneratedMessage {
  factory DecimalValue({
    $core.String? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  DecimalValue._() : super();
  factory DecimalValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DecimalValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DecimalValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cedar.v3'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DecimalValue clone() => DecimalValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DecimalValue copyWith(void Function(DecimalValue) updates) =>
      super.copyWith((message) => updates(message as DecimalValue))
          as DecimalValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecimalValue create() => DecimalValue._();
  DecimalValue createEmptyInstance() => create();
  static $pb.PbList<DecimalValue> createRepeated() =>
      $pb.PbList<DecimalValue>();
  @$core.pragma('dart2js:noInline')
  static DecimalValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecimalValue>(create);
  static DecimalValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

//
//  Generated code. Do not modify.
//  source: buf/validate/validate.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/descriptor.pbenum.dart' as $10;
import '../../google/protobuf/duration.pb.dart' as $8;
import '../../google/protobuf/timestamp.pb.dart' as $9;
import 'validate.pbenum.dart';

export 'validate.pbenum.dart';

///  `Constraint` represents a validation rule written in the Common Expression
///  Language (CEL) syntax. Each Constraint includes a unique identifier, an
///  optional error message, and the CEL expression to evaluate. For more
///  information on CEL, [see our documentation](https://github.com/bufbuild/protovalidate/blob/main/docs/cel.md).
///
///  ```proto
///  message Foo {
///    option (buf.validate.message).cel = {
///      id: "foo.bar"
///      message: "bar must be greater than 0"
///      expression: "this.bar > 0"
///    };
///    int32 bar = 1;
///  }
///  ```
class Constraint extends $pb.GeneratedMessage {
  factory Constraint({
    $core.String? id,
    $core.String? message,
    $core.String? expression,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (message != null) {
      $result.message = message;
    }
    if (expression != null) {
      $result.expression = expression;
    }
    return $result;
  }
  Constraint._() : super();
  factory Constraint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Constraint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Constraint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'expression')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Constraint clone() => Constraint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Constraint copyWith(void Function(Constraint) updates) =>
      super.copyWith((message) => updates(message as Constraint)) as Constraint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Constraint create() => Constraint._();
  Constraint createEmptyInstance() => create();
  static $pb.PbList<Constraint> createRepeated() => $pb.PbList<Constraint>();
  @$core.pragma('dart2js:noInline')
  static Constraint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Constraint>(create);
  static Constraint? _defaultInstance;

  /// `id` is a string that serves as a machine-readable name for this Constraint.
  /// It should be unique within its scope, which could be either a message or a field.
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// `message` is an optional field that provides a human-readable error message
  /// for this Constraint when the CEL expression evaluates to false. If a
  /// non-empty message is provided, any strings resulting from the CEL
  /// expression evaluation are ignored.
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  /// `expression` is the actual CEL expression that will be evaluated for
  /// validation. This string must resolve to either a boolean or a string
  /// value. If the expression evaluates to false or a non-empty string, the
  /// validation is considered failed, and the message is rejected.
  @$pb.TagNumber(3)
  $core.String get expression => $_getSZ(2);
  @$pb.TagNumber(3)
  set expression($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExpression() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpression() => clearField(3);
}

/// MessageConstraints represents validation rules that are applied to the entire message.
/// It includes disabling options and a list of Constraint messages representing Common Expression Language (CEL) validation rules.
class MessageConstraints extends $pb.GeneratedMessage {
  factory MessageConstraints({
    $core.bool? disabled,
    $core.Iterable<Constraint>? cel,
  }) {
    final $result = create();
    if (disabled != null) {
      $result.disabled = disabled;
    }
    if (cel != null) {
      $result.cel.addAll(cel);
    }
    return $result;
  }
  MessageConstraints._() : super();
  factory MessageConstraints.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MessageConstraints.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageConstraints',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'disabled')
    ..pc<Constraint>(3, _omitFieldNames ? '' : 'cel', $pb.PbFieldType.PM,
        subBuilder: Constraint.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MessageConstraints clone() => MessageConstraints()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MessageConstraints copyWith(void Function(MessageConstraints) updates) =>
      super.copyWith((message) => updates(message as MessageConstraints))
          as MessageConstraints;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageConstraints create() => MessageConstraints._();
  MessageConstraints createEmptyInstance() => create();
  static $pb.PbList<MessageConstraints> createRepeated() =>
      $pb.PbList<MessageConstraints>();
  @$core.pragma('dart2js:noInline')
  static MessageConstraints getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageConstraints>(create);
  static MessageConstraints? _defaultInstance;

  ///  `disabled` is a boolean flag that, when set to true, nullifies any validation rules for this message.
  ///  This includes any fields within the message that would otherwise support validation.
  ///
  ///  ```proto
  ///  message MyMessage {
  ///    // validation will be bypassed for this message
  ///    option (buf.validate.message).disabled = true;
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.bool get disabled => $_getBF(0);
  @$pb.TagNumber(1)
  set disabled($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDisabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisabled() => clearField(1);

  ///  `cel` is a repeated field of type Constraint. Each Constraint specifies a validation rule to be applied to this message.
  ///  These constraints are written in Common Expression Language (CEL) syntax. For more information on
  ///  CEL, [see our documentation](https://github.com/bufbuild/protovalidate/blob/main/docs/cel.md).
  ///
  ///
  ///  ```proto
  ///  message MyMessage {
  ///    // The field `foo` must be greater than 42.
  ///    option (buf.validate.message).cel = {
  ///      id: "my_message.value",
  ///      message: "value must be greater than 42",
  ///      expression: "this.foo > 42",
  ///    };
  ///    optional int32 foo = 1;
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.List<Constraint> get cel => $_getList(1);
}

/// The `OneofConstraints` message type enables you to manage constraints for
/// oneof fields in your protobuf messages.
class OneofConstraints extends $pb.GeneratedMessage {
  factory OneofConstraints({
    $core.bool? required,
  }) {
    final $result = create();
    if (required != null) {
      $result.required = required;
    }
    return $result;
  }
  OneofConstraints._() : super();
  factory OneofConstraints.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OneofConstraints.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OneofConstraints',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'required')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OneofConstraints clone() => OneofConstraints()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OneofConstraints copyWith(void Function(OneofConstraints) updates) =>
      super.copyWith((message) => updates(message as OneofConstraints))
          as OneofConstraints;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OneofConstraints create() => OneofConstraints._();
  OneofConstraints createEmptyInstance() => create();
  static $pb.PbList<OneofConstraints> createRepeated() =>
      $pb.PbList<OneofConstraints>();
  @$core.pragma('dart2js:noInline')
  static OneofConstraints getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OneofConstraints>(create);
  static OneofConstraints? _defaultInstance;

  ///  If `required` is true, exactly one field of the oneof must be present. A
  ///  validation error is returned if no fields in the oneof are present. The
  ///  field itself may still be a default value; further constraints
  ///  should be placed on the fields themselves to ensure they are valid values,
  ///  such as `min_len` or `gt`.
  ///
  ///  ```proto
  ///  message MyMessage {
  ///    oneof value {
  ///      // Either `a` or `b` must be set. If `a` is set, it must also be
  ///      // non-empty; whereas if `b` is set, it can still be an empty string.
  ///      option (buf.validate.oneof).required = true;
  ///      string a = 1 [(buf.validate.field).string.min_len = 1];
  ///      string b = 2;
  ///    }
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.bool get required => $_getBF(0);
  @$pb.TagNumber(1)
  set required($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRequired() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequired() => clearField(1);
}

enum FieldConstraints_Type {
  float,
  double_2,
  int32,
  int64,
  uint32,
  uint64,
  sint32,
  sint64,
  fixed32,
  fixed64,
  sfixed32,
  sfixed64,
  bool_13,
  string,
  bytes,
  enum_16,
  repeated,
  map,
  any,
  duration,
  timestamp,
  notSet
}

/// FieldConstraints encapsulates the rules for each type of field. Depending on
/// the field, the correct set should be used to ensure proper validations.
class FieldConstraints extends $pb.GeneratedMessage {
  factory FieldConstraints({
    FloatRules? float,
    DoubleRules? double_2,
    Int32Rules? int32,
    Int64Rules? int64,
    UInt32Rules? uint32,
    UInt64Rules? uint64,
    SInt32Rules? sint32,
    SInt64Rules? sint64,
    Fixed32Rules? fixed32,
    Fixed64Rules? fixed64,
    SFixed32Rules? sfixed32,
    SFixed64Rules? sfixed64,
    BoolRules? bool_13,
    StringRules? string,
    BytesRules? bytes,
    EnumRules? enum_16,
    RepeatedRules? repeated,
    MapRules? map,
    AnyRules? any,
    DurationRules? duration,
    TimestampRules? timestamp,
    $core.Iterable<Constraint>? cel,
    $core.bool? required,
    Ignore? ignore,
  }) {
    final $result = create();
    if (float != null) {
      $result.float = float;
    }
    if (double_2 != null) {
      $result.double_2 = double_2;
    }
    if (int32 != null) {
      $result.int32 = int32;
    }
    if (int64 != null) {
      $result.int64 = int64;
    }
    if (uint32 != null) {
      $result.uint32 = uint32;
    }
    if (uint64 != null) {
      $result.uint64 = uint64;
    }
    if (sint32 != null) {
      $result.sint32 = sint32;
    }
    if (sint64 != null) {
      $result.sint64 = sint64;
    }
    if (fixed32 != null) {
      $result.fixed32 = fixed32;
    }
    if (fixed64 != null) {
      $result.fixed64 = fixed64;
    }
    if (sfixed32 != null) {
      $result.sfixed32 = sfixed32;
    }
    if (sfixed64 != null) {
      $result.sfixed64 = sfixed64;
    }
    if (bool_13 != null) {
      $result.bool_13 = bool_13;
    }
    if (string != null) {
      $result.string = string;
    }
    if (bytes != null) {
      $result.bytes = bytes;
    }
    if (enum_16 != null) {
      $result.enum_16 = enum_16;
    }
    if (repeated != null) {
      $result.repeated = repeated;
    }
    if (map != null) {
      $result.map = map;
    }
    if (any != null) {
      $result.any = any;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (cel != null) {
      $result.cel.addAll(cel);
    }
    if (required != null) {
      $result.required = required;
    }
    if (ignore != null) {
      $result.ignore = ignore;
    }
    return $result;
  }
  FieldConstraints._() : super();
  factory FieldConstraints.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FieldConstraints.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FieldConstraints_Type>
      _FieldConstraints_TypeByTag = {
    1: FieldConstraints_Type.float,
    2: FieldConstraints_Type.double_2,
    3: FieldConstraints_Type.int32,
    4: FieldConstraints_Type.int64,
    5: FieldConstraints_Type.uint32,
    6: FieldConstraints_Type.uint64,
    7: FieldConstraints_Type.sint32,
    8: FieldConstraints_Type.sint64,
    9: FieldConstraints_Type.fixed32,
    10: FieldConstraints_Type.fixed64,
    11: FieldConstraints_Type.sfixed32,
    12: FieldConstraints_Type.sfixed64,
    13: FieldConstraints_Type.bool_13,
    14: FieldConstraints_Type.string,
    15: FieldConstraints_Type.bytes,
    16: FieldConstraints_Type.enum_16,
    18: FieldConstraints_Type.repeated,
    19: FieldConstraints_Type.map,
    20: FieldConstraints_Type.any,
    21: FieldConstraints_Type.duration,
    22: FieldConstraints_Type.timestamp,
    0: FieldConstraints_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FieldConstraints',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      18,
      19,
      20,
      21,
      22
    ])
    ..aOM<FloatRules>(1, _omitFieldNames ? '' : 'float',
        subBuilder: FloatRules.create)
    ..aOM<DoubleRules>(2, _omitFieldNames ? '' : 'double',
        subBuilder: DoubleRules.create)
    ..aOM<Int32Rules>(3, _omitFieldNames ? '' : 'int32',
        subBuilder: Int32Rules.create)
    ..aOM<Int64Rules>(4, _omitFieldNames ? '' : 'int64',
        subBuilder: Int64Rules.create)
    ..aOM<UInt32Rules>(5, _omitFieldNames ? '' : 'uint32',
        subBuilder: UInt32Rules.create)
    ..aOM<UInt64Rules>(6, _omitFieldNames ? '' : 'uint64',
        subBuilder: UInt64Rules.create)
    ..aOM<SInt32Rules>(7, _omitFieldNames ? '' : 'sint32',
        subBuilder: SInt32Rules.create)
    ..aOM<SInt64Rules>(8, _omitFieldNames ? '' : 'sint64',
        subBuilder: SInt64Rules.create)
    ..aOM<Fixed32Rules>(9, _omitFieldNames ? '' : 'fixed32',
        subBuilder: Fixed32Rules.create)
    ..aOM<Fixed64Rules>(10, _omitFieldNames ? '' : 'fixed64',
        subBuilder: Fixed64Rules.create)
    ..aOM<SFixed32Rules>(11, _omitFieldNames ? '' : 'sfixed32',
        subBuilder: SFixed32Rules.create)
    ..aOM<SFixed64Rules>(12, _omitFieldNames ? '' : 'sfixed64',
        subBuilder: SFixed64Rules.create)
    ..aOM<BoolRules>(13, _omitFieldNames ? '' : 'bool',
        subBuilder: BoolRules.create)
    ..aOM<StringRules>(14, _omitFieldNames ? '' : 'string',
        subBuilder: StringRules.create)
    ..aOM<BytesRules>(15, _omitFieldNames ? '' : 'bytes',
        subBuilder: BytesRules.create)
    ..aOM<EnumRules>(16, _omitFieldNames ? '' : 'enum',
        subBuilder: EnumRules.create)
    ..aOM<RepeatedRules>(18, _omitFieldNames ? '' : 'repeated',
        subBuilder: RepeatedRules.create)
    ..aOM<MapRules>(19, _omitFieldNames ? '' : 'map',
        subBuilder: MapRules.create)
    ..aOM<AnyRules>(20, _omitFieldNames ? '' : 'any',
        subBuilder: AnyRules.create)
    ..aOM<DurationRules>(21, _omitFieldNames ? '' : 'duration',
        subBuilder: DurationRules.create)
    ..aOM<TimestampRules>(22, _omitFieldNames ? '' : 'timestamp',
        subBuilder: TimestampRules.create)
    ..pc<Constraint>(23, _omitFieldNames ? '' : 'cel', $pb.PbFieldType.PM,
        subBuilder: Constraint.create)
    ..aOB(25, _omitFieldNames ? '' : 'required')
    ..e<Ignore>(27, _omitFieldNames ? '' : 'ignore', $pb.PbFieldType.OE,
        defaultOrMaker: Ignore.IGNORE_UNSPECIFIED,
        valueOf: Ignore.valueOf,
        enumValues: Ignore.values);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FieldConstraints clone() => FieldConstraints()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FieldConstraints copyWith(void Function(FieldConstraints) updates) =>
      super.copyWith((message) => updates(message as FieldConstraints))
          as FieldConstraints;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldConstraints create() => FieldConstraints._();
  FieldConstraints createEmptyInstance() => create();
  static $pb.PbList<FieldConstraints> createRepeated() =>
      $pb.PbList<FieldConstraints>();
  @$core.pragma('dart2js:noInline')
  static FieldConstraints getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FieldConstraints>(create);
  static FieldConstraints? _defaultInstance;

  FieldConstraints_Type whichType() =>
      _FieldConstraints_TypeByTag[$_whichOneof(0)]!;
  void clearType() => clearField($_whichOneof(0));

  /// Scalar Field Types
  @$pb.TagNumber(1)
  FloatRules get float => $_getN(0);
  @$pb.TagNumber(1)
  set float(FloatRules v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFloat() => $_has(0);
  @$pb.TagNumber(1)
  void clearFloat() => clearField(1);
  @$pb.TagNumber(1)
  FloatRules ensureFloat() => $_ensure(0);

  @$pb.TagNumber(2)
  DoubleRules get double_2 => $_getN(1);
  @$pb.TagNumber(2)
  set double_2(DoubleRules v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDouble_2() => $_has(1);
  @$pb.TagNumber(2)
  void clearDouble_2() => clearField(2);
  @$pb.TagNumber(2)
  DoubleRules ensureDouble_2() => $_ensure(1);

  @$pb.TagNumber(3)
  Int32Rules get int32 => $_getN(2);
  @$pb.TagNumber(3)
  set int32(Int32Rules v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInt32() => $_has(2);
  @$pb.TagNumber(3)
  void clearInt32() => clearField(3);
  @$pb.TagNumber(3)
  Int32Rules ensureInt32() => $_ensure(2);

  @$pb.TagNumber(4)
  Int64Rules get int64 => $_getN(3);
  @$pb.TagNumber(4)
  set int64(Int64Rules v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasInt64() => $_has(3);
  @$pb.TagNumber(4)
  void clearInt64() => clearField(4);
  @$pb.TagNumber(4)
  Int64Rules ensureInt64() => $_ensure(3);

  @$pb.TagNumber(5)
  UInt32Rules get uint32 => $_getN(4);
  @$pb.TagNumber(5)
  set uint32(UInt32Rules v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUint32() => $_has(4);
  @$pb.TagNumber(5)
  void clearUint32() => clearField(5);
  @$pb.TagNumber(5)
  UInt32Rules ensureUint32() => $_ensure(4);

  @$pb.TagNumber(6)
  UInt64Rules get uint64 => $_getN(5);
  @$pb.TagNumber(6)
  set uint64(UInt64Rules v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUint64() => $_has(5);
  @$pb.TagNumber(6)
  void clearUint64() => clearField(6);
  @$pb.TagNumber(6)
  UInt64Rules ensureUint64() => $_ensure(5);

  @$pb.TagNumber(7)
  SInt32Rules get sint32 => $_getN(6);
  @$pb.TagNumber(7)
  set sint32(SInt32Rules v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSint32() => $_has(6);
  @$pb.TagNumber(7)
  void clearSint32() => clearField(7);
  @$pb.TagNumber(7)
  SInt32Rules ensureSint32() => $_ensure(6);

  @$pb.TagNumber(8)
  SInt64Rules get sint64 => $_getN(7);
  @$pb.TagNumber(8)
  set sint64(SInt64Rules v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSint64() => $_has(7);
  @$pb.TagNumber(8)
  void clearSint64() => clearField(8);
  @$pb.TagNumber(8)
  SInt64Rules ensureSint64() => $_ensure(7);

  @$pb.TagNumber(9)
  Fixed32Rules get fixed32 => $_getN(8);
  @$pb.TagNumber(9)
  set fixed32(Fixed32Rules v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasFixed32() => $_has(8);
  @$pb.TagNumber(9)
  void clearFixed32() => clearField(9);
  @$pb.TagNumber(9)
  Fixed32Rules ensureFixed32() => $_ensure(8);

  @$pb.TagNumber(10)
  Fixed64Rules get fixed64 => $_getN(9);
  @$pb.TagNumber(10)
  set fixed64(Fixed64Rules v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasFixed64() => $_has(9);
  @$pb.TagNumber(10)
  void clearFixed64() => clearField(10);
  @$pb.TagNumber(10)
  Fixed64Rules ensureFixed64() => $_ensure(9);

  @$pb.TagNumber(11)
  SFixed32Rules get sfixed32 => $_getN(10);
  @$pb.TagNumber(11)
  set sfixed32(SFixed32Rules v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSfixed32() => $_has(10);
  @$pb.TagNumber(11)
  void clearSfixed32() => clearField(11);
  @$pb.TagNumber(11)
  SFixed32Rules ensureSfixed32() => $_ensure(10);

  @$pb.TagNumber(12)
  SFixed64Rules get sfixed64 => $_getN(11);
  @$pb.TagNumber(12)
  set sfixed64(SFixed64Rules v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSfixed64() => $_has(11);
  @$pb.TagNumber(12)
  void clearSfixed64() => clearField(12);
  @$pb.TagNumber(12)
  SFixed64Rules ensureSfixed64() => $_ensure(11);

  @$pb.TagNumber(13)
  BoolRules get bool_13 => $_getN(12);
  @$pb.TagNumber(13)
  set bool_13(BoolRules v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasBool_13() => $_has(12);
  @$pb.TagNumber(13)
  void clearBool_13() => clearField(13);
  @$pb.TagNumber(13)
  BoolRules ensureBool_13() => $_ensure(12);

  @$pb.TagNumber(14)
  StringRules get string => $_getN(13);
  @$pb.TagNumber(14)
  set string(StringRules v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasString() => $_has(13);
  @$pb.TagNumber(14)
  void clearString() => clearField(14);
  @$pb.TagNumber(14)
  StringRules ensureString() => $_ensure(13);

  @$pb.TagNumber(15)
  BytesRules get bytes => $_getN(14);
  @$pb.TagNumber(15)
  set bytes(BytesRules v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasBytes() => $_has(14);
  @$pb.TagNumber(15)
  void clearBytes() => clearField(15);
  @$pb.TagNumber(15)
  BytesRules ensureBytes() => $_ensure(14);

  /// Complex Field Types
  @$pb.TagNumber(16)
  EnumRules get enum_16 => $_getN(15);
  @$pb.TagNumber(16)
  set enum_16(EnumRules v) {
    setField(16, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasEnum_16() => $_has(15);
  @$pb.TagNumber(16)
  void clearEnum_16() => clearField(16);
  @$pb.TagNumber(16)
  EnumRules ensureEnum_16() => $_ensure(15);

  @$pb.TagNumber(18)
  RepeatedRules get repeated => $_getN(16);
  @$pb.TagNumber(18)
  set repeated(RepeatedRules v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRepeated() => $_has(16);
  @$pb.TagNumber(18)
  void clearRepeated() => clearField(18);
  @$pb.TagNumber(18)
  RepeatedRules ensureRepeated() => $_ensure(16);

  @$pb.TagNumber(19)
  MapRules get map => $_getN(17);
  @$pb.TagNumber(19)
  set map(MapRules v) {
    setField(19, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasMap() => $_has(17);
  @$pb.TagNumber(19)
  void clearMap() => clearField(19);
  @$pb.TagNumber(19)
  MapRules ensureMap() => $_ensure(17);

  /// Well-Known Field Types
  @$pb.TagNumber(20)
  AnyRules get any => $_getN(18);
  @$pb.TagNumber(20)
  set any(AnyRules v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasAny() => $_has(18);
  @$pb.TagNumber(20)
  void clearAny() => clearField(20);
  @$pb.TagNumber(20)
  AnyRules ensureAny() => $_ensure(18);

  @$pb.TagNumber(21)
  DurationRules get duration => $_getN(19);
  @$pb.TagNumber(21)
  set duration(DurationRules v) {
    setField(21, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasDuration() => $_has(19);
  @$pb.TagNumber(21)
  void clearDuration() => clearField(21);
  @$pb.TagNumber(21)
  DurationRules ensureDuration() => $_ensure(19);

  @$pb.TagNumber(22)
  TimestampRules get timestamp => $_getN(20);
  @$pb.TagNumber(22)
  set timestamp(TimestampRules v) {
    setField(22, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTimestamp() => $_has(20);
  @$pb.TagNumber(22)
  void clearTimestamp() => clearField(22);
  @$pb.TagNumber(22)
  TimestampRules ensureTimestamp() => $_ensure(20);

  ///  `cel` is a repeated field used to represent a textual expression
  ///  in the Common Expression Language (CEL) syntax. For more information on
  ///  CEL, [see our documentation](https://github.com/bufbuild/protovalidate/blob/main/docs/cel.md).
  ///
  ///  ```proto
  ///  message MyMessage {
  ///    // The field `value` must be greater than 42.
  ///    optional int32 value = 1 [(buf.validate.field).cel = {
  ///      id: "my_message.value",
  ///      message: "value must be greater than 42",
  ///      expression: "this > 42",
  ///    }];
  ///  }
  ///  ```
  @$pb.TagNumber(23)
  $core.List<Constraint> get cel => $_getList(21);

  ///  If `required` is true, the field must be populated. A populated field can be
  ///  described as "serialized in the wire format," which includes:
  ///
  ///  - the following "nullable" fields must be explicitly set to be considered populated:
  ///    - singular message fields (whose fields may be unpopulated/default values)
  ///    - member fields of a oneof (may be their default value)
  ///    - proto3 optional fields (may be their default value)
  ///    - proto2 scalar fields (both optional and required)
  ///  - proto3 scalar fields must be non-zero to be considered populated
  ///  - repeated and map fields must be non-empty to be considered populated
  ///
  ///  ```proto
  ///  message MyMessage {
  ///    // The field `value` must be set to a non-null value.
  ///    optional MyOtherMessage value = 1 [(buf.validate.field).required = true];
  ///  }
  ///  ```
  @$pb.TagNumber(25)
  $core.bool get required => $_getBF(22);
  @$pb.TagNumber(25)
  set required($core.bool v) {
    $_setBool(22, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasRequired() => $_has(22);
  @$pb.TagNumber(25)
  void clearRequired() => clearField(25);

  ///  Skip validation on the field if its value matches the specified criteria.
  ///  See Ignore enum for details.
  ///
  ///  ```proto
  ///  message UpdateRequest {
  ///    // The uri rule only applies if the field is populated and not an empty
  ///    // string.
  ///    optional string url = 1 [
  ///      (buf.validate.field).ignore = IGNORE_IF_DEFAULT_VALUE,
  ///      (buf.validate.field).string.uri = true,
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(27)
  Ignore get ignore => $_getN(23);
  @$pb.TagNumber(27)
  set ignore(Ignore v) {
    setField(27, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasIgnore() => $_has(23);
  @$pb.TagNumber(27)
  void clearIgnore() => clearField(27);
}

/// PredefinedConstraints are custom constraints that can be re-used with
/// multiple fields.
class PredefinedConstraints extends $pb.GeneratedMessage {
  factory PredefinedConstraints({
    $core.Iterable<Constraint>? cel,
  }) {
    final $result = create();
    if (cel != null) {
      $result.cel.addAll(cel);
    }
    return $result;
  }
  PredefinedConstraints._() : super();
  factory PredefinedConstraints.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PredefinedConstraints.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PredefinedConstraints',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..pc<Constraint>(1, _omitFieldNames ? '' : 'cel', $pb.PbFieldType.PM,
        subBuilder: Constraint.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PredefinedConstraints clone() =>
      PredefinedConstraints()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PredefinedConstraints copyWith(
          void Function(PredefinedConstraints) updates) =>
      super.copyWith((message) => updates(message as PredefinedConstraints))
          as PredefinedConstraints;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PredefinedConstraints create() => PredefinedConstraints._();
  PredefinedConstraints createEmptyInstance() => create();
  static $pb.PbList<PredefinedConstraints> createRepeated() =>
      $pb.PbList<PredefinedConstraints>();
  @$core.pragma('dart2js:noInline')
  static PredefinedConstraints getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PredefinedConstraints>(create);
  static PredefinedConstraints? _defaultInstance;

  ///  `cel` is a repeated field used to represent a textual expression
  ///  in the Common Expression Language (CEL) syntax. For more information on
  ///  CEL, [see our documentation](https://github.com/bufbuild/protovalidate/blob/main/docs/cel.md).
  ///
  ///  ```proto
  ///  message MyMessage {
  ///    // The field `value` must be greater than 42.
  ///    optional int32 value = 1 [(buf.validate.predefined).cel = {
  ///      id: "my_message.value",
  ///      message: "value must be greater than 42",
  ///      expression: "this > 42",
  ///    }];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.List<Constraint> get cel => $_getList(0);
}

enum FloatRules_LessThan { lt, lte, notSet }

enum FloatRules_GreaterThan { gt, gte, notSet }

/// FloatRules describes the constraints applied to `float` values. These
/// rules may also be applied to the `google.protobuf.FloatValue` Well-Known-Type.
class FloatRules extends $pb.GeneratedMessage {
  factory FloatRules({
    $core.double? const_1,
    $core.double? lt,
    $core.double? lte,
    $core.double? gt,
    $core.double? gte,
    $core.Iterable<$core.double>? in_6,
    $core.Iterable<$core.double>? notIn,
    $core.bool? finite,
    $core.Iterable<$core.double>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (finite != null) {
      $result.finite = finite;
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  FloatRules._() : super();
  factory FloatRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FloatRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FloatRules_LessThan>
      _FloatRules_LessThanByTag = {
    2: FloatRules_LessThan.lt,
    3: FloatRules_LessThan.lte,
    0: FloatRules_LessThan.notSet
  };
  static const $core.Map<$core.int, FloatRules_GreaterThan>
      _FloatRules_GreaterThanByTag = {
    4: FloatRules_GreaterThan.gt,
    5: FloatRules_GreaterThan.gte,
    0: FloatRules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FloatRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$core.double>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OF)
    ..p<$core.double>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PF)
    ..p<$core.double>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PF)
    ..aOB(8, _omitFieldNames ? '' : 'finite')
    ..p<$core.double>(9, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PF)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FloatRules clone() => FloatRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FloatRules copyWith(void Function(FloatRules) updates) =>
      super.copyWith((message) => updates(message as FloatRules)) as FloatRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FloatRules create() => FloatRules._();
  FloatRules createEmptyInstance() => create();
  static $pb.PbList<FloatRules> createRepeated() => $pb.PbList<FloatRules>();
  @$core.pragma('dart2js:noInline')
  static FloatRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FloatRules>(create);
  static FloatRules? _defaultInstance;

  FloatRules_LessThan whichLessThan() =>
      _FloatRules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  FloatRules_GreaterThan whichGreaterThan() =>
      _FloatRules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    // value must equal 42.0
  ///    float value = 1 [(buf.validate.field).float.const = 42.0];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.double get const_1 => $_getN(0);
  @$pb.TagNumber(1)
  set const_1($core.double v) {
    $_setFloat(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    // value must be less than 10.0
  ///    float value = 1 [(buf.validate.field).float.lt = 10.0];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.double get lt => $_getN(1);
  @$pb.TagNumber(2)
  set lt($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    // value must be less than or equal to 10.0
  ///    float value = 1 [(buf.validate.field).float.lte = 10.0];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.double get lte => $_getN(2);
  @$pb.TagNumber(3)
  set lte($core.double v) {
    $_setFloat(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    // value must be greater than 5.0 [float.gt]
  ///    float value = 1 [(buf.validate.field).float.gt = 5.0];
  ///
  ///    // value must be greater than 5 and less than 10.0 [float.gt_lt]
  ///    float other_value = 2 [(buf.validate.field).float = { gt: 5.0, lt: 10.0 }];
  ///
  ///    // value must be greater than 10 or less than 5.0 [float.gt_lt_exclusive]
  ///    float another_value = 3 [(buf.validate.field).float = { gt: 10.0, lt: 5.0 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.double get gt => $_getN(3);
  @$pb.TagNumber(4)
  set gt($core.double v) {
    $_setFloat(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    // value must be greater than or equal to 5.0 [float.gte]
  ///    float value = 1 [(buf.validate.field).float.gte = 5.0];
  ///
  ///    // value must be greater than or equal to 5.0 and less than 10.0 [float.gte_lt]
  ///    float other_value = 2 [(buf.validate.field).float = { gte: 5.0, lt: 10.0 }];
  ///
  ///    // value must be greater than or equal to 10.0 or less than 5.0 [float.gte_lt_exclusive]
  ///    float another_value = 3 [(buf.validate.field).float = { gte: 10.0, lt: 5.0 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.double get gte => $_getN(4);
  @$pb.TagNumber(5)
  set gte($core.double v) {
    $_setFloat(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message
  ///  is generated.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    // value must be in list [1.0, 2.0, 3.0]
  ///    float value = 1 [(buf.validate.field).float = { in: [1.0, 2.0, 3.0] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.double> get in_6 => $_getList(5);

  ///  `in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    // value must not be in list [1.0, 2.0, 3.0]
  ///    float value = 1 [(buf.validate.field).float = { not_in: [1.0, 2.0, 3.0] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.double> get notIn => $_getList(6);

  /// `finite` requires the field value to be finite. If the field value is
  /// infinite or NaN, an error message is generated.
  @$pb.TagNumber(8)
  $core.bool get finite => $_getBF(7);
  @$pb.TagNumber(8)
  set finite($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFinite() => $_has(7);
  @$pb.TagNumber(8)
  void clearFinite() => clearField(8);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyFloat {
  ///    float value = 1 [
  ///      (buf.validate.field).float.example = 1.0,
  ///      (buf.validate.field).float.example = "Infinity"
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(9)
  $core.List<$core.double> get example => $_getList(8);
}

enum DoubleRules_LessThan { lt, lte, notSet }

enum DoubleRules_GreaterThan { gt, gte, notSet }

/// DoubleRules describes the constraints applied to `double` values. These
/// rules may also be applied to the `google.protobuf.DoubleValue` Well-Known-Type.
class DoubleRules extends $pb.GeneratedMessage {
  factory DoubleRules({
    $core.double? const_1,
    $core.double? lt,
    $core.double? lte,
    $core.double? gt,
    $core.double? gte,
    $core.Iterable<$core.double>? in_6,
    $core.Iterable<$core.double>? notIn,
    $core.bool? finite,
    $core.Iterable<$core.double>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (finite != null) {
      $result.finite = finite;
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  DoubleRules._() : super();
  factory DoubleRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DoubleRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DoubleRules_LessThan>
      _DoubleRules_LessThanByTag = {
    2: DoubleRules_LessThan.lt,
    3: DoubleRules_LessThan.lte,
    0: DoubleRules_LessThan.notSet
  };
  static const $core.Map<$core.int, DoubleRules_GreaterThan>
      _DoubleRules_GreaterThanByTag = {
    4: DoubleRules_GreaterThan.gt,
    5: DoubleRules_GreaterThan.gte,
    0: DoubleRules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DoubleRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$core.double>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OD)
    ..p<$core.double>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PD)
    ..p<$core.double>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PD)
    ..aOB(8, _omitFieldNames ? '' : 'finite')
    ..p<$core.double>(9, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PD)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DoubleRules clone() => DoubleRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DoubleRules copyWith(void Function(DoubleRules) updates) =>
      super.copyWith((message) => updates(message as DoubleRules))
          as DoubleRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DoubleRules create() => DoubleRules._();
  DoubleRules createEmptyInstance() => create();
  static $pb.PbList<DoubleRules> createRepeated() => $pb.PbList<DoubleRules>();
  @$core.pragma('dart2js:noInline')
  static DoubleRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DoubleRules>(create);
  static DoubleRules? _defaultInstance;

  DoubleRules_LessThan whichLessThan() =>
      _DoubleRules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  DoubleRules_GreaterThan whichGreaterThan() =>
      _DoubleRules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    // value must equal 42.0
  ///    double value = 1 [(buf.validate.field).double.const = 42.0];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.double get const_1 => $_getN(0);
  @$pb.TagNumber(1)
  set const_1($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    // value must be less than 10.0
  ///    double value = 1 [(buf.validate.field).double.lt = 10.0];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.double get lt => $_getN(1);
  @$pb.TagNumber(2)
  set lt($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified value
  ///  (field <= value). If the field value is greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    // value must be less than or equal to 10.0
  ///    double value = 1 [(buf.validate.field).double.lte = 10.0];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.double get lte => $_getN(2);
  @$pb.TagNumber(3)
  set lte($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or `lte`,
  ///  the range is reversed, and the field value must be outside the specified
  ///  range. If the field value doesn't meet the required conditions, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    // value must be greater than 5.0 [double.gt]
  ///    double value = 1 [(buf.validate.field).double.gt = 5.0];
  ///
  ///    // value must be greater than 5 and less than 10.0 [double.gt_lt]
  ///    double other_value = 2 [(buf.validate.field).double = { gt: 5.0, lt: 10.0 }];
  ///
  ///    // value must be greater than 10 or less than 5.0 [double.gt_lt_exclusive]
  ///    double another_value = 3 [(buf.validate.field).double = { gt: 10.0, lt: 5.0 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.double get gt => $_getN(3);
  @$pb.TagNumber(4)
  set gt($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    // value must be greater than or equal to 5.0 [double.gte]
  ///    double value = 1 [(buf.validate.field).double.gte = 5.0];
  ///
  ///    // value must be greater than or equal to 5.0 and less than 10.0 [double.gte_lt]
  ///    double other_value = 2 [(buf.validate.field).double = { gte: 5.0, lt: 10.0 }];
  ///
  ///    // value must be greater than or equal to 10.0 or less than 5.0 [double.gte_lt_exclusive]
  ///    double another_value = 3 [(buf.validate.field).double = { gte: 10.0, lt: 5.0 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.double get gte => $_getN(4);
  @$pb.TagNumber(5)
  set gte($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    // value must be in list [1.0, 2.0, 3.0]
  ///    double value = 1 [(buf.validate.field).double = { in: [1.0, 2.0, 3.0] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.double> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    // value must not be in list [1.0, 2.0, 3.0]
  ///    double value = 1 [(buf.validate.field).double = { not_in: [1.0, 2.0, 3.0] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.double> get notIn => $_getList(6);

  /// `finite` requires the field value to be finite. If the field value is
  /// infinite or NaN, an error message is generated.
  @$pb.TagNumber(8)
  $core.bool get finite => $_getBF(7);
  @$pb.TagNumber(8)
  set finite($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFinite() => $_has(7);
  @$pb.TagNumber(8)
  void clearFinite() => clearField(8);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyDouble {
  ///    double value = 1 [
  ///      (buf.validate.field).double.example = 1.0,
  ///      (buf.validate.field).double.example = "Infinity"
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(9)
  $core.List<$core.double> get example => $_getList(8);
}

enum Int32Rules_LessThan { lt, lte, notSet }

enum Int32Rules_GreaterThan { gt, gte, notSet }

/// Int32Rules describes the constraints applied to `int32` values. These
/// rules may also be applied to the `google.protobuf.Int32Value` Well-Known-Type.
class Int32Rules extends $pb.GeneratedMessage {
  factory Int32Rules({
    $core.int? const_1,
    $core.int? lt,
    $core.int? lte,
    $core.int? gt,
    $core.int? gte,
    $core.Iterable<$core.int>? in_6,
    $core.Iterable<$core.int>? notIn,
    $core.Iterable<$core.int>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  Int32Rules._() : super();
  factory Int32Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Int32Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Int32Rules_LessThan>
      _Int32Rules_LessThanByTag = {
    2: Int32Rules_LessThan.lt,
    3: Int32Rules_LessThan.lte,
    0: Int32Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, Int32Rules_GreaterThan>
      _Int32Rules_GreaterThanByTag = {
    4: Int32Rules_GreaterThan.gt,
    5: Int32Rules_GreaterThan.gte,
    0: Int32Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Int32Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.O3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.P3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.P3)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.P3)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Int32Rules clone() => Int32Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Int32Rules copyWith(void Function(Int32Rules) updates) =>
      super.copyWith((message) => updates(message as Int32Rules)) as Int32Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Int32Rules create() => Int32Rules._();
  Int32Rules createEmptyInstance() => create();
  static $pb.PbList<Int32Rules> createRepeated() => $pb.PbList<Int32Rules>();
  @$core.pragma('dart2js:noInline')
  static Int32Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Int32Rules>(create);
  static Int32Rules? _defaultInstance;

  Int32Rules_LessThan whichLessThan() =>
      _Int32Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  Int32Rules_GreaterThan whichGreaterThan() =>
      _Int32Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    // value must equal 42
  ///    int32 value = 1 [(buf.validate.field).int32.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.int get const_1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set const_1($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field
  ///  < value). If the field value is equal to or greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    // value must be less than 10
  ///    int32 value = 1 [(buf.validate.field).int32.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.int get lt => $_getIZ(1);
  @$pb.TagNumber(2)
  set lt($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    // value must be less than or equal to 10
  ///    int32 value = 1 [(buf.validate.field).int32.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.int get lte => $_getIZ(2);
  @$pb.TagNumber(3)
  set lte($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    // value must be greater than 5 [int32.gt]
  ///    int32 value = 1 [(buf.validate.field).int32.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [int32.gt_lt]
  ///    int32 other_value = 2 [(buf.validate.field).int32 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [int32.gt_lt_exclusive]
  ///    int32 another_value = 3 [(buf.validate.field).int32 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.int get gt => $_getIZ(3);
  @$pb.TagNumber(4)
  set gt($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified value
  ///  (exclusive). If the value of `gte` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    // value must be greater than or equal to 5 [int32.gte]
  ///    int32 value = 1 [(buf.validate.field).int32.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [int32.gte_lt]
  ///    int32 other_value = 2 [(buf.validate.field).int32 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [int32.gte_lt_exclusive]
  ///    int32 another_value = 3 [(buf.validate.field).int32 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.int get gte => $_getIZ(4);
  @$pb.TagNumber(5)
  set gte($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    // value must be in list [1, 2, 3]
  ///    int32 value = 1 [(buf.validate.field).int32 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.int> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error message
  ///  is generated.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    // value must not be in list [1, 2, 3]
  ///    int32 value = 1 [(buf.validate.field).int32 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.int> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyInt32 {
  ///    int32 value = 1 [
  ///      (buf.validate.field).int32.example = 1,
  ///      (buf.validate.field).int32.example = -10
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$core.int> get example => $_getList(7);
}

enum Int64Rules_LessThan { lt, lte, notSet }

enum Int64Rules_GreaterThan { gt, gte, notSet }

/// Int64Rules describes the constraints applied to `int64` values. These
/// rules may also be applied to the `google.protobuf.Int64Value` Well-Known-Type.
class Int64Rules extends $pb.GeneratedMessage {
  factory Int64Rules({
    $fixnum.Int64? const_1,
    $fixnum.Int64? lt,
    $fixnum.Int64? lte,
    $fixnum.Int64? gt,
    $fixnum.Int64? gte,
    $core.Iterable<$fixnum.Int64>? in_6,
    $core.Iterable<$fixnum.Int64>? notIn,
    $core.Iterable<$fixnum.Int64>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  Int64Rules._() : super();
  factory Int64Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Int64Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Int64Rules_LessThan>
      _Int64Rules_LessThanByTag = {
    2: Int64Rules_LessThan.lt,
    3: Int64Rules_LessThan.lte,
    0: Int64Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, Int64Rules_GreaterThan>
      _Int64Rules_GreaterThanByTag = {
    4: Int64Rules_GreaterThan.gt,
    5: Int64Rules_GreaterThan.gte,
    0: Int64Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Int64Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..aInt64(1, _omitFieldNames ? '' : 'const')
    ..aInt64(2, _omitFieldNames ? '' : 'lt')
    ..aInt64(3, _omitFieldNames ? '' : 'lte')
    ..aInt64(4, _omitFieldNames ? '' : 'gt')
    ..aInt64(5, _omitFieldNames ? '' : 'gte')
    ..p<$fixnum.Int64>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.P6)
    ..p<$fixnum.Int64>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.P6)
    ..p<$fixnum.Int64>(9, _omitFieldNames ? '' : 'example', $pb.PbFieldType.P6)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Int64Rules clone() => Int64Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Int64Rules copyWith(void Function(Int64Rules) updates) =>
      super.copyWith((message) => updates(message as Int64Rules)) as Int64Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Int64Rules create() => Int64Rules._();
  Int64Rules createEmptyInstance() => create();
  static $pb.PbList<Int64Rules> createRepeated() => $pb.PbList<Int64Rules>();
  @$core.pragma('dart2js:noInline')
  static Int64Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Int64Rules>(create);
  static Int64Rules? _defaultInstance;

  Int64Rules_LessThan whichLessThan() =>
      _Int64Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  Int64Rules_GreaterThan whichGreaterThan() =>
      _Int64Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    // value must equal 42
  ///    int64 value = 1 [(buf.validate.field).int64.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $fixnum.Int64 get const_1 => $_getI64(0);
  @$pb.TagNumber(1)
  set const_1($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    // value must be less than 10
  ///    int64 value = 1 [(buf.validate.field).int64.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get lt => $_getI64(1);
  @$pb.TagNumber(2)
  set lt($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    // value must be less than or equal to 10
  ///    int64 value = 1 [(buf.validate.field).int64.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $fixnum.Int64 get lte => $_getI64(2);
  @$pb.TagNumber(3)
  set lte($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    // value must be greater than 5 [int64.gt]
  ///    int64 value = 1 [(buf.validate.field).int64.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [int64.gt_lt]
  ///    int64 other_value = 2 [(buf.validate.field).int64 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [int64.gt_lt_exclusive]
  ///    int64 another_value = 3 [(buf.validate.field).int64 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $fixnum.Int64 get gt => $_getI64(3);
  @$pb.TagNumber(4)
  set gt($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    // value must be greater than or equal to 5 [int64.gte]
  ///    int64 value = 1 [(buf.validate.field).int64.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [int64.gte_lt]
  ///    int64 other_value = 2 [(buf.validate.field).int64 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [int64.gte_lt_exclusive]
  ///    int64 another_value = 3 [(buf.validate.field).int64 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $fixnum.Int64 get gte => $_getI64(4);
  @$pb.TagNumber(5)
  set gte($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    // value must be in list [1, 2, 3]
  ///    int64 value = 1 [(buf.validate.field).int64 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$fixnum.Int64> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    // value must not be in list [1, 2, 3]
  ///    int64 value = 1 [(buf.validate.field).int64 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$fixnum.Int64> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyInt64 {
  ///    int64 value = 1 [
  ///      (buf.validate.field).int64.example = 1,
  ///      (buf.validate.field).int64.example = -10
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(9)
  $core.List<$fixnum.Int64> get example => $_getList(7);
}

enum UInt32Rules_LessThan { lt, lte, notSet }

enum UInt32Rules_GreaterThan { gt, gte, notSet }

/// UInt32Rules describes the constraints applied to `uint32` values. These
/// rules may also be applied to the `google.protobuf.UInt32Value` Well-Known-Type.
class UInt32Rules extends $pb.GeneratedMessage {
  factory UInt32Rules({
    $core.int? const_1,
    $core.int? lt,
    $core.int? lte,
    $core.int? gt,
    $core.int? gte,
    $core.Iterable<$core.int>? in_6,
    $core.Iterable<$core.int>? notIn,
    $core.Iterable<$core.int>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  UInt32Rules._() : super();
  factory UInt32Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UInt32Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UInt32Rules_LessThan>
      _UInt32Rules_LessThanByTag = {
    2: UInt32Rules_LessThan.lt,
    3: UInt32Rules_LessThan.lte,
    0: UInt32Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, UInt32Rules_GreaterThan>
      _UInt32Rules_GreaterThanByTag = {
    4: UInt32Rules_GreaterThan.gt,
    5: UInt32Rules_GreaterThan.gte,
    0: UInt32Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UInt32Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OU3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PU3)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PU3)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UInt32Rules clone() => UInt32Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UInt32Rules copyWith(void Function(UInt32Rules) updates) =>
      super.copyWith((message) => updates(message as UInt32Rules))
          as UInt32Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UInt32Rules create() => UInt32Rules._();
  UInt32Rules createEmptyInstance() => create();
  static $pb.PbList<UInt32Rules> createRepeated() => $pb.PbList<UInt32Rules>();
  @$core.pragma('dart2js:noInline')
  static UInt32Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UInt32Rules>(create);
  static UInt32Rules? _defaultInstance;

  UInt32Rules_LessThan whichLessThan() =>
      _UInt32Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  UInt32Rules_GreaterThan whichGreaterThan() =>
      _UInt32Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    // value must equal 42
  ///    uint32 value = 1 [(buf.validate.field).uint32.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.int get const_1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set const_1($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    // value must be less than 10
  ///    uint32 value = 1 [(buf.validate.field).uint32.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.int get lt => $_getIZ(1);
  @$pb.TagNumber(2)
  set lt($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    // value must be less than or equal to 10
  ///    uint32 value = 1 [(buf.validate.field).uint32.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.int get lte => $_getIZ(2);
  @$pb.TagNumber(3)
  set lte($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    // value must be greater than 5 [uint32.gt]
  ///    uint32 value = 1 [(buf.validate.field).uint32.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [uint32.gt_lt]
  ///    uint32 other_value = 2 [(buf.validate.field).uint32 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [uint32.gt_lt_exclusive]
  ///    uint32 another_value = 3 [(buf.validate.field).uint32 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.int get gt => $_getIZ(3);
  @$pb.TagNumber(4)
  set gt($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    // value must be greater than or equal to 5 [uint32.gte]
  ///    uint32 value = 1 [(buf.validate.field).uint32.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [uint32.gte_lt]
  ///    uint32 other_value = 2 [(buf.validate.field).uint32 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [uint32.gte_lt_exclusive]
  ///    uint32 another_value = 3 [(buf.validate.field).uint32 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.int get gte => $_getIZ(4);
  @$pb.TagNumber(5)
  set gte($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    // value must be in list [1, 2, 3]
  ///    uint32 value = 1 [(buf.validate.field).uint32 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.int> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    // value must not be in list [1, 2, 3]
  ///    uint32 value = 1 [(buf.validate.field).uint32 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.int> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyUInt32 {
  ///    uint32 value = 1 [
  ///      (buf.validate.field).uint32.example = 1,
  ///      (buf.validate.field).uint32.example = 10
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$core.int> get example => $_getList(7);
}

enum UInt64Rules_LessThan { lt, lte, notSet }

enum UInt64Rules_GreaterThan { gt, gte, notSet }

/// UInt64Rules describes the constraints applied to `uint64` values. These
/// rules may also be applied to the `google.protobuf.UInt64Value` Well-Known-Type.
class UInt64Rules extends $pb.GeneratedMessage {
  factory UInt64Rules({
    $fixnum.Int64? const_1,
    $fixnum.Int64? lt,
    $fixnum.Int64? lte,
    $fixnum.Int64? gt,
    $fixnum.Int64? gte,
    $core.Iterable<$fixnum.Int64>? in_6,
    $core.Iterable<$fixnum.Int64>? notIn,
    $core.Iterable<$fixnum.Int64>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  UInt64Rules._() : super();
  factory UInt64Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UInt64Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UInt64Rules_LessThan>
      _UInt64Rules_LessThanByTag = {
    2: UInt64Rules_LessThan.lt,
    3: UInt64Rules_LessThan.lte,
    0: UInt64Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, UInt64Rules_GreaterThan>
      _UInt64Rules_GreaterThanByTag = {
    4: UInt64Rules_GreaterThan.gt,
    5: UInt64Rules_GreaterThan.gte,
    0: UInt64Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UInt64Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PU6)
    ..p<$fixnum.Int64>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PU6)
    ..p<$fixnum.Int64>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PU6)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UInt64Rules clone() => UInt64Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UInt64Rules copyWith(void Function(UInt64Rules) updates) =>
      super.copyWith((message) => updates(message as UInt64Rules))
          as UInt64Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UInt64Rules create() => UInt64Rules._();
  UInt64Rules createEmptyInstance() => create();
  static $pb.PbList<UInt64Rules> createRepeated() => $pb.PbList<UInt64Rules>();
  @$core.pragma('dart2js:noInline')
  static UInt64Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UInt64Rules>(create);
  static UInt64Rules? _defaultInstance;

  UInt64Rules_LessThan whichLessThan() =>
      _UInt64Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  UInt64Rules_GreaterThan whichGreaterThan() =>
      _UInt64Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    // value must equal 42
  ///    uint64 value = 1 [(buf.validate.field).uint64.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $fixnum.Int64 get const_1 => $_getI64(0);
  @$pb.TagNumber(1)
  set const_1($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    // value must be less than 10
  ///    uint64 value = 1 [(buf.validate.field).uint64.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get lt => $_getI64(1);
  @$pb.TagNumber(2)
  set lt($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    // value must be less than or equal to 10
  ///    uint64 value = 1 [(buf.validate.field).uint64.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $fixnum.Int64 get lte => $_getI64(2);
  @$pb.TagNumber(3)
  set lte($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    // value must be greater than 5 [uint64.gt]
  ///    uint64 value = 1 [(buf.validate.field).uint64.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [uint64.gt_lt]
  ///    uint64 other_value = 2 [(buf.validate.field).uint64 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [uint64.gt_lt_exclusive]
  ///    uint64 another_value = 3 [(buf.validate.field).uint64 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $fixnum.Int64 get gt => $_getI64(3);
  @$pb.TagNumber(4)
  set gt($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    // value must be greater than or equal to 5 [uint64.gte]
  ///    uint64 value = 1 [(buf.validate.field).uint64.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [uint64.gte_lt]
  ///    uint64 other_value = 2 [(buf.validate.field).uint64 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [uint64.gte_lt_exclusive]
  ///    uint64 another_value = 3 [(buf.validate.field).uint64 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $fixnum.Int64 get gte => $_getI64(4);
  @$pb.TagNumber(5)
  set gte($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    // value must be in list [1, 2, 3]
  ///    uint64 value = 1 [(buf.validate.field).uint64 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$fixnum.Int64> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    // value must not be in list [1, 2, 3]
  ///    uint64 value = 1 [(buf.validate.field).uint64 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$fixnum.Int64> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyUInt64 {
  ///    uint64 value = 1 [
  ///      (buf.validate.field).uint64.example = 1,
  ///      (buf.validate.field).uint64.example = -10
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$fixnum.Int64> get example => $_getList(7);
}

enum SInt32Rules_LessThan { lt, lte, notSet }

enum SInt32Rules_GreaterThan { gt, gte, notSet }

/// SInt32Rules describes the constraints applied to `sint32` values.
class SInt32Rules extends $pb.GeneratedMessage {
  factory SInt32Rules({
    $core.int? const_1,
    $core.int? lt,
    $core.int? lte,
    $core.int? gt,
    $core.int? gte,
    $core.Iterable<$core.int>? in_6,
    $core.Iterable<$core.int>? notIn,
    $core.Iterable<$core.int>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  SInt32Rules._() : super();
  factory SInt32Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SInt32Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SInt32Rules_LessThan>
      _SInt32Rules_LessThanByTag = {
    2: SInt32Rules_LessThan.lt,
    3: SInt32Rules_LessThan.lte,
    0: SInt32Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, SInt32Rules_GreaterThan>
      _SInt32Rules_GreaterThanByTag = {
    4: SInt32Rules_GreaterThan.gt,
    5: SInt32Rules_GreaterThan.gte,
    0: SInt32Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SInt32Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OS3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OS3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OS3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OS3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OS3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PS3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PS3)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PS3)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SInt32Rules clone() => SInt32Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SInt32Rules copyWith(void Function(SInt32Rules) updates) =>
      super.copyWith((message) => updates(message as SInt32Rules))
          as SInt32Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SInt32Rules create() => SInt32Rules._();
  SInt32Rules createEmptyInstance() => create();
  static $pb.PbList<SInt32Rules> createRepeated() => $pb.PbList<SInt32Rules>();
  @$core.pragma('dart2js:noInline')
  static SInt32Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SInt32Rules>(create);
  static SInt32Rules? _defaultInstance;

  SInt32Rules_LessThan whichLessThan() =>
      _SInt32Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  SInt32Rules_GreaterThan whichGreaterThan() =>
      _SInt32Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///    // value must equal 42
  ///    sint32 value = 1 [(buf.validate.field).sint32.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.int get const_1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set const_1($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field
  ///  < value). If the field value is equal to or greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///    // value must be less than 10
  ///    sint32 value = 1 [(buf.validate.field).sint32.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.int get lt => $_getIZ(1);
  @$pb.TagNumber(2)
  set lt($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///    // value must be less than or equal to 10
  ///    sint32 value = 1 [(buf.validate.field).sint32.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.int get lte => $_getIZ(2);
  @$pb.TagNumber(3)
  set lte($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///    // value must be greater than 5 [sint32.gt]
  ///    sint32 value = 1 [(buf.validate.field).sint32.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [sint32.gt_lt]
  ///    sint32 other_value = 2 [(buf.validate.field).sint32 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [sint32.gt_lt_exclusive]
  ///    sint32 another_value = 3 [(buf.validate.field).sint32 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.int get gt => $_getIZ(3);
  @$pb.TagNumber(4)
  set gt($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///   // value must be greater than or equal to 5 [sint32.gte]
  ///   sint32 value = 1 [(buf.validate.field).sint32.gte = 5];
  ///
  ///   // value must be greater than or equal to 5 and less than 10 [sint32.gte_lt]
  ///   sint32 other_value = 2 [(buf.validate.field).sint32 = { gte: 5, lt: 10 }];
  ///
  ///   // value must be greater than or equal to 10 or less than 5 [sint32.gte_lt_exclusive]
  ///   sint32 another_value = 3 [(buf.validate.field).sint32 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.int get gte => $_getIZ(4);
  @$pb.TagNumber(5)
  set gte($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///    // value must be in list [1, 2, 3]
  ///    sint32 value = 1 [(buf.validate.field).sint32 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.int> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///    // value must not be in list [1, 2, 3]
  ///    sint32 value = 1 [(buf.validate.field).sint32 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.int> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MySInt32 {
  ///    sint32 value = 1 [
  ///      (buf.validate.field).sint32.example = 1,
  ///      (buf.validate.field).sint32.example = -10
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$core.int> get example => $_getList(7);
}

enum SInt64Rules_LessThan { lt, lte, notSet }

enum SInt64Rules_GreaterThan { gt, gte, notSet }

/// SInt64Rules describes the constraints applied to `sint64` values.
class SInt64Rules extends $pb.GeneratedMessage {
  factory SInt64Rules({
    $fixnum.Int64? const_1,
    $fixnum.Int64? lt,
    $fixnum.Int64? lte,
    $fixnum.Int64? gt,
    $fixnum.Int64? gte,
    $core.Iterable<$fixnum.Int64>? in_6,
    $core.Iterable<$fixnum.Int64>? notIn,
    $core.Iterable<$fixnum.Int64>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  SInt64Rules._() : super();
  factory SInt64Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SInt64Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SInt64Rules_LessThan>
      _SInt64Rules_LessThanByTag = {
    2: SInt64Rules_LessThan.lt,
    3: SInt64Rules_LessThan.lte,
    0: SInt64Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, SInt64Rules_GreaterThan>
      _SInt64Rules_GreaterThanByTag = {
    4: SInt64Rules_GreaterThan.gt,
    5: SInt64Rules_GreaterThan.gte,
    0: SInt64Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SInt64Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OS6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OS6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OS6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OS6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OS6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PS6)
    ..p<$fixnum.Int64>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PS6)
    ..p<$fixnum.Int64>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PS6)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SInt64Rules clone() => SInt64Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SInt64Rules copyWith(void Function(SInt64Rules) updates) =>
      super.copyWith((message) => updates(message as SInt64Rules))
          as SInt64Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SInt64Rules create() => SInt64Rules._();
  SInt64Rules createEmptyInstance() => create();
  static $pb.PbList<SInt64Rules> createRepeated() => $pb.PbList<SInt64Rules>();
  @$core.pragma('dart2js:noInline')
  static SInt64Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SInt64Rules>(create);
  static SInt64Rules? _defaultInstance;

  SInt64Rules_LessThan whichLessThan() =>
      _SInt64Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  SInt64Rules_GreaterThan whichGreaterThan() =>
      _SInt64Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    // value must equal 42
  ///    sint64 value = 1 [(buf.validate.field).sint64.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $fixnum.Int64 get const_1 => $_getI64(0);
  @$pb.TagNumber(1)
  set const_1($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field
  ///  < value). If the field value is equal to or greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    // value must be less than 10
  ///    sint64 value = 1 [(buf.validate.field).sint64.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get lt => $_getI64(1);
  @$pb.TagNumber(2)
  set lt($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    // value must be less than or equal to 10
  ///    sint64 value = 1 [(buf.validate.field).sint64.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $fixnum.Int64 get lte => $_getI64(2);
  @$pb.TagNumber(3)
  set lte($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    // value must be greater than 5 [sint64.gt]
  ///    sint64 value = 1 [(buf.validate.field).sint64.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [sint64.gt_lt]
  ///    sint64 other_value = 2 [(buf.validate.field).sint64 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [sint64.gt_lt_exclusive]
  ///    sint64 another_value = 3 [(buf.validate.field).sint64 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $fixnum.Int64 get gt => $_getI64(3);
  @$pb.TagNumber(4)
  set gt($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    // value must be greater than or equal to 5 [sint64.gte]
  ///    sint64 value = 1 [(buf.validate.field).sint64.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [sint64.gte_lt]
  ///    sint64 other_value = 2 [(buf.validate.field).sint64 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [sint64.gte_lt_exclusive]
  ///    sint64 another_value = 3 [(buf.validate.field).sint64 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $fixnum.Int64 get gte => $_getI64(4);
  @$pb.TagNumber(5)
  set gte($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message
  ///  is generated.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    // value must be in list [1, 2, 3]
  ///    sint64 value = 1 [(buf.validate.field).sint64 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$fixnum.Int64> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    // value must not be in list [1, 2, 3]
  ///    sint64 value = 1 [(buf.validate.field).sint64 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$fixnum.Int64> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MySInt64 {
  ///    sint64 value = 1 [
  ///      (buf.validate.field).sint64.example = 1,
  ///      (buf.validate.field).sint64.example = -10
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$fixnum.Int64> get example => $_getList(7);
}

enum Fixed32Rules_LessThan { lt, lte, notSet }

enum Fixed32Rules_GreaterThan { gt, gte, notSet }

/// Fixed32Rules describes the constraints applied to `fixed32` values.
class Fixed32Rules extends $pb.GeneratedMessage {
  factory Fixed32Rules({
    $core.int? const_1,
    $core.int? lt,
    $core.int? lte,
    $core.int? gt,
    $core.int? gte,
    $core.Iterable<$core.int>? in_6,
    $core.Iterable<$core.int>? notIn,
    $core.Iterable<$core.int>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  Fixed32Rules._() : super();
  factory Fixed32Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Fixed32Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Fixed32Rules_LessThan>
      _Fixed32Rules_LessThanByTag = {
    2: Fixed32Rules_LessThan.lt,
    3: Fixed32Rules_LessThan.lte,
    0: Fixed32Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, Fixed32Rules_GreaterThan>
      _Fixed32Rules_GreaterThanByTag = {
    4: Fixed32Rules_GreaterThan.gt,
    5: Fixed32Rules_GreaterThan.gte,
    0: Fixed32Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Fixed32Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OF3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OF3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OF3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OF3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OF3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PF3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PF3)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PF3)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Fixed32Rules clone() => Fixed32Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Fixed32Rules copyWith(void Function(Fixed32Rules) updates) =>
      super.copyWith((message) => updates(message as Fixed32Rules))
          as Fixed32Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Fixed32Rules create() => Fixed32Rules._();
  Fixed32Rules createEmptyInstance() => create();
  static $pb.PbList<Fixed32Rules> createRepeated() =>
      $pb.PbList<Fixed32Rules>();
  @$core.pragma('dart2js:noInline')
  static Fixed32Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Fixed32Rules>(create);
  static Fixed32Rules? _defaultInstance;

  Fixed32Rules_LessThan whichLessThan() =>
      _Fixed32Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  Fixed32Rules_GreaterThan whichGreaterThan() =>
      _Fixed32Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value.
  ///  If the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    // value must equal 42
  ///    fixed32 value = 1 [(buf.validate.field).fixed32.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.int get const_1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set const_1($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    // value must be less than 10
  ///    fixed32 value = 1 [(buf.validate.field).fixed32.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.int get lt => $_getIZ(1);
  @$pb.TagNumber(2)
  set lt($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    // value must be less than or equal to 10
  ///    fixed32 value = 1 [(buf.validate.field).fixed32.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.int get lte => $_getIZ(2);
  @$pb.TagNumber(3)
  set lte($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    // value must be greater than 5 [fixed32.gt]
  ///    fixed32 value = 1 [(buf.validate.field).fixed32.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [fixed32.gt_lt]
  ///    fixed32 other_value = 2 [(buf.validate.field).fixed32 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [fixed32.gt_lt_exclusive]
  ///    fixed32 another_value = 3 [(buf.validate.field).fixed32 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.int get gt => $_getIZ(3);
  @$pb.TagNumber(4)
  set gt($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    // value must be greater than or equal to 5 [fixed32.gte]
  ///    fixed32 value = 1 [(buf.validate.field).fixed32.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [fixed32.gte_lt]
  ///    fixed32 other_value = 2 [(buf.validate.field).fixed32 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [fixed32.gte_lt_exclusive]
  ///    fixed32 another_value = 3 [(buf.validate.field).fixed32 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.int get gte => $_getIZ(4);
  @$pb.TagNumber(5)
  set gte($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message
  ///  is generated.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    // value must be in list [1, 2, 3]
  ///    fixed32 value = 1 [(buf.validate.field).fixed32 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.int> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    // value must not be in list [1, 2, 3]
  ///    fixed32 value = 1 [(buf.validate.field).fixed32 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.int> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyFixed32 {
  ///    fixed32 value = 1 [
  ///      (buf.validate.field).fixed32.example = 1,
  ///      (buf.validate.field).fixed32.example = 2
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$core.int> get example => $_getList(7);
}

enum Fixed64Rules_LessThan { lt, lte, notSet }

enum Fixed64Rules_GreaterThan { gt, gte, notSet }

/// Fixed64Rules describes the constraints applied to `fixed64` values.
class Fixed64Rules extends $pb.GeneratedMessage {
  factory Fixed64Rules({
    $fixnum.Int64? const_1,
    $fixnum.Int64? lt,
    $fixnum.Int64? lte,
    $fixnum.Int64? gt,
    $fixnum.Int64? gte,
    $core.Iterable<$fixnum.Int64>? in_6,
    $core.Iterable<$fixnum.Int64>? notIn,
    $core.Iterable<$fixnum.Int64>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  Fixed64Rules._() : super();
  factory Fixed64Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Fixed64Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Fixed64Rules_LessThan>
      _Fixed64Rules_LessThanByTag = {
    2: Fixed64Rules_LessThan.lt,
    3: Fixed64Rules_LessThan.lte,
    0: Fixed64Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, Fixed64Rules_GreaterThan>
      _Fixed64Rules_GreaterThanByTag = {
    4: Fixed64Rules_GreaterThan.gt,
    5: Fixed64Rules_GreaterThan.gte,
    0: Fixed64Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Fixed64Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PF6)
    ..p<$fixnum.Int64>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PF6)
    ..p<$fixnum.Int64>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PF6)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Fixed64Rules clone() => Fixed64Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Fixed64Rules copyWith(void Function(Fixed64Rules) updates) =>
      super.copyWith((message) => updates(message as Fixed64Rules))
          as Fixed64Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Fixed64Rules create() => Fixed64Rules._();
  Fixed64Rules createEmptyInstance() => create();
  static $pb.PbList<Fixed64Rules> createRepeated() =>
      $pb.PbList<Fixed64Rules>();
  @$core.pragma('dart2js:noInline')
  static Fixed64Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Fixed64Rules>(create);
  static Fixed64Rules? _defaultInstance;

  Fixed64Rules_LessThan whichLessThan() =>
      _Fixed64Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  Fixed64Rules_GreaterThan whichGreaterThan() =>
      _Fixed64Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    // value must equal 42
  ///    fixed64 value = 1 [(buf.validate.field).fixed64.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $fixnum.Int64 get const_1 => $_getI64(0);
  @$pb.TagNumber(1)
  set const_1($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    // value must be less than 10
  ///    fixed64 value = 1 [(buf.validate.field).fixed64.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get lt => $_getI64(1);
  @$pb.TagNumber(2)
  set lt($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    // value must be less than or equal to 10
  ///    fixed64 value = 1 [(buf.validate.field).fixed64.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $fixnum.Int64 get lte => $_getI64(2);
  @$pb.TagNumber(3)
  set lte($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    // value must be greater than 5 [fixed64.gt]
  ///    fixed64 value = 1 [(buf.validate.field).fixed64.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [fixed64.gt_lt]
  ///    fixed64 other_value = 2 [(buf.validate.field).fixed64 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [fixed64.gt_lt_exclusive]
  ///    fixed64 another_value = 3 [(buf.validate.field).fixed64 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $fixnum.Int64 get gt => $_getI64(3);
  @$pb.TagNumber(4)
  set gt($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    // value must be greater than or equal to 5 [fixed64.gte]
  ///    fixed64 value = 1 [(buf.validate.field).fixed64.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [fixed64.gte_lt]
  ///    fixed64 other_value = 2 [(buf.validate.field).fixed64 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [fixed64.gte_lt_exclusive]
  ///    fixed64 another_value = 3 [(buf.validate.field).fixed64 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $fixnum.Int64 get gte => $_getI64(4);
  @$pb.TagNumber(5)
  set gte($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    // value must be in list [1, 2, 3]
  ///    fixed64 value = 1 [(buf.validate.field).fixed64 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$fixnum.Int64> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    // value must not be in list [1, 2, 3]
  ///    fixed64 value = 1 [(buf.validate.field).fixed64 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$fixnum.Int64> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyFixed64 {
  ///    fixed64 value = 1 [
  ///      (buf.validate.field).fixed64.example = 1,
  ///      (buf.validate.field).fixed64.example = 2
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$fixnum.Int64> get example => $_getList(7);
}

enum SFixed32Rules_LessThan { lt, lte, notSet }

enum SFixed32Rules_GreaterThan { gt, gte, notSet }

/// SFixed32Rules describes the constraints applied to `fixed32` values.
class SFixed32Rules extends $pb.GeneratedMessage {
  factory SFixed32Rules({
    $core.int? const_1,
    $core.int? lt,
    $core.int? lte,
    $core.int? gt,
    $core.int? gte,
    $core.Iterable<$core.int>? in_6,
    $core.Iterable<$core.int>? notIn,
    $core.Iterable<$core.int>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  SFixed32Rules._() : super();
  factory SFixed32Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SFixed32Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SFixed32Rules_LessThan>
      _SFixed32Rules_LessThanByTag = {
    2: SFixed32Rules_LessThan.lt,
    3: SFixed32Rules_LessThan.lte,
    0: SFixed32Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, SFixed32Rules_GreaterThan>
      _SFixed32Rules_GreaterThanByTag = {
    4: SFixed32Rules_GreaterThan.gt,
    5: SFixed32Rules_GreaterThan.gte,
    0: SFixed32Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SFixed32Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OSF3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OSF3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OSF3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OSF3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OSF3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PSF3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PSF3)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PSF3)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SFixed32Rules clone() => SFixed32Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SFixed32Rules copyWith(void Function(SFixed32Rules) updates) =>
      super.copyWith((message) => updates(message as SFixed32Rules))
          as SFixed32Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SFixed32Rules create() => SFixed32Rules._();
  SFixed32Rules createEmptyInstance() => create();
  static $pb.PbList<SFixed32Rules> createRepeated() =>
      $pb.PbList<SFixed32Rules>();
  @$core.pragma('dart2js:noInline')
  static SFixed32Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SFixed32Rules>(create);
  static SFixed32Rules? _defaultInstance;

  SFixed32Rules_LessThan whichLessThan() =>
      _SFixed32Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  SFixed32Rules_GreaterThan whichGreaterThan() =>
      _SFixed32Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    // value must equal 42
  ///    sfixed32 value = 1 [(buf.validate.field).sfixed32.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.int get const_1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set const_1($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    // value must be less than 10
  ///    sfixed32 value = 1 [(buf.validate.field).sfixed32.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.int get lt => $_getIZ(1);
  @$pb.TagNumber(2)
  set lt($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    // value must be less than or equal to 10
  ///    sfixed32 value = 1 [(buf.validate.field).sfixed32.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.int get lte => $_getIZ(2);
  @$pb.TagNumber(3)
  set lte($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    // value must be greater than 5 [sfixed32.gt]
  ///    sfixed32 value = 1 [(buf.validate.field).sfixed32.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [sfixed32.gt_lt]
  ///    sfixed32 other_value = 2 [(buf.validate.field).sfixed32 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [sfixed32.gt_lt_exclusive]
  ///    sfixed32 another_value = 3 [(buf.validate.field).sfixed32 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.int get gt => $_getIZ(3);
  @$pb.TagNumber(4)
  set gt($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    // value must be greater than or equal to 5 [sfixed32.gte]
  ///    sfixed32 value = 1 [(buf.validate.field).sfixed32.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [sfixed32.gte_lt]
  ///    sfixed32 other_value = 2 [(buf.validate.field).sfixed32 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [sfixed32.gte_lt_exclusive]
  ///    sfixed32 another_value = 3 [(buf.validate.field).sfixed32 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.int get gte => $_getIZ(4);
  @$pb.TagNumber(5)
  set gte($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    // value must be in list [1, 2, 3]
  ///    sfixed32 value = 1 [(buf.validate.field).sfixed32 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.int> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    // value must not be in list [1, 2, 3]
  ///    sfixed32 value = 1 [(buf.validate.field).sfixed32 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.int> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MySFixed32 {
  ///    sfixed32 value = 1 [
  ///      (buf.validate.field).sfixed32.example = 1,
  ///      (buf.validate.field).sfixed32.example = 2
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$core.int> get example => $_getList(7);
}

enum SFixed64Rules_LessThan { lt, lte, notSet }

enum SFixed64Rules_GreaterThan { gt, gte, notSet }

/// SFixed64Rules describes the constraints applied to `fixed64` values.
class SFixed64Rules extends $pb.GeneratedMessage {
  factory SFixed64Rules({
    $fixnum.Int64? const_1,
    $fixnum.Int64? lt,
    $fixnum.Int64? lte,
    $fixnum.Int64? gt,
    $fixnum.Int64? gte,
    $core.Iterable<$fixnum.Int64>? in_6,
    $core.Iterable<$fixnum.Int64>? notIn,
    $core.Iterable<$fixnum.Int64>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_6 != null) {
      $result.in_6.addAll(in_6);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  SFixed64Rules._() : super();
  factory SFixed64Rules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SFixed64Rules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SFixed64Rules_LessThan>
      _SFixed64Rules_LessThanByTag = {
    2: SFixed64Rules_LessThan.lt,
    3: SFixed64Rules_LessThan.lte,
    0: SFixed64Rules_LessThan.notSet
  };
  static const $core.Map<$core.int, SFixed64Rules_GreaterThan>
      _SFixed64Rules_GreaterThanByTag = {
    4: SFixed64Rules_GreaterThan.gt,
    5: SFixed64Rules_GreaterThan.gte,
    0: SFixed64Rules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SFixed64Rules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OSF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'lt', $pb.PbFieldType.OSF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'lte', $pb.PbFieldType.OSF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'gt', $pb.PbFieldType.OSF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'gte', $pb.PbFieldType.OSF6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(6, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PSF6)
    ..p<$fixnum.Int64>(7, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PSF6)
    ..p<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PSF6)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SFixed64Rules clone() => SFixed64Rules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SFixed64Rules copyWith(void Function(SFixed64Rules) updates) =>
      super.copyWith((message) => updates(message as SFixed64Rules))
          as SFixed64Rules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SFixed64Rules create() => SFixed64Rules._();
  SFixed64Rules createEmptyInstance() => create();
  static $pb.PbList<SFixed64Rules> createRepeated() =>
      $pb.PbList<SFixed64Rules>();
  @$core.pragma('dart2js:noInline')
  static SFixed64Rules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SFixed64Rules>(create);
  static SFixed64Rules? _defaultInstance;

  SFixed64Rules_LessThan whichLessThan() =>
      _SFixed64Rules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  SFixed64Rules_GreaterThan whichGreaterThan() =>
      _SFixed64Rules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    // value must equal 42
  ///    sfixed64 value = 1 [(buf.validate.field).sfixed64.const = 42];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $fixnum.Int64 get const_1 => $_getI64(0);
  @$pb.TagNumber(1)
  set const_1($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `lt` requires the field value to be less than the specified value (field <
  ///  value). If the field value is equal to or greater than the specified value,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    // value must be less than 10
  ///    sfixed64 value = 1 [(buf.validate.field).sfixed64.lt = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get lt => $_getI64(1);
  @$pb.TagNumber(2)
  set lt($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(2)
  void clearLt() => clearField(2);

  ///  `lte` requires the field value to be less than or equal to the specified
  ///  value (field <= value). If the field value is greater than the specified
  ///  value, an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    // value must be less than or equal to 10
  ///    sfixed64 value = 1 [(buf.validate.field).sfixed64.lte = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $fixnum.Int64 get lte => $_getI64(2);
  @$pb.TagNumber(3)
  set lte($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(3)
  void clearLte() => clearField(3);

  ///  `gt` requires the field value to be greater than the specified value
  ///  (exclusive). If the value of `gt` is larger than a specified `lt` or
  ///  `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    // value must be greater than 5 [sfixed64.gt]
  ///    sfixed64 value = 1 [(buf.validate.field).sfixed64.gt = 5];
  ///
  ///    // value must be greater than 5 and less than 10 [sfixed64.gt_lt]
  ///    sfixed64 other_value = 2 [(buf.validate.field).sfixed64 = { gt: 5, lt: 10 }];
  ///
  ///    // value must be greater than 10 or less than 5 [sfixed64.gt_lt_exclusive]
  ///    sfixed64 another_value = 3 [(buf.validate.field).sfixed64 = { gt: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $fixnum.Int64 get gt => $_getI64(3);
  @$pb.TagNumber(4)
  set gt($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGt() => clearField(4);

  ///  `gte` requires the field value to be greater than or equal to the specified
  ///  value (exclusive). If the value of `gte` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    // value must be greater than or equal to 5 [sfixed64.gte]
  ///    sfixed64 value = 1 [(buf.validate.field).sfixed64.gte = 5];
  ///
  ///    // value must be greater than or equal to 5 and less than 10 [sfixed64.gte_lt]
  ///    sfixed64 other_value = 2 [(buf.validate.field).sfixed64 = { gte: 5, lt: 10 }];
  ///
  ///    // value must be greater than or equal to 10 or less than 5 [sfixed64.gte_lt_exclusive]
  ///    sfixed64 another_value = 3 [(buf.validate.field).sfixed64 = { gte: 10, lt: 5 }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $fixnum.Int64 get gte => $_getI64(4);
  @$pb.TagNumber(5)
  set gte($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(5)
  void clearGte() => clearField(5);

  ///  `in` requires the field value to be equal to one of the specified values.
  ///  If the field value isn't one of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    // value must be in list [1, 2, 3]
  ///    sfixed64 value = 1 [(buf.validate.field).sfixed64 = { in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$fixnum.Int64> get in_6 => $_getList(5);

  ///  `not_in` requires the field value to not be equal to any of the specified
  ///  values. If the field value is one of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    // value must not be in list [1, 2, 3]
  ///    sfixed64 value = 1 [(buf.validate.field).sfixed64 = { not_in: [1, 2, 3] }];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$fixnum.Int64> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MySFixed64 {
  ///    sfixed64 value = 1 [
  ///      (buf.validate.field).sfixed64.example = 1,
  ///      (buf.validate.field).sfixed64.example = 2
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$fixnum.Int64> get example => $_getList(7);
}

/// BoolRules describes the constraints applied to `bool` values. These rules
/// may also be applied to the `google.protobuf.BoolValue` Well-Known-Type.
class BoolRules extends $pb.GeneratedMessage {
  factory BoolRules({
    $core.bool? const_1,
    $core.Iterable<$core.bool>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  BoolRules._() : super();
  factory BoolRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BoolRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoolRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'const')
    ..p<$core.bool>(2, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PB)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BoolRules clone() => BoolRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BoolRules copyWith(void Function(BoolRules) updates) =>
      super.copyWith((message) => updates(message as BoolRules)) as BoolRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoolRules create() => BoolRules._();
  BoolRules createEmptyInstance() => create();
  static $pb.PbList<BoolRules> createRepeated() => $pb.PbList<BoolRules>();
  @$core.pragma('dart2js:noInline')
  static BoolRules getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolRules>(create);
  static BoolRules? _defaultInstance;

  ///  `const` requires the field value to exactly match the specified boolean value.
  ///  If the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBool {
  ///    // value must equal true
  ///    bool value = 1 [(buf.validate.field).bool.const = true];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.bool get const_1 => $_getBF(0);
  @$pb.TagNumber(1)
  set const_1($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyBool {
  ///    bool value = 1 [
  ///      (buf.validate.field).bool.example = 1,
  ///      (buf.validate.field).bool.example = 2
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.List<$core.bool> get example => $_getList(1);
}

enum StringRules_WellKnown {
  email,
  hostname,
  ip,
  ipv4,
  ipv6,
  uri,
  uriRef,
  address,
  uuid,
  wellKnownRegex,
  ipWithPrefixlen,
  ipv4WithPrefixlen,
  ipv6WithPrefixlen,
  ipPrefix,
  ipv4Prefix,
  ipv6Prefix,
  hostAndPort,
  tuuid,
  notSet
}

/// StringRules describes the constraints applied to `string` values These
/// rules may also be applied to the `google.protobuf.StringValue` Well-Known-Type.
class StringRules extends $pb.GeneratedMessage {
  factory StringRules({
    $core.String? const_1,
    $fixnum.Int64? minLen,
    $fixnum.Int64? maxLen,
    $fixnum.Int64? minBytes,
    $fixnum.Int64? maxBytes,
    $core.String? pattern,
    $core.String? prefix,
    $core.String? suffix,
    $core.String? contains,
    $core.Iterable<$core.String>? in_10,
    $core.Iterable<$core.String>? notIn,
    $core.bool? email,
    $core.bool? hostname,
    $core.bool? ip,
    $core.bool? ipv4,
    $core.bool? ipv6,
    $core.bool? uri,
    $core.bool? uriRef,
    $fixnum.Int64? len,
    $fixnum.Int64? lenBytes,
    $core.bool? address,
    $core.bool? uuid,
    $core.String? notContains,
    KnownRegex? wellKnownRegex,
    $core.bool? strict,
    $core.bool? ipWithPrefixlen,
    $core.bool? ipv4WithPrefixlen,
    $core.bool? ipv6WithPrefixlen,
    $core.bool? ipPrefix,
    $core.bool? ipv4Prefix,
    $core.bool? ipv6Prefix,
    $core.bool? hostAndPort,
    $core.bool? tuuid,
    $core.Iterable<$core.String>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (minLen != null) {
      $result.minLen = minLen;
    }
    if (maxLen != null) {
      $result.maxLen = maxLen;
    }
    if (minBytes != null) {
      $result.minBytes = minBytes;
    }
    if (maxBytes != null) {
      $result.maxBytes = maxBytes;
    }
    if (pattern != null) {
      $result.pattern = pattern;
    }
    if (prefix != null) {
      $result.prefix = prefix;
    }
    if (suffix != null) {
      $result.suffix = suffix;
    }
    if (contains != null) {
      $result.contains = contains;
    }
    if (in_10 != null) {
      $result.in_10.addAll(in_10);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (email != null) {
      $result.email = email;
    }
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (ip != null) {
      $result.ip = ip;
    }
    if (ipv4 != null) {
      $result.ipv4 = ipv4;
    }
    if (ipv6 != null) {
      $result.ipv6 = ipv6;
    }
    if (uri != null) {
      $result.uri = uri;
    }
    if (uriRef != null) {
      $result.uriRef = uriRef;
    }
    if (len != null) {
      $result.len = len;
    }
    if (lenBytes != null) {
      $result.lenBytes = lenBytes;
    }
    if (address != null) {
      $result.address = address;
    }
    if (uuid != null) {
      $result.uuid = uuid;
    }
    if (notContains != null) {
      $result.notContains = notContains;
    }
    if (wellKnownRegex != null) {
      $result.wellKnownRegex = wellKnownRegex;
    }
    if (strict != null) {
      $result.strict = strict;
    }
    if (ipWithPrefixlen != null) {
      $result.ipWithPrefixlen = ipWithPrefixlen;
    }
    if (ipv4WithPrefixlen != null) {
      $result.ipv4WithPrefixlen = ipv4WithPrefixlen;
    }
    if (ipv6WithPrefixlen != null) {
      $result.ipv6WithPrefixlen = ipv6WithPrefixlen;
    }
    if (ipPrefix != null) {
      $result.ipPrefix = ipPrefix;
    }
    if (ipv4Prefix != null) {
      $result.ipv4Prefix = ipv4Prefix;
    }
    if (ipv6Prefix != null) {
      $result.ipv6Prefix = ipv6Prefix;
    }
    if (hostAndPort != null) {
      $result.hostAndPort = hostAndPort;
    }
    if (tuuid != null) {
      $result.tuuid = tuuid;
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  StringRules._() : super();
  factory StringRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StringRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StringRules_WellKnown>
      _StringRules_WellKnownByTag = {
    12: StringRules_WellKnown.email,
    13: StringRules_WellKnown.hostname,
    14: StringRules_WellKnown.ip,
    15: StringRules_WellKnown.ipv4,
    16: StringRules_WellKnown.ipv6,
    17: StringRules_WellKnown.uri,
    18: StringRules_WellKnown.uriRef,
    21: StringRules_WellKnown.address,
    22: StringRules_WellKnown.uuid,
    24: StringRules_WellKnown.wellKnownRegex,
    26: StringRules_WellKnown.ipWithPrefixlen,
    27: StringRules_WellKnown.ipv4WithPrefixlen,
    28: StringRules_WellKnown.ipv6WithPrefixlen,
    29: StringRules_WellKnown.ipPrefix,
    30: StringRules_WellKnown.ipv4Prefix,
    31: StringRules_WellKnown.ipv6Prefix,
    32: StringRules_WellKnown.hostAndPort,
    33: StringRules_WellKnown.tuuid,
    0: StringRules_WellKnown.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StringRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      21,
      22,
      24,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33
    ])
    ..aOS(1, _omitFieldNames ? '' : 'const')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'minLen', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'maxLen', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'minBytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'maxBytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'pattern')
    ..aOS(7, _omitFieldNames ? '' : 'prefix')
    ..aOS(8, _omitFieldNames ? '' : 'suffix')
    ..aOS(9, _omitFieldNames ? '' : 'contains')
    ..pPS(10, _omitFieldNames ? '' : 'in')
    ..pPS(11, _omitFieldNames ? '' : 'notIn')
    ..aOB(12, _omitFieldNames ? '' : 'email')
    ..aOB(13, _omitFieldNames ? '' : 'hostname')
    ..aOB(14, _omitFieldNames ? '' : 'ip')
    ..aOB(15, _omitFieldNames ? '' : 'ipv4')
    ..aOB(16, _omitFieldNames ? '' : 'ipv6')
    ..aOB(17, _omitFieldNames ? '' : 'uri')
    ..aOB(18, _omitFieldNames ? '' : 'uriRef')
    ..a<$fixnum.Int64>(19, _omitFieldNames ? '' : 'len', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        20, _omitFieldNames ? '' : 'lenBytes', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(21, _omitFieldNames ? '' : 'address')
    ..aOB(22, _omitFieldNames ? '' : 'uuid')
    ..aOS(23, _omitFieldNames ? '' : 'notContains')
    ..e<KnownRegex>(
        24, _omitFieldNames ? '' : 'wellKnownRegex', $pb.PbFieldType.OE,
        defaultOrMaker: KnownRegex.KNOWN_REGEX_UNSPECIFIED,
        valueOf: KnownRegex.valueOf,
        enumValues: KnownRegex.values)
    ..aOB(25, _omitFieldNames ? '' : 'strict')
    ..aOB(26, _omitFieldNames ? '' : 'ipWithPrefixlen')
    ..aOB(27, _omitFieldNames ? '' : 'ipv4WithPrefixlen')
    ..aOB(28, _omitFieldNames ? '' : 'ipv6WithPrefixlen')
    ..aOB(29, _omitFieldNames ? '' : 'ipPrefix')
    ..aOB(30, _omitFieldNames ? '' : 'ipv4Prefix')
    ..aOB(31, _omitFieldNames ? '' : 'ipv6Prefix')
    ..aOB(32, _omitFieldNames ? '' : 'hostAndPort')
    ..aOB(33, _omitFieldNames ? '' : 'tuuid')
    ..pPS(34, _omitFieldNames ? '' : 'example')
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StringRules clone() => StringRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StringRules copyWith(void Function(StringRules) updates) =>
      super.copyWith((message) => updates(message as StringRules))
          as StringRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StringRules create() => StringRules._();
  StringRules createEmptyInstance() => create();
  static $pb.PbList<StringRules> createRepeated() => $pb.PbList<StringRules>();
  @$core.pragma('dart2js:noInline')
  static StringRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StringRules>(create);
  static StringRules? _defaultInstance;

  StringRules_WellKnown whichWellKnown() =>
      _StringRules_WellKnownByTag[$_whichOneof(0)]!;
  void clearWellKnown() => clearField($_whichOneof(0));

  ///  `const` requires the field value to exactly match the specified value. If
  ///  the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must equal `hello`
  ///    string value = 1 [(buf.validate.field).string.const = "hello"];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.String get const_1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set const_1($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `min_len` specifies that the field value must have at least the specified
  ///  number of characters (Unicode code points), which may differ from the number
  ///  of bytes in the string. If the field value contains fewer characters, an error
  ///  message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value length must be at least 3 characters
  ///    string value = 1 [(buf.validate.field).string.min_len = 3];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get minLen => $_getI64(1);
  @$pb.TagNumber(2)
  set minLen($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMinLen() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinLen() => clearField(2);

  ///  `max_len` specifies that the field value must have no more than the specified
  ///  number of characters (Unicode code points), which may differ from the
  ///  number of bytes in the string. If the field value contains more characters,
  ///  an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value length must be at most 10 characters
  ///    string value = 1 [(buf.validate.field).string.max_len = 10];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $fixnum.Int64 get maxLen => $_getI64(2);
  @$pb.TagNumber(3)
  set maxLen($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMaxLen() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxLen() => clearField(3);

  ///  `min_bytes` specifies that the field value must have at least the specified
  ///  number of bytes. If the field value contains fewer bytes, an error message
  ///  will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value length must be at least 4 bytes
  ///    string value = 1 [(buf.validate.field).string.min_bytes = 4];
  ///  }
  ///
  ///  ```
  @$pb.TagNumber(4)
  $fixnum.Int64 get minBytes => $_getI64(3);
  @$pb.TagNumber(4)
  set minBytes($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMinBytes() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinBytes() => clearField(4);

  ///  `max_bytes` specifies that the field value must have no more than the
  /// specified number of bytes. If the field value contains more bytes, an
  ///  error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value length must be at most 8 bytes
  ///    string value = 1 [(buf.validate.field).string.max_bytes = 8];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $fixnum.Int64 get maxBytes => $_getI64(4);
  @$pb.TagNumber(5)
  set maxBytes($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMaxBytes() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxBytes() => clearField(5);

  ///  `pattern` specifies that the field value must match the specified
  ///  regular expression (RE2 syntax), with the expression provided without any
  ///  delimiters. If the field value doesn't match the regular expression, an
  ///  error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value does not match regex pattern `^[a-zA-Z]//$`
  ///    string value = 1 [(buf.validate.field).string.pattern = "^[a-zA-Z]//$"];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.String get pattern => $_getSZ(5);
  @$pb.TagNumber(6)
  set pattern($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPattern() => $_has(5);
  @$pb.TagNumber(6)
  void clearPattern() => clearField(6);

  ///  `prefix` specifies that the field value must have the
  /// specified substring at the beginning of the string. If the field value
  ///  doesn't start with the specified prefix, an error message will be
  ///  generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value does not have prefix `pre`
  ///    string value = 1 [(buf.validate.field).string.prefix = "pre"];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.String get prefix => $_getSZ(6);
  @$pb.TagNumber(7)
  set prefix($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrefix() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrefix() => clearField(7);

  ///  `suffix` specifies that the field value must have the
  /// specified substring at the end of the string. If the field value doesn't
  ///  end with the specified suffix, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value does not have suffix `post`
  ///    string value = 1 [(buf.validate.field).string.suffix = "post"];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.String get suffix => $_getSZ(7);
  @$pb.TagNumber(8)
  set suffix($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSuffix() => $_has(7);
  @$pb.TagNumber(8)
  void clearSuffix() => clearField(8);

  ///  `contains` specifies that the field value must have the
  /// specified substring anywhere in the string. If the field value doesn't
  ///  contain the specified substring, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value does not contain substring `inside`.
  ///    string value = 1 [(buf.validate.field).string.contains = "inside"];
  ///  }
  ///  ```
  @$pb.TagNumber(9)
  $core.String get contains => $_getSZ(8);
  @$pb.TagNumber(9)
  set contains($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasContains() => $_has(8);
  @$pb.TagNumber(9)
  void clearContains() => clearField(9);

  ///  `in` specifies that the field value must be equal to one of the specified
  ///  values. If the field value isn't one of the specified values, an error
  ///  message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be in list ["apple", "banana"]
  ///    string value = 1 [(buf.validate.field).string.in = "apple", (buf.validate.field).string.in = "banana"];
  ///  }
  ///  ```
  @$pb.TagNumber(10)
  $core.List<$core.String> get in_10 => $_getList(9);

  /// `not_in` specifies that the field value cannot be equal to any
  /// of the specified values. If the field value is one of the specified values,
  /// an error message will be generated.
  /// ```proto
  /// message MyString {
  ///   // value must not be in list ["orange", "grape"]
  ///   string value = 1 [(buf.validate.field).string.not_in = "orange", (buf.validate.field).string.not_in = "grape"];
  /// }
  /// ```
  @$pb.TagNumber(11)
  $core.List<$core.String> get notIn => $_getList(10);

  ///  `email` specifies that the field value must be a valid email address
  ///  (addr-spec only) as defined by [RFC 5322](https://datatracker.ietf.org/doc/html/rfc5322#section-3.4.1).
  ///  If the field value isn't a valid email address, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid email address
  ///    string value = 1 [(buf.validate.field).string.email = true];
  ///  }
  ///  ```
  @$pb.TagNumber(12)
  $core.bool get email => $_getBF(11);
  @$pb.TagNumber(12)
  set email($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasEmail() => $_has(11);
  @$pb.TagNumber(12)
  void clearEmail() => clearField(12);

  ///  `hostname` specifies that the field value must be a valid
  ///  hostname as defined by [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034#section-3.5). This constraint doesn't support
  ///  internationalized domain names (IDNs). If the field value isn't a
  ///  valid hostname, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid hostname
  ///    string value = 1 [(buf.validate.field).string.hostname = true];
  ///  }
  ///  ```
  @$pb.TagNumber(13)
  $core.bool get hostname => $_getBF(12);
  @$pb.TagNumber(13)
  set hostname($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasHostname() => $_has(12);
  @$pb.TagNumber(13)
  void clearHostname() => clearField(13);

  ///  `ip` specifies that the field value must be a valid IP
  ///  (v4 or v6) address, without surrounding square brackets for IPv6 addresses.
  ///  If the field value isn't a valid IP address, an error message will be
  ///  generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IP address
  ///    string value = 1 [(buf.validate.field).string.ip = true];
  ///  }
  ///  ```
  @$pb.TagNumber(14)
  $core.bool get ip => $_getBF(13);
  @$pb.TagNumber(14)
  set ip($core.bool v) {
    $_setBool(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasIp() => $_has(13);
  @$pb.TagNumber(14)
  void clearIp() => clearField(14);

  ///  `ipv4` specifies that the field value must be a valid IPv4
  ///  address. If the field value isn't a valid IPv4 address, an error message
  ///  will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IPv4 address
  ///    string value = 1 [(buf.validate.field).string.ipv4 = true];
  ///  }
  ///  ```
  @$pb.TagNumber(15)
  $core.bool get ipv4 => $_getBF(14);
  @$pb.TagNumber(15)
  set ipv4($core.bool v) {
    $_setBool(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasIpv4() => $_has(14);
  @$pb.TagNumber(15)
  void clearIpv4() => clearField(15);

  ///  `ipv6` specifies that the field value must be a valid
  ///  IPv6 address, without surrounding square brackets. If the field value is
  ///  not a valid IPv6 address, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IPv6 address
  ///    string value = 1 [(buf.validate.field).string.ipv6 = true];
  ///  }
  ///  ```
  @$pb.TagNumber(16)
  $core.bool get ipv6 => $_getBF(15);
  @$pb.TagNumber(16)
  set ipv6($core.bool v) {
    $_setBool(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasIpv6() => $_has(15);
  @$pb.TagNumber(16)
  void clearIpv6() => clearField(16);

  ///  `uri` specifies that the field value must be a valid URI as defined by
  ///  [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986#section-3).
  ///
  ///  If the field value isn't a valid URI, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid URI
  ///    string value = 1 [(buf.validate.field).string.uri = true];
  ///  }
  ///  ```
  @$pb.TagNumber(17)
  $core.bool get uri => $_getBF(16);
  @$pb.TagNumber(17)
  set uri($core.bool v) {
    $_setBool(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasUri() => $_has(16);
  @$pb.TagNumber(17)
  void clearUri() => clearField(17);

  ///  `uri_ref` specifies that the field value must be a valid URI Reference as
  ///  defined by [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986#section-4.1).
  ///
  ///  A URI Reference is either a [URI](https://datatracker.ietf.org/doc/html/rfc3986#section-3),
  ///  or a [Relative Reference](https://datatracker.ietf.org/doc/html/rfc3986#section-4.2).
  ///
  ///  If the field value isn't a valid URI Reference, an error message will be
  ///  generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid URI Reference
  ///    string value = 1 [(buf.validate.field).string.uri_ref = true];
  ///  }
  ///  ```
  @$pb.TagNumber(18)
  $core.bool get uriRef => $_getBF(17);
  @$pb.TagNumber(18)
  set uriRef($core.bool v) {
    $_setBool(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasUriRef() => $_has(17);
  @$pb.TagNumber(18)
  void clearUriRef() => clearField(18);

  ///  `len` dictates that the field value must have the specified
  ///  number of characters (Unicode code points), which may differ from the number
  ///  of bytes in the string. If the field value does not meet the specified
  ///  length, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value length must be 5 characters
  ///    string value = 1 [(buf.validate.field).string.len = 5];
  ///  }
  ///  ```
  @$pb.TagNumber(19)
  $fixnum.Int64 get len => $_getI64(18);
  @$pb.TagNumber(19)
  set len($fixnum.Int64 v) {
    $_setInt64(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasLen() => $_has(18);
  @$pb.TagNumber(19)
  void clearLen() => clearField(19);

  ///  `len_bytes` dictates that the field value must have the specified number of
  ///  bytes. If the field value does not match the specified length in bytes,
  ///  an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value length must be 6 bytes
  ///    string value = 1 [(buf.validate.field).string.len_bytes = 6];
  ///  }
  ///  ```
  @$pb.TagNumber(20)
  $fixnum.Int64 get lenBytes => $_getI64(19);
  @$pb.TagNumber(20)
  set lenBytes($fixnum.Int64 v) {
    $_setInt64(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasLenBytes() => $_has(19);
  @$pb.TagNumber(20)
  void clearLenBytes() => clearField(20);

  ///  `address` specifies that the field value must be either a valid hostname
  ///  as defined by [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034#section-3.5)
  ///  (which doesn't support internationalized domain names or IDNs) or a valid
  ///  IP (v4 or v6). If the field value isn't a valid hostname or IP, an error
  ///  message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid hostname, or ip address
  ///    string value = 1 [(buf.validate.field).string.address = true];
  ///  }
  ///  ```
  @$pb.TagNumber(21)
  $core.bool get address => $_getBF(20);
  @$pb.TagNumber(21)
  set address($core.bool v) {
    $_setBool(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasAddress() => $_has(20);
  @$pb.TagNumber(21)
  void clearAddress() => clearField(21);

  ///  `uuid` specifies that the field value must be a valid UUID as defined by
  ///  [RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122#section-4.1.2). If the
  ///  field value isn't a valid UUID, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid UUID
  ///    string value = 1 [(buf.validate.field).string.uuid = true];
  ///  }
  ///  ```
  @$pb.TagNumber(22)
  $core.bool get uuid => $_getBF(21);
  @$pb.TagNumber(22)
  set uuid($core.bool v) {
    $_setBool(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasUuid() => $_has(21);
  @$pb.TagNumber(22)
  void clearUuid() => clearField(22);

  ///  `not_contains` specifies that the field value must not have the
  /// specified substring anywhere in the string. If the field value contains
  ///  the specified substring, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value contains substring `inside`.
  ///    string value = 1 [(buf.validate.field).string.not_contains = "inside"];
  ///  }
  ///  ```
  @$pb.TagNumber(23)
  $core.String get notContains => $_getSZ(22);
  @$pb.TagNumber(23)
  set notContains($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasNotContains() => $_has(22);
  @$pb.TagNumber(23)
  void clearNotContains() => clearField(23);

  ///  `well_known_regex` specifies a common well-known pattern
  ///  defined as a regex. If the field value doesn't match the well-known
  ///  regex, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid HTTP header value
  ///    string value = 1 [(buf.validate.field).string.well_known_regex = KNOWN_REGEX_HTTP_HEADER_VALUE];
  ///  }
  ///  ```
  ///
  ///  #### KnownRegex
  ///
  ///  `well_known_regex` contains some well-known patterns.
  ///
  ///  | Name                          | Number | Description                               |
  ///  |-------------------------------|--------|-------------------------------------------|
  ///  | KNOWN_REGEX_UNSPECIFIED       | 0      |                                           |
  ///  | KNOWN_REGEX_HTTP_HEADER_NAME  | 1      | HTTP header name as defined by [RFC 7230](https://datatracker.ietf.org/doc/html/rfc7230#section-3.2)  |
  ///  | KNOWN_REGEX_HTTP_HEADER_VALUE | 2      | HTTP header value as defined by [RFC 7230](https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.4) |
  @$pb.TagNumber(24)
  KnownRegex get wellKnownRegex => $_getN(23);
  @$pb.TagNumber(24)
  set wellKnownRegex(KnownRegex v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasWellKnownRegex() => $_has(23);
  @$pb.TagNumber(24)
  void clearWellKnownRegex() => clearField(24);

  ///  This applies to regexes `HTTP_HEADER_NAME` and `HTTP_HEADER_VALUE` to
  ///  enable strict header validation. By default, this is true, and HTTP header
  ///  validations are [RFC-compliant](https://datatracker.ietf.org/doc/html/rfc7230#section-3). Setting to false will enable looser
  ///  validations that only disallow `\r\n\0` characters, which can be used to
  ///  bypass header matching rules.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // The field `value` must have be a valid HTTP headers, but not enforced with strict rules.
  ///    string value = 1 [(buf.validate.field).string.strict = false];
  ///  }
  ///  ```
  @$pb.TagNumber(25)
  $core.bool get strict => $_getBF(24);
  @$pb.TagNumber(25)
  set strict($core.bool v) {
    $_setBool(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasStrict() => $_has(24);
  @$pb.TagNumber(25)
  void clearStrict() => clearField(25);

  ///  `ip_with_prefixlen` specifies that the field value must be a valid IP (v4 or v6)
  ///  address with prefix length. If the field value isn't a valid IP with prefix
  ///  length, an error message will be generated.
  ///
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IP with prefix length
  ///     string value = 1 [(buf.validate.field).string.ip_with_prefixlen = true];
  ///  }
  ///  ```
  @$pb.TagNumber(26)
  $core.bool get ipWithPrefixlen => $_getBF(25);
  @$pb.TagNumber(26)
  set ipWithPrefixlen($core.bool v) {
    $_setBool(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasIpWithPrefixlen() => $_has(25);
  @$pb.TagNumber(26)
  void clearIpWithPrefixlen() => clearField(26);

  ///  `ipv4_with_prefixlen` specifies that the field value must be a valid
  ///  IPv4 address with prefix.
  ///  If the field value isn't a valid IPv4 address with prefix length,
  ///  an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IPv4 address with prefix length
  ///     string value = 1 [(buf.validate.field).string.ipv4_with_prefixlen = true];
  ///  }
  ///  ```
  @$pb.TagNumber(27)
  $core.bool get ipv4WithPrefixlen => $_getBF(26);
  @$pb.TagNumber(27)
  set ipv4WithPrefixlen($core.bool v) {
    $_setBool(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasIpv4WithPrefixlen() => $_has(26);
  @$pb.TagNumber(27)
  void clearIpv4WithPrefixlen() => clearField(27);

  ///  `ipv6_with_prefixlen` specifies that the field value must be a valid
  ///  IPv6 address with prefix length.
  ///  If the field value is not a valid IPv6 address with prefix length,
  ///  an error message will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IPv6 address prefix length
  ///     string value = 1 [(buf.validate.field).string.ipv6_with_prefixlen = true];
  ///  }
  ///  ```
  @$pb.TagNumber(28)
  $core.bool get ipv6WithPrefixlen => $_getBF(27);
  @$pb.TagNumber(28)
  set ipv6WithPrefixlen($core.bool v) {
    $_setBool(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasIpv6WithPrefixlen() => $_has(27);
  @$pb.TagNumber(28)
  void clearIpv6WithPrefixlen() => clearField(28);

  ///  `ip_prefix` specifies that the field value must be a valid IP (v4 or v6) prefix.
  ///  If the field value isn't a valid IP prefix, an error message will be
  ///  generated. The prefix must have all zeros for the masked bits of the prefix (e.g.,
  ///  `127.0.0.0/16`, not `127.0.0.1/16`).
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IP prefix
  ///     string value = 1 [(buf.validate.field).string.ip_prefix = true];
  ///  }
  ///  ```
  @$pb.TagNumber(29)
  $core.bool get ipPrefix => $_getBF(28);
  @$pb.TagNumber(29)
  set ipPrefix($core.bool v) {
    $_setBool(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasIpPrefix() => $_has(28);
  @$pb.TagNumber(29)
  void clearIpPrefix() => clearField(29);

  ///  `ipv4_prefix` specifies that the field value must be a valid IPv4
  ///  prefix. If the field value isn't a valid IPv4 prefix, an error message
  ///  will be generated. The prefix must have all zeros for the masked bits of
  ///  the prefix (e.g., `127.0.0.0/16`, not `127.0.0.1/16`).
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IPv4 prefix
  ///     string value = 1 [(buf.validate.field).string.ipv4_prefix = true];
  ///  }
  ///  ```
  @$pb.TagNumber(30)
  $core.bool get ipv4Prefix => $_getBF(29);
  @$pb.TagNumber(30)
  set ipv4Prefix($core.bool v) {
    $_setBool(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasIpv4Prefix() => $_has(29);
  @$pb.TagNumber(30)
  void clearIpv4Prefix() => clearField(30);

  ///  `ipv6_prefix` specifies that the field value must be a valid IPv6 prefix.
  ///  If the field value is not a valid IPv6 prefix, an error message will be
  ///  generated. The prefix must have all zeros for the masked bits of the prefix
  ///  (e.g., `2001:db8::/48`, not `2001:db8::1/48`).
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid IPv6 prefix
  ///     string value = 1 [(buf.validate.field).string.ipv6_prefix = true];
  ///  }
  ///  ```
  @$pb.TagNumber(31)
  $core.bool get ipv6Prefix => $_getBF(30);
  @$pb.TagNumber(31)
  set ipv6Prefix($core.bool v) {
    $_setBool(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasIpv6Prefix() => $_has(30);
  @$pb.TagNumber(31)
  void clearIpv6Prefix() => clearField(31);

  /// `host_and_port` specifies the field value must be a valid host and port
  /// pair. The host must be a valid hostname or IP address while the port
  /// must be in the range of 0-65535, inclusive. IPv6 addresses must be delimited
  /// with square brackets (e.g., `[::1]:1234`).
  @$pb.TagNumber(32)
  $core.bool get hostAndPort => $_getBF(31);
  @$pb.TagNumber(32)
  set hostAndPort($core.bool v) {
    $_setBool(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasHostAndPort() => $_has(31);
  @$pb.TagNumber(32)
  void clearHostAndPort() => clearField(32);

  ///  `tuuid` (trimmed UUID) specifies that the field value must be a valid UUID as
  ///  defined by [RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122#section-4.1.2) with all dashes
  ///  omitted. If the field value isn't a valid UUID without dashes, an error message
  ///  will be generated.
  ///
  ///  ```proto
  ///  message MyString {
  ///    // value must be a valid trimmed UUID
  ///    string value = 1 [(buf.validate.field).string.tuuid = true];
  ///  }
  ///  ```
  @$pb.TagNumber(33)
  $core.bool get tuuid => $_getBF(32);
  @$pb.TagNumber(33)
  set tuuid($core.bool v) {
    $_setBool(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasTuuid() => $_has(32);
  @$pb.TagNumber(33)
  void clearTuuid() => clearField(33);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyString {
  ///    string value = 1 [
  ///      (buf.validate.field).string.example = "hello",
  ///      (buf.validate.field).string.example = "world"
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(34)
  $core.List<$core.String> get example => $_getList(33);
}

enum BytesRules_WellKnown { ip, ipv4, ipv6, notSet }

/// BytesRules describe the constraints applied to `bytes` values. These rules
/// may also be applied to the `google.protobuf.BytesValue` Well-Known-Type.
class BytesRules extends $pb.GeneratedMessage {
  factory BytesRules({
    $core.List<$core.int>? const_1,
    $fixnum.Int64? minLen,
    $fixnum.Int64? maxLen,
    $core.String? pattern,
    $core.List<$core.int>? prefix,
    $core.List<$core.int>? suffix,
    $core.List<$core.int>? contains,
    $core.Iterable<$core.List<$core.int>>? in_8,
    $core.Iterable<$core.List<$core.int>>? notIn,
    $core.bool? ip,
    $core.bool? ipv4,
    $core.bool? ipv6,
    $fixnum.Int64? len,
    $core.Iterable<$core.List<$core.int>>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (minLen != null) {
      $result.minLen = minLen;
    }
    if (maxLen != null) {
      $result.maxLen = maxLen;
    }
    if (pattern != null) {
      $result.pattern = pattern;
    }
    if (prefix != null) {
      $result.prefix = prefix;
    }
    if (suffix != null) {
      $result.suffix = suffix;
    }
    if (contains != null) {
      $result.contains = contains;
    }
    if (in_8 != null) {
      $result.in_8.addAll(in_8);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (ip != null) {
      $result.ip = ip;
    }
    if (ipv4 != null) {
      $result.ipv4 = ipv4;
    }
    if (ipv6 != null) {
      $result.ipv6 = ipv6;
    }
    if (len != null) {
      $result.len = len;
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  BytesRules._() : super();
  factory BytesRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BytesRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, BytesRules_WellKnown>
      _BytesRules_WellKnownByTag = {
    10: BytesRules_WellKnown.ip,
    11: BytesRules_WellKnown.ipv4,
    12: BytesRules_WellKnown.ipv6,
    0: BytesRules_WellKnown.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BytesRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'minLen', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'maxLen', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'pattern')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'prefix', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'suffix', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'contains', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PY)
    ..aOB(10, _omitFieldNames ? '' : 'ip')
    ..aOB(11, _omitFieldNames ? '' : 'ipv4')
    ..aOB(12, _omitFieldNames ? '' : 'ipv6')
    ..a<$fixnum.Int64>(13, _omitFieldNames ? '' : 'len', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$core.List<$core.int>>(
        14, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PY)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BytesRules clone() => BytesRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BytesRules copyWith(void Function(BytesRules) updates) =>
      super.copyWith((message) => updates(message as BytesRules)) as BytesRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BytesRules create() => BytesRules._();
  BytesRules createEmptyInstance() => create();
  static $pb.PbList<BytesRules> createRepeated() => $pb.PbList<BytesRules>();
  @$core.pragma('dart2js:noInline')
  static BytesRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BytesRules>(create);
  static BytesRules? _defaultInstance;

  BytesRules_WellKnown whichWellKnown() =>
      _BytesRules_WellKnownByTag[$_whichOneof(0)]!;
  void clearWellKnown() => clearField($_whichOneof(0));

  ///  `const` requires the field value to exactly match the specified bytes
  ///  value. If the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value must be "\x01\x02\x03\x04"
  ///    bytes value = 1 [(buf.validate.field).bytes.const = "\x01\x02\x03\x04"];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.List<$core.int> get const_1 => $_getN(0);
  @$pb.TagNumber(1)
  set const_1($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `min_len` requires the field value to have at least the specified minimum
  ///  length in bytes.
  ///  If the field value doesn't meet the requirement, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value length must be at least 2 bytes.
  ///    optional bytes value = 1 [(buf.validate.field).bytes.min_len = 2];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get minLen => $_getI64(1);
  @$pb.TagNumber(2)
  set minLen($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMinLen() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinLen() => clearField(2);

  ///  `max_len` requires the field value to have at most the specified maximum
  ///  length in bytes.
  ///  If the field value exceeds the requirement, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value must be at most 6 bytes.
  ///    optional bytes value = 1 [(buf.validate.field).bytes.max_len = 6];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $fixnum.Int64 get maxLen => $_getI64(2);
  @$pb.TagNumber(3)
  set maxLen($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMaxLen() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxLen() => clearField(3);

  ///  `pattern` requires the field value to match the specified regular
  ///  expression ([RE2 syntax](https://github.com/google/re2/wiki/Syntax)).
  ///  The value of the field must be valid UTF-8 or validation will fail with a
  ///  runtime error.
  ///  If the field value doesn't match the pattern, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value must match regex pattern "^[a-zA-Z0-9]+$".
  ///    optional bytes value = 1 [(buf.validate.field).bytes.pattern = "^[a-zA-Z0-9]+$"];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.String get pattern => $_getSZ(3);
  @$pb.TagNumber(4)
  set pattern($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPattern() => $_has(3);
  @$pb.TagNumber(4)
  void clearPattern() => clearField(4);

  ///  `prefix` requires the field value to have the specified bytes at the
  ///  beginning of the string.
  ///  If the field value doesn't meet the requirement, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value does not have prefix \x01\x02
  ///    optional bytes value = 1 [(buf.validate.field).bytes.prefix = "\x01\x02"];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.List<$core.int> get prefix => $_getN(4);
  @$pb.TagNumber(5)
  set prefix($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrefix() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrefix() => clearField(5);

  ///  `suffix` requires the field value to have the specified bytes at the end
  ///  of the string.
  ///  If the field value doesn't meet the requirement, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value does not have suffix \x03\x04
  ///    optional bytes value = 1 [(buf.validate.field).bytes.suffix = "\x03\x04"];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $core.List<$core.int> get suffix => $_getN(5);
  @$pb.TagNumber(6)
  set suffix($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSuffix() => $_has(5);
  @$pb.TagNumber(6)
  void clearSuffix() => clearField(6);

  ///  `contains` requires the field value to have the specified bytes anywhere in
  ///  the string.
  ///  If the field value doesn't meet the requirement, an error message is generated.
  ///
  ///  ```protobuf
  ///  message MyBytes {
  ///    // value does not contain \x02\x03
  ///    optional bytes value = 1 [(buf.validate.field).bytes.contains = "\x02\x03"];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$core.int> get contains => $_getN(6);
  @$pb.TagNumber(7)
  set contains($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasContains() => $_has(6);
  @$pb.TagNumber(7)
  void clearContains() => clearField(7);

  ///  `in` requires the field value to be equal to one of the specified
  ///  values. If the field value doesn't match any of the specified values, an
  ///  error message is generated.
  ///
  ///  ```protobuf
  ///  message MyBytes {
  ///    // value must in ["\x01\x02", "\x02\x03", "\x03\x04"]
  ///    optional bytes value = 1 [(buf.validate.field).bytes.in = {"\x01\x02", "\x02\x03", "\x03\x04"}];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$core.List<$core.int>> get in_8 => $_getList(7);

  ///  `not_in` requires the field value to be not equal to any of the specified
  ///  values.
  ///  If the field value matches any of the specified values, an error message is
  ///  generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value must not in ["\x01\x02", "\x02\x03", "\x03\x04"]
  ///    optional bytes value = 1 [(buf.validate.field).bytes.not_in = {"\x01\x02", "\x02\x03", "\x03\x04"}];
  ///  }
  ///  ```
  @$pb.TagNumber(9)
  $core.List<$core.List<$core.int>> get notIn => $_getList(8);

  ///  `ip` ensures that the field `value` is a valid IP address (v4 or v6) in byte format.
  ///  If the field value doesn't meet this constraint, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value must be a valid IP address
  ///    optional bytes value = 1 [(buf.validate.field).bytes.ip = true];
  ///  }
  ///  ```
  @$pb.TagNumber(10)
  $core.bool get ip => $_getBF(9);
  @$pb.TagNumber(10)
  set ip($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIp() => $_has(9);
  @$pb.TagNumber(10)
  void clearIp() => clearField(10);

  ///  `ipv4` ensures that the field `value` is a valid IPv4 address in byte format.
  ///  If the field value doesn't meet this constraint, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value must be a valid IPv4 address
  ///    optional bytes value = 1 [(buf.validate.field).bytes.ipv4 = true];
  ///  }
  ///  ```
  @$pb.TagNumber(11)
  $core.bool get ipv4 => $_getBF(10);
  @$pb.TagNumber(11)
  set ipv4($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIpv4() => $_has(10);
  @$pb.TagNumber(11)
  void clearIpv4() => clearField(11);

  /// `ipv6` ensures that the field `value` is a valid IPv6 address in byte format.
  /// If the field value doesn't meet this constraint, an error message is generated.
  /// ```proto
  /// message MyBytes {
  ///   // value must be a valid IPv6 address
  ///   optional bytes value = 1 [(buf.validate.field).bytes.ipv6 = true];
  /// }
  /// ```
  @$pb.TagNumber(12)
  $core.bool get ipv6 => $_getBF(11);
  @$pb.TagNumber(12)
  set ipv6($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasIpv6() => $_has(11);
  @$pb.TagNumber(12)
  void clearIpv6() => clearField(12);

  ///  `len` requires the field value to have the specified length in bytes.
  ///  If the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    // value length must be 4 bytes.
  ///    optional bytes value = 1 [(buf.validate.field).bytes.len = 4];
  ///  }
  ///  ```
  @$pb.TagNumber(13)
  $fixnum.Int64 get len => $_getI64(12);
  @$pb.TagNumber(13)
  set len($fixnum.Int64 v) {
    $_setInt64(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasLen() => $_has(12);
  @$pb.TagNumber(13)
  void clearLen() => clearField(13);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyBytes {
  ///    bytes value = 1 [
  ///      (buf.validate.field).bytes.example = "\x01\x02",
  ///      (buf.validate.field).bytes.example = "\x02\x03"
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(14)
  $core.List<$core.List<$core.int>> get example => $_getList(13);
}

/// EnumRules describe the constraints applied to `enum` values.
class EnumRules extends $pb.GeneratedMessage {
  factory EnumRules({
    $core.int? const_1,
    $core.bool? definedOnly,
    $core.Iterable<$core.int>? in_3,
    $core.Iterable<$core.int>? notIn,
    $core.Iterable<$core.int>? example,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (definedOnly != null) {
      $result.definedOnly = definedOnly;
    }
    if (in_3 != null) {
      $result.in_3.addAll(in_3);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  EnumRules._() : super();
  factory EnumRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnumRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnumRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'const', $pb.PbFieldType.O3)
    ..aOB(2, _omitFieldNames ? '' : 'definedOnly')
    ..p<$core.int>(3, _omitFieldNames ? '' : 'in', $pb.PbFieldType.P3)
    ..p<$core.int>(4, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.P3)
    ..p<$core.int>(5, _omitFieldNames ? '' : 'example', $pb.PbFieldType.P3)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnumRules clone() => EnumRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnumRules copyWith(void Function(EnumRules) updates) =>
      super.copyWith((message) => updates(message as EnumRules)) as EnumRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnumRules create() => EnumRules._();
  EnumRules createEmptyInstance() => create();
  static $pb.PbList<EnumRules> createRepeated() => $pb.PbList<EnumRules>();
  @$core.pragma('dart2js:noInline')
  static EnumRules getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnumRules>(create);
  static EnumRules? _defaultInstance;

  ///  `const` requires the field value to exactly match the specified enum value.
  ///  If the field value doesn't match, an error message is generated.
  ///
  ///  ```proto
  ///  enum MyEnum {
  ///    MY_ENUM_UNSPECIFIED = 0;
  ///    MY_ENUM_VALUE1 = 1;
  ///    MY_ENUM_VALUE2 = 2;
  ///  }
  ///
  ///  message MyMessage {
  ///    // The field `value` must be exactly MY_ENUM_VALUE1.
  ///    MyEnum value = 1 [(buf.validate.field).enum.const = 1];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $core.int get const_1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set const_1($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);

  ///  `defined_only` requires the field value to be one of the defined values for
  ///  this enum, failing on any undefined value.
  ///
  ///  ```proto
  ///  enum MyEnum {
  ///    MY_ENUM_UNSPECIFIED = 0;
  ///    MY_ENUM_VALUE1 = 1;
  ///    MY_ENUM_VALUE2 = 2;
  ///  }
  ///
  ///  message MyMessage {
  ///    // The field `value` must be a defined value of MyEnum.
  ///    MyEnum value = 1 [(buf.validate.field).enum.defined_only = true];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.bool get definedOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set definedOnly($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDefinedOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefinedOnly() => clearField(2);

  ///  `in` requires the field value to be equal to one of the
  /// specified enum values. If the field value doesn't match any of the
  /// specified values, an error message is generated.
  ///
  ///  ```proto
  ///  enum MyEnum {
  ///    MY_ENUM_UNSPECIFIED = 0;
  ///    MY_ENUM_VALUE1 = 1;
  ///    MY_ENUM_VALUE2 = 2;
  ///  }
  ///
  ///  message MyMessage {
  ///    // The field `value` must be equal to one of the specified values.
  ///    MyEnum value = 1 [(buf.validate.field).enum = { in: [1, 2]}];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.List<$core.int> get in_3 => $_getList(2);

  ///  `not_in` requires the field value to be not equal to any of the
  /// specified enum values. If the field value matches one of the specified
  ///  values, an error message is generated.
  ///
  ///  ```proto
  ///  enum MyEnum {
  ///    MY_ENUM_UNSPECIFIED = 0;
  ///    MY_ENUM_VALUE1 = 1;
  ///    MY_ENUM_VALUE2 = 2;
  ///  }
  ///
  ///  message MyMessage {
  ///    // The field `value` must not be equal to any of the specified values.
  ///    MyEnum value = 1 [(buf.validate.field).enum = { not_in: [1, 2]}];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $core.List<$core.int> get notIn => $_getList(3);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  enum MyEnum {
  ///    MY_ENUM_UNSPECIFIED = 0;
  ///    MY_ENUM_VALUE1 = 1;
  ///    MY_ENUM_VALUE2 = 2;
  ///  }
  ///
  ///  message MyMessage {
  ///      (buf.validate.field).enum.example = 1,
  ///      (buf.validate.field).enum.example = 2
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $core.List<$core.int> get example => $_getList(4);
}

/// RepeatedRules describe the constraints applied to `repeated` values.
class RepeatedRules extends $pb.GeneratedMessage {
  factory RepeatedRules({
    $fixnum.Int64? minItems,
    $fixnum.Int64? maxItems,
    $core.bool? unique,
    FieldConstraints? items,
  }) {
    final $result = create();
    if (minItems != null) {
      $result.minItems = minItems;
    }
    if (maxItems != null) {
      $result.maxItems = maxItems;
    }
    if (unique != null) {
      $result.unique = unique;
    }
    if (items != null) {
      $result.items = items;
    }
    return $result;
  }
  RepeatedRules._() : super();
  factory RepeatedRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepeatedRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RepeatedRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'minItems', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'maxItems', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(3, _omitFieldNames ? '' : 'unique')
    ..aOM<FieldConstraints>(4, _omitFieldNames ? '' : 'items',
        subBuilder: FieldConstraints.create)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepeatedRules clone() => RepeatedRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepeatedRules copyWith(void Function(RepeatedRules) updates) =>
      super.copyWith((message) => updates(message as RepeatedRules))
          as RepeatedRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepeatedRules create() => RepeatedRules._();
  RepeatedRules createEmptyInstance() => create();
  static $pb.PbList<RepeatedRules> createRepeated() =>
      $pb.PbList<RepeatedRules>();
  @$core.pragma('dart2js:noInline')
  static RepeatedRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepeatedRules>(create);
  static RepeatedRules? _defaultInstance;

  ///  `min_items` requires that this field must contain at least the specified
  ///  minimum number of items.
  ///
  ///  Note that `min_items = 1` is equivalent to setting a field as `required`.
  ///
  ///  ```proto
  ///  message MyRepeated {
  ///    // value must contain at least  2 items
  ///    repeated string value = 1 [(buf.validate.field).repeated.min_items = 2];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $fixnum.Int64 get minItems => $_getI64(0);
  @$pb.TagNumber(1)
  set minItems($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMinItems() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinItems() => clearField(1);

  ///  `max_items` denotes that this field must not exceed a
  ///  certain number of items as the upper limit. If the field contains more
  ///  items than specified, an error message will be generated, requiring the
  ///  field to maintain no more than the specified number of items.
  ///
  ///  ```proto
  ///  message MyRepeated {
  ///    // value must contain no more than 3 item(s)
  ///    repeated string value = 1 [(buf.validate.field).repeated.max_items = 3];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get maxItems => $_getI64(1);
  @$pb.TagNumber(2)
  set maxItems($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxItems() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxItems() => clearField(2);

  ///  `unique` indicates that all elements in this field must
  ///  be unique. This constraint is strictly applicable to scalar and enum
  ///  types, with message types not being supported.
  ///
  ///  ```proto
  ///  message MyRepeated {
  ///    // repeated value must contain unique items
  ///    repeated string value = 1 [(buf.validate.field).repeated.unique = true];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.bool get unique => $_getBF(2);
  @$pb.TagNumber(3)
  set unique($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnique() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnique() => clearField(3);

  ///  `items` details the constraints to be applied to each item
  ///  in the field. Even for repeated message fields, validation is executed
  ///  against each item unless skip is explicitly specified.
  ///
  ///  ```proto
  ///  message MyRepeated {
  ///    // The items in the field `value` must follow the specified constraints.
  ///    repeated string value = 1 [(buf.validate.field).repeated.items = {
  ///      string: {
  ///        min_len: 3
  ///        max_len: 10
  ///      }
  ///    }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  FieldConstraints get items => $_getN(3);
  @$pb.TagNumber(4)
  set items(FieldConstraints v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasItems() => $_has(3);
  @$pb.TagNumber(4)
  void clearItems() => clearField(4);
  @$pb.TagNumber(4)
  FieldConstraints ensureItems() => $_ensure(3);
}

/// MapRules describe the constraints applied to `map` values.
class MapRules extends $pb.GeneratedMessage {
  factory MapRules({
    $fixnum.Int64? minPairs,
    $fixnum.Int64? maxPairs,
    FieldConstraints? keys,
    FieldConstraints? values,
  }) {
    final $result = create();
    if (minPairs != null) {
      $result.minPairs = minPairs;
    }
    if (maxPairs != null) {
      $result.maxPairs = maxPairs;
    }
    if (keys != null) {
      $result.keys = keys;
    }
    if (values != null) {
      $result.values = values;
    }
    return $result;
  }
  MapRules._() : super();
  factory MapRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MapRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MapRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'minPairs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'maxPairs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<FieldConstraints>(4, _omitFieldNames ? '' : 'keys',
        subBuilder: FieldConstraints.create)
    ..aOM<FieldConstraints>(5, _omitFieldNames ? '' : 'values',
        subBuilder: FieldConstraints.create)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MapRules clone() => MapRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MapRules copyWith(void Function(MapRules) updates) =>
      super.copyWith((message) => updates(message as MapRules)) as MapRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MapRules create() => MapRules._();
  MapRules createEmptyInstance() => create();
  static $pb.PbList<MapRules> createRepeated() => $pb.PbList<MapRules>();
  @$core.pragma('dart2js:noInline')
  static MapRules getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MapRules>(create);
  static MapRules? _defaultInstance;

  /// Specifies the minimum number of key-value pairs allowed. If the field has
  ///  fewer key-value pairs than specified, an error message is generated.
  ///
  ///  ```proto
  ///  message MyMap {
  ///    // The field `value` must have at least 2 key-value pairs.
  ///    map<string, string> value = 1 [(buf.validate.field).map.min_pairs = 2];
  ///  }
  ///  ```
  @$pb.TagNumber(1)
  $fixnum.Int64 get minPairs => $_getI64(0);
  @$pb.TagNumber(1)
  set minPairs($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMinPairs() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinPairs() => clearField(1);

  /// Specifies the maximum number of key-value pairs allowed. If the field has
  ///  more key-value pairs than specified, an error message is generated.
  ///
  ///  ```proto
  ///  message MyMap {
  ///    // The field `value` must have at most 3 key-value pairs.
  ///    map<string, string> value = 1 [(buf.validate.field).map.max_pairs = 3];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $fixnum.Int64 get maxPairs => $_getI64(1);
  @$pb.TagNumber(2)
  set maxPairs($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxPairs() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxPairs() => clearField(2);

  /// Specifies the constraints to be applied to each key in the field.
  ///
  ///  ```proto
  ///  message MyMap {
  ///    // The keys in the field `value` must follow the specified constraints.
  ///    map<string, string> value = 1 [(buf.validate.field).map.keys = {
  ///      string: {
  ///        min_len: 3
  ///        max_len: 10
  ///      }
  ///    }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  FieldConstraints get keys => $_getN(2);
  @$pb.TagNumber(4)
  set keys(FieldConstraints v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasKeys() => $_has(2);
  @$pb.TagNumber(4)
  void clearKeys() => clearField(4);
  @$pb.TagNumber(4)
  FieldConstraints ensureKeys() => $_ensure(2);

  /// Specifies the constraints to be applied to the value of each key in the
  ///  field. Message values will still have their validations evaluated unless
  /// skip is specified here.
  ///
  ///  ```proto
  ///  message MyMap {
  ///    // The values in the field `value` must follow the specified constraints.
  ///    map<string, string> value = 1 [(buf.validate.field).map.values = {
  ///      string: {
  ///        min_len: 5
  ///        max_len: 20
  ///      }
  ///    }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  FieldConstraints get values => $_getN(3);
  @$pb.TagNumber(5)
  set values(FieldConstraints v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasValues() => $_has(3);
  @$pb.TagNumber(5)
  void clearValues() => clearField(5);
  @$pb.TagNumber(5)
  FieldConstraints ensureValues() => $_ensure(3);
}

/// AnyRules describe constraints applied exclusively to the `google.protobuf.Any` well-known type.
class AnyRules extends $pb.GeneratedMessage {
  factory AnyRules({
    $core.Iterable<$core.String>? in_2,
    $core.Iterable<$core.String>? notIn,
  }) {
    final $result = create();
    if (in_2 != null) {
      $result.in_2.addAll(in_2);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    return $result;
  }
  AnyRules._() : super();
  factory AnyRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnyRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnyRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..pPS(2, _omitFieldNames ? '' : 'in')
    ..pPS(3, _omitFieldNames ? '' : 'notIn')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnyRules clone() => AnyRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnyRules copyWith(void Function(AnyRules) updates) =>
      super.copyWith((message) => updates(message as AnyRules)) as AnyRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnyRules create() => AnyRules._();
  AnyRules createEmptyInstance() => create();
  static $pb.PbList<AnyRules> createRepeated() => $pb.PbList<AnyRules>();
  @$core.pragma('dart2js:noInline')
  static AnyRules getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnyRules>(create);
  static AnyRules? _defaultInstance;

  ///  `in` requires the field's `type_url` to be equal to one of the
  /// specified values. If it doesn't match any of the specified values, an error
  ///  message is generated.
  ///
  ///  ```proto
  ///  message MyAny {
  ///    //  The `value` field must have a `type_url` equal to one of the specified values.
  ///    google.protobuf.Any value = 1 [(buf.validate.field).any.in = ["type.googleapis.com/MyType1", "type.googleapis.com/MyType2"]];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $core.List<$core.String> get in_2 => $_getList(0);

  ///  requires the field's type_url to be not equal to any of the specified values. If it matches any of the specified values, an error message is generated.
  ///
  ///  ```proto
  ///  message MyAny {
  ///    // The field `value` must not have a `type_url` equal to any of the specified values.
  ///    google.protobuf.Any value = 1 [(buf.validate.field).any.not_in = ["type.googleapis.com/ForbiddenType1", "type.googleapis.com/ForbiddenType2"]];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $core.List<$core.String> get notIn => $_getList(1);
}

enum DurationRules_LessThan { lt, lte, notSet }

enum DurationRules_GreaterThan { gt, gte, notSet }

/// DurationRules describe the constraints applied exclusively to the `google.protobuf.Duration` well-known type.
class DurationRules extends $pb.GeneratedMessage {
  factory DurationRules({
    $8.Duration? const_2,
    $8.Duration? lt,
    $8.Duration? lte,
    $8.Duration? gt,
    $8.Duration? gte,
    $core.Iterable<$8.Duration>? in_7,
    $core.Iterable<$8.Duration>? notIn,
    $core.Iterable<$8.Duration>? example,
  }) {
    final $result = create();
    if (const_2 != null) {
      $result.const_2 = const_2;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (in_7 != null) {
      $result.in_7.addAll(in_7);
    }
    if (notIn != null) {
      $result.notIn.addAll(notIn);
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  DurationRules._() : super();
  factory DurationRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DurationRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DurationRules_LessThan>
      _DurationRules_LessThanByTag = {
    3: DurationRules_LessThan.lt,
    4: DurationRules_LessThan.lte,
    0: DurationRules_LessThan.notSet
  };
  static const $core.Map<$core.int, DurationRules_GreaterThan>
      _DurationRules_GreaterThanByTag = {
    5: DurationRules_GreaterThan.gt,
    6: DurationRules_GreaterThan.gte,
    0: DurationRules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DurationRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..oo(1, [5, 6])
    ..aOM<$8.Duration>(2, _omitFieldNames ? '' : 'const',
        subBuilder: $8.Duration.create)
    ..aOM<$8.Duration>(3, _omitFieldNames ? '' : 'lt',
        subBuilder: $8.Duration.create)
    ..aOM<$8.Duration>(4, _omitFieldNames ? '' : 'lte',
        subBuilder: $8.Duration.create)
    ..aOM<$8.Duration>(5, _omitFieldNames ? '' : 'gt',
        subBuilder: $8.Duration.create)
    ..aOM<$8.Duration>(6, _omitFieldNames ? '' : 'gte',
        subBuilder: $8.Duration.create)
    ..pc<$8.Duration>(7, _omitFieldNames ? '' : 'in', $pb.PbFieldType.PM,
        subBuilder: $8.Duration.create)
    ..pc<$8.Duration>(8, _omitFieldNames ? '' : 'notIn', $pb.PbFieldType.PM,
        subBuilder: $8.Duration.create)
    ..pc<$8.Duration>(9, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PM,
        subBuilder: $8.Duration.create)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DurationRules clone() => DurationRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DurationRules copyWith(void Function(DurationRules) updates) =>
      super.copyWith((message) => updates(message as DurationRules))
          as DurationRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DurationRules create() => DurationRules._();
  DurationRules createEmptyInstance() => create();
  static $pb.PbList<DurationRules> createRepeated() =>
      $pb.PbList<DurationRules>();
  @$core.pragma('dart2js:noInline')
  static DurationRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DurationRules>(create);
  static DurationRules? _defaultInstance;

  DurationRules_LessThan whichLessThan() =>
      _DurationRules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  DurationRules_GreaterThan whichGreaterThan() =>
      _DurationRules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` dictates that the field must match the specified value of the `google.protobuf.Duration` type exactly.
  ///  If the field's value deviates from the specified value, an error message
  ///  will be generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    // value must equal 5s
  ///    google.protobuf.Duration value = 1 [(buf.validate.field).duration.const = "5s"];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $8.Duration get const_2 => $_getN(0);
  @$pb.TagNumber(2)
  set const_2($8.Duration v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConst_2() => $_has(0);
  @$pb.TagNumber(2)
  void clearConst_2() => clearField(2);
  @$pb.TagNumber(2)
  $8.Duration ensureConst_2() => $_ensure(0);

  ///  `lt` stipulates that the field must be less than the specified value of the `google.protobuf.Duration` type,
  ///  exclusive. If the field's value is greater than or equal to the specified
  ///  value, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    // value must be less than 5s
  ///    google.protobuf.Duration value = 1 [(buf.validate.field).duration.lt = "5s"];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $8.Duration get lt => $_getN(1);
  @$pb.TagNumber(3)
  set lt($8.Duration v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(3)
  void clearLt() => clearField(3);
  @$pb.TagNumber(3)
  $8.Duration ensureLt() => $_ensure(1);

  ///  `lte` indicates that the field must be less than or equal to the specified
  ///  value of the `google.protobuf.Duration` type, inclusive. If the field's value is greater than the specified value,
  ///  an error message will be generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    // value must be less than or equal to 10s
  ///    google.protobuf.Duration value = 1 [(buf.validate.field).duration.lte = "10s"];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $8.Duration get lte => $_getN(2);
  @$pb.TagNumber(4)
  set lte($8.Duration v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(4)
  void clearLte() => clearField(4);
  @$pb.TagNumber(4)
  $8.Duration ensureLte() => $_ensure(2);

  ///  `gt` requires the duration field value to be greater than the specified
  ///  value (exclusive). If the value of `gt` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    // duration must be greater than 5s [duration.gt]
  ///    google.protobuf.Duration value = 1 [(buf.validate.field).duration.gt = { seconds: 5 }];
  ///
  ///    // duration must be greater than 5s and less than 10s [duration.gt_lt]
  ///    google.protobuf.Duration another_value = 2 [(buf.validate.field).duration = { gt: { seconds: 5 }, lt: { seconds: 10 } }];
  ///
  ///    // duration must be greater than 10s or less than 5s [duration.gt_lt_exclusive]
  ///    google.protobuf.Duration other_value = 3 [(buf.validate.field).duration = { gt: { seconds: 10 }, lt: { seconds: 5 } }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $8.Duration get gt => $_getN(3);
  @$pb.TagNumber(5)
  set gt($8.Duration v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(5)
  void clearGt() => clearField(5);
  @$pb.TagNumber(5)
  $8.Duration ensureGt() => $_ensure(3);

  ///  `gte` requires the duration field value to be greater than or equal to the
  ///  specified value (exclusive). If the value of `gte` is larger than a
  ///  specified `lt` or `lte`, the range is reversed, and the field value must
  ///  be outside the specified range. If the field value doesn't meet the
  ///  required conditions, an error message is generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///   // duration must be greater than or equal to 5s [duration.gte]
  ///   google.protobuf.Duration value = 1 [(buf.validate.field).duration.gte = { seconds: 5 }];
  ///
  ///   // duration must be greater than or equal to 5s and less than 10s [duration.gte_lt]
  ///   google.protobuf.Duration another_value = 2 [(buf.validate.field).duration = { gte: { seconds: 5 }, lt: { seconds: 10 } }];
  ///
  ///   // duration must be greater than or equal to 10s or less than 5s [duration.gte_lt_exclusive]
  ///   google.protobuf.Duration other_value = 3 [(buf.validate.field).duration = { gte: { seconds: 10 }, lt: { seconds: 5 } }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $8.Duration get gte => $_getN(4);
  @$pb.TagNumber(6)
  set gte($8.Duration v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(6)
  void clearGte() => clearField(6);
  @$pb.TagNumber(6)
  $8.Duration ensureGte() => $_ensure(4);

  ///  `in` asserts that the field must be equal to one of the specified values of the `google.protobuf.Duration` type.
  ///  If the field's value doesn't correspond to any of the specified values,
  ///  an error message will be generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    // value must be in list [1s, 2s, 3s]
  ///    google.protobuf.Duration value = 1 [(buf.validate.field).duration.in = ["1s", "2s", "3s"]];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.List<$8.Duration> get in_7 => $_getList(5);

  ///  `not_in` denotes that the field must not be equal to
  ///  any of the specified values of the `google.protobuf.Duration` type.
  ///  If the field's value matches any of these values, an error message will be
  ///  generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    // value must not be in list [1s, 2s, 3s]
  ///    google.protobuf.Duration value = 1 [(buf.validate.field).duration.not_in = ["1s", "2s", "3s"]];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.List<$8.Duration> get notIn => $_getList(6);

  ///  `example` specifies values that the field may have. These values SHOULD
  ///  conform to other constraints. `example` values will not impact validation
  ///  but may be used as helpful guidance on how to populate the given field.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    google.protobuf.Duration value = 1 [
  ///      (buf.validate.field).duration.example = { seconds: 1 },
  ///      (buf.validate.field).duration.example = { seconds: 2 },
  ///    ];
  ///  }
  ///  ```
  @$pb.TagNumber(9)
  $core.List<$8.Duration> get example => $_getList(7);
}

enum TimestampRules_LessThan { lt, lte, ltNow, notSet }

enum TimestampRules_GreaterThan { gt, gte, gtNow, notSet }

/// TimestampRules describe the constraints applied exclusively to the `google.protobuf.Timestamp` well-known type.
class TimestampRules extends $pb.GeneratedMessage {
  factory TimestampRules({
    $9.Timestamp? const_2,
    $9.Timestamp? lt,
    $9.Timestamp? lte,
    $9.Timestamp? gt,
    $9.Timestamp? gte,
    $core.bool? ltNow,
    $core.bool? gtNow,
    $8.Duration? within,
    $core.Iterable<$9.Timestamp>? example,
  }) {
    final $result = create();
    if (const_2 != null) {
      $result.const_2 = const_2;
    }
    if (lt != null) {
      $result.lt = lt;
    }
    if (lte != null) {
      $result.lte = lte;
    }
    if (gt != null) {
      $result.gt = gt;
    }
    if (gte != null) {
      $result.gte = gte;
    }
    if (ltNow != null) {
      $result.ltNow = ltNow;
    }
    if (gtNow != null) {
      $result.gtNow = gtNow;
    }
    if (within != null) {
      $result.within = within;
    }
    if (example != null) {
      $result.example.addAll(example);
    }
    return $result;
  }
  TimestampRules._() : super();
  factory TimestampRules.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TimestampRules.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TimestampRules_LessThan>
      _TimestampRules_LessThanByTag = {
    3: TimestampRules_LessThan.lt,
    4: TimestampRules_LessThan.lte,
    7: TimestampRules_LessThan.ltNow,
    0: TimestampRules_LessThan.notSet
  };
  static const $core.Map<$core.int, TimestampRules_GreaterThan>
      _TimestampRules_GreaterThanByTag = {
    5: TimestampRules_GreaterThan.gt,
    6: TimestampRules_GreaterThan.gte,
    8: TimestampRules_GreaterThan.gtNow,
    0: TimestampRules_GreaterThan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TimestampRules',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 7])
    ..oo(1, [5, 6, 8])
    ..aOM<$9.Timestamp>(2, _omitFieldNames ? '' : 'const',
        subBuilder: $9.Timestamp.create)
    ..aOM<$9.Timestamp>(3, _omitFieldNames ? '' : 'lt',
        subBuilder: $9.Timestamp.create)
    ..aOM<$9.Timestamp>(4, _omitFieldNames ? '' : 'lte',
        subBuilder: $9.Timestamp.create)
    ..aOM<$9.Timestamp>(5, _omitFieldNames ? '' : 'gt',
        subBuilder: $9.Timestamp.create)
    ..aOM<$9.Timestamp>(6, _omitFieldNames ? '' : 'gte',
        subBuilder: $9.Timestamp.create)
    ..aOB(7, _omitFieldNames ? '' : 'ltNow')
    ..aOB(8, _omitFieldNames ? '' : 'gtNow')
    ..aOM<$8.Duration>(9, _omitFieldNames ? '' : 'within',
        subBuilder: $8.Duration.create)
    ..pc<$9.Timestamp>(10, _omitFieldNames ? '' : 'example', $pb.PbFieldType.PM,
        subBuilder: $9.Timestamp.create)
    ..hasExtensions = true;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TimestampRules clone() => TimestampRules()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TimestampRules copyWith(void Function(TimestampRules) updates) =>
      super.copyWith((message) => updates(message as TimestampRules))
          as TimestampRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimestampRules create() => TimestampRules._();
  TimestampRules createEmptyInstance() => create();
  static $pb.PbList<TimestampRules> createRepeated() =>
      $pb.PbList<TimestampRules>();
  @$core.pragma('dart2js:noInline')
  static TimestampRules getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TimestampRules>(create);
  static TimestampRules? _defaultInstance;

  TimestampRules_LessThan whichLessThan() =>
      _TimestampRules_LessThanByTag[$_whichOneof(0)]!;
  void clearLessThan() => clearField($_whichOneof(0));

  TimestampRules_GreaterThan whichGreaterThan() =>
      _TimestampRules_GreaterThanByTag[$_whichOneof(1)]!;
  void clearGreaterThan() => clearField($_whichOneof(1));

  ///  `const` dictates that this field, of the `google.protobuf.Timestamp` type, must exactly match the specified value. If the field value doesn't correspond to the specified timestamp, an error message will be generated.
  ///
  ///  ```proto
  ///  message MyTimestamp {
  ///    // value must equal 2023-05-03T10:00:00Z
  ///    google.protobuf.Timestamp created_at = 1 [(buf.validate.field).timestamp.const = {seconds: 1727998800}];
  ///  }
  ///  ```
  @$pb.TagNumber(2)
  $9.Timestamp get const_2 => $_getN(0);
  @$pb.TagNumber(2)
  set const_2($9.Timestamp v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConst_2() => $_has(0);
  @$pb.TagNumber(2)
  void clearConst_2() => clearField(2);
  @$pb.TagNumber(2)
  $9.Timestamp ensureConst_2() => $_ensure(0);

  ///  requires the duration field value to be less than the specified value (field < value). If the field value doesn't meet the required conditions, an error message is generated.
  ///
  ///  ```proto
  ///  message MyDuration {
  ///    // duration must be less than 'P3D' [duration.lt]
  ///    google.protobuf.Duration value = 1 [(buf.validate.field).duration.lt = { seconds: 259200 }];
  ///  }
  ///  ```
  @$pb.TagNumber(3)
  $9.Timestamp get lt => $_getN(1);
  @$pb.TagNumber(3)
  set lt($9.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLt() => $_has(1);
  @$pb.TagNumber(3)
  void clearLt() => clearField(3);
  @$pb.TagNumber(3)
  $9.Timestamp ensureLt() => $_ensure(1);

  ///  requires the timestamp field value to be less than or equal to the specified value (field <= value). If the field value doesn't meet the required conditions, an error message is generated.
  ///
  ///  ```proto
  ///  message MyTimestamp {
  ///    // timestamp must be less than or equal to '2023-05-14T00:00:00Z' [timestamp.lte]
  ///    google.protobuf.Timestamp value = 1 [(buf.validate.field).timestamp.lte = { seconds: 1678867200 }];
  ///  }
  ///  ```
  @$pb.TagNumber(4)
  $9.Timestamp get lte => $_getN(2);
  @$pb.TagNumber(4)
  set lte($9.Timestamp v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLte() => $_has(2);
  @$pb.TagNumber(4)
  void clearLte() => clearField(4);
  @$pb.TagNumber(4)
  $9.Timestamp ensureLte() => $_ensure(2);

  ///  `gt` requires the timestamp field value to be greater than the specified
  ///  value (exclusive). If the value of `gt` is larger than a specified `lt`
  ///  or `lte`, the range is reversed, and the field value must be outside the
  ///  specified range. If the field value doesn't meet the required conditions,
  ///  an error message is generated.
  ///
  ///  ```proto
  ///  message MyTimestamp {
  ///    // timestamp must be greater than '2023-01-01T00:00:00Z' [timestamp.gt]
  ///    google.protobuf.Timestamp value = 1 [(buf.validate.field).timestamp.gt = { seconds: 1672444800 }];
  ///
  ///    // timestamp must be greater than '2023-01-01T00:00:00Z' and less than '2023-01-02T00:00:00Z' [timestamp.gt_lt]
  ///    google.protobuf.Timestamp another_value = 2 [(buf.validate.field).timestamp = { gt: { seconds: 1672444800 }, lt: { seconds: 1672531200 } }];
  ///
  ///    // timestamp must be greater than '2023-01-02T00:00:00Z' or less than '2023-01-01T00:00:00Z' [timestamp.gt_lt_exclusive]
  ///    google.protobuf.Timestamp other_value = 3 [(buf.validate.field).timestamp = { gt: { seconds: 1672531200 }, lt: { seconds: 1672444800 } }];
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  $9.Timestamp get gt => $_getN(3);
  @$pb.TagNumber(5)
  set gt($9.Timestamp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGt() => $_has(3);
  @$pb.TagNumber(5)
  void clearGt() => clearField(5);
  @$pb.TagNumber(5)
  $9.Timestamp ensureGt() => $_ensure(3);

  ///  `gte` requires the timestamp field value to be greater than or equal to the
  ///  specified value (exclusive). If the value of `gte` is larger than a
  ///  specified `lt` or `lte`, the range is reversed, and the field value
  ///  must be outside the specified range. If the field value doesn't meet
  ///  the required conditions, an error message is generated.
  ///
  ///  ```proto
  ///  message MyTimestamp {
  ///    // timestamp must be greater than or equal to '2023-01-01T00:00:00Z' [timestamp.gte]
  ///    google.protobuf.Timestamp value = 1 [(buf.validate.field).timestamp.gte = { seconds: 1672444800 }];
  ///
  ///    // timestamp must be greater than or equal to '2023-01-01T00:00:00Z' and less than '2023-01-02T00:00:00Z' [timestamp.gte_lt]
  ///    google.protobuf.Timestamp another_value = 2 [(buf.validate.field).timestamp = { gte: { seconds: 1672444800 }, lt: { seconds: 1672531200 } }];
  ///
  ///    // timestamp must be greater than or equal to '2023-01-02T00:00:00Z' or less than '2023-01-01T00:00:00Z' [timestamp.gte_lt_exclusive]
  ///    google.protobuf.Timestamp other_value = 3 [(buf.validate.field).timestamp = { gte: { seconds: 1672531200 }, lt: { seconds: 1672444800 } }];
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  $9.Timestamp get gte => $_getN(4);
  @$pb.TagNumber(6)
  set gte($9.Timestamp v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGte() => $_has(4);
  @$pb.TagNumber(6)
  void clearGte() => clearField(6);
  @$pb.TagNumber(6)
  $9.Timestamp ensureGte() => $_ensure(4);

  ///  `lt_now` specifies that this field, of the `google.protobuf.Timestamp` type, must be less than the current time. `lt_now` can only be used with the `within` rule.
  ///
  ///  ```proto
  ///  message MyTimestamp {
  ///   // value must be less than now
  ///    google.protobuf.Timestamp created_at = 1 [(buf.validate.field).timestamp.lt_now = true];
  ///  }
  ///  ```
  @$pb.TagNumber(7)
  $core.bool get ltNow => $_getBF(5);
  @$pb.TagNumber(7)
  set ltNow($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLtNow() => $_has(5);
  @$pb.TagNumber(7)
  void clearLtNow() => clearField(7);

  ///  `gt_now` specifies that this field, of the `google.protobuf.Timestamp` type, must be greater than the current time. `gt_now` can only be used with the `within` rule.
  ///
  ///  ```proto
  ///  message MyTimestamp {
  ///    // value must be greater than now
  ///    google.protobuf.Timestamp created_at = 1 [(buf.validate.field).timestamp.gt_now = true];
  ///  }
  ///  ```
  @$pb.TagNumber(8)
  $core.bool get gtNow => $_getBF(6);
  @$pb.TagNumber(8)
  set gtNow($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGtNow() => $_has(6);
  @$pb.TagNumber(8)
  void clearGtNow() => clearField(8);

  ///  `within` specifies that this field, of the `google.protobuf.Timestamp` type, must be within the specified duration of the current time. If the field value isn't within the duration, an error message is generated.
  ///
  ///  ```proto
  ///  message MyTimestamp {
  ///    // value must be within 1 hour of now
  ///    google.protobuf.Timestamp created_at = 1 [(buf.validate.field).timestamp.within = {seconds: 3600}];
  ///  }
  ///  ```
  @$pb.TagNumber(9)
  $8.Duration get within => $_getN(7);
  @$pb.TagNumber(9)
  set within($8.Duration v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWithin() => $_has(7);
  @$pb.TagNumber(9)
  void clearWithin() => clearField(9);
  @$pb.TagNumber(9)
  $8.Duration ensureWithin() => $_ensure(7);

  @$pb.TagNumber(10)
  $core.List<$9.Timestamp> get example => $_getList(8);
}

/// `Violations` is a collection of `Violation` messages. This message type is returned by
/// protovalidate when a proto message fails to meet the requirements set by the `Constraint` validation rules.
/// Each individual violation is represented by a `Violation` message.
class Violations extends $pb.GeneratedMessage {
  factory Violations({
    $core.Iterable<Violation>? violations,
  }) {
    final $result = create();
    if (violations != null) {
      $result.violations.addAll(violations);
    }
    return $result;
  }
  Violations._() : super();
  factory Violations.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Violations.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Violations',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..pc<Violation>(1, _omitFieldNames ? '' : 'violations', $pb.PbFieldType.PM,
        subBuilder: Violation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Violations clone() => Violations()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Violations copyWith(void Function(Violations) updates) =>
      super.copyWith((message) => updates(message as Violations)) as Violations;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Violations create() => Violations._();
  Violations createEmptyInstance() => create();
  static $pb.PbList<Violations> createRepeated() => $pb.PbList<Violations>();
  @$core.pragma('dart2js:noInline')
  static Violations getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Violations>(create);
  static Violations? _defaultInstance;

  /// `violations` is a repeated field that contains all the `Violation` messages corresponding to the violations detected.
  @$pb.TagNumber(1)
  $core.List<Violation> get violations => $_getList(0);
}

///  `Violation` represents a single instance where a validation rule, expressed
///  as a `Constraint`, was not met. It provides information about the field that
///  caused the violation, the specific constraint that wasn't fulfilled, and a
///  human-readable error message.
///
///  ```json
///  {
///    "fieldPath": "bar",
///    "constraintId": "foo.bar",
///    "message": "bar must be greater than 0"
///  }
///  ```
class Violation extends $pb.GeneratedMessage {
  factory Violation({
    $core.String? constraintId,
    $core.String? message,
    $core.bool? forKey,
    FieldPath? field_5,
    FieldPath? rule,
  }) {
    final $result = create();
    if (constraintId != null) {
      $result.constraintId = constraintId;
    }
    if (message != null) {
      $result.message = message;
    }
    if (forKey != null) {
      $result.forKey = forKey;
    }
    if (field_5 != null) {
      $result.field_5 = field_5;
    }
    if (rule != null) {
      $result.rule = rule;
    }
    return $result;
  }
  Violation._() : super();
  factory Violation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Violation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Violation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'constraintId')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOB(4, _omitFieldNames ? '' : 'forKey')
    ..aOM<FieldPath>(5, _omitFieldNames ? '' : 'field',
        subBuilder: FieldPath.create)
    ..aOM<FieldPath>(6, _omitFieldNames ? '' : 'rule',
        subBuilder: FieldPath.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Violation clone() => Violation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Violation copyWith(void Function(Violation) updates) =>
      super.copyWith((message) => updates(message as Violation)) as Violation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Violation create() => Violation._();
  Violation createEmptyInstance() => create();
  static $pb.PbList<Violation> createRepeated() => $pb.PbList<Violation>();
  @$core.pragma('dart2js:noInline')
  static Violation getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Violation>(create);
  static Violation? _defaultInstance;

  /// `constraint_id` is the unique identifier of the `Constraint` that was not fulfilled.
  /// This is the same `id` that was specified in the `Constraint` message, allowing easy tracing of which rule was violated.
  @$pb.TagNumber(2)
  $core.String get constraintId => $_getSZ(0);
  @$pb.TagNumber(2)
  set constraintId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConstraintId() => $_has(0);
  @$pb.TagNumber(2)
  void clearConstraintId() => clearField(2);

  /// `message` is a human-readable error message that describes the nature of the violation.
  /// This can be the default error message from the violated `Constraint`, or it can be a custom message that gives more context about the violation.
  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  /// `for_key` indicates whether the violation was caused by a map key, rather than a value.
  @$pb.TagNumber(4)
  $core.bool get forKey => $_getBF(2);
  @$pb.TagNumber(4)
  set forKey($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasForKey() => $_has(2);
  @$pb.TagNumber(4)
  void clearForKey() => clearField(4);

  ///  `field` is a machine-readable path to the field that failed validation.
  ///  This could be a nested field, in which case the path will include all the parent fields leading to the actual field that caused the violation.
  ///
  ///  For example, consider the following message:
  ///
  ///  ```proto
  ///  message Message {
  ///    bool a = 1 [(buf.validate.field).required = true];
  ///  }
  ///  ```
  ///
  ///  It could produce the following violation:
  ///
  ///  ```textproto
  ///  violation {
  ///    field { element { field_number: 1, field_name: "a", field_type: 8 } }
  ///    ...
  ///  }
  ///  ```
  @$pb.TagNumber(5)
  FieldPath get field_5 => $_getN(3);
  @$pb.TagNumber(5)
  set field_5(FieldPath v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasField_5() => $_has(3);
  @$pb.TagNumber(5)
  void clearField_5() => clearField(5);
  @$pb.TagNumber(5)
  FieldPath ensureField_5() => $_ensure(3);

  ///  `rule` is a machine-readable path that points to the specific constraint rule that failed validation.
  ///  This will be a nested field starting from the FieldConstraints of the field that failed validation.
  ///  For custom constraints, this will provide the path of the constraint, e.g. `cel[0]`.
  ///
  ///  For example, consider the following message:
  ///
  ///  ```proto
  ///  message Message {
  ///    bool a = 1 [(buf.validate.field).required = true];
  ///    bool b = 2 [(buf.validate.field).cel = {
  ///      id: "custom_constraint",
  ///      expression: "!this ? 'b must be true': ''"
  ///    }]
  ///  }
  ///  ```
  ///
  ///  It could produce the following violations:
  ///
  ///  ```textproto
  ///  violation {
  ///    rule { element { field_number: 25, field_name: "required", field_type: 8 } }
  ///    ...
  ///  }
  ///  violation {
  ///    rule { element { field_number: 23, field_name: "cel", field_type: 11, index: 0 } }
  ///    ...
  ///  }
  ///  ```
  @$pb.TagNumber(6)
  FieldPath get rule => $_getN(4);
  @$pb.TagNumber(6)
  set rule(FieldPath v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRule() => $_has(4);
  @$pb.TagNumber(6)
  void clearRule() => clearField(6);
  @$pb.TagNumber(6)
  FieldPath ensureRule() => $_ensure(4);
}

///  `FieldPath` provides a path to a nested protobuf field.
///
///  This message provides enough information to render a dotted field path even without protobuf descriptors.
///  It also provides enough information to resolve a nested field through unknown wire data.
class FieldPath extends $pb.GeneratedMessage {
  factory FieldPath({
    $core.Iterable<FieldPathElement>? elements,
  }) {
    final $result = create();
    if (elements != null) {
      $result.elements.addAll(elements);
    }
    return $result;
  }
  FieldPath._() : super();
  factory FieldPath.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FieldPath.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FieldPath',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..pc<FieldPathElement>(
        1, _omitFieldNames ? '' : 'elements', $pb.PbFieldType.PM,
        subBuilder: FieldPathElement.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FieldPath clone() => FieldPath()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FieldPath copyWith(void Function(FieldPath) updates) =>
      super.copyWith((message) => updates(message as FieldPath)) as FieldPath;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldPath create() => FieldPath._();
  FieldPath createEmptyInstance() => create();
  static $pb.PbList<FieldPath> createRepeated() => $pb.PbList<FieldPath>();
  @$core.pragma('dart2js:noInline')
  static FieldPath getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldPath>(create);
  static FieldPath? _defaultInstance;

  /// `elements` contains each element of the path, starting from the root and recursing downward.
  @$pb.TagNumber(1)
  $core.List<FieldPathElement> get elements => $_getList(0);
}

enum FieldPathElement_Subscript {
  index_,
  boolKey,
  intKey,
  uintKey,
  stringKey,
  notSet
}

///  `FieldPathElement` provides enough information to nest through a single protobuf field.
///
///  If the selected field is a map or repeated field, the `subscript` value selects a specific element from it.
///  A path that refers to a value nested under a map key or repeated field index will have a `subscript` value.
///  The `field_type` field allows unambiguous resolution of a field even if descriptors are not available.
class FieldPathElement extends $pb.GeneratedMessage {
  factory FieldPathElement({
    $core.int? fieldNumber,
    $core.String? fieldName,
    $10.FieldDescriptorProto_Type? fieldType,
    $10.FieldDescriptorProto_Type? keyType,
    $10.FieldDescriptorProto_Type? valueType,
    $fixnum.Int64? index,
    $core.bool? boolKey,
    $fixnum.Int64? intKey,
    $fixnum.Int64? uintKey,
    $core.String? stringKey,
  }) {
    final $result = create();
    if (fieldNumber != null) {
      $result.fieldNumber = fieldNumber;
    }
    if (fieldName != null) {
      $result.fieldName = fieldName;
    }
    if (fieldType != null) {
      $result.fieldType = fieldType;
    }
    if (keyType != null) {
      $result.keyType = keyType;
    }
    if (valueType != null) {
      $result.valueType = valueType;
    }
    if (index != null) {
      $result.index = index;
    }
    if (boolKey != null) {
      $result.boolKey = boolKey;
    }
    if (intKey != null) {
      $result.intKey = intKey;
    }
    if (uintKey != null) {
      $result.uintKey = uintKey;
    }
    if (stringKey != null) {
      $result.stringKey = stringKey;
    }
    return $result;
  }
  FieldPathElement._() : super();
  factory FieldPathElement.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FieldPathElement.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FieldPathElement_Subscript>
      _FieldPathElement_SubscriptByTag = {
    6: FieldPathElement_Subscript.index_,
    7: FieldPathElement_Subscript.boolKey,
    8: FieldPathElement_Subscript.intKey,
    9: FieldPathElement_Subscript.uintKey,
    10: FieldPathElement_Subscript.stringKey,
    0: FieldPathElement_Subscript.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FieldPathElement',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'buf.validate'),
      createEmptyInstance: create)
    ..oo(0, [6, 7, 8, 9, 10])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fieldNumber', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'fieldName')
    ..e<$10.FieldDescriptorProto_Type>(
        3, _omitFieldNames ? '' : 'fieldType', $pb.PbFieldType.OE,
        defaultOrMaker: $10.FieldDescriptorProto_Type.TYPE_DOUBLE,
        valueOf: $10.FieldDescriptorProto_Type.valueOf,
        enumValues: $10.FieldDescriptorProto_Type.values)
    ..e<$10.FieldDescriptorProto_Type>(
        4, _omitFieldNames ? '' : 'keyType', $pb.PbFieldType.OE,
        defaultOrMaker: $10.FieldDescriptorProto_Type.TYPE_DOUBLE,
        valueOf: $10.FieldDescriptorProto_Type.valueOf,
        enumValues: $10.FieldDescriptorProto_Type.values)
    ..e<$10.FieldDescriptorProto_Type>(
        5, _omitFieldNames ? '' : 'valueType', $pb.PbFieldType.OE,
        defaultOrMaker: $10.FieldDescriptorProto_Type.TYPE_DOUBLE,
        valueOf: $10.FieldDescriptorProto_Type.valueOf,
        enumValues: $10.FieldDescriptorProto_Type.values)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(7, _omitFieldNames ? '' : 'boolKey')
    ..aInt64(8, _omitFieldNames ? '' : 'intKey')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'uintKey', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(10, _omitFieldNames ? '' : 'stringKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FieldPathElement clone() => FieldPathElement()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FieldPathElement copyWith(void Function(FieldPathElement) updates) =>
      super.copyWith((message) => updates(message as FieldPathElement))
          as FieldPathElement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldPathElement create() => FieldPathElement._();
  FieldPathElement createEmptyInstance() => create();
  static $pb.PbList<FieldPathElement> createRepeated() =>
      $pb.PbList<FieldPathElement>();
  @$core.pragma('dart2js:noInline')
  static FieldPathElement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FieldPathElement>(create);
  static FieldPathElement? _defaultInstance;

  FieldPathElement_Subscript whichSubscript() =>
      _FieldPathElement_SubscriptByTag[$_whichOneof(0)]!;
  void clearSubscript() => clearField($_whichOneof(0));

  /// `field_number` is the field number this path element refers to.
  @$pb.TagNumber(1)
  $core.int get fieldNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set fieldNumber($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFieldNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldNumber() => clearField(1);

  /// `field_name` contains the field name this path element refers to.
  /// This can be used to display a human-readable path even if the field number is unknown.
  @$pb.TagNumber(2)
  $core.String get fieldName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fieldName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFieldName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldName() => clearField(2);

  ///  `field_type` specifies the type of this field. When using reflection, this value is not needed.
  ///
  ///  This value is provided to make it possible to traverse unknown fields through wire data.
  ///  When traversing wire data, be mindful of both packed[1] and delimited[2] encoding schemes.
  ///
  ///  [1]: https://protobuf.dev/programming-guides/encoding/#packed
  ///  [2]: https://protobuf.dev/programming-guides/encoding/#groups
  ///
  ///  N.B.: Although groups are deprecated, the corresponding delimited encoding scheme is not, and
  ///  can be explicitly used in Protocol Buffers 2023 Edition.
  @$pb.TagNumber(3)
  $10.FieldDescriptorProto_Type get fieldType => $_getN(2);
  @$pb.TagNumber(3)
  set fieldType($10.FieldDescriptorProto_Type v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFieldType() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldType() => clearField(3);

  /// `key_type` specifies the map key type of this field. This value is useful when traversing
  /// unknown fields through wire data: specifically, it allows handling the differences between
  /// different integer encodings.
  @$pb.TagNumber(4)
  $10.FieldDescriptorProto_Type get keyType => $_getN(3);
  @$pb.TagNumber(4)
  set keyType($10.FieldDescriptorProto_Type v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasKeyType() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeyType() => clearField(4);

  /// `value_type` specifies map value type of this field. This is useful if you want to display a
  /// value inside unknown fields through wire data.
  @$pb.TagNumber(5)
  $10.FieldDescriptorProto_Type get valueType => $_getN(4);
  @$pb.TagNumber(5)
  set valueType($10.FieldDescriptorProto_Type v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasValueType() => $_has(4);
  @$pb.TagNumber(5)
  void clearValueType() => clearField(5);

  /// `index` specifies a 0-based index into a repeated field.
  @$pb.TagNumber(6)
  $fixnum.Int64 get index => $_getI64(5);
  @$pb.TagNumber(6)
  set index($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIndex() => $_has(5);
  @$pb.TagNumber(6)
  void clearIndex() => clearField(6);

  /// `bool_key` specifies a map key of type bool.
  @$pb.TagNumber(7)
  $core.bool get boolKey => $_getBF(6);
  @$pb.TagNumber(7)
  set boolKey($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBoolKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoolKey() => clearField(7);

  /// `int_key` specifies a map key of type int32, int64, sint32, sint64, sfixed32 or sfixed64.
  @$pb.TagNumber(8)
  $fixnum.Int64 get intKey => $_getI64(7);
  @$pb.TagNumber(8)
  set intKey($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIntKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearIntKey() => clearField(8);

  /// `uint_key` specifies a map key of type uint32, uint64, fixed32 or fixed64.
  @$pb.TagNumber(9)
  $fixnum.Int64 get uintKey => $_getI64(8);
  @$pb.TagNumber(9)
  set uintKey($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasUintKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearUintKey() => clearField(9);

  /// `string_key` specifies a map key of type string.
  @$pb.TagNumber(10)
  $core.String get stringKey => $_getSZ(9);
  @$pb.TagNumber(10)
  set stringKey($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasStringKey() => $_has(9);
  @$pb.TagNumber(10)
  void clearStringKey() => clearField(10);
}

class Validate {
  static final message = $pb.Extension<MessageConstraints>(
      _omitMessageNames ? '' : 'google.protobuf.MessageOptions',
      _omitFieldNames ? '' : 'message',
      1159,
      $pb.PbFieldType.OM,
      defaultOrMaker: MessageConstraints.getDefault,
      subBuilder: MessageConstraints.create);
  static final oneof = $pb.Extension<OneofConstraints>(
      _omitMessageNames ? '' : 'google.protobuf.OneofOptions',
      _omitFieldNames ? '' : 'oneof',
      1159,
      $pb.PbFieldType.OM,
      defaultOrMaker: OneofConstraints.getDefault,
      subBuilder: OneofConstraints.create);
  static final field_1159 = $pb.Extension<FieldConstraints>(
      _omitMessageNames ? '' : 'google.protobuf.FieldOptions',
      _omitFieldNames ? '' : 'field_1159',
      1159,
      $pb.PbFieldType.OM,
      defaultOrMaker: FieldConstraints.getDefault,
      subBuilder: FieldConstraints.create);
  static final predefined = $pb.Extension<PredefinedConstraints>(
      _omitMessageNames ? '' : 'google.protobuf.FieldOptions',
      _omitFieldNames ? '' : 'predefined',
      1160,
      $pb.PbFieldType.OM,
      defaultOrMaker: PredefinedConstraints.getDefault,
      subBuilder: PredefinedConstraints.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(message);
    registry.add(oneof);
    registry.add(field_1159);
    registry.add(predefined);
  }
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

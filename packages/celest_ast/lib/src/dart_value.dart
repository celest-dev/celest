import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:code_builder/code_builder.dart';

part 'dart_value.g.dart';

sealed class DartValue {
  TypeReference get staticType;
  Object? toDart();
  Object? toJson() => null;
}

abstract class DartString
    implements Built<DartString, DartStringBuilder>, DartValue {
  factory DartString(String value) => _$DartString._(
        value: value,
        staticType: TypeReference(
          (t) => t
            ..url = 'dart:core'
            ..symbol = 'String',
        ),
      );

  factory DartString.build([void Function(DartStringBuilder) updates]) =
      _$DartString;

  DartString._();

  String get value;

  @override
  Object? toDart() => value;

  @override
  String toJson() => value;

  static Serializer<DartString> get serializer => _$dartStringSerializer;
}

sealed class DartNum implements DartValue {}

abstract class DartInt
    implements Built<DartInt, DartIntBuilder>, DartValue, DartNum {
  factory DartInt(int value) => _$DartInt._(
        value: value,
        staticType: TypeReference(
          (t) => t
            ..url = 'dart:core'
            ..symbol = 'int',
        ),
      );
  factory DartInt.build([void Function(DartIntBuilder) updates]) = _$DartInt;
  DartInt._();

  int get value;

  @override
  Object? toDart() => value;

  @override
  int toJson() => value;

  static Serializer<DartInt> get serializer => _$dartIntSerializer;
}

abstract class DartDouble
    implements Built<DartDouble, DartDoubleBuilder>, DartValue, DartNum {
  factory DartDouble(double value) => _$DartDouble._(
        value: value,
        staticType: TypeReference(
          (t) => t
            ..url = 'dart:core'
            ..symbol = 'double',
        ),
      );

  factory DartDouble.build([void Function(DartDoubleBuilder) updates]) =
      _$DartDouble;
  DartDouble._();

  double get value;

  @override
  double toDart() => value;

  @override
  double toJson() => value;

  static Serializer<DartDouble> get serializer => _$dartDoubleSerializer;
}

abstract class DartBool implements Built<DartBool, DartBoolBuilder>, DartValue {
  factory DartBool(bool value) => _$DartBool._(
        value: value,
        staticType: TypeReference(
          (t) => t
            ..url = 'dart:core'
            ..symbol = 'bool',
        ),
      );

  factory DartBool.build([void Function(DartBoolBuilder) updates]) = _$DartBool;
  DartBool._();

  bool get value;

  @override
  bool toDart() => value;

  @override
  bool toJson() => value;

  static Serializer<DartBool> get serializer => _$dartBoolSerializer;
}

abstract class DartList implements Built<DartList, DartListBuilder>, DartValue {
  factory DartList(
    List<DartValue> value, {
    required TypeReference staticType,
  }) =>
      _$DartList._(value: value.toBuiltList(), staticType: staticType);
  factory DartList.build([void Function(DartListBuilder) updates]) = _$DartList;
  DartList._();

  BuiltList<DartValue> get value;

  @override
  List<Object?> toDart() => value.map((e) => e.toDart()).toList();

  @override
  List<Object?> toJson() => value.map((e) => e.toJson()).toList();

  static Serializer<DartList> get serializer => _$dartListSerializer;
}

abstract class DartMap implements Built<DartMap, DartMapBuilder>, DartValue {
  factory DartMap(
    Map<DartValue, DartValue> value, {
    required TypeReference staticType,
  }) =>
      _$DartMap._(
        value: value.build(),
        staticType: staticType,
      );

  factory DartMap.build([void Function(DartMapBuilder) updates]) = _$DartMap;
  DartMap._();

  BuiltMap<DartValue, DartValue> get value;

  @override
  Map<Object?, Object?> toDart() =>
      value.map((key, value) => MapEntry(key.toDart(), value.toDart())).toMap();

  @override
  Map<Object?, Object?> toJson() =>
      value.map((key, value) => MapEntry(key.toJson(), value.toJson())).toMap();

  static Serializer<DartMap> get serializer => _$dartMapSerializer;
}

abstract class DartNull implements Built<DartNull, DartNullBuilder>, DartValue {
  factory DartNull() => _$DartNull._(
        staticType: TypeReference((t) => t
          ..url = 'dart:core'
          ..symbol = 'Null'),
      );

  factory DartNull.build([void Function(DartNullBuilder) updates]) = _$DartNull;
  DartNull._();

  @override
  Object? toDart() => null;

  @override
  Object? toJson() => null;

  static Serializer<DartNull> get serializer => _$dartNullSerializer;
}

abstract class DartRecord
    implements Built<DartRecord, DartRecordBuilder>, DartValue {
  factory DartRecord({
    List<DartValue> positionalFields = const [],
    Map<String, DartValue> namedFields = const {},
    required TypeReference staticType,
  }) {
    return _$DartRecord._(
      positionalFields: positionalFields.build(),
      namedFields: namedFields.build(),
      staticType: staticType,
    );
  }

  factory DartRecord.build([void Function(DartRecordBuilder) updates]) =
      _$DartRecord;
  DartRecord._();

  BuiltList<DartValue> get positionalFields;
  BuiltMap<String, DartValue> get namedFields;

  @override
  Never toDart() => throw UnimplementedError();

  @override
  Map<String, Object?> toJson() => {
        for (final (index, value) in positionalFields.indexed)
          '\$$index': value.toJson(),
        for (final MapEntry(:key, :value) in namedFields.entries)
          key: value.toJson(),
      };

  static Serializer<DartRecord> get serializer => _$dartRecordSerializer;
}

abstract class DartEnum implements Built<DartEnum, DartEnumBuilder>, DartValue {
  factory DartEnum(
    TypeReference enumRef,
    String value,
  ) =>
      _$DartEnum._(
        enumRef: enumRef,
        value: value,
        staticType: enumRef,
      );

  factory DartEnum.build([void Function(DartEnumBuilder) updates]) = _$DartEnum;
  DartEnum._();

  TypeReference get enumRef;
  String get value;

  @override
  Never toDart() => throw UnimplementedError();

  @override
  String toJson() => value;

  static Serializer<DartEnum> get serializer => _$dartEnumSerializer;
}

abstract class DartInstance
    implements Built<DartInstance, DartInstanceBuilder>, DartValue {
  factory DartInstance({
    required TypeReference classRef,
    String constructor = '',
    Map<String, DartValue> positionalArguments = const {},
    Map<String, DartValue> namedArguments = const {},
    TypeReference? staticType,
  }) {
    return _$DartInstance._(
      classRef: classRef,
      constructor: constructor,
      positionalArguments: positionalArguments.build(),
      namedArguments: namedArguments.build(),
      staticType: staticType ?? classRef,
    );
  }

  factory DartInstance.build([void Function(DartInstanceBuilder) updates]) =
      _$DartInstance;
  DartInstance._();

  TypeReference get classRef;
  String get constructor;
  BuiltMap<String, DartValue> get positionalArguments;
  BuiltMap<String, DartValue> get namedArguments;

  @override
  Never toDart() => throw UnimplementedError();

  @override
  Map<String, Object?> toJson() => {
        for (final MapEntry(:key, :value) in positionalArguments.entries)
          key: value.toJson(),
        for (final MapEntry(:key, :value) in namedArguments.entries)
          key: value.toJson(),
      };

  static Serializer<DartInstance> get serializer => _$dartInstanceSerializer;
}

abstract class DartTypeLiteral
    implements Built<DartTypeLiteral, DartTypeLiteralBuilder>, DartValue {
  factory DartTypeLiteral(TypeReference type) =>
      _$DartTypeLiteral._(type: type, staticType: type);

  factory DartTypeLiteral.build(
      [void Function(DartTypeLiteralBuilder) updates]) = _$DartTypeLiteral;
  DartTypeLiteral._();

  TypeReference get type;

  @override
  Never toDart() => throw UnimplementedError();

  @override
  Never toJson() => throw UnimplementedError();

  static Serializer<DartTypeLiteral> get serializer =>
      _$dartTypeLiteralSerializer;
}

abstract class DartSymbolLiteral
    implements Built<DartSymbolLiteral, DartSymbolLiteralBuilder>, DartValue {
  factory DartSymbolLiteral(String value) => _$DartSymbolLiteral._(
        value: value,
        staticType: TypeReference(
          (t) => t
            ..url = 'dart:core'
            ..symbol = 'Symbol',
        ),
      );

  factory DartSymbolLiteral.build(
      [void Function(DartSymbolLiteralBuilder) updates]) = _$DartSymbolLiteral;
  DartSymbolLiteral._();

  String get value;

  @override
  Never toDart() => throw UnimplementedError();

  @override
  String toJson() => value;

  static Serializer<DartSymbolLiteral> get serializer =>
      _$dartSymbolLiteralSerializer;
}

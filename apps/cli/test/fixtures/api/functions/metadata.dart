/// Tests that metadata associated with functions and parameters are correctly
/// parsed and transferred to the generated client.
library;

import 'package:celest_backend/models/metadata.dart';

/// A function that has doc comments.
///
/// This is a doc comment.
///
/// # This is an H1
/// ## This is an H2
/// ### This is an H3
/// * This is a list item
///
/// This is an example:
///
/// ```dart
/// void hasDocComments() {}
/// ```
// This should not be copied over.
void hasDocComments() {}

@deprecated
void hasDeprecatedAnnotation() {}

@Deprecated('Do not use this function.')
void hasConstructedDeprecatedAnnotation() {}

@MyAnnotation.create('positional', named: 'named')
void hasNamedConstructedAnnotation() {}

@Literals(
  string: 'string',
  intValue: 1,
  doubleValue: 1.0,
  boolValue: true,
  list: ['list'],
  map: {'map': 'map'},
  enumValue: LiteralEnum.a,
  recordValue: (a: 'a', b: 'b', c: 'c'),
)
void hasLiteralsAnnotation(
  @Literals(
    string: 'string',
    intValue: 1,
    doubleValue: 1.0,
    boolValue: true,
    list: ['list'],
    map: {'map': 'map'},
    enumValue: LiteralEnum.a,
    recordValue: (a: 'a', b: 'b', c: 'c'),
  )
  String value, {
  @Literals(
    string: 'string',
    intValue: 1,
    doubleValue: 1.0,
    boolValue: true,
    list: ['list'],
    map: {'map': 'map'},
    enumValue: LiteralEnum.a,
    recordValue: (a: 'a', b: 'b', c: 'c'),
  )
  required String named,
}) {}

@exportable
void hasExportableAnnotation(
  @exportable String value, {
  @exportable String named = 'named',
}) {}

@Exportable()
void hasExportableConstructedAnnotation(
  @Exportable() String value, {
  @Exportable() String named = 'named',
}) {}

@notExportable
void hasNotExportableAnnotation(
  @notExportable String value, {
  @notExportable String named = 'named',
}) {}

// -- Default values --

void positionalDefaultValues([
  String value = 'value',
  int intValue = 1,
  double doubleValue = 1.0,
  bool boolValue = true,
  List<String> list = const ['list'],
  Map<String, String> map = const {'map': 'map'},
  Exportable exportable = const Exportable(),
  Serializable serializable = const Serializable.forType('String'),
  LiteralEnum enumValue = LiteralEnum.a,
  ({String a, String b, String c}) recordValue = (a: 'a', b: 'b', c: 'c'),
]) {}

void nullablePositionalDefaultValues([
  String? value = 'value',
  int? intValue = 1,
  double? doubleValue = 1.0,
  bool? boolValue = true,
  List<String>? list = const ['list'],
  Map<String, String>? map = const {'map': 'map'},
  Exportable? exportable = const Exportable(),
  Serializable? serializable = const Serializable.forType('String'),
  LiteralEnum? enumValue = LiteralEnum.a,
  ({String a, String b, String c})? recordValue = (a: 'a', b: 'b', c: 'c'),
]) {}

void namedDefaultValues({
  String value = 'value',
  int intValue = 1,
  double doubleValue = 1.0,
  bool boolValue = true,
  List<String> list = const ['list'],
  Map<String, String> map = const {'map': 'map'},
  Exportable exportable = const Exportable(),
  Serializable serializable = const Serializable.forType('String'),
  LiteralEnum enumValue = LiteralEnum.a,
  ({String a, String b, String c}) recordValue = (a: 'a', b: 'b', c: 'c'),
}) {}

void nullableNamedDefaultValues({
  String? value = 'value',
  int? intValue = 1,
  double? doubleValue = 1.0,
  bool? boolValue = true,
  List<String>? list = const ['list'],
  Map<String, String>? map = const {'map': 'map'},
  Exportable? exportable = const Exportable(),
  Serializable? serializable = const Serializable.forType('String'),
  LiteralEnum? enumValue = LiteralEnum.a,
  ({String a, String b, String c})? recordValue = (a: 'a', b: 'b', c: 'c'),
}) {}

// Tests that default values of function parameters can refer
// to top-level variables and static field variables.

const defaultInt = 42;
const defaultDouble = 42.0;
const defaultBool = true;
const defaultString = 'default';
const defaultList = ['default'];
const defaultMap = {'default': 'default'};
const defaultEnum = LiteralEnum.a;
const defaultRecord = (a: 'a', b: 'b', c: 'c');
const defaultExportable = Exportable.instance;
const defaultSerializable = Serializable.string;

void positionalDefaultValueVars([
  int value = defaultInt,
  double doubleValue = defaultDouble,
  bool boolValue = defaultBool,
  String stringValue = defaultString,
  List<String> listValue = defaultList,
  Map<String, String> mapValue = defaultMap,
  LiteralEnum enumValue = defaultEnum,
  ({String a, String b, String c}) recordValue = defaultRecord,
  Exportable exportable = defaultExportable,
  Serializable serializable = defaultSerializable,
]) {}

void nullablePositionalDefaultValueVars([
  int? value = defaultInt,
  double? doubleValue = defaultDouble,
  bool? boolValue = defaultBool,
  String? stringValue = defaultString,
  List<String>? listValue = defaultList,
  Map<String, String>? mapValue = defaultMap,
  LiteralEnum? enumValue = defaultEnum,
  ({String a, String b, String c})? recordValue = defaultRecord,
  Exportable? exportable = defaultExportable,
  Serializable? serializable = defaultSerializable,
]) {}

void namedDefaultValueVars({
  int value = defaultInt,
  double doubleValue = defaultDouble,
  bool boolValue = defaultBool,
  String stringValue = defaultString,
  List<String> listValue = defaultList,
  Map<String, String> mapValue = defaultMap,
  LiteralEnum enumValue = defaultEnum,
  ({String a, String b, String c}) recordValue = defaultRecord,
  Exportable exportable = defaultExportable,
  Serializable serializable = defaultSerializable,
}) {}

void nullableNamedDefaultValueVars({
  int? value = defaultInt,
  double? doubleValue = defaultDouble,
  bool? boolValue = defaultBool,
  String? stringValue = defaultString,
  List<String>? listValue = defaultList,
  Map<String, String>? mapValue = defaultMap,
  LiteralEnum? enumValue = defaultEnum,
  ({String a, String b, String c})? recordValue = defaultRecord,
  Exportable? exportable = defaultExportable,
  Serializable? serializable = defaultSerializable,
}) {}

// Tests that default values which are private variable references
// are copied by value and not by trying to reference the private
// variable.
//
// Since function signatures would become invalid if we did not
// copy over the default value, this is a way to ensure that client
// signatures look the same as the server signatures when variables
// are public, but still function correctly when variables are
// private.

const _defaultInt = 42;
const _defaultDouble = 42.0;
const _defaultBool = true;
const _defaultString = 'default';
const _defaultList = ['default'];
const _defaultMap = {'default': 'default'};
const _defaultEnum = LiteralEnum.a;
const _defaultRecord = (a: 'a', b: 'b', c: 'c');
const _defaultExportable = Exportable.instance;
const _defaultSerializable = Serializable.string;

void positionalDefaultValueVarsPrivate([
  int value = _defaultInt,
  double doubleValue = _defaultDouble,
  bool boolValue = _defaultBool,
  String stringValue = _defaultString,
  List<String> listValue = _defaultList,
  Map<String, String> mapValue = _defaultMap,
  LiteralEnum enumValue = _defaultEnum,
  ({String a, String b, String c}) recordValue = _defaultRecord,
  Exportable exportable = _defaultExportable,
  Serializable serializable = _defaultSerializable,
]) {}

void nullablePositionalDefaultValueVarsPrivate([
  int? value = _defaultInt,
  double? doubleValue = _defaultDouble,
  bool? boolValue = _defaultBool,
  String? stringValue = _defaultString,
  List<String>? listValue = _defaultList,
  Map<String, String>? mapValue = _defaultMap,
  LiteralEnum? enumValue = _defaultEnum,
  ({String a, String b, String c})? recordValue = _defaultRecord,
  Exportable? exportable = _defaultExportable,
  Serializable? serializable = _defaultSerializable,
]) {}

void namedDefaultValueVarsPrivate({
  int value = _defaultInt,
  double doubleValue = _defaultDouble,
  bool boolValue = _defaultBool,
  String stringValue = _defaultString,
  List<String> listValue = _defaultList,
  Map<String, String> mapValue = _defaultMap,
  LiteralEnum enumValue = _defaultEnum,
  ({String a, String b, String c}) recordValue = _defaultRecord,
  Exportable exportable = _defaultExportable,
  Serializable serializable = _defaultSerializable,
}) {}

void nullableNamedDefaultValueVarsPrivate({
  int? value = _defaultInt,
  double? doubleValue = _defaultDouble,
  bool? boolValue = _defaultBool,
  String? stringValue = _defaultString,
  List<String>? listValue = _defaultList,
  Map<String, String>? mapValue = _defaultMap,
  LiteralEnum? enumValue = _defaultEnum,
  ({String a, String b, String c})? recordValue = _defaultRecord,
  Exportable? exportable = _defaultExportable,
  Serializable? serializable = _defaultSerializable,
}) {}

/// Tests that extension types are correctly handled by the analyzer.
library;

import 'dart:async';

import 'package:celest/celest.dart';
import 'package:celest_backend/models/extension_types.dart';

// Basic extension types
@cloud
StringX string(StringX s) => s;
@cloud
FutureOr<StringX> asyncOrString(StringX s) => s;
@cloud
Future<StringX> asyncString(StringX s) async => s;

// Extension type over primitive
@cloud
StringXImpl stringImpl(StringXImpl s) => s;
@cloud
StringXToFromJson stringToFromJson(StringXToFromJson s) => s;
@cloud
StringXToJson stringToJson(StringXToJson s) => s;
@cloud
StringXToJsonImpl stringToJsonImpl(StringXToJsonImpl s) => s;
@cloud
StringXFromJson stringFromJson(StringXFromJson s) => s;
@cloud
StringXFromJsonImpl stringFromJsonImpl(StringXFromJsonImpl s) => s;
@cloud
StringXFromJsonStatic stringFromJsonStatic(StringXFromJsonStatic s) => s;
@cloud
StringXPrivateField stringPrivateField(StringXPrivateField s) => s;
@cloud
StringXPrivateFieldImpl stringPrivateFieldImpl(StringXPrivateFieldImpl s) => s;
@cloud
StringXPrivateCtor stringPrivateCtor(StringXPrivateCtor s) => s;
@cloud
StringXPrivateCtorImpl stringPrivateCtorImpl(StringXPrivateCtorImpl s) => s;

// Extension type over custom model
@cloud
Value value(Value v) => v;
@cloud
ValueX valueX(ValueX v) => v;
@cloud
ValueXImpl valueXImpl(ValueXImpl v) => v;
@cloud
ValueXToFromJson valueXToFromJson(ValueXToFromJson v) => v;
@cloud
ValueXToJson valueXToJson(ValueXToJson v) => v;
@cloud
ValueXToJsonImpl valueXToJsonImpl(ValueXToJsonImpl v) => v;
@cloud
ValueXFromJson valueXFromJson(ValueXFromJson v) => v;
@cloud
ValueXFromJsonImpl valueXFromJsonImpl(ValueXFromJsonImpl v) => v;
@cloud
ValueXFromJsonStatic valueXFromJsonStatic(ValueXFromJsonStatic v) => v;

// Enum tests
@cloud
Color color(Color color) => color;
@cloud
ColorX colorX(ColorX color) => color;
@cloud
ColorXImpl colorXImpl(ColorXImpl color) => color;
@cloud
ColorXToFromJson colorXToFromJson(ColorXToFromJson color) => color;
@cloud
ColorXToJson colorXToJson(ColorXToJson color) => color;
@cloud
ColorXToJsonImpl colorXToJsonImpl(ColorXToJsonImpl color) => color;
@cloud
ColorXFromJson colorXFromJson(ColorXFromJson color) => color;
@cloud
ColorXFromJsonImpl colorXFromJsonImpl(ColorXFromJsonImpl color) => color;
@cloud
ColorXFromJsonStatic colorXFromJsonStatic(ColorXFromJsonStatic color) => color;

// JsonValue tests
@cloud
JsonValue jsonValue(JsonValue value) => value;
@cloud
JsonString jsonString(JsonString value) => value;
@cloud
JsonNum jsonNum(JsonNum value) => value;
@cloud
JsonInt jsonInt(JsonInt value) => value;
@cloud
JsonDouble jsonDouble(JsonDouble value) => value;
@cloud
JsonBool jsonBool(JsonBool value) => value;
@cloud
JsonList jsonList(JsonList value) => value;
@cloud
JsonMap jsonMap(JsonMap value) => value;

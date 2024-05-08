/// Tests that extension types are correctly handled by the analyzer.
library;

import 'dart:async';

import 'package:celest_backend/models/extension_types.dart';
import 'package:celest_core/celest_core.dart';

// Basic extension types
StringX string(StringX s) => s;
FutureOr<StringX> asyncOrString(StringX s) => s;
Future<StringX> asyncString(StringX s) async => s;

// Extension type over primitive
StringXImpl stringImpl(StringXImpl s) => s;
StringXToFromJson stringToFromJson(StringXToFromJson s) => s;
StringXToJson stringToJson(StringXToJson s) => s;
StringXToJsonImpl stringToJsonImpl(StringXToJsonImpl s) => s;
StringXFromJson stringFromJson(StringXFromJson s) => s;
StringXFromJsonImpl stringFromJsonImpl(StringXFromJsonImpl s) => s;
StringXFromJsonStatic stringFromJsonStatic(StringXFromJsonStatic s) => s;
StringXPrivateField stringPrivateField(StringXPrivateField s) => s;
StringXPrivateFieldImpl stringPrivateFieldImpl(StringXPrivateFieldImpl s) => s;
StringXPrivateCtor stringPrivateCtor(StringXPrivateCtor s) => s;
StringXPrivateCtorImpl stringPrivateCtorImpl(StringXPrivateCtorImpl s) => s;

// Extension type over custom model
Value value(Value v) => v;
ValueX valueX(ValueX v) => v;
ValueXImpl valueXImpl(ValueXImpl v) => v;
ValueXToFromJson valueXToFromJson(ValueXToFromJson v) => v;
ValueXToJson valueXToJson(ValueXToJson v) => v;
ValueXToJsonImpl valueXToJsonImpl(ValueXToJsonImpl v) => v;
ValueXFromJson valueXFromJson(ValueXFromJson v) => v;
ValueXFromJsonImpl valueXFromJsonImpl(ValueXFromJsonImpl v) => v;
ValueXFromJsonStatic valueXFromJsonStatic(ValueXFromJsonStatic v) => v;

// Enum tests
Color color(Color color) => color;
ColorX colorX(ColorX color) => color;
ColorXImpl colorXImpl(ColorXImpl color) => color;
ColorXToFromJson colorXToFromJson(ColorXToFromJson color) => color;
ColorXToJson colorXToJson(ColorXToJson color) => color;
ColorXToJsonImpl colorXToJsonImpl(ColorXToJsonImpl color) => color;
ColorXFromJson colorXFromJson(ColorXFromJson color) => color;
ColorXFromJsonImpl colorXFromJsonImpl(ColorXFromJsonImpl color) => color;
ColorXFromJsonStatic colorXFromJsonStatic(ColorXFromJsonStatic color) => color;

// JsonValue tests
JsonValue jsonValue(JsonValue value) => value;
JsonString jsonString(JsonString value) => value;
JsonNum jsonNum(JsonNum value) => value;
JsonInt jsonInt(JsonInt value) => value;
JsonDouble jsonDouble(JsonDouble value) => value;
JsonBool jsonBool(JsonBool value) => value;
JsonList jsonList(JsonList value) => value;
JsonMap jsonMap(JsonMap value) => value;

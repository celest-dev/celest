/// Tests that extension types are correctly handled by the analyzer.
library;

import 'dart:async';

import 'package:celest_backend/models.dart';

StringX string(StringX s) => s;
FutureOr<StringX> asyncOrString(StringX s) => s;
Future<StringX> asyncString(StringX s) async => s;

StringXImpl stringImpl(StringXImpl s) => s;
StringXToFromJson stringToFromJson(StringXToFromJson s) => s;
StringXToJson stringToJson(StringXToJson s) => s;
StringXToJsonImpl stringToJsonImpl(StringXToJsonImpl s) => s;
StringXFromJson stringFromJson(StringXFromJson s) => s;
StringXFromJsonImpl stringFromJsonImpl(StringXFromJsonImpl s) => s;
StringXPrivateField stringPrivateField(StringXPrivateField s) => s;
StringXPrivateFieldImpl stringPrivateFieldImpl(StringXPrivateFieldImpl s) => s;
StringXPrivateCtor stringPrivateCtor(StringXPrivateCtor s) => s;
StringXPrivateCtorImpl stringPrivateCtorImpl(StringXPrivateCtorImpl s) => s;

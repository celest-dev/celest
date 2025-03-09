/// Tests that dart:ui types can be used as inputs/outputs in functions.
library;

import 'dart:ui' as ui;

import 'package:celest/celest.dart';

@cloud
Future<ui.Color> lerpColor(ui.Color a, ui.Color b, double t) async {
  return ui.Color.lerp(a, b, t)!;
}

@cloud
Future<ui.Locale> addCountryCode(ui.Locale locale, String countryCode) async {
  return ui.Locale(locale.languageCode, countryCode);
}

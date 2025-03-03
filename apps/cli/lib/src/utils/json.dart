import 'dart:convert';

String prettyPrintJson(Object? object) {
  return const JsonEncoder.withIndent('  ').convert(object);
}

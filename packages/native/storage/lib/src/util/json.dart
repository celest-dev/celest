import 'dart:convert';

String prettyJson(Object? object) {
  return const JsonEncoder.withIndent('  ').convert(object);
}

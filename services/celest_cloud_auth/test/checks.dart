import 'dart:convert';

import 'package:checks/checks.dart';
import 'package:http/http.dart' as http;

void Function(Subject<http.Response>) expectAll(
  List<void Function(Subject<http.Response>)> checks,
) {
  return (res) {
    for (final check in checks) {
      check(res);
    }
  };
}

void Function(Subject<http.Response>) expectStatus(int statusCode) {
  return (res) => res.hasStatus(statusCode);
}

void Function(Subject<http.Response>) expectBody(Map<String, Object?>? o) {
  return (res) => res.hasJsonBody(o);
}

void Function(Subject<http.Response>) expectBodyHas(
  List<void Function(Subject<Map<String, Object?>>)> conditions,
) {
  return (res) {
    res
        .has((it) => jsonDecode(it.body), 'body')
        .isA<Map<String, Object?>>()
        .which((it) {
      for (final condition in conditions) {
        condition(it);
      }
    });
  };
}

extension ResponseChecks on Subject<http.Response> {
  void hasStatus(int statusCode) {
    has((res) => res.statusCode, 'statusCode').equals(statusCode);
  }

  void hasJsonBody(Map<String, Object?>? o) {
    if (o == null) {
      return has((res) => res.body, 'body').equals('');
    }
    has((res) => jsonDecode(res.body), 'json')
        .isA<Map<String, Object?>>()
        .deepEquals(o);
  }
}

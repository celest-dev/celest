// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'file:///Users/dillonnys/celest/cloud/apps/cli/e2e/api/apis/parameter_types.dart'
    as _i3;

import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../apis/parameter_types.dart' as _i2;

class SimpleTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.simple(
        (request[r'aString'] as String),
        (request[r'anInt'] as int),
        (request[r'aDouble'] as double),
        (request[r'aBool'] as bool),
        _i3.MyEnum.values.byName((request[r'anEnum'] as String)),
        (request[r'aNull'] as Null),
        (request[r'anIterableOfString'] as Iterable<Object?>)
            .map((el) => (el as String))
            .toList(),
        (request[r'anIterableOfInt'] as Iterable<Object?>)
            .map((el) => (el as int))
            .toList(),
        (request[r'anIterableOfDouble'] as Iterable<Object?>)
            .map((el) => (el as double))
            .toList(),
        (request[r'anIterableOfBool'] as Iterable<Object?>)
            .map((el) => (el as bool))
            .toList(),
        (request[r'anIterableOfEnum'] as Iterable<Object?>)
            .map((el) => _i3.MyEnum.values.byName((el as String)))
            .toList(),
        (request[r'anIterableOfNull'] as Iterable<Object?>)
            .map((el) => (el as Null))
            .toList(),
        (request[r'aListOfString'] as Iterable<Object?>)
            .map((el) => (el as String))
            .toList(),
        (request[r'aListOfInt'] as Iterable<Object?>)
            .map((el) => (el as int))
            .toList(),
        (request[r'aListOfDouble'] as Iterable<Object?>)
            .map((el) => (el as double))
            .toList(),
        (request[r'aListOfBool'] as Iterable<Object?>)
            .map((el) => (el as bool))
            .toList(),
        (request[r'aListOfEnum'] as Iterable<Object?>)
            .map((el) => _i3.MyEnum.values.byName((el as String)))
            .toList(),
        (request[r'aListOfNull'] as Iterable<Object?>)
            .map((el) => (el as Null))
            .toList(),
        (request[r'aMapOfString'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as String),
            )),
        (request[r'aMapOfInt'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as int),
            )),
        (request[r'aMapOfDouble'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as double),
            )),
        (request[r'aMapOfBool'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as bool),
            )),
        (request[r'aMapOfEnum'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.MyEnum.values.byName((value as String)),
            )),
        (request[r'aMapOfNull'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as Null),
            )),
      );
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i4.FutureOr<_i5.Response> handler(_i5.Request request) {
    final handler = _i5.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

Future<void> main(List<String> args) async {
  await _i1.serve(
    args,
    (_) => SimpleTarget(),
  );
}

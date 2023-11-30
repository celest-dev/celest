// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i4;

import '../../../../../apis/parameter_types.dart' as _i2;

class SimpleOptionalTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.simpleOptional(
        request[r'aString'] == null ? null : (request[r'aString'] as String),
        request[r'anInt'] == null ? null : (request[r'anInt'] as int),
        request[r'aDouble'] == null ? null : (request[r'aDouble'] as double),
        request[r'aBool'] == null ? null : (request[r'aBool'] as bool),
        request[r'anEnum'] == null
            ? null
            : _i2.MyEnum.values.byName((request[r'anEnum'] as String)),
        (request[r'aNull'] as Null),
        request[r'anIterableOfString'] == null
            ? null
            : (request[r'anIterableOfString'] as Iterable<Object?>)
                .map((el) => (el as String))
                .toList(),
        request[r'anIterableOfInt'] == null
            ? null
            : (request[r'anIterableOfInt'] as Iterable<Object?>)
                .map((el) => (el as int))
                .toList(),
        request[r'anIterableOfDouble'] == null
            ? null
            : (request[r'anIterableOfDouble'] as Iterable<Object?>)
                .map((el) => (el as double))
                .toList(),
        request[r'anIterableOfBool'] == null
            ? null
            : (request[r'anIterableOfBool'] as Iterable<Object?>)
                .map((el) => (el as bool))
                .toList(),
        request[r'anIterableOfEnum'] == null
            ? null
            : (request[r'anIterableOfEnum'] as Iterable<Object?>)
                .map((el) => _i2.MyEnum.values.byName((el as String)))
                .toList(),
        request[r'anIterableOfNull'] == null
            ? null
            : (request[r'anIterableOfNull'] as Iterable<Object?>)
                .map((el) => (el as Null))
                .toList(),
        request[r'aListOfString'] == null
            ? null
            : (request[r'aListOfString'] as Iterable<Object?>)
                .map((el) => (el as String))
                .toList(),
        request[r'aListOfInt'] == null
            ? null
            : (request[r'aListOfInt'] as Iterable<Object?>)
                .map((el) => (el as int))
                .toList(),
        request[r'aListOfDouble'] == null
            ? null
            : (request[r'aListOfDouble'] as Iterable<Object?>)
                .map((el) => (el as double))
                .toList(),
        request[r'aListOfBool'] == null
            ? null
            : (request[r'aListOfBool'] as Iterable<Object?>)
                .map((el) => (el as bool))
                .toList(),
        request[r'aListOfEnum'] == null
            ? null
            : (request[r'aListOfEnum'] as Iterable<Object?>)
                .map((el) => _i2.MyEnum.values.byName((el as String)))
                .toList(),
        request[r'aListOfNull'] == null
            ? null
            : (request[r'aListOfNull'] as Iterable<Object?>)
                .map((el) => (el as Null))
                .toList(),
        request[r'aMapOfString'] == null
            ? null
            : (request[r'aMapOfString'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                MapEntry(
                  key,
                  (value as String),
                )),
        request[r'aMapOfInt'] == null
            ? null
            : (request[r'aMapOfInt'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                MapEntry(
                  key,
                  (value as int),
                )),
        request[r'aMapOfDouble'] == null
            ? null
            : (request[r'aMapOfDouble'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                MapEntry(
                  key,
                  (value as double),
                )),
        request[r'aMapOfBool'] == null
            ? null
            : (request[r'aMapOfBool'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                MapEntry(
                  key,
                  (value as bool),
                )),
        request[r'aMapOfEnum'] == null
            ? null
            : (request[r'aMapOfEnum'] as Map<String, Object?>).map((
                key,
                value,
              ) =>
                MapEntry(
                  key,
                  _i2.MyEnum.values.byName((value as String)),
                )),
        request[r'aMapOfNull'] == null
            ? null
            : (request[r'aMapOfNull'] as Map<String, Object?>).map((
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
  _i3.FutureOr<_i4.Response> handler(_i4.Request request) {
    final handler = _i4.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i3.Future<void> main(List<String> args) async {
  await _i1.serve(
    args,
    (_) => SimpleOptionalTarget(),
  );
}

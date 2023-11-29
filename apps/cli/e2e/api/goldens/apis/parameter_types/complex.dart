// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'file:///Users/dillonnys/celest/cloud/apps/cli/e2e/api/apis/parameter_types.dart'
    as _i3;

import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../apis/parameter_types.dart' as _i2;

class ComplexTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      return _i2.complex(
        _i3.SimpleStruct.fromJson(
            (request[r'aSimpleStruct'] as Map<String, dynamic>)),
        _i3.ComplexStruct.fromJson(
            (request[r'aComplexStruct'] as Map<String, dynamic>)),
        request[r'aNullableSimpleStruct'] == null
            ? null
            : _i3.SimpleStruct.fromJson(
                (request[r'aNullableSimpleStruct'] as Map<String, dynamic>)),
        request[r'aNullableComplexStruct'] == null
            ? null
            : _i3.ComplexStruct.fromJson(
                (request[r'aNullableComplexStruct'] as Map<String, dynamic>)),
        (request[r'anIterableOfSimpleStruct'] as Iterable<Object?>)
            .map(
                (el) => _i3.SimpleStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'anIterableOfComplexStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.ComplexStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        request[r'aNullableIterableOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableIterableOfSimpleStruct'] as Iterable<Object?>)
                .map((el) =>
                    _i3.SimpleStruct.fromJson((el as Map<String, dynamic>)))
                .toList(),
        request[r'aNullableIterableOfComplexStruct'] == null
            ? null
            : (request[r'aNullableIterableOfComplexStruct']
                    as Iterable<Object?>)
                .map((el) =>
                    _i3.ComplexStruct.fromJson((el as Map<String, dynamic>)))
                .toList(),
        (request[r'anIterableOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i3.SimpleStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'anIterableOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i3.ComplexStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aListOfSimpleStruct'] as Iterable<Object?>)
            .map(
                (el) => _i3.SimpleStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aListOfComplexStruct'] as Iterable<Object?>)
            .map((el) =>
                _i3.ComplexStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        request[r'aNullableListOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableListOfSimpleStruct'] as Iterable<Object?>)
                .map((el) =>
                    _i3.SimpleStruct.fromJson((el as Map<String, dynamic>)))
                .toList(),
        request[r'aNullableListOfComplexStruct'] == null
            ? null
            : (request[r'aNullableListOfComplexStruct'] as Iterable<Object?>)
                .map((el) =>
                    _i3.ComplexStruct.fromJson((el as Map<String, dynamic>)))
                .toList(),
        (request[r'aListOfNullableSimpleStruct'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i3.SimpleStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aListOfNullableComplexStruct'] as Iterable<Object?>)
            .map((el) => el == null
                ? null
                : _i3.ComplexStruct.fromJson((el as Map<String, dynamic>)))
            .toList(),
        (request[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.SimpleStruct.fromJson((value as Map<String, dynamic>)),
            )),
        (request[r'aMapOfComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i3.ComplexStruct.fromJson((value as Map<String, dynamic>)),
            )),
        request[r'aNullableMapOfSimpleStruct'] == null
            ? null
            : (request[r'aNullableMapOfSimpleStruct'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) =>
                    MapEntry(
                      key,
                      _i3.SimpleStruct.fromJson(
                          (value as Map<String, dynamic>)),
                    )),
        request[r'aNullableMapOfComplexStruct'] == null
            ? null
            : (request[r'aNullableMapOfComplexStruct'] as Map<String, Object?>)
                .map((
                key,
                value,
              ) =>
                    MapEntry(
                      key,
                      _i3.ComplexStruct.fromJson(
                          (value as Map<String, dynamic>)),
                    )),
        (request[r'aMapOfNullableSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              value == null
                  ? null
                  : _i3.SimpleStruct.fromJson((value as Map<String, dynamic>)),
            )),
        (request[r'aMapOfNullableComplexStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              value == null
                  ? null
                  : _i3.ComplexStruct.fromJson((value as Map<String, dynamic>)),
            )),
        request[r'aNullableMapOfNullableSimpleStruct'] == null
            ? null
            : (request[r'aNullableMapOfNullableSimpleStruct']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) =>
                    MapEntry(
                      key,
                      value == null
                          ? null
                          : _i3.SimpleStruct.fromJson(
                              (value as Map<String, dynamic>)),
                    )),
        request[r'aNullableMapOfNullableComplexStruct'] == null
            ? null
            : (request[r'aNullableMapOfNullableComplexStruct']
                    as Map<String, Object?>)
                .map((
                key,
                value,
              ) =>
                    MapEntry(
                      key,
                      value == null
                          ? null
                          : _i3.ComplexStruct.fromJson(
                              (value as Map<String, dynamic>)),
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

_i4.Future<void> main(List<String> args) async {
  await _i1.serve(
    args,
    (_) => ComplexTarget(),
  );
}

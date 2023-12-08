// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:celest/celest.dart' as _i2;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i5;

import '../../../../../apis/return_types.dart' as _i3;

class AsyncComplexStructReturnTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
// ignore: unused_local_variable
      final response = await _i3.asyncComplexStructReturn(celestContext);
      return {
        'aBool': response.aBool,
        'aDouble': response.aDouble,
        'aListOfBool': response.aListOfBool,
        'aListOfDouble': response.aListOfDouble,
        'aListOfEnum': response.aListOfEnum.map((el) => el.name).toList(),
        'aListOfInt': response.aListOfInt,
        'aListOfNull': response.aListOfNull,
        'aListOfSimpleClass':
            response.aListOfSimpleClass.map((el) => el.toJson()).toList(),
        'aListOfSimpleStruct':
            response.aListOfSimpleStruct.map((el) => {}).toList(),
        'aListOfString': response.aListOfString,
        'aMapOfBool': response.aMapOfBool,
        'aMapOfDouble': response.aMapOfDouble,
        'aMapOfEnum': response.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              value.name,
            )),
        'aMapOfInt': response.aMapOfInt,
        'aMapOfNull': response.aMapOfNull,
        'aMapOfSimpleClass': response.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              value.toJson(),
            )),
        'aMapOfSimpleStruct': response.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              {},
            )),
        'aMapOfString': response.aMapOfString,
        'aNull': response.aNull,
        'aSimpleClass': response.aSimpleClass.toJson(),
        'aSimpleStruct': {},
        'aString': response.aString,
        'anEnum': response.anEnum.name,
        'anInt': response.anInt,
        'anIterableOfBool': response.anIterableOfBool,
        'anIterableOfDouble': response.anIterableOfDouble,
        'anIterableOfEnum':
            response.anIterableOfEnum.map((el) => el.name).toList(),
        'anIterableOfInt': response.anIterableOfInt,
        'anIterableOfNull': response.anIterableOfNull,
        'anIterableOfSimpleClass':
            response.anIterableOfSimpleClass.map((el) => el.toJson()).toList(),
        'anIterableOfSimpleStruct':
            response.anIterableOfSimpleStruct.map((el) => {}).toList(),
        'anIterableOfString': response.anIterableOfString,
      };
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
    (_) => AsyncComplexStructReturnTarget(),
  );
}

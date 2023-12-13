// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:celest/celest.dart' as _i2;
import 'package:celest_core/celest_core.dart' as _i4;
import 'package:functions_framework/serve.dart' as _i1;
import 'package:shelf/shelf.dart' as _i6;

import '../../../../../apis/return_types.dart' as _i3;

class AsyncOrComplexStructReturnTarget extends _i1.FunctionTarget {
  final _inner = _i1.JsonWithContextFunctionTarget(
    (
      request,
      context,
    ) async {
      final celestContext = _i2.FunctionContext();
// ignore: unused_local_variable
      final response = await _i3.asyncOrComplexStructReturn(celestContext);
      return {
        'aBigInt': _i4.Serializers.instance.serializeWithType(
          'dart:core#BigInt',
          response.aBigInt,
        ),
        'aBool': response.aBool,
        'aDateTime': _i4.Serializers.instance.serializeWithType(
          'dart:core#DateTime',
          response.aDateTime,
        ),
        'aDouble': response.aDouble,
        'aDuration': _i4.Serializers.instance.serializeWithType(
          'dart:core#Duration',
          response.aDuration,
        ),
        'aListOfBigInt': response.aListOfBigInt
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:core#BigInt',
                  el,
                ))
            .toList(),
        'aListOfBool': response.aListOfBool,
        'aListOfDateTime': response.aListOfDateTime
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:core#DateTime',
                  el,
                ))
            .toList(),
        'aListOfDouble': response.aListOfDouble,
        'aListOfDuration': response.aListOfDuration
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:core#Duration',
                  el,
                ))
            .toList(),
        'aListOfEnum': response.aListOfEnum.map((el) => el.name).toList(),
        'aListOfInt': response.aListOfInt,
        'aListOfNull': response.aListOfNull,
        'aListOfRegExp': response.aListOfRegExp
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:core#RegExp',
                  el,
                ))
            .toList(),
        'aListOfSimpleClass':
            response.aListOfSimpleClass.map((el) => el.toJson()).toList(),
        'aListOfSimpleStruct':
            response.aListOfSimpleStruct.map((el) => {}).toList(),
        'aListOfStackTrace': response.aListOfStackTrace
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:core#StackTrace',
                  el,
                ))
            .toList(),
        'aListOfString': response.aListOfString,
        'aListOfUint8List': response.aListOfUint8List
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:typed_data#Uint8List',
                  el,
                ))
            .toList(),
        'aListOfUri': response.aListOfUri
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:core#Uri',
                  el,
                ))
            .toList(),
        'aListOfUriData': response.aListOfUriData
            .map((el) => _i4.Serializers.instance.serializeWithType(
                  'dart:core#UriData',
                  el,
                ))
            .toList(),
        'aMapOfBigInt': response.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:core#BigInt',
                value,
              ),
            )),
        'aMapOfBool': response.aMapOfBool,
        'aMapOfDateTime': response.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:core#DateTime',
                value,
              ),
            )),
        'aMapOfDouble': response.aMapOfDouble,
        'aMapOfDuration': response.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:core#Duration',
                value,
              ),
            )),
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
        'aMapOfRegExp': response.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:core#RegExp',
                value,
              ),
            )),
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
        'aMapOfStackTrace': response.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:core#StackTrace',
                value,
              ),
            )),
        'aMapOfString': response.aMapOfString,
        'aMapOfUint8List': response.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:typed_data#Uint8List',
                value,
              ),
            )),
        'aMapOfUri': response.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:core#Uri',
                value,
              ),
            )),
        'aMapOfUriData': response.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i4.Serializers.instance.serializeWithType(
                'dart:core#UriData',
                value,
              ),
            )),
        'aNull': response.aNull,
        'aRegExp': _i4.Serializers.instance.serializeWithType(
          'dart:core#RegExp',
          response.aRegExp,
        ),
        'aSimpleClass': response.aSimpleClass.toJson(),
        'aSimpleStruct': {},
        'aStackTrace': _i4.Serializers.instance.serializeWithType(
          'dart:core#StackTrace',
          response.aStackTrace,
        ),
        'aString': response.aString,
        'aUint8List': _i4.Serializers.instance.serializeWithType(
          'dart:typed_data#Uint8List',
          response.aUint8List,
        ),
        'aUri': _i4.Serializers.instance.serializeWithType(
          'dart:core#Uri',
          response.aUri,
        ),
        'aUriData': _i4.Serializers.instance.serializeWithType(
          'dart:core#UriData',
          response.aUriData,
        ),
        'anEnum': response.anEnum.name,
        'anInt': response.anInt,
        'anIterableOfSimpleClass':
            response.anIterableOfSimpleClass.map((el) => el.toJson()).toList(),
      };
    },
    (json) => json as Map<String, dynamic>,
  );

  @override
  _i5.FutureOr<_i6.Response> handler(_i6.Request request) {
    final handler = _i6.Pipeline().addHandler(_inner.handler);
    return handler(request);
  }
}

_i5.Future<void> main(List<String> args) async {
  await _i1.serve(
    args,
    (_) => AsyncOrComplexStructReturnTarget(),
  );
}

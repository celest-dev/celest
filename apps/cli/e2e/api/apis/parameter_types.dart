import 'dart:typed_data';

import 'package:celest_core/celest_core.dart';

enum MyEnum { a, b, c }

Future<void> simple(
  String aString,
  int anInt,
  double aDouble,
  bool aBool,
  MyEnum anEnum,
  Null aNull,
  BigInt aBigInt,
  DateTime aDateTime,
  Duration aDuration,
  RegExp aRegExp,
  StackTrace aStackTrace,
  Uri aUri,
  UriData aUriData,
  Uint8List aUint8List,
  Iterable<String> anIterableOfString,
  Iterable<Uint8List> anIterableOfUint8List,
  List<String> aListOfString,
  List<int> aListOfInt,
  List<double> aListOfDouble,
  List<bool> aListOfBool,
  List<MyEnum> aListOfEnum,
  List<Null> aListOfNull,
  List<BigInt> aListOfBigInt,
  List<DateTime> aListOfDateTime,
  List<Duration> aListOfDuration,
  List<RegExp> aListOfRegExp,
  List<StackTrace> aListOfStackTrace,
  List<Uri> aListOfUri,
  List<UriData> aListOfUriData,
  List<Uint8List> aListOfUint8List,
  Map<String, String> aMapOfString,
  Map<String, int> aMapOfInt,
  Map<String, double> aMapOfDouble,
  Map<String, bool> aMapOfBool,
  Map<String, MyEnum> aMapOfEnum,
  Map<String, Null> aMapOfNull,
  Map<String, BigInt> aMapOfBigInt,
  Map<String, DateTime> aMapOfDateTime,
  Map<String, Duration> aMapOfDuration,
  Map<String, RegExp> aMapOfRegExp,
  Map<String, StackTrace> aMapOfStackTrace,
  Map<String, Uri> aMapOfUri,
  Map<String, UriData> aMapOfUriData,
  Map<String, Uint8List> aMapOfUint8List,
) async {}

Future<void> simpleOptional(
  String? aString,
  int? anInt,
  double? aDouble,
  bool? aBool,
  MyEnum? anEnum,
  Null aNull,
  BigInt? aBigInt,
  DateTime? aDateTime,
  Duration? aDuration,
  RegExp? aRegExp,
  StackTrace? aStackTrace,
  Uri? aUri,
  UriData? aUriData,
  Uint8List? aUint8List,
  Iterable<String>? anIterableOfString,
  Iterable<Uint8List>? anIterableOfUint8List,
  List<String>? aListOfString,
  List<int>? aListOfInt,
  List<double>? aListOfDouble,
  List<bool>? aListOfBool,
  List<MyEnum>? aListOfEnum,
  List<Null>? aListOfNull,
  List<BigInt>? aListOfBigInt,
  List<DateTime>? aListOfDateTime,
  List<Duration>? aListOfDuration,
  List<RegExp>? aListOfRegExp,
  List<StackTrace>? aListOfStackTrace,
  List<Uri>? aListOfUri,
  List<UriData>? aListOfUriData,
  List<Uint8List>? aListOfUint8List,
  Map<String, String>? aMapOfString,
  Map<String, int>? aMapOfInt,
  Map<String, double>? aMapOfDouble,
  Map<String, bool>? aMapOfBool,
  Map<String, MyEnum>? aMapOfEnum,
  Map<String, Null>? aMapOfNull,
  Map<String, BigInt>? aMapOfBigInt,
  Map<String, DateTime>? aMapOfDateTime,
  Map<String, Duration>? aMapOfDuration,
  Map<String, RegExp>? aMapOfRegExp,
  Map<String, StackTrace>? aMapOfStackTrace,
  Map<String, Uri>? aMapOfUri,
  Map<String, UriData>? aMapOfUriData,
  Map<String, Uint8List>? aMapOfUint8List,
) async {}

typedef SimpleStruct = ();

class SimpleClass {
  const SimpleClass();
  factory SimpleClass.fromJson(Map<String, dynamic> json) => SimpleClass();
  Map<String, dynamic> toJson() => {};
}

typedef ComplexStruct = ({
  String aString,
  int anInt,
  double aDouble,
  bool aBool,
  MyEnum anEnum,
  Null aNull,
  BigInt aBigInt,
  DateTime aDateTime,
  Duration aDuration,
  RegExp aRegExp,
  StackTrace aStackTrace,
  Uri aUri,
  UriData aUriData,
  Uint8List aUint8List,
  SimpleStruct aSimpleStruct,
  SimpleClass aSimpleClass,
  Iterable<SimpleClass> anIterableOfSimpleClass,
  List<String> aListOfString,
  List<int> aListOfInt,
  List<double> aListOfDouble,
  List<bool> aListOfBool,
  List<MyEnum> aListOfEnum,
  List<Null> aListOfNull,
  List<BigInt> aListOfBigInt,
  List<DateTime> aListOfDateTime,
  List<Duration> aListOfDuration,
  List<RegExp> aListOfRegExp,
  List<StackTrace> aListOfStackTrace,
  List<Uri> aListOfUri,
  List<UriData> aListOfUriData,
  List<Uint8List> aListOfUint8List,
  List<SimpleStruct> aListOfSimpleStruct,
  List<SimpleClass> aListOfSimpleClass,
  Map<String, String> aMapOfString,
  Map<String, int> aMapOfInt,
  Map<String, double> aMapOfDouble,
  Map<String, bool> aMapOfBool,
  Map<String, MyEnum> aMapOfEnum,
  Map<String, Null> aMapOfNull,
  Map<String, BigInt> aMapOfBigInt,
  Map<String, DateTime> aMapOfDateTime,
  Map<String, Duration> aMapOfDuration,
  Map<String, RegExp> aMapOfRegExp,
  Map<String, StackTrace> aMapOfStackTrace,
  Map<String, Uri> aMapOfUri,
  Map<String, UriData> aMapOfUriData,
  Map<String, Uint8List> aMapOfUint8List,
  Map<String, SimpleStruct> aMapOfSimpleStruct,
  Map<String, SimpleClass> aMapOfSimpleClass,
});

class ComplexClass {
  final String aString;
  final int anInt;
  final double aDouble;
  final bool aBool;
  final MyEnum anEnum;
  final Null aNull;
  final BigInt aBigInt;
  final DateTime aDateTime;
  final Duration aDuration;
  final RegExp aRegExp;
  final StackTrace aStackTrace;
  final Uri aUri;
  final UriData aUriData;
  final Uint8List aUint8List;
  final SimpleStruct aSimpleStruct;
  final SimpleClass aSimpleClass;
  final Iterable<SimpleClass> anIterableOfSimpleClass;
  final List<String> aListOfString;
  final List<int> aListOfInt;
  final List<double> aListOfDouble;
  final List<bool> aListOfBool;
  final List<MyEnum> aListOfEnum;
  final List<Null> aListOfNull;
  final List<BigInt> aListOfBigInt;
  final List<DateTime> aListOfDateTime;
  final List<Duration> aListOfDuration;
  final List<RegExp> aListOfRegExp;
  final List<StackTrace> aListOfStackTrace;
  final List<Uri> aListOfUri;
  final List<UriData> aListOfUriData;
  final List<Uint8List> aListOfUint8List;
  final List<SimpleStruct> aListOfSimpleStruct;
  final List<SimpleClass> aListOfSimpleClass;
  final Map<String, String> aMapOfString;
  final Map<String, int> aMapOfInt;
  final Map<String, double> aMapOfDouble;
  final Map<String, bool> aMapOfBool;
  final Map<String, MyEnum> aMapOfEnum;
  final Map<String, Null> aMapOfNull;
  final Map<String, BigInt> aMapOfBigInt;
  final Map<String, DateTime> aMapOfDateTime;
  final Map<String, Duration> aMapOfDuration;
  final Map<String, RegExp> aMapOfRegExp;
  final Map<String, StackTrace> aMapOfStackTrace;
  final Map<String, Uri> aMapOfUri;
  final Map<String, UriData> aMapOfUriData;
  final Map<String, Uint8List> aMapOfUint8List;
  final Map<String, SimpleStruct> aMapOfSimpleStruct;
  final Map<String, SimpleClass> aMapOfSimpleClass;

  const ComplexClass({
    required this.aString,
    required this.anInt,
    required this.aDouble,
    required this.aBool,
    required this.anEnum,
    required this.aNull,
    required this.aBigInt,
    required this.aDateTime,
    required this.aDuration,
    required this.aRegExp,
    required this.aStackTrace,
    required this.aUri,
    required this.aUriData,
    required this.aUint8List,
    required this.aSimpleStruct,
    required this.aSimpleClass,
    required this.anIterableOfSimpleClass,
    required this.aListOfString,
    required this.aListOfInt,
    required this.aListOfDouble,
    required this.aListOfBool,
    required this.aListOfEnum,
    required this.aListOfNull,
    required this.aListOfBigInt,
    required this.aListOfDateTime,
    required this.aListOfDuration,
    required this.aListOfRegExp,
    required this.aListOfStackTrace,
    required this.aListOfUri,
    required this.aListOfUriData,
    required this.aListOfUint8List,
    required this.aListOfSimpleStruct,
    required this.aListOfSimpleClass,
    required this.aMapOfString,
    required this.aMapOfInt,
    required this.aMapOfDouble,
    required this.aMapOfBool,
    required this.aMapOfEnum,
    required this.aMapOfNull,
    required this.aMapOfBigInt,
    required this.aMapOfDateTime,
    required this.aMapOfDuration,
    required this.aMapOfRegExp,
    required this.aMapOfStackTrace,
    required this.aMapOfUri,
    required this.aMapOfUriData,
    required this.aMapOfUint8List,
    required this.aMapOfSimpleStruct,
    required this.aMapOfSimpleClass,
  });

  factory ComplexClass.fromJson(Map<String, dynamic> json) => ComplexClass(
        aString: json['aString'] as String,
        anInt: json['anInt'] as int,
        aDouble: json['aDouble'] as double,
        aBool: json['aBool'] as bool,
        anEnum: MyEnum.values.byName(json['anEnum'] as String),
        aNull: json['aNull'] as Null,
        aBigInt: Serializers.instance.deserialize(
          'dart:core#BigInt',
          json['aBigInt'],
        ),
        aDateTime: Serializers.instance.deserialize(
          'dart:core#DateTime',
          json['aDateTime'],
        ),
        aDuration: Serializers.instance.deserialize(
          'dart:core#Duration',
          json['aDuration'],
        ),
        aRegExp: Serializers.instance.deserialize(
          'dart:core#RegExp',
          json['aRegExp'],
        ),
        aStackTrace: Serializers.instance.deserialize(
          'dart:core#StackTrace',
          json['aStackTrace'],
        ),
        aUri: Serializers.instance.deserialize(
          'dart:core#Uri',
          json['aUri'],
        ),
        aUriData: Serializers.instance.deserialize(
          'dart:core#UriData',
          json['aUriData'],
        ),
        aUint8List: Serializers.instance.deserialize(
          'dart:typed_data#Uint8List',
          json['aUint8List'],
        ),
        aSimpleStruct: (),
        aSimpleClass: SimpleClass.fromJson(json['aSimpleStruct']),
        anIterableOfSimpleClass:
            (json['anIterableOfSimpleClass'] as List<dynamic>)
                .map((e) => SimpleClass.fromJson(e))
                .toList(),
        aListOfString: (json['aListOfString'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        aListOfInt:
            (json['aListOfInt'] as List<dynamic>).map((e) => e as int).toList(),
        aListOfDouble: (json['aListOfDouble'] as List<dynamic>)
            .map((e) => e as double)
            .toList(),
        aListOfBool: (json['aListOfBool'] as List<dynamic>)
            .map((e) => e as bool)
            .toList(),
        aListOfEnum: (json['aListOfEnum'] as List<dynamic>)
            .map((e) => MyEnum.values.byName(e as String))
            .toList(),
        aListOfNull: (json['aListOfNull'] as List<dynamic>)
            .map((e) => e as Null)
            .toList(),
        aListOfBigInt: (json['aListOfBigInt'] as List<dynamic>)
            .map((e) =>
                Serializers.instance.deserialize<BigInt>('dart:core#BigInt', e))
            .toList(),
        aListOfDateTime: (json['aListOfDateTime'] as List<dynamic>)
            .map((e) => Serializers.instance
                .deserialize<DateTime>('dart:core#DateTime', e))
            .toList(),
        aListOfDuration: (json['aListOfDuration'] as List<dynamic>)
            .map((e) => Serializers.instance
                .deserialize<Duration>('dart:core#Duration', e))
            .toList(),
        aListOfRegExp: (json['aListOfRegExp'] as List<dynamic>)
            .map((e) =>
                Serializers.instance.deserialize<RegExp>('dart:core#RegExp', e))
            .toList(),
        aListOfStackTrace: (json['aListOfStackTrace'] as List<dynamic>)
            .map((e) => Serializers.instance
                .deserialize<StackTrace>('dart:core#StackTrace', e))
            .toList(),
        aListOfUri: (json['aListOfUri'] as List<dynamic>)
            .map((e) =>
                Serializers.instance.deserialize<Uri>('dart:core#Uri', e))
            .toList(),
        aListOfUriData: (json['aListOfUriData'] as List<dynamic>)
            .map((e) => Serializers.instance
                .deserialize<UriData>('dart:core#UriData', e))
            .toList(),
        aListOfUint8List: (json['aListOfUint8List'] as List<dynamic>)
            .map((e) => Serializers.instance
                .deserialize<Uint8List>('dart:typed_data#Uint8List', e))
            .toList(),
        aListOfSimpleStruct: (json['aListOfSimpleStruct'] as List<dynamic>)
            .map((e) => ())
            .toList(),
        aListOfSimpleClass: (json['aListOfSimpleClass'] as List<dynamic>)
            .map((e) => SimpleClass.fromJson(e))
            .toList(),
        aMapOfString: (json['aMapOfString'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, e as String)),
        aMapOfInt: (json['aMapOfInt'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, e as int)),
        aMapOfDouble: (json['aMapOfDouble'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, e as double)),
        aMapOfBool: (json['aMapOfBool'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, e as bool)),
        aMapOfEnum: (json['aMapOfEnum'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, MyEnum.values.byName(e as String))),
        aMapOfNull: (json['aMapOfNull'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, e as Null)),
        aMapOfBigInt: (json['aMapOfBigInt'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k,
                Serializers.instance
                    .deserialize<BigInt>('dart:core#BigInt', e))),
        aMapOfDateTime: (json['aMapOfDateTime'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k,
                Serializers.instance
                    .deserialize<DateTime>('dart:core#DateTime', e))),
        aMapOfDuration: (json['aMapOfDuration'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k,
                Serializers.instance
                    .deserialize<Duration>('dart:core#Duration', e))),
        aMapOfRegExp: (json['aMapOfRegExp'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k,
                Serializers.instance
                    .deserialize<RegExp>('dart:core#RegExp', e))),
        aMapOfStackTrace: (json['aMapOfStackTrace'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(
                k,
                Serializers.instance
                    .deserialize<StackTrace>('dart:core#StackTrace', e))),
        aMapOfUri: (json['aMapOfUri'] as Map<String, dynamic>).map((k, e) =>
            MapEntry(
                k, Serializers.instance.deserialize<Uri>('dart:core#Uri', e))),
        aMapOfUriData: (json['aMapOfUriData'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k,
                Serializers.instance
                    .deserialize<UriData>('dart:core#UriData', e))),
        aMapOfUint8List: (json['aMapOfUint8List'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k,
                Serializers.instance
                    .deserialize<Uint8List>('dart:typed_data#Uint8List', e))),
        aMapOfSimpleStruct: (json['aMapOfSimpleStruct'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, ())),
        aMapOfSimpleClass: (json['aMapOfSimpleClass'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, SimpleClass.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        'aString': aString,
        'anInt': anInt,
        'aDouble': aDouble,
        'aBool': aBool,
        'anEnum': anEnum.name,
        'aNull': aNull,
        'aBigInt': Serializers.instance.serialize('dart:core#BigInt', aBigInt),
        'aDateTime':
            Serializers.instance.serialize('dart:core#DateTime', aDateTime),
        'aDuration':
            Serializers.instance.serialize('dart:core#Duration', aDuration),
        'aRegExp': Serializers.instance.serialize('dart:core#RegExp', aRegExp),
        'aStackTrace':
            Serializers.instance.serialize('dart:core#StackTrace', aStackTrace),
        'aUri': Serializers.instance.serialize('dart:core#Uri', aUri),
        'aUriData':
            Serializers.instance.serialize('dart:core#UriData', aUriData),
        'aUint8List': Serializers.instance
            .serialize('dart:typed_data#Uint8List', aUint8List),
        'aSimpleStruct': (),
        'aSimpleClass': aSimpleClass.toJson(),
        'anIterableOfSimpleClass':
            anIterableOfSimpleClass.map((e) => e.toJson()).toList(),
        'aListOfString': aListOfString,
        'aListOfInt': aListOfInt,
        'aListOfDouble': aListOfDouble,
        'aListOfBool': aListOfBool,
        'aListOfEnum': aListOfEnum.map((e) => e.name).toList(),
        'aListOfNull': aListOfNull,
        'aListOfBigInt': aListOfBigInt
            .map((e) => Serializers.instance.serialize('dart:core#BigInt', e))
            .toList(),
        'aListOfDateTime': aListOfDateTime
            .map((e) => Serializers.instance.serialize('dart:core#DateTime', e))
            .toList(),
        'aListOfDuration': aListOfDuration
            .map((e) => Serializers.instance.serialize('dart:core#Duration', e))
            .toList(),
        'aListOfRegExp': aListOfRegExp
            .map((e) => Serializers.instance.serialize('dart:core#RegExp', e))
            .toList(),
        'aListOfStackTrace': aListOfStackTrace
            .map((e) =>
                Serializers.instance.serialize('dart:core#StackTrace', e))
            .toList(),
        'aListOfUri': aListOfUri
            .map((e) => Serializers.instance.serialize('dart:core#Uri', e))
            .toList(),
        'aListOfUriData': aListOfUriData
            .map((e) => Serializers.instance.serialize('dart:core#UriData', e))
            .toList(),
        'aListOfUint8List': aListOfUint8List
            .map((e) =>
                Serializers.instance.serialize('dart:typed_data#Uint8List', e))
            .toList(),
        'aListOfSimpleStruct': aListOfSimpleStruct.map((e) => ()).toList(),
        'aListOfSimpleClass':
            aListOfSimpleClass.map((e) => e.toJson()).toList(),
        'aMapOfString': aMapOfString,
        'aMapOfInt': aMapOfInt,
        'aMapOfDouble': aMapOfDouble,
        'aMapOfBool': aMapOfBool,
        'aMapOfEnum': aMapOfEnum.map((k, e) => MapEntry(k, e.name)),
        'aMapOfNull': aMapOfNull,
        'aMapOfBigInt': aMapOfBigInt.map((k, e) =>
            MapEntry(k, Serializers.instance.serialize('dart:core#BigInt', e))),
        'aMapOfDateTime': aMapOfDateTime.map((k, e) => MapEntry(
            k, Serializers.instance.serialize('dart:core#DateTime', e))),
        'aMapOfDuration': aMapOfDuration.map((k, e) => MapEntry(
            k, Serializers.instance.serialize('dart:core#Duration', e))),
        'aMapOfRegExp': aMapOfRegExp.map((k, e) =>
            MapEntry(k, Serializers.instance.serialize('dart:core#RegExp', e))),
        'aMapOfStackTrace': aMapOfStackTrace.map((k, e) => MapEntry(
            k, Serializers.instance.serialize('dart:core#StackTrace', e))),
        'aMapOfUri': aMapOfUri.map((k, e) =>
            MapEntry(k, Serializers.instance.serialize('dart:core#Uri', e))),
        'aMapOfUriData': aMapOfUriData.map((k, e) => MapEntry(
            k, Serializers.instance.serialize('dart:core#UriData', e))),
        'aMapOfUint8List': aMapOfUint8List.map((k, e) => MapEntry(
            k, Serializers.instance.serialize('dart:typed_data#Uint8List', e))),
        'aMapOfSimpleStruct': aMapOfSimpleStruct.map((k, e) => MapEntry(k, ())),
        'aMapOfSimpleClass':
            aMapOfSimpleClass.map((k, e) => MapEntry(k, e.toJson())),
      };
}

Future<void> complex(
  SimpleStruct aSimpleStruct,
  ComplexStruct aComplexStruct,
  SimpleClass aSimpleClass,
  ComplexClass aComplexClass,
  SimpleStruct? aNullableSimpleStruct,
  ComplexStruct? aNullableComplexStruct,
  SimpleClass? aNullableSimpleClass,
  ComplexClass? aNullableComplexClass,
  Iterable<SimpleStruct> anIterableOfSimpleStruct,
  Iterable<ComplexStruct> anIterableOfComplexStruct,
  Iterable<SimpleClass> anIterableOfSimpleClass,
  Iterable<ComplexClass> anIterableOfComplexClass,
  Iterable<SimpleStruct>? aNullableIterableOfSimpleStruct,
  Iterable<ComplexStruct>? aNullableIterableOfComplexStruct,
  Iterable<SimpleClass>? aNullableIterableOfSimpleClass,
  Iterable<ComplexClass>? aNullableIterableOfComplexClass,
  Iterable<SimpleStruct?> anIterableOfNullableSimpleStruct,
  Iterable<ComplexStruct?> anIterableOfNullableComplexStruct,
  Iterable<SimpleClass?> anIterableOfNullableSimpleClass,
  Iterable<ComplexClass?> anIterableOfNullableComplexClass,
  List<SimpleStruct> aListOfSimpleStruct,
  List<ComplexStruct> aListOfComplexStruct,
  List<SimpleClass> aListOfSimpleClass,
  List<ComplexClass> aListOfComplexClass,
  List<SimpleStruct>? aNullableListOfSimpleStruct,
  List<ComplexStruct>? aNullableListOfComplexStruct,
  List<SimpleClass>? aNullableListOfSimpleClass,
  List<ComplexClass>? aNullableListOfComplexClass,
  List<SimpleStruct?> aListOfNullableSimpleStruct,
  List<ComplexStruct?> aListOfNullableComplexStruct,
  List<SimpleClass?> aListOfNullableSimpleClass,
  List<ComplexClass?> aListOfNullableComplexClass,
  Map<String, SimpleStruct> aMapOfSimpleStruct,
  Map<String, ComplexStruct> aMapOfComplexStruct,
  Map<String, SimpleClass> aMapOfSimpleClass,
  Map<String, ComplexClass> aMapOfComplexClass,
  Map<String, SimpleStruct>? aNullableMapOfSimpleStruct,
  Map<String, ComplexStruct>? aNullableMapOfComplexStruct,
  Map<String, SimpleClass>? aNullableMapOfSimpleClass,
  Map<String, ComplexClass>? aNullableMapOfComplexClass,
  Map<String, SimpleStruct?> aMapOfNullableSimpleStruct,
  Map<String, ComplexStruct?> aMapOfNullableComplexStruct,
  Map<String, SimpleClass?> aMapOfNullableSimpleClass,
  Map<String, ComplexClass?> aMapOfNullableComplexClass,
  Map<String, SimpleStruct?>? aNullableMapOfNullableSimpleStruct,
  Map<String, ComplexStruct?>? aNullableMapOfNullableComplexStruct,
  Map<String, SimpleClass?>? aNullableMapOfNullableSimpleClass,
  Map<String, ComplexClass?>? aNullableMapOfNullableComplexClass,
) async {}

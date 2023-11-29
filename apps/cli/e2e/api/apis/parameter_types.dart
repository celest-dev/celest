enum MyEnum { a, b, c }

Future<void> simple(
  String aString,
  int anInt,
  double aDouble,
  bool aBool,
  MyEnum anEnum,
  Null aNull,
  Iterable<String> anIterableOfString,
  Iterable<int> anIterableOfInt,
  Iterable<double> anIterableOfDouble,
  Iterable<bool> anIterableOfBool,
  Iterable<MyEnum> anIterableOfEnum,
  Iterable<Null> anIterableOfNull,
  List<String> aListOfString,
  List<int> aListOfInt,
  List<double> aListOfDouble,
  List<bool> aListOfBool,
  List<MyEnum> aListOfEnum,
  List<Null> aListOfNull,
  Map<String, String> aMapOfString,
  Map<String, int> aMapOfInt,
  Map<String, double> aMapOfDouble,
  Map<String, bool> aMapOfBool,
  Map<String, MyEnum> aMapOfEnum,
  Map<String, Null> aMapOfNull,
) async {}

Future<void> simpleOptional(
  String? aString,
  int? anInt,
  double? aDouble,
  bool? aBool,
  MyEnum? anEnum,
  Null aNull,
  Iterable<String>? anIterableOfString,
  Iterable<int>? anIterableOfInt,
  Iterable<double>? anIterableOfDouble,
  Iterable<bool>? anIterableOfBool,
  Iterable<MyEnum>? anIterableOfEnum,
  Iterable<Null>? anIterableOfNull,
  List<String>? aListOfString,
  List<int>? aListOfInt,
  List<double>? aListOfDouble,
  List<bool>? aListOfBool,
  List<MyEnum>? aListOfEnum,
  List<Null>? aListOfNull,
  Map<String, String>? aMapOfString,
  Map<String, int>? aMapOfInt,
  Map<String, double>? aMapOfDouble,
  Map<String, bool>? aMapOfBool,
  Map<String, MyEnum>? aMapOfEnum,
  Map<String, Null>? aMapOfNull,
) async {}

class SimpleStruct {
  const SimpleStruct();
  factory SimpleStruct.fromJson(Map<String, Object?> _) => SimpleStruct();
  Map<String, Object?> toJson() => {};
}

class ComplexStruct {
  final String aString;
  final int anInt;
  final double aDouble;
  final bool aBool;
  final MyEnum anEnum;
  final Null aNull;
  final SimpleStruct aSimpleStruct;
  final Iterable<String> anIterableOfString;
  final Iterable<int> anIterableOfInt;
  final Iterable<double> anIterableOfDouble;
  final Iterable<bool> anIterableOfBool;
  final Iterable<MyEnum> anIterableOfEnum;
  final Iterable<Null> anIterableOfNull;
  final Iterable<SimpleStruct> anIterableOfSimpleStruct;
  final List<String> aListOfString;
  final List<int> aListOfInt;
  final List<double> aListOfDouble;
  final List<bool> aListOfBool;
  final List<MyEnum> aListOfEnum;
  final List<Null> aListOfNull;
  final List<SimpleStruct> aListOfSimpleStruct;
  final Map<String, String> aMapOfString;
  final Map<String, int> aMapOfInt;
  final Map<String, double> aMapOfDouble;
  final Map<String, bool> aMapOfBool;
  final Map<String, MyEnum> aMapOfEnum;
  final Map<String, Null> aMapOfNull;
  final Map<String, SimpleStruct> aMapOfSimpleStruct;

  const ComplexStruct({
    required this.aString,
    required this.anInt,
    required this.aDouble,
    required this.aBool,
    required this.anEnum,
    required this.aNull,
    required this.aSimpleStruct,
    required this.anIterableOfString,
    required this.anIterableOfInt,
    required this.anIterableOfDouble,
    required this.anIterableOfBool,
    required this.anIterableOfEnum,
    required this.anIterableOfNull,
    required this.anIterableOfSimpleStruct,
    required this.aListOfString,
    required this.aListOfInt,
    required this.aListOfDouble,
    required this.aListOfBool,
    required this.aListOfEnum,
    required this.aListOfNull,
    required this.aListOfSimpleStruct,
    required this.aMapOfString,
    required this.aMapOfInt,
    required this.aMapOfDouble,
    required this.aMapOfBool,
    required this.aMapOfEnum,
    required this.aMapOfNull,
    required this.aMapOfSimpleStruct,
  });

  factory ComplexStruct.fromJson(Map<String, dynamic> json) => ComplexStruct(
        aString: json['aString'] as String,
        anInt: json['anInt'] as int,
        aDouble: json['aDouble'] as double,
        aBool: json['aBool'] as bool,
        anEnum: MyEnum.values.byName(json['anEnum'] as String),
        aNull: json['aNull'] as Null,
        aSimpleStruct: SimpleStruct.fromJson(json['aSimpleStruct']),
        anIterableOfString: (json['anIterableOfString'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        anIterableOfInt: (json['anIterableOfInt'] as List<dynamic>)
            .map((e) => e as int)
            .toList(),
        anIterableOfDouble: (json['anIterableOfDouble'] as List<dynamic>)
            .map((e) => e as double)
            .toList(),
        anIterableOfBool: (json['anIterableOfBool'] as List<dynamic>)
            .map((e) => e as bool)
            .toList(),
        anIterableOfEnum: (json['anIterableOfEnum'] as List<dynamic>)
            .map((e) => MyEnum.values.byName(e as String))
            .toList(),
        anIterableOfNull: (json['anIterableOfNull'] as List<dynamic>)
            .map((e) => e as Null)
            .toList(),
        anIterableOfSimpleStruct:
            (json['anIterableOfSimpleStruct'] as List<dynamic>)
                .map((e) => SimpleStruct.fromJson(e))
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
        aListOfSimpleStruct: (json['aListOfSimpleStruct'] as List<dynamic>)
            .map((e) => SimpleStruct.fromJson(e))
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
        aMapOfSimpleStruct: (json['aMapOfSimpleStruct'] as Map<String, dynamic>)
            .map((k, e) => MapEntry(k, SimpleStruct.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        'aString': aString,
        'anInt': anInt,
        'aDouble': aDouble,
        'aBool': aBool,
        'anEnum': anEnum.name,
        'aNull': aNull,
        'aSimpleStruct': aSimpleStruct.toJson(),
        'anIterableOfString': anIterableOfString.toList(),
        'anIterableOfInt': anIterableOfInt.toList(),
        'anIterableOfDouble': anIterableOfDouble.toList(),
        'anIterableOfBool': anIterableOfBool.toList(),
        'anIterableOfEnum': anIterableOfEnum.map((e) => e.name).toList(),
        'anIterableOfNull': anIterableOfNull.toList(),
        'anIterableOfSimpleStruct':
            anIterableOfSimpleStruct.map((e) => e.toJson()).toList(),
        'aListOfString': aListOfString,
        'aListOfInt': aListOfInt,
        'aListOfDouble': aListOfDouble,
        'aListOfBool': aListOfBool,
        'aListOfEnum': aListOfEnum.map((e) => e.name).toList(),
        'aListOfNull': aListOfNull,
        'aListOfSimpleStruct':
            aListOfSimpleStruct.map((e) => e.toJson()).toList(),
        'aMapOfString': aMapOfString,
        'aMapOfInt': aMapOfInt,
        'aMapOfDouble': aMapOfDouble,
        'aMapOfBool': aMapOfBool,
        'aMapOfEnum': aMapOfEnum.map((k, e) => MapEntry(k, e.name)),
        'aMapOfNull': aMapOfNull,
        'aMapOfSimpleStruct':
            aMapOfSimpleStruct.map((k, e) => MapEntry(k, e.toJson())),
      };
}

Future<void> complex(
  SimpleStruct aSimpleStruct,
  ComplexStruct aComplexStruct,
  SimpleStruct? aNullableSimpleStruct,
  ComplexStruct? aNullableComplexStruct,
  Iterable<SimpleStruct> anIterableOfSimpleStruct,
  Iterable<ComplexStruct> anIterableOfComplexStruct,
  Iterable<SimpleStruct>? aNullableIterableOfSimpleStruct,
  Iterable<ComplexStruct>? aNullableIterableOfComplexStruct,
  Iterable<SimpleStruct?> anIterableOfNullableSimpleStruct,
  Iterable<ComplexStruct?> anIterableOfNullableComplexStruct,
  List<SimpleStruct> aListOfSimpleStruct,
  List<ComplexStruct> aListOfComplexStruct,
  List<SimpleStruct>? aNullableListOfSimpleStruct,
  List<ComplexStruct>? aNullableListOfComplexStruct,
  List<SimpleStruct?> aListOfNullableSimpleStruct,
  List<ComplexStruct?> aListOfNullableComplexStruct,
  Map<String, SimpleStruct> aMapOfSimpleStruct,
  Map<String, ComplexStruct> aMapOfComplexStruct,
  Map<String, SimpleStruct>? aNullableMapOfSimpleStruct,
  Map<String, ComplexStruct>? aNullableMapOfComplexStruct,
  Map<String, SimpleStruct?> aMapOfNullableSimpleStruct,
  Map<String, ComplexStruct?> aMapOfNullableComplexStruct,
  Map<String, SimpleStruct?>? aNullableMapOfNullableSimpleStruct,
  Map<String, ComplexStruct?>? aNullableMapOfNullableComplexStruct,
) async {}

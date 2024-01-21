/// Validates all permutations of return types.
library;

import 'dart:async';
import 'dart:convert';

import 'package:api/models.dart';

Future<void> asyncVoidReturn() async {}

Future<String> asyncStringReturn() async {
  return 'Hello, world!';
}

Future<int> asyncIntReturn() async {
  return 42;
}

Future<double> asyncDoubleReturn() async {
  return 3.14;
}

Future<bool> asyncBoolReturn() async {
  return true;
}

Future<Iterable<String>> asyncIterableReturn() async {
  return ['Hello', 'world'];
}

Future<List<String>> asyncListReturn() async {
  return ['Hello', 'world'];
}

Future<Map<String, String>> asyncMapReturn() async {
  return {'Hello': 'world'};
}

Future<SimpleStruct> asyncStructReturn() async {
  return ();
}

Future<SimpleStruct?> asyncStructReturnNullable() async {
  return null;
}

Future<ComplexStruct> asyncComplexStructReturn() async {
  return (
    aString: 'Hello',
    anInt: 42,
    aDouble: 3.14,
    aBool: true,
    anEnum: MyEnum.a,
    aNull: null,
    aBigInt: BigInt.from(42),
    aDateTime: DateTime.now(),
    aDuration: Duration(seconds: 42),
    aRegExp: RegExp(r'Hello, world!'),
    aStackTrace: StackTrace.current,
    aUri: Uri.parse('https://example.com'),
    aUriData: UriData.fromString('Hello, world!'),
    aUint8List: utf8.encode('Hello, world!'),
    aSimpleStruct: (),
    aSimpleClass: SimpleClass(),
    anIterableOfSimpleClass: [SimpleClass(), SimpleClass()],
    aListOfString: ['Hello', 'world'],
    aListOfInt: [1, 2, 3],
    aListOfDouble: [1.1, 2.2, 3.3],
    aListOfBool: [true, false],
    aListOfEnum: [MyEnum.a, MyEnum.b],
    aListOfNull: [null],
    aListOfBigInt: [BigInt.from(42), BigInt.from(43)],
    aListOfDateTime: [DateTime.now(), DateTime.now()],
    aListOfDuration: [Duration(seconds: 42), Duration(seconds: 43)],
    aListOfRegExp: [RegExp(r'Hello, world!'), RegExp(r'Hello, world!')],
    aListOfStackTrace: [StackTrace.current, StackTrace.current],
    aListOfUri: [
      Uri.parse('https://example.com'),
      Uri.parse('https://example.com')
    ],
    aListOfUriData: [
      UriData.fromString('Hello, world!'),
      UriData.fromString('Hello, world!')
    ],
    aListOfUint8List: [
      utf8.encode('Hello, world!'),
      utf8.encode('Hello, world!')
    ],
    aListOfSimpleStruct: [(), ()],
    aListOfSimpleClass: [SimpleClass(), SimpleClass()],
    aMapOfString: {'Hello': 'world'},
    aMapOfInt: {'Hello': 42},
    aMapOfDouble: {'Hello': 3.14},
    aMapOfBool: {'Hello': true},
    aMapOfEnum: {'Hello': MyEnum.a},
    aMapOfNull: {'Hello': null},
    aMapOfBigInt: {'Hello': BigInt.from(42)},
    aMapOfDateTime: {'Hello': DateTime.now()},
    aMapOfDuration: {'Hello': Duration(seconds: 42)},
    aMapOfRegExp: {'Hello': RegExp(r'Hello, world!')},
    aMapOfStackTrace: {'Hello': StackTrace.current},
    aMapOfUri: {'Hello': Uri.parse('https://example.com')},
    aMapOfUriData: {'Hello': UriData.fromString('Hello, world!')},
    aMapOfUint8List: {'Hello': utf8.encode('Hello, world!')},
    aMapOfSimpleStruct: {'Hello': (), 'World': ()},
    aMapOfSimpleClass: {'Hello': SimpleClass(), 'World': SimpleClass()},
  );
}

Future<ComplexStruct?> asyncComplexStructReturnNullable() async {
  return null;
}

Future<ComplexClass> asyncComplexClassReturn() async {
  return ComplexClass(
    aString: 'Hello',
    anInt: 42,
    aDouble: 3.14,
    aBool: true,
    anEnum: MyEnum.a,
    aNull: null,
    aBigInt: BigInt.from(42),
    aDateTime: DateTime.now(),
    aDuration: Duration(seconds: 42),
    aRegExp: RegExp(r'Hello, world!'),
    aStackTrace: StackTrace.current,
    aUri: Uri.parse('https://example.com'),
    aUriData: UriData.fromString('Hello, world!'),
    aUint8List: utf8.encode('Hello, world!'),
    aSimpleStruct: (),
    aSimpleClass: SimpleClass(),
    anIterableOfSimpleClass: [SimpleClass(), SimpleClass()],
    aListOfString: ['Hello', 'world'],
    aListOfInt: [1, 2, 3],
    aListOfDouble: [1.1, 2.2, 3.3],
    aListOfBool: [true, false],
    aListOfEnum: [MyEnum.a, MyEnum.b],
    aListOfNull: [null],
    aListOfBigInt: [BigInt.from(42), BigInt.from(43)],
    aListOfDateTime: [DateTime.now(), DateTime.now()],
    aListOfDuration: [Duration(seconds: 42), Duration(seconds: 43)],
    aListOfRegExp: [RegExp(r'Hello, world!'), RegExp(r'Hello, world!')],
    aListOfStackTrace: [StackTrace.current, StackTrace.current],
    aListOfUri: [
      Uri.parse('https://example.com'),
      Uri.parse('https://example.com')
    ],
    aListOfUriData: [
      UriData.fromString('Hello, world!'),
      UriData.fromString('Hello, world!')
    ],
    aListOfUint8List: [
      utf8.encode('Hello, world!'),
      utf8.encode('Hello, world!')
    ],
    aListOfSimpleStruct: [(), ()],
    aListOfSimpleClass: [SimpleClass(), SimpleClass()],
    aMapOfString: {'Hello': 'world'},
    aMapOfInt: {'Hello': 42},
    aMapOfDouble: {'Hello': 3.14},
    aMapOfBool: {'Hello': true},
    aMapOfEnum: {'Hello': MyEnum.a},
    aMapOfNull: {'Hello': null},
    aMapOfBigInt: {'Hello': BigInt.from(42)},
    aMapOfDateTime: {'Hello': DateTime.now()},
    aMapOfDuration: {'Hello': Duration(seconds: 42)},
    aMapOfRegExp: {'Hello': RegExp(r'Hello, world!')},
    aMapOfStackTrace: {'Hello': StackTrace.current},
    aMapOfUri: {'Hello': Uri.parse('https://example.com')},
    aMapOfUriData: {'Hello': UriData.fromString('Hello, world!')},
    aMapOfUint8List: {'Hello': utf8.encode('Hello, world!')},
    aMapOfSimpleStruct: {'Hello': (), 'World': ()},
    aMapOfSimpleClass: {'Hello': SimpleClass(), 'World': SimpleClass()},
  );
}

Future<SimpleClass?> asyncClassReturnNullable() async {
  return null;
}

FutureOr<void> asyncOrVoidReturn() async {}

FutureOr<String> asyncOrStringReturn() async {
  return 'Hello, world!';
}

FutureOr<int> asyncOrIntReturn() async {
  return 42;
}

FutureOr<double> asyncOrDoubleReturn() async {
  return 3.14;
}

FutureOr<bool> asyncOrBoolReturn() async {
  return true;
}

FutureOr<Iterable<String>> asyncOrIterableReturn() async {
  return ['Hello', 'world'];
}

FutureOr<List<String>> asyncOrListReturn() async {
  return ['Hello', 'world'];
}

FutureOr<Map<String, String>> asyncOrMapReturn() async {
  return {'Hello': 'world'};
}

FutureOr<SimpleStruct> asyncOrStructReturn() async {
  return ();
}

FutureOr<ComplexStruct> asyncOrComplexStructReturn() async {
  return (
    aString: 'Hello',
    anInt: 42,
    aDouble: 3.14,
    aBool: true,
    anEnum: MyEnum.a,
    aNull: null,
    aBigInt: BigInt.from(42),
    aDateTime: DateTime.now(),
    aDuration: Duration(seconds: 42),
    aRegExp: RegExp(r'Hello, world!'),
    aStackTrace: StackTrace.current,
    aUri: Uri.parse('https://example.com'),
    aUriData: UriData.fromString('Hello, world!'),
    aUint8List: utf8.encode('Hello, world!'),
    aSimpleStruct: (),
    aSimpleClass: SimpleClass(),
    anIterableOfSimpleClass: [SimpleClass(), SimpleClass()],
    aListOfString: ['Hello', 'world'],
    aListOfInt: [1, 2, 3],
    aListOfDouble: [1.1, 2.2, 3.3],
    aListOfBool: [true, false],
    aListOfEnum: [MyEnum.a, MyEnum.b],
    aListOfNull: [null],
    aListOfBigInt: [BigInt.from(42), BigInt.from(43)],
    aListOfDateTime: [DateTime.now(), DateTime.now()],
    aListOfDuration: [Duration(seconds: 42), Duration(seconds: 43)],
    aListOfRegExp: [RegExp(r'Hello, world!'), RegExp(r'Hello, world!')],
    aListOfStackTrace: [StackTrace.current, StackTrace.current],
    aListOfUri: [
      Uri.parse('https://example.com'),
      Uri.parse('https://example.com')
    ],
    aListOfUriData: [
      UriData.fromString('Hello, world!'),
      UriData.fromString('Hello, world!')
    ],
    aListOfUint8List: [
      utf8.encode('Hello, world!'),
      utf8.encode('Hello, world!')
    ],
    aListOfSimpleStruct: [(), ()],
    aListOfSimpleClass: [SimpleClass(), SimpleClass()],
    aMapOfString: {'Hello': 'world'},
    aMapOfInt: {'Hello': 42},
    aMapOfDouble: {'Hello': 3.14},
    aMapOfBool: {'Hello': true},
    aMapOfEnum: {'Hello': MyEnum.a},
    aMapOfNull: {'Hello': null},
    aMapOfBigInt: {'Hello': BigInt.from(42)},
    aMapOfDateTime: {'Hello': DateTime.now()},
    aMapOfDuration: {'Hello': Duration(seconds: 42)},
    aMapOfRegExp: {'Hello': RegExp(r'Hello, world!')},
    aMapOfStackTrace: {'Hello': StackTrace.current},
    aMapOfUri: {'Hello': Uri.parse('https://example.com')},
    aMapOfUriData: {'Hello': UriData.fromString('Hello, world!')},
    aMapOfUint8List: {'Hello': utf8.encode('Hello, world!')},
    aMapOfSimpleStruct: {'Hello': (), 'World': ()},
    aMapOfSimpleClass: {'Hello': SimpleClass(), 'World': SimpleClass()},
  );
}

FutureOr<void>? asyncOrVoidReturnNullable() {
  return null;
}

FutureOr<String>? asyncOrStringReturnNullable() {
  return null;
}

FutureOr<int>? asyncOrIntReturnNullable() {
  return null;
}

FutureOr<double>? asyncOrDoubleReturnNullable() {
  return null;
}

FutureOr<bool>? asyncOrBoolReturnNullable() {
  return null;
}

FutureOr<Iterable<String>>? asyncOrIterableReturnNullable() {
  return null;
}

FutureOr<List<String>>? asyncOrListReturnNullable() {
  return null;
}

FutureOr<Map<String, String>>? asyncOrMapReturnNullable() {
  return null;
}

FutureOr<SimpleStruct>? asyncOrStructReturnNullable() {
  return null;
}

FutureOr<ComplexStruct>? asyncOrComplexStructReturnNullable() {
  return null;
}

FutureOr<SimpleClass>? asyncOrSimpleClassReturnNullable() {
  return null;
}

FutureOr<ComplexClass>? asyncOrComplexClassReturnNullable() {
  return null;
}

void voidReturn() {}

String stringReturn() {
  return 'Hello, world!';
}

int intReturn() {
  return 42;
}

double doubleReturn() {
  return 3.14;
}

bool boolReturn() {
  return true;
}

Iterable<String> iterableReturn() {
  return ['Hello', 'world'];
}

List<String> listReturn() {
  return ['Hello', 'world'];
}

Map<String, String> mapReturn() {
  return {'Hello': 'world'};
}

SimpleStruct structReturn() {
  return ();
}

ComplexStruct complexReturn() {
  return (
    aString: 'Hello',
    anInt: 42,
    aDouble: 3.14,
    aBool: true,
    anEnum: MyEnum.a,
    aNull: null,
    aBigInt: BigInt.from(42),
    aDateTime: DateTime.now(),
    aDuration: Duration(seconds: 42),
    aRegExp: RegExp(r'Hello, world!'),
    aStackTrace: StackTrace.current,
    aUri: Uri.parse('https://example.com'),
    aUriData: UriData.fromString('Hello, world!'),
    aUint8List: utf8.encode('Hello, world!'),
    aSimpleStruct: (),
    aSimpleClass: SimpleClass(),
    anIterableOfSimpleClass: [SimpleClass(), SimpleClass()],
    aListOfString: ['Hello', 'world'],
    aListOfInt: [1, 2, 3],
    aListOfDouble: [1.1, 2.2, 3.3],
    aListOfBool: [true, false],
    aListOfEnum: [MyEnum.a, MyEnum.b],
    aListOfNull: [null],
    aListOfBigInt: [BigInt.from(42), BigInt.from(43)],
    aListOfDateTime: [DateTime.now(), DateTime.now()],
    aListOfDuration: [Duration(seconds: 42), Duration(seconds: 43)],
    aListOfRegExp: [RegExp(r'Hello, world!'), RegExp(r'Hello, world!')],
    aListOfStackTrace: [StackTrace.current, StackTrace.current],
    aListOfUri: [
      Uri.parse('https://example.com'),
      Uri.parse('https://example.com')
    ],
    aListOfUriData: [
      UriData.fromString('Hello, world!'),
      UriData.fromString('Hello, world!')
    ],
    aListOfUint8List: [
      utf8.encode('Hello, world!'),
      utf8.encode('Hello, world!')
    ],
    aListOfSimpleStruct: [(), ()],
    aListOfSimpleClass: [SimpleClass(), SimpleClass()],
    aMapOfString: {'Hello': 'world'},
    aMapOfInt: {'Hello': 42},
    aMapOfDouble: {'Hello': 3.14},
    aMapOfBool: {'Hello': true},
    aMapOfEnum: {'Hello': MyEnum.a},
    aMapOfNull: {'Hello': null},
    aMapOfBigInt: {'Hello': BigInt.from(42)},
    aMapOfDateTime: {'Hello': DateTime.now()},
    aMapOfDuration: {'Hello': Duration(seconds: 42)},
    aMapOfRegExp: {'Hello': RegExp(r'Hello, world!')},
    aMapOfStackTrace: {'Hello': StackTrace.current},
    aMapOfUri: {'Hello': Uri.parse('https://example.com')},
    aMapOfUriData: {'Hello': UriData.fromString('Hello, world!')},
    aMapOfUint8List: {'Hello': utf8.encode('Hello, world!')},
    aMapOfSimpleStruct: {'Hello': (), 'World': ()},
    aMapOfSimpleClass: {'Hello': SimpleClass(), 'World': SimpleClass()},
  );
}

SimpleClass simpleClassReturn() {
  return SimpleClass();
}

ComplexClass complexClassReturn() {
  return ComplexClass(
    aString: 'Hello',
    anInt: 42,
    aDouble: 3.14,
    aBool: true,
    anEnum: MyEnum.a,
    aNull: null,
    aBigInt: BigInt.from(42),
    aDateTime: DateTime.now(),
    aDuration: Duration(seconds: 42),
    aRegExp: RegExp(r'Hello, world!'),
    aStackTrace: StackTrace.current,
    aUri: Uri.parse('https://example.com'),
    aUriData: UriData.fromString('Hello, world!'),
    aUint8List: utf8.encode('Hello, world!'),
    aSimpleStruct: (),
    aSimpleClass: SimpleClass(),
    anIterableOfSimpleClass: [SimpleClass(), SimpleClass()],
    aListOfString: ['Hello', 'world'],
    aListOfInt: [1, 2, 3],
    aListOfDouble: [1.1, 2.2, 3.3],
    aListOfBool: [true, false],
    aListOfEnum: [MyEnum.a, MyEnum.b],
    aListOfNull: [null],
    aListOfBigInt: [BigInt.from(42), BigInt.from(43)],
    aListOfDateTime: [DateTime.now(), DateTime.now()],
    aListOfDuration: [Duration(seconds: 42), Duration(seconds: 43)],
    aListOfRegExp: [RegExp(r'Hello, world!'), RegExp(r'Hello, world!')],
    aListOfStackTrace: [StackTrace.current, StackTrace.current],
    aListOfUri: [
      Uri.parse('https://example.com'),
      Uri.parse('https://example.com')
    ],
    aListOfUriData: [
      UriData.fromString('Hello, world!'),
      UriData.fromString('Hello, world!')
    ],
    aListOfUint8List: [
      utf8.encode('Hello, world!'),
      utf8.encode('Hello, world!')
    ],
    aListOfSimpleStruct: [(), ()],
    aListOfSimpleClass: [SimpleClass(), SimpleClass()],
    aMapOfString: {'Hello': 'world'},
    aMapOfInt: {'Hello': 42},
    aMapOfDouble: {'Hello': 3.14},
    aMapOfBool: {'Hello': true},
    aMapOfEnum: {'Hello': MyEnum.a},
    aMapOfNull: {'Hello': null},
    aMapOfBigInt: {'Hello': BigInt.from(42)},
    aMapOfDateTime: {'Hello': DateTime.now()},
    aMapOfDuration: {'Hello': Duration(seconds: 42)},
    aMapOfRegExp: {'Hello': RegExp(r'Hello, world!')},
    aMapOfStackTrace: {'Hello': StackTrace.current},
    aMapOfUri: {'Hello': Uri.parse('https://example.com')},
    aMapOfUriData: {'Hello': UriData.fromString('Hello, world!')},
    aMapOfUint8List: {'Hello': utf8.encode('Hello, world!')},
    aMapOfSimpleStruct: {'Hello': (), 'World': ()},
    aMapOfSimpleClass: {'Hello': SimpleClass(), 'World': SimpleClass()},
  );
}

String? stringReturnNullable() {
  return null;
}

int? intReturnNullable() {
  return null;
}

double? doubleReturnNullable() {
  return null;
}

bool? boolReturnNullable() {
  return null;
}

Iterable<String>? iterableReturnNullable() {
  return null;
}

List<String>? listReturnNullable() {
  return null;
}

Map<String, String>? mapReturnNullable() {
  return null;
}

SimpleStruct? structReturnNullable() {
  return null;
}

ComplexStruct? complexReturnNullable() {
  return null;
}

SimpleClass? simpleClassReturnNullable() {
  return null;
}

ComplexClass? complexClassReturnNullable() {
  return null;
}

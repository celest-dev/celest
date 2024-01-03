/// Validates all permutations of return types.
library;

import 'dart:async';
import 'dart:convert';

import 'package:celest/celest.dart';

import 'parameter_types.dart';

Future<void> asyncVoidReturn(FunctionContext context) async {}

Future<String> asyncStringReturn(FunctionContext context) async {
  return 'Hello, world!';
}

Future<int> asyncIntReturn(FunctionContext context) async {
  return 42;
}

Future<double> asyncDoubleReturn(FunctionContext context) async {
  return 3.14;
}

Future<bool> asyncBoolReturn(FunctionContext context) async {
  return true;
}

Future<Iterable<String>> asyncIterableReturn(FunctionContext context) async {
  return ['Hello', 'world'];
}

Future<List<String>> asyncListReturn(FunctionContext context) async {
  return ['Hello', 'world'];
}

Future<Map<String, String>> asyncMapReturn(FunctionContext context) async {
  return {'Hello': 'world'};
}

Future<SimpleStruct> asyncStructReturn(FunctionContext context) async {
  return ();
}

Future<SimpleStruct?> asyncStructReturnNullable(FunctionContext context) async {
  return null;
}

Future<ComplexStruct> asyncComplexStructReturn(FunctionContext context) async {
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

Future<ComplexStruct?> asyncComplexStructReturnNullable(
  FunctionContext context,
) async {
  return null;
}

Future<ComplexClass> asyncComplexClassReturn(FunctionContext context) async {
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

Future<SimpleClass?> asyncClassReturnNullable(FunctionContext context) async {
  return null;
}

FutureOr<void> asyncOrVoidReturn(FunctionContext context) async {}

FutureOr<String> asyncOrStringReturn(FunctionContext context) async {
  return 'Hello, world!';
}

FutureOr<int> asyncOrIntReturn(FunctionContext context) async {
  return 42;
}

FutureOr<double> asyncOrDoubleReturn(FunctionContext context) async {
  return 3.14;
}

FutureOr<bool> asyncOrBoolReturn(FunctionContext context) async {
  return true;
}

FutureOr<Iterable<String>> asyncOrIterableReturn(
    FunctionContext context) async {
  return ['Hello', 'world'];
}

FutureOr<List<String>> asyncOrListReturn(FunctionContext context) async {
  return ['Hello', 'world'];
}

FutureOr<Map<String, String>> asyncOrMapReturn(FunctionContext context) async {
  return {'Hello': 'world'};
}

FutureOr<SimpleStruct> asyncOrStructReturn(FunctionContext context) async {
  return ();
}

FutureOr<ComplexStruct> asyncOrComplexStructReturn(
  FunctionContext context,
) async {
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

FutureOr<void>? asyncOrVoidReturnNullable(FunctionContext context) {
  return null;
}

FutureOr<String>? asyncOrStringReturnNullable(FunctionContext context) {
  return null;
}

FutureOr<int>? asyncOrIntReturnNullable(FunctionContext context) {
  return null;
}

FutureOr<double>? asyncOrDoubleReturnNullable(FunctionContext context) {
  return null;
}

FutureOr<bool>? asyncOrBoolReturnNullable(FunctionContext context) {
  return null;
}

FutureOr<Iterable<String>>? asyncOrIterableReturnNullable(
    FunctionContext context) {
  return null;
}

FutureOr<List<String>>? asyncOrListReturnNullable(FunctionContext context) {
  return null;
}

FutureOr<Map<String, String>>? asyncOrMapReturnNullable(
    FunctionContext context) {
  return null;
}

FutureOr<SimpleStruct>? asyncOrStructReturnNullable(FunctionContext context) {
  return null;
}

FutureOr<ComplexStruct>? asyncOrComplexStructReturnNullable(
    FunctionContext context) {
  return null;
}

FutureOr<SimpleClass>? asyncOrSimpleClassReturnNullable(
    FunctionContext context) {
  return null;
}

FutureOr<ComplexClass>? asyncOrComplexClassReturnNullable(
    FunctionContext context) {
  return null;
}

void voidReturn(FunctionContext context) {}

String stringReturn(FunctionContext context) {
  return 'Hello, world!';
}

int intReturn(FunctionContext context) {
  return 42;
}

double doubleReturn(FunctionContext context) {
  return 3.14;
}

bool boolReturn(FunctionContext context) {
  return true;
}

Iterable<String> iterableReturn(FunctionContext context) {
  return ['Hello', 'world'];
}

List<String> listReturn(FunctionContext context) {
  return ['Hello', 'world'];
}

Map<String, String> mapReturn(FunctionContext context) {
  return {'Hello': 'world'};
}

SimpleStruct structReturn(FunctionContext context) {
  return ();
}

ComplexStruct complexReturn(FunctionContext context) {
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

SimpleClass simpleClassReturn(FunctionContext context) {
  return SimpleClass();
}

ComplexClass complexClassReturn(FunctionContext context) {
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

String? stringReturnNullable(FunctionContext context) {
  return null;
}

int? intReturnNullable(FunctionContext context) {
  return null;
}

double? doubleReturnNullable(FunctionContext context) {
  return null;
}

bool? boolReturnNullable(FunctionContext context) {
  return null;
}

Iterable<String>? iterableReturnNullable(FunctionContext context) {
  return null;
}

List<String>? listReturnNullable(FunctionContext context) {
  return null;
}

Map<String, String>? mapReturnNullable(FunctionContext context) {
  return null;
}

SimpleStruct? structReturnNullable(FunctionContext context) {
  return null;
}

ComplexStruct? complexReturnNullable(FunctionContext context) {
  return null;
}

SimpleClass? simpleClassReturnNullable(FunctionContext context) {
  return null;
}

ComplexClass? complexClassReturnNullable(FunctionContext context) {
  return null;
}

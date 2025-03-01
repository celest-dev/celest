/// Validates all permutations of return types.
library;

import 'package:celest/celest.dart';
import 'dart:async';
import 'dart:convert';

import 'package:celest_backend/models/parameter_types.dart';

@cloud
Future<void> asyncVoidReturn() async {}

@cloud
Future<String> asyncStringReturn() async {
  return 'Hello, world!';
}

@cloud
Future<int> asyncIntReturn() async {
  return 42;
}

@cloud
Future<double> asyncDoubleReturn() async {
  return 3.14;
}

@cloud
Future<bool> asyncBoolReturn() async {
  return true;
}

@cloud
Future<Iterable<String>> asyncIterableReturn() async {
  return ['Hello', 'world'];
}

@cloud
Future<List<String>> asyncListReturn() async {
  return ['Hello', 'world'];
}

@cloud
Future<Map<String, String>> asyncMapReturn() async {
  return {'Hello': 'world'};
}

@cloud
Future<SimpleStruct> asyncStructReturn() async {
  return ();
}

@cloud
Future<SimpleStruct?> asyncStructReturnNullable() async {
  return null;
}

@cloud
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

@cloud
Future<ComplexStruct?> asyncComplexStructReturnNullable() async {
  return null;
}

@cloud
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

@cloud
Future<SimpleClass?> asyncClassReturnNullable() async {
  return null;
}

@cloud
FutureOr<void> asyncOrVoidReturn() async {}

@cloud
FutureOr<String> asyncOrStringReturn() async {
  return 'Hello, world!';
}

@cloud
FutureOr<int> asyncOrIntReturn() async {
  return 42;
}

@cloud
FutureOr<double> asyncOrDoubleReturn() async {
  return 3.14;
}

@cloud
FutureOr<bool> asyncOrBoolReturn() async {
  return true;
}

@cloud
FutureOr<Iterable<String>> asyncOrIterableReturn() async {
  return ['Hello', 'world'];
}

@cloud
FutureOr<List<String>> asyncOrListReturn() async {
  return ['Hello', 'world'];
}

@cloud
FutureOr<Map<String, String>> asyncOrMapReturn() async {
  return {'Hello': 'world'};
}

@cloud
FutureOr<SimpleStruct> asyncOrStructReturn() async {
  return ();
}

@cloud
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

@cloud
FutureOr<void>? asyncOrVoidReturnNullable() {
  return null;
}

@cloud
FutureOr<String>? asyncOrStringReturnNullable() {
  return null;
}

@cloud
FutureOr<int>? asyncOrIntReturnNullable() {
  return null;
}

@cloud
FutureOr<double>? asyncOrDoubleReturnNullable() {
  return null;
}

@cloud
FutureOr<bool>? asyncOrBoolReturnNullable() {
  return null;
}

@cloud
FutureOr<Iterable<String>>? asyncOrIterableReturnNullable() {
  return null;
}

@cloud
FutureOr<List<String>>? asyncOrListReturnNullable() {
  return null;
}

@cloud
FutureOr<Map<String, String>>? asyncOrMapReturnNullable() {
  return null;
}

@cloud
FutureOr<SimpleStruct>? asyncOrStructReturnNullable() {
  return null;
}

@cloud
FutureOr<ComplexStruct>? asyncOrComplexStructReturnNullable() {
  return null;
}

@cloud
FutureOr<SimpleClass>? asyncOrSimpleClassReturnNullable() {
  return null;
}

@cloud
FutureOr<ComplexClass>? asyncOrComplexClassReturnNullable() {
  return null;
}

@cloud
void voidReturn() {}

@cloud
String stringReturn() {
  return 'Hello, world!';
}

@cloud
int intReturn() {
  return 42;
}

@cloud
double doubleReturn() {
  return 3.14;
}

@cloud
bool boolReturn() {
  return true;
}

@cloud
Iterable<String> iterableReturn() {
  return ['Hello', 'world'];
}

@cloud
List<String> listReturn() {
  return ['Hello', 'world'];
}

@cloud
Map<String, String> mapReturn() {
  return {'Hello': 'world'};
}

@cloud
SimpleStruct structReturn() {
  return ();
}

@cloud
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

@cloud
SimpleClass simpleClassReturn() {
  return SimpleClass();
}

@cloud
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

@cloud
String? stringReturnNullable() {
  return null;
}

@cloud
int? intReturnNullable() {
  return null;
}

@cloud
double? doubleReturnNullable() {
  return null;
}

@cloud
bool? boolReturnNullable() {
  return null;
}

@cloud
Iterable<String>? iterableReturnNullable() {
  return null;
}

@cloud
List<String>? listReturnNullable() {
  return null;
}

@cloud
Map<String, String>? mapReturnNullable() {
  return null;
}

@cloud
SimpleStruct? structReturnNullable() {
  return null;
}

@cloud
ComplexStruct? complexReturnNullable() {
  return null;
}

@cloud
SimpleClass? simpleClassReturnNullable() {
  return null;
}

@cloud
ComplexClass? complexClassReturnNullable() {
  return null;
}

/// Tests that classes which wrap generic types are generated correctly when
/// those generic types follow the specifications of `json_serializable`, e.g.
/// having a `toJson` method with function parameters for mapping the
/// underlying types to JSON (Object Function(T) toJsonT).
library;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class SimpleClass {}

class GenericWrappers {
  GenericWrappers({
    required this.listOfString,
    required this.listOfUri,
    required this.listOfSimpleClass,
    required this.listOfListOfString,
    required this.listOfListOfUri,
    required this.listOfListOfSimpleClass,
    required this.mapOfString,
    required this.mapOfUri,
    required this.mapOfSimpleClass,
    required this.mapOfListOfString,
    required this.mapOfListOfUri,
    required this.mapOfListOfSimpleClass,
    required this.mapOfMapOfString,
    required this.mapOfMapOfUri,
    required this.mapOfMapOfSimpleClass,
  });

  final IList<String> listOfString;
  final IList<Uri> listOfUri;
  final IList<SimpleClass> listOfSimpleClass;
  final IList<IList<String>> listOfListOfString;
  final IList<IList<Uri>> listOfListOfUri;
  final IList<IList<SimpleClass>> listOfListOfSimpleClass;
  final IMap<String, String> mapOfString;
  final IMap<String, Uri> mapOfUri;
  final IMap<String, SimpleClass> mapOfSimpleClass;
  final IMap<String, IList<String>> mapOfListOfString;
  final IMap<String, IList<Uri>> mapOfListOfUri;
  final IMap<String, IList<SimpleClass>> mapOfListOfSimpleClass;
  final IMap<String, IMap<String, String>> mapOfMapOfString;
  final IMap<String, IMap<String, Uri>> mapOfMapOfUri;
  final IMap<String, IMap<String, SimpleClass>> mapOfMapOfSimpleClass;
}

GenericWrappers genericWrappers(GenericWrappers value) => value;
Future<GenericWrappers> genericWrappersAsync(GenericWrappers value) async =>
    value;
GenericWrappers genericWrapperParameters({
  required IList<String> listOfString,
  required IList<Uri> listOfUri,
  required IList<SimpleClass> listOfSimpleClass,
  required IList<IList<String>> listOfListOfString,
  required IList<IList<Uri>> listOfListOfUri,
  required IList<IList<SimpleClass>> listOfListOfSimpleClass,
  required IMap<String, String> mapOfString,
  required IMap<String, Uri> mapOfUri,
  required IMap<String, SimpleClass> mapOfSimpleClass,
  required IMap<String, IList<String>> mapOfListOfString,
  required IMap<String, IList<Uri>> mapOfListOfUri,
  required IMap<String, IList<SimpleClass>> mapOfListOfSimpleClass,
  required IMap<String, IMap<String, String>> mapOfMapOfString,
  required IMap<String, IMap<String, Uri>> mapOfMapOfUri,
  required IMap<String, IMap<String, SimpleClass>> mapOfMapOfSimpleClass,
}) {
  return GenericWrappers(
    listOfString: listOfString,
    listOfUri: listOfUri,
    listOfSimpleClass: listOfSimpleClass,
    listOfListOfString: listOfListOfString,
    listOfListOfUri: listOfListOfUri,
    listOfListOfSimpleClass: listOfListOfSimpleClass,
    mapOfString: mapOfString,
    mapOfUri: mapOfUri,
    mapOfSimpleClass: mapOfSimpleClass,
    mapOfListOfString: mapOfListOfString,
    mapOfListOfUri: mapOfListOfUri,
    mapOfListOfSimpleClass: mapOfListOfSimpleClass,
    mapOfMapOfString: mapOfMapOfString,
    mapOfMapOfUri: mapOfMapOfUri,
    mapOfMapOfSimpleClass: mapOfMapOfSimpleClass,
  );
}

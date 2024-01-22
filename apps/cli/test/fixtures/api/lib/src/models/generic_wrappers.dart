import 'package:celest_backend/models.dart';

export 'package:fast_immutable_collections/fast_immutable_collections.dart';

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

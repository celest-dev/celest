// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

library;

import 'dart:io';

import 'package:celest/celest.dart';
import 'package:celest_core/src/util/globals.dart';
import 'package:http/http.dart' as http;

import 'src/client/functions.dart';
import 'src/client/serializers.dart';

final Celest celest = Celest();

class Celest {
  late http.Client httpClient = http.Client();

  late final Uri baseUri = kIsWeb || !Platform.isAndroid
      ? Uri.parse('http://localhost:7777')
      : Uri.parse('http://10.0.2.2:7777');

  final functions = CelestFunctions();

  void init() {
    Serializers.instance.put(const EmptySerializer());
    Serializers.instance.put(const FieldsSerializer());
    Serializers.instance.put(const NamedFieldsSerializer());
    Serializers.instance.put(const MixedFieldsSerializer());
    Serializers.instance.put(const DefaultValuesSerializer());
    Serializers.instance.put(const NestedClassSerializer());
    Serializers.instance.put(const OnlyFromJsonSerializer());
    Serializers.instance.put(const OnlyToJsonSerializer());
    Serializers.instance.put(const OnlyToJsonWithDefaultsSerializer());
    Serializers.instance.put(const FromJsonAndToJsonSerializer());
    Serializers.instance.put(const NonMapToJsonSerializer());
    Serializers.instance.put(const NonMapToJsonWithDefaultsSerializer());
    Serializers.instance.put(const NonMapFromAndToJsonSerializer());
    Serializers.instance.put(const SimpleClassSerializer());
    Serializers.instance.put(const NodeSerializer());
    Serializers.instance.put(const ParentSerializer());
    Serializers.instance.put(const ChildSerializer());
    Serializers.instance.put(const SelfReferencingWrapperSerializer());
    Serializers.instance.put(const SelfReferencingSerializer());
    Serializers.instance.put(const SupportedExceptionTypeSerializer());
    Serializers.instance.put(const SupportedErrorTypeSerializer());
    Serializers.instance.put(const CustomExceptionSerializer());
    Serializers.instance.put(const CustomExceptionToFromJsonSerializer());
    Serializers.instance.put(const CustomErrorSerializer());
    Serializers.instance.put(const CustomErrorToFromJsonSerializer());
    Serializers.instance.put(const CustomErrorWithStackTraceSerializer());
    Serializers.instance.put(const IListStringSerializer());
    Serializers.instance.put(const IListUriSerializer());
    Serializers.instance.put(const IListSimpleClassSerializer());
    Serializers.instance.put(const IListIListStringSerializer());
    Serializers.instance.put(const IListIListUriSerializer());
    Serializers.instance.put(const IListIListSimpleClassSerializer());
    Serializers.instance.put(const IMapStringStringSerializer());
    Serializers.instance.put(const IMapStringUriSerializer());
    Serializers.instance.put(const IMapStringSimpleClassSerializer());
    Serializers.instance.put(const IMapStringIListStringSerializer());
    Serializers.instance.put(const IMapStringIListUriSerializer());
    Serializers.instance.put(const IMapStringIListSimpleClassSerializer());
    Serializers.instance.put(const IMapStringIMapStringStringSerializer());
    Serializers.instance.put(const IMapStringIMapStringUriSerializer());
    Serializers.instance.put(const IMapStringIMapStringSimpleClassSerializer());
    Serializers.instance.put(const GenericWrappersSerializer());
    Serializers.instance.put(const ExportableSerializer());
    Serializers.instance.put(const SerializableSerializer());
    Serializers.instance.put(const LiteralEnumSerializer());
    Serializers.instance.put(const Record$k7x4l9Serializer());
    Serializers.instance.put(const MyEnumSerializer());
    Serializers.instance.put(const SimpleStructSerializer());
    Serializers.instance.put(const ComplexStructSerializer());
    Serializers.instance.put(const ComplexClassSerializer());
    Serializers.instance.put(const Record$rmm4wtSerializer());
    Serializers.instance.put(const NamedFieldsRecordSerializer());
    Serializers.instance.put(const Record$wkpf9qSerializer());
    Serializers.instance.put(const NestedSerializer());
    Serializers.instance.put(const NullableNestedSerializer());
    Serializers.instance.put(const ShapeSerializer());
    Serializers.instance.put(const RectangleSerializer());
    Serializers.instance.put(const CircleSerializer());
    Serializers.instance.put(const ShapeWithInheritedCustomJsonSerializer());
    Serializers.instance
        .put(const RectangleWithInheritedCustomJsonSerializer());
    Serializers.instance.put(const CircleWithInheritedCustomJsonSerializer());
    Serializers.instance.put(const ShapeWithCustomJsonSerializer());
    Serializers.instance.put(const CircleWithCustomJsonSerializer());
    Serializers.instance.put(const RectangleWithCustomJsonSerializer());
    Serializers.instance.put(const ShapeWithOverriddenCustomJsonSerializer());
    Serializers.instance.put(const CircleWithOverriddenCustomJsonSerializer());
    Serializers.instance
        .put(const RectangleWithOverriddenCustomJsonSerializer());
    Serializers.instance.put(const OkResultShapeSerializer());
    Serializers.instance.put(const ErrResultStringSerializer());
    Serializers.instance.put(const ResultShapeStringSerializer());
    Serializers.instance.put(const SwappedResultStringShapeSerializer());
    Serializers.instance.put(const ResultStringShapeSerializer());
    Serializers.instance.put(const OkResultStringSerializer());
    Serializers.instance.put(const ErrResultShapeSerializer());
    Serializers.instance.put(const SwappedResultShapeStringSerializer());
    Serializers.instance.put(const OkResultSerializer());
    Serializers.instance.put(const ShapeExceptionSerializer());
    Serializers.instance.put(const BadShapeExceptionSerializer());
    Serializers.instance.put(const ResultSerializer());
    Serializers.instance.put(const ErrResultSerializer());
    Serializers.instance.put(const SwappedResultSerializer());
  }
}

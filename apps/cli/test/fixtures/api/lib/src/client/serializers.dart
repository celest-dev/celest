// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

import 'dart:typed_data';

import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart';
import 'package:celest_backend/src/models/classes.dart';
import 'package:celest_backend/src/models/cycles.dart';
import 'package:celest_backend/src/models/exceptions.dart';
import 'package:celest_backend/src/models/extension_types.dart';
import 'package:celest_backend/src/models/generic_wrappers.dart';
import 'package:celest_backend/src/models/metadata.dart';
import 'package:celest_backend/src/models/parameter_types.dart';
import 'package:celest_backend/src/models/records.dart';
import 'package:celest_backend/src/models/sealed_classes.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart';
import 'package:fast_immutable_collections/src/imap/imap.dart';

typedef Record$k7x4l9 = ({String a, String b, String c});
typedef Record$rmm4wt = ({String anotherField, String field});
typedef Record$wkpf9q = ({
  NamedFieldsRecord aliased,
  ({String anotherField, String field}) nonAliased
});

final class BadShapeExceptionSerializer extends Serializer<BadShapeException> {
  const BadShapeExceptionSerializer();

  @override
  BadShapeException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return BadShapeException(
        Serializers.instance.deserialize<Shape>(serialized[r'shape']));
  }

  @override
  Map<String, Object?> serialize(BadShapeException value) =>
      {r'shape': Serializers.instance.serialize<Shape>(value.shape)};
}

final class ChildSerializer extends Serializer<Child> {
  const ChildSerializer();

  @override
  Child deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Child((serialized[r'name'] as String));
  }

  @override
  Map<String, Object?> serialize(Child value) => {r'name': value.name};
}

final class CircleSerializer extends Serializer<Circle> {
  const CircleSerializer();

  @override
  Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Map<String, Object?> serialize(Circle value) => {r'radius': value.radius};
}

final class CircleWithCustomJsonSerializer
    extends Serializer<CircleWithCustomJson> {
  const CircleWithCustomJsonSerializer();

  @override
  CircleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return CircleWithCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(CircleWithCustomJson value) => value.toJson();
}

final class CircleWithInheritedCustomJsonSerializer
    extends Serializer<CircleWithInheritedCustomJson> {
  const CircleWithInheritedCustomJsonSerializer();

  @override
  CircleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'CircleWithInheritedCustomJson',
      ...serialized,
    }) as CircleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(CircleWithInheritedCustomJson value) =>
      value.toJson();
}

final class CircleWithOverriddenCustomJsonSerializer
    extends Serializer<CircleWithOverriddenCustomJson> {
  const CircleWithOverriddenCustomJsonSerializer();

  @override
  CircleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return CircleWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(CircleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class ComplexClassSerializer extends Serializer<ComplexClass> {
  const ComplexClassSerializer();

  @override
  ComplexClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return ComplexClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(ComplexClass value) => value.toJson();
}

final class ComplexStructSerializer extends Serializer<ComplexStruct> {
  const ComplexStructSerializer();

  @override
  ComplexStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aBigInt: Serializers.instance.deserialize<BigInt>(serialized[r'aBigInt']),
      aBool: (serialized[r'aBool'] as bool),
      aDateTime:
          Serializers.instance.deserialize<DateTime>(serialized[r'aDateTime']),
      aDouble: (serialized[r'aDouble'] as num).toDouble(),
      aDuration:
          Serializers.instance.deserialize<Duration>(serialized[r'aDuration']),
      aListOfBigInt: (serialized[r'aListOfBigInt'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<BigInt>(el))
          .toList(),
      aListOfBool: (serialized[r'aListOfBool'] as Iterable<Object?>)
          .map((el) => (el as bool))
          .toList(),
      aListOfDateTime: (serialized[r'aListOfDateTime'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<DateTime>(el))
          .toList(),
      aListOfDouble: (serialized[r'aListOfDouble'] as Iterable<Object?>)
          .map((el) => (el as num).toDouble())
          .toList(),
      aListOfDuration: (serialized[r'aListOfDuration'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<Duration>(el))
          .toList(),
      aListOfEnum: (serialized[r'aListOfEnum'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<MyEnum>(el))
          .toList(),
      aListOfInt: (serialized[r'aListOfInt'] as Iterable<Object?>)
          .map((el) => (el as num).toInt())
          .toList(),
      aListOfNull: (serialized[r'aListOfNull'] as Iterable<Object?>)
          .map((el) => (el as Null))
          .toList(),
      aListOfRegExp: (serialized[r'aListOfRegExp'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<RegExp>(el))
          .toList(),
      aListOfSimpleClass:
          (serialized[r'aListOfSimpleClass'] as Iterable<Object?>)
              .map((el) => Serializers.instance.deserialize<SimpleClass>(el))
              .toList(),
      aListOfSimpleStruct:
          (serialized[r'aListOfSimpleStruct'] as Iterable<Object?>)
              .map((el) => Serializers.instance.deserialize<SimpleStruct>(el))
              .toList(),
      aListOfStackTrace: (serialized[r'aListOfStackTrace'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<StackTrace>(el))
          .toList(),
      aListOfString: (serialized[r'aListOfString'] as Iterable<Object?>)
          .map((el) => (el as String))
          .toList(),
      aListOfUint8List: (serialized[r'aListOfUint8List'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<Uint8List>(el))
          .toList(),
      aListOfUri: (serialized[r'aListOfUri'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<Uri>(el))
          .toList(),
      aListOfUriData: (serialized[r'aListOfUriData'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<UriData>(el))
          .toList(),
      aMapOfBigInt: (serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.deserialize<BigInt>(value),
          )),
      aMapOfBool: (serialized[r'aMapOfBool'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as bool),
          )),
      aMapOfDateTime:
          (serialized[r'aMapOfDateTime'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance.deserialize<DateTime>(value),
              )),
      aMapOfDouble: (serialized[r'aMapOfDouble'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as num).toDouble(),
          )),
      aMapOfDuration:
          (serialized[r'aMapOfDuration'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance.deserialize<Duration>(value),
              )),
      aMapOfEnum: (serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.deserialize<MyEnum>(value),
          )),
      aMapOfInt: (serialized[r'aMapOfInt'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as num).toInt(),
          )),
      aMapOfNull: (serialized[r'aMapOfNull'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as Null),
          )),
      aMapOfRegExp: (serialized[r'aMapOfRegExp'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.deserialize<RegExp>(value),
          )),
      aMapOfSimpleClass:
          (serialized[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance.deserialize<SimpleClass>(value),
              )),
      aMapOfSimpleStruct:
          (serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance.deserialize<SimpleStruct>(value),
              )),
      aMapOfStackTrace:
          (serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance.deserialize<StackTrace>(value),
              )),
      aMapOfString: (serialized[r'aMapOfString'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            (value as String),
          )),
      aMapOfUint8List:
          (serialized[r'aMapOfUint8List'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance.deserialize<Uint8List>(value),
              )),
      aMapOfUri: (serialized[r'aMapOfUri'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.deserialize<Uri>(value),
          )),
      aMapOfUriData:
          (serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance.deserialize<UriData>(value),
              )),
      aNull: (serialized[r'aNull'] as Null),
      aRegExp: Serializers.instance.deserialize<RegExp>(serialized[r'aRegExp']),
      aSimpleClass: Serializers.instance
          .deserialize<SimpleClass>(serialized[r'aSimpleClass']),
      aSimpleStruct: Serializers.instance
          .deserialize<SimpleStruct>(serialized[r'aSimpleStruct']),
      aStackTrace: Serializers.instance
          .deserialize<StackTrace>(serialized[r'aStackTrace']),
      aString: (serialized[r'aString'] as String),
      aUint8List: Serializers.instance
          .deserialize<Uint8List>(serialized[r'aUint8List']),
      aUri: Serializers.instance.deserialize<Uri>(serialized[r'aUri']),
      aUriData:
          Serializers.instance.deserialize<UriData>(serialized[r'aUriData']),
      anEnum: Serializers.instance.deserialize<MyEnum>(serialized[r'anEnum']),
      anInt: (serialized[r'anInt'] as num).toInt(),
      anIterableOfSimpleClass:
          (serialized[r'anIterableOfSimpleClass'] as Iterable<Object?>)
              .map((el) => Serializers.instance.deserialize<SimpleClass>(el))
              .toList()
    );
  }

  @override
  Map<String, Object?> serialize(ComplexStruct value) => {
        r'aBigInt': Serializers.instance.serialize<BigInt>(value.aBigInt),
        r'aBool': value.aBool,
        r'aDateTime': Serializers.instance.serialize<DateTime>(value.aDateTime),
        r'aDouble': value.aDouble,
        r'aDuration': Serializers.instance.serialize<Duration>(value.aDuration),
        r'aListOfBigInt': value.aListOfBigInt
            .map((el) => Serializers.instance.serialize<BigInt>(el))
            .toList(),
        r'aListOfBool': value.aListOfBool,
        r'aListOfDateTime': value.aListOfDateTime
            .map((el) => Serializers.instance.serialize<DateTime>(el))
            .toList(),
        r'aListOfDouble': value.aListOfDouble,
        r'aListOfDuration': value.aListOfDuration
            .map((el) => Serializers.instance.serialize<Duration>(el))
            .toList(),
        r'aListOfEnum': value.aListOfEnum
            .map((el) => Serializers.instance.serialize<MyEnum>(el))
            .toList(),
        r'aListOfInt': value.aListOfInt,
        r'aListOfNull': value.aListOfNull,
        r'aListOfRegExp': value.aListOfRegExp
            .map((el) => Serializers.instance.serialize<RegExp>(el))
            .toList(),
        r'aListOfSimpleClass': value.aListOfSimpleClass
            .map((el) => Serializers.instance.serialize<SimpleClass>(el))
            .toList(),
        r'aListOfSimpleStruct': value.aListOfSimpleStruct
            .map((el) => Serializers.instance.serialize<SimpleStruct>(el))
            .toList(),
        r'aListOfStackTrace': value.aListOfStackTrace
            .map((el) => Serializers.instance.serialize<StackTrace>(el))
            .toList(),
        r'aListOfString': value.aListOfString,
        r'aListOfUint8List': value.aListOfUint8List
            .map((el) => Serializers.instance.serialize<Uint8List>(el))
            .toList(),
        r'aListOfUri': value.aListOfUri
            .map((el) => Serializers.instance.serialize<Uri>(el))
            .toList(),
        r'aListOfUriData': value.aListOfUriData
            .map((el) => Serializers.instance.serialize<UriData>(el))
            .toList(),
        r'aMapOfBigInt': value.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<BigInt>(value),
            )),
        r'aMapOfBool': value.aMapOfBool,
        r'aMapOfDateTime': value.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<DateTime>(value),
            )),
        r'aMapOfDouble': value.aMapOfDouble,
        r'aMapOfDuration': value.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<Duration>(value),
            )),
        r'aMapOfEnum': value.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<MyEnum>(value),
            )),
        r'aMapOfInt': value.aMapOfInt,
        r'aMapOfNull': value.aMapOfNull,
        r'aMapOfRegExp': value.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<RegExp>(value),
            )),
        r'aMapOfSimpleClass': value.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<SimpleClass>(value),
            )),
        r'aMapOfSimpleStruct': value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<SimpleStruct>(value),
            )),
        r'aMapOfStackTrace': value.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<StackTrace>(value),
            )),
        r'aMapOfString': value.aMapOfString,
        r'aMapOfUint8List': value.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<Uint8List>(value),
            )),
        r'aMapOfUri': value.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<Uri>(value),
            )),
        r'aMapOfUriData': value.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.serialize<UriData>(value),
            )),
        r'aNull': value.aNull,
        r'aRegExp': Serializers.instance.serialize<RegExp>(value.aRegExp),
        r'aSimpleClass':
            Serializers.instance.serialize<SimpleClass>(value.aSimpleClass),
        r'aSimpleStruct':
            Serializers.instance.serialize<SimpleStruct>(value.aSimpleStruct),
        r'aStackTrace':
            Serializers.instance.serialize<StackTrace>(value.aStackTrace),
        r'aString': value.aString,
        r'aUint8List':
            Serializers.instance.serialize<Uint8List>(value.aUint8List),
        r'aUri': Serializers.instance.serialize<Uri>(value.aUri),
        r'aUriData': Serializers.instance.serialize<UriData>(value.aUriData),
        r'anEnum': Serializers.instance.serialize<MyEnum>(value.anEnum),
        r'anInt': value.anInt,
        r'anIterableOfSimpleClass': value.anIterableOfSimpleClass
            .map((el) => Serializers.instance.serialize<SimpleClass>(el))
            .toList(),
      };
}

final class CustomErrorSerializer extends Serializer<CustomError> {
  const CustomErrorSerializer();

  @override
  CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return CustomError();
  }

  @override
  Map<String, Object?> serialize(CustomError value) => {
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

final class CustomErrorToFromJsonSerializer
    extends Serializer<CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(CustomErrorToFromJson value) => value.toJson();
}

final class CustomErrorWithStackTraceSerializer
    extends Serializer<CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return CustomErrorWithStackTrace(
        stackTrace: (Serializers.instance
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Map<String, Object?> serialize(CustomErrorWithStackTrace value) => {
        r'stackTrace':
            Serializers.instance.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

final class CustomExceptionSerializer extends Serializer<CustomException> {
  const CustomExceptionSerializer();

  @override
  CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return CustomException();
  }

  @override
  Map<String, Object?> serialize(CustomException value) => {
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

final class CustomExceptionToFromJsonSerializer
    extends Serializer<CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(CustomExceptionToFromJson value) =>
      value.toJson();
}

final class DefaultValuesSerializer extends Serializer<DefaultValues> {
  const DefaultValuesSerializer();

  @override
  DefaultValues deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return DefaultValues(
      field: ((serialized?[r'field'] as String?)) ?? 'default',
      nullableField: ((serialized?[r'nullableField'] as String?)) ?? null,
      nullableFieldWithDefault:
          ((serialized?[r'nullableFieldWithDefault'] as String?)) ?? 'default',
    );
  }

  @override
  Map<String, Object?> serialize(DefaultValues value) => {
        r'field': value.field,
        r'nullableField': value.nullableField,
        r'nullableFieldWithDefault': value.nullableFieldWithDefault,
        r'fieldWithoutInitializer': value.fieldWithoutInitializer,
      };
}

final class EmptySerializer extends Serializer<Empty> {
  const EmptySerializer();

  @override
  Empty deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return Empty();
  }

  @override
  Map<String, Object?> serialize(Empty value) => {};
}

final class ErrResultSerializer<E extends ShapeException>
    extends Serializer<ErrResult<E>> {
  const ErrResultSerializer();

  @override
  ErrResult<E> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ErrResult<E>(
        Serializers.instance.deserialize<E>(serialized[r'error']));
  }

  @override
  Map<String, Object?> serialize(ErrResult<E> value) =>
      {r'error': Serializers.instance.serialize<E>(value.error)};
}

final class ErrResultShapeSerializer extends Serializer<ErrResult<Shape>> {
  const ErrResultShapeSerializer();

  @override
  ErrResult<Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ErrResult<Shape>(
        Serializers.instance.deserialize<Shape>(serialized[r'error']));
  }

  @override
  Map<String, Object?> serialize(ErrResult<Shape> value) =>
      {r'error': Serializers.instance.serialize<Shape>(value.error)};
}

final class ErrResultStringSerializer extends Serializer<ErrResult<String>> {
  const ErrResultStringSerializer();

  @override
  ErrResult<String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ErrResult<String>((serialized[r'error'] as String));
  }

  @override
  Map<String, Object?> serialize(ErrResult<String> value) =>
      {r'error': value.error};
}

final class ExportableSerializer extends Serializer<Exportable> {
  const ExportableSerializer();

  @override
  Exportable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return Exportable();
  }

  @override
  Map<String, Object?> serialize(Exportable value) => {};
}

final class FieldsSerializer extends Serializer<Fields> {
  const FieldsSerializer();

  @override
  Fields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Fields(
      (serialized[r'superField'] as String),
      (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(Fields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class FromJsonAndToJsonSerializer extends Serializer<FromJsonAndToJson> {
  const FromJsonAndToJsonSerializer();

  @override
  FromJsonAndToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return FromJsonAndToJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(FromJsonAndToJson value) => value.toJson();
}

final class GenericWrappersSerializer extends Serializer<GenericWrappers> {
  const GenericWrappersSerializer();

  @override
  GenericWrappers deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return GenericWrappers(
      listOfString: Serializers.instance
          .deserialize<IList<String>>(serialized[r'listOfString']),
      listOfUri: Serializers.instance
          .deserialize<IList<Uri>>(serialized[r'listOfUri']),
      listOfSimpleClass: Serializers.instance
          .deserialize<IList<SimpleClass>>(serialized[r'listOfSimpleClass']),
      listOfListOfString: Serializers.instance
          .deserialize<IList<IList<String>>>(serialized[r'listOfListOfString']),
      listOfListOfUri: Serializers.instance
          .deserialize<IList<IList<Uri>>>(serialized[r'listOfListOfUri']),
      listOfListOfSimpleClass: Serializers.instance
          .deserialize<IList<IList<SimpleClass>>>(
              serialized[r'listOfListOfSimpleClass']),
      mapOfString: Serializers.instance
          .deserialize<IMap<String, String>>(serialized[r'mapOfString']),
      mapOfUri: Serializers.instance
          .deserialize<IMap<String, Uri>>(serialized[r'mapOfUri']),
      mapOfSimpleClass: Serializers.instance
          .deserialize<IMap<String, SimpleClass>>(
              serialized[r'mapOfSimpleClass']),
      mapOfListOfString: Serializers.instance
          .deserialize<IMap<String, IList<String>>>(
              serialized[r'mapOfListOfString']),
      mapOfListOfUri: Serializers.instance
          .deserialize<IMap<String, IList<Uri>>>(serialized[r'mapOfListOfUri']),
      mapOfListOfSimpleClass: Serializers.instance
          .deserialize<IMap<String, IList<SimpleClass>>>(
              serialized[r'mapOfListOfSimpleClass']),
      mapOfMapOfString: Serializers.instance
          .deserialize<IMap<String, IMap<String, String>>>(
              serialized[r'mapOfMapOfString']),
      mapOfMapOfUri: Serializers.instance
          .deserialize<IMap<String, IMap<String, Uri>>>(
              serialized[r'mapOfMapOfUri']),
      mapOfMapOfSimpleClass: Serializers.instance
          .deserialize<IMap<String, IMap<String, SimpleClass>>>(
              serialized[r'mapOfMapOfSimpleClass']),
    );
  }

  @override
  Map<String, Object?> serialize(GenericWrappers value) => {
        r'listOfString':
            Serializers.instance.serialize<IList<String>>(value.listOfString),
        r'listOfUri':
            Serializers.instance.serialize<IList<Uri>>(value.listOfUri),
        r'listOfSimpleClass': Serializers.instance
            .serialize<IList<SimpleClass>>(value.listOfSimpleClass),
        r'listOfListOfString': Serializers.instance
            .serialize<IList<IList<String>>>(value.listOfListOfString),
        r'listOfListOfUri': Serializers.instance
            .serialize<IList<IList<Uri>>>(value.listOfListOfUri),
        r'listOfListOfSimpleClass': Serializers.instance
            .serialize<IList<IList<SimpleClass>>>(
                value.listOfListOfSimpleClass),
        r'mapOfString': Serializers.instance
            .serialize<IMap<String, String>>(value.mapOfString),
        r'mapOfUri':
            Serializers.instance.serialize<IMap<String, Uri>>(value.mapOfUri),
        r'mapOfSimpleClass': Serializers.instance
            .serialize<IMap<String, SimpleClass>>(value.mapOfSimpleClass),
        r'mapOfListOfString': Serializers.instance
            .serialize<IMap<String, IList<String>>>(value.mapOfListOfString),
        r'mapOfListOfUri': Serializers.instance
            .serialize<IMap<String, IList<Uri>>>(value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': Serializers.instance
            .serialize<IMap<String, IList<SimpleClass>>>(
                value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': Serializers.instance
            .serialize<IMap<String, IMap<String, String>>>(
                value.mapOfMapOfString),
        r'mapOfMapOfUri': Serializers.instance
            .serialize<IMap<String, IMap<String, Uri>>>(value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': Serializers.instance
            .serialize<IMap<String, IMap<String, SimpleClass>>>(
                value.mapOfMapOfSimpleClass),
      };
}

final class IListIListSimpleClassSerializer
    extends Serializer<IList<IList<SimpleClass>>> {
  const IListIListSimpleClassSerializer();

  @override
  IList<IList<SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return IList<IList<SimpleClass>>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<IList<SimpleClass>>(value),
    );
  }

  @override
  Object serialize(IList<IList<SimpleClass>> value) => value.toJson(
      (value) => Serializers.instance.serialize<IList<SimpleClass>>(value));
}

final class IListIListStringSerializer
    extends Serializer<IList<IList<String>>> {
  const IListIListStringSerializer();

  @override
  IList<IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return IList<IList<String>>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<IList<String>>(value),
    );
  }

  @override
  Object serialize(IList<IList<String>> value) => value
      .toJson((value) => Serializers.instance.serialize<IList<String>>(value));
}

final class IListIListUriSerializer extends Serializer<IList<IList<Uri>>> {
  const IListIListUriSerializer();

  @override
  IList<IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return IList<IList<Uri>>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<IList<Uri>>(value),
    );
  }

  @override
  Object serialize(IList<IList<Uri>> value) => value
      .toJson((value) => Serializers.instance.serialize<IList<Uri>>(value));
}

final class IListSimpleClassSerializer extends Serializer<IList<SimpleClass>> {
  const IListSimpleClassSerializer();

  @override
  IList<SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return IList<SimpleClass>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<SimpleClass>(value),
    );
  }

  @override
  Object serialize(IList<SimpleClass> value) => value
      .toJson((value) => Serializers.instance.serialize<SimpleClass>(value));
}

final class IListStringSerializer extends Serializer<IList<String>> {
  const IListStringSerializer();

  @override
  IList<String> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return IList<String>.fromJson(
      serialized,
      (value) => (value as String),
    );
  }

  @override
  Object serialize(IList<String> value) => value.toJson((value) => value);
}

final class IListUriSerializer extends Serializer<IList<Uri>> {
  const IListUriSerializer();

  @override
  IList<Uri> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return IList<Uri>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(IList<Uri> value) =>
      value.toJson((value) => Serializers.instance.serialize<Uri>(value));
}

final class IMapStringIListSimpleClassSerializer
    extends Serializer<IMap<String, IList<SimpleClass>>> {
  const IMapStringIListSimpleClassSerializer();

  @override
  IMap<String, IList<SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, IList<SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<IList<SimpleClass>>(value),
    );
  }

  @override
  Object serialize(IMap<String, IList<SimpleClass>> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<IList<SimpleClass>>(value),
      );
}

final class IMapStringIListStringSerializer
    extends Serializer<IMap<String, IList<String>>> {
  const IMapStringIListStringSerializer();

  @override
  IMap<String, IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, IList<String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<IList<String>>(value),
    );
  }

  @override
  Object serialize(IMap<String, IList<String>> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<IList<String>>(value),
      );
}

final class IMapStringIListUriSerializer
    extends Serializer<IMap<String, IList<Uri>>> {
  const IMapStringIListUriSerializer();

  @override
  IMap<String, IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, IList<Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<IList<Uri>>(value),
    );
  }

  @override
  Object serialize(IMap<String, IList<Uri>> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<IList<Uri>>(value),
      );
}

final class IMapStringIMapStringSimpleClassSerializer
    extends Serializer<IMap<String, IMap<String, SimpleClass>>> {
  const IMapStringIMapStringSimpleClassSerializer();

  @override
  IMap<String, IMap<String, SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, IMap<String, SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          Serializers.instance.deserialize<IMap<String, SimpleClass>>(value),
    );
  }

  @override
  Object serialize(IMap<String, IMap<String, SimpleClass>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            Serializers.instance.serialize<IMap<String, SimpleClass>>(value),
      );
}

final class IMapStringIMapStringStringSerializer
    extends Serializer<IMap<String, IMap<String, String>>> {
  const IMapStringIMapStringStringSerializer();

  @override
  IMap<String, IMap<String, String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, IMap<String, String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<IMap<String, String>>(value),
    );
  }

  @override
  Object serialize(IMap<String, IMap<String, String>> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<IMap<String, String>>(value),
      );
}

final class IMapStringIMapStringUriSerializer
    extends Serializer<IMap<String, IMap<String, Uri>>> {
  const IMapStringIMapStringUriSerializer();

  @override
  IMap<String, IMap<String, Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, IMap<String, Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<IMap<String, Uri>>(value),
    );
  }

  @override
  Object serialize(IMap<String, IMap<String, Uri>> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<IMap<String, Uri>>(value),
      );
}

final class IMapStringSimpleClassSerializer
    extends Serializer<IMap<String, SimpleClass>> {
  const IMapStringSimpleClassSerializer();

  @override
  IMap<String, SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, SimpleClass>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<SimpleClass>(value),
    );
  }

  @override
  Object serialize(IMap<String, SimpleClass> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<SimpleClass>(value),
      );
}

final class IMapStringStringSerializer
    extends Serializer<IMap<String, String>> {
  const IMapStringStringSerializer();

  @override
  IMap<String, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, String>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => (value as String),
    );
  }

  @override
  Object serialize(IMap<String, String> value) => value.toJson(
        (value) => value,
        (value) => value,
      );
}

final class IMapStringUriSerializer extends Serializer<IMap<String, Uri>> {
  const IMapStringUriSerializer();

  @override
  IMap<String, Uri> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return IMap<String, Uri>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(IMap<String, Uri> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<Uri>(value),
      );
}

final class LiteralEnumSerializer extends Serializer<LiteralEnum> {
  const LiteralEnumSerializer();

  @override
  LiteralEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return LiteralEnum.values.byName(serialized);
  }

  @override
  String serialize(LiteralEnum value) => value.name;
}

final class MixedFieldsSerializer extends Serializer<MixedFields> {
  const MixedFieldsSerializer();

  @override
  MixedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return MixedFields(
      (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(MixedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class MyEnumSerializer extends Serializer<MyEnum> {
  const MyEnumSerializer();

  @override
  MyEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return MyEnum.values.byName(serialized);
  }

  @override
  String serialize(MyEnum value) => value.name;
}

final class NamedFieldsRecordSerializer extends Serializer<NamedFieldsRecord> {
  const NamedFieldsRecordSerializer();

  @override
  NamedFieldsRecord deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(NamedFieldsRecord value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

final class NamedFieldsSerializer extends Serializer<NamedFields> {
  const NamedFieldsSerializer();

  @override
  NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return NamedFields(
      superField: (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(NamedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class NestedClassSerializer extends Serializer<NestedClass> {
  const NestedClassSerializer();

  @override
  NestedClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return NestedClass(
      Serializers.instance.deserialize<Fields>(serialized[r'fields']),
      Serializers.instance.deserialize<Fields?>(serialized[r'nullableFields']),
    );
  }

  @override
  Map<String, Object?> serialize(NestedClass value) => {
        r'fields': Serializers.instance.serialize<Fields>(value.fields),
        r'nullableFields':
            Serializers.instance.serialize<Fields?>(value.nullableFields),
      };
}

final class NestedSerializer extends Serializer<Nested> {
  const NestedSerializer();

  @override
  Nested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: Serializers.instance
          .deserialize<NamedFieldsRecord>(serialized[r'namedFields'])
    );
  }

  @override
  Map<String, Object?> serialize(Nested value) => {
        r'namedFields':
            Serializers.instance.serialize<NamedFieldsRecord>(value.namedFields)
      };
}

final class NodeSerializer extends Serializer<Node> {
  const NodeSerializer();

  @override
  Node deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Parent') {
      return Serializers.instance.deserialize<Parent>(serialized);
    }
    if (serialized[r'$type'] == r'Child') {
      return Serializers.instance.deserialize<Child>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Node')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(Node value) {
    if (value is Parent) {
      return {
        ...(Serializers.instance.serialize<Parent>(value)
            as Map<String, Object?>),
        r'$type': r'Parent',
      };
    }
    if (value is Child) {
      return {
        ...(Serializers.instance.serialize<Child>(value)
            as Map<String, Object?>),
        r'$type': r'Child',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Node')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class NonMapFromAndToJsonSerializer
    extends Serializer<NonMapFromAndToJson> {
  const NonMapFromAndToJsonSerializer();

  @override
  NonMapFromAndToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return NonMapFromAndToJson.fromJson(serialized);
  }

  @override
  String serialize(NonMapFromAndToJson value) => value.toJson();
}

final class NonMapToJsonSerializer extends Serializer<NonMapToJson> {
  const NonMapToJsonSerializer();

  @override
  NonMapToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return NonMapToJson((serialized as String));
  }

  @override
  String serialize(NonMapToJson value) => value.toJson();
}

final class NonMapToJsonWithDefaultsSerializer
    extends Serializer<NonMapToJsonWithDefaults> {
  const NonMapToJsonWithDefaultsSerializer();

  @override
  NonMapToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return NonMapToJsonWithDefaults(((serialized as String?)) ?? 'default');
  }

  @override
  String serialize(NonMapToJsonWithDefaults value) => value.toJson();
}

final class NullableNestedSerializer extends Serializer<NullableNested> {
  const NullableNestedSerializer();

  @override
  NullableNested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: Serializers.instance
          .deserialize<NamedFieldsRecord?>(serialized[r'namedFields'])
    );
  }

  @override
  Map<String, Object?> serialize(NullableNested value) => {
        r'namedFields': Serializers.instance
            .serialize<NamedFieldsRecord?>(value.namedFields)
      };
}

final class OkResultSerializer<T extends Shape>
    extends Serializer<OkResult<T>> {
  const OkResultSerializer();

  @override
  OkResult<T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return OkResult<T>(
        Serializers.instance.deserialize<T>(serialized[r'data']));
  }

  @override
  Map<String, Object?> serialize(OkResult<T> value) =>
      {r'data': Serializers.instance.serialize<T>(value.data)};
}

final class OkResultShapeSerializer extends Serializer<OkResult<Shape>> {
  const OkResultShapeSerializer();

  @override
  OkResult<Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return OkResult<Shape>(
        Serializers.instance.deserialize<Shape>(serialized[r'data']));
  }

  @override
  Map<String, Object?> serialize(OkResult<Shape> value) =>
      {r'data': Serializers.instance.serialize<Shape>(value.data)};
}

final class OkResultStringSerializer extends Serializer<OkResult<String>> {
  const OkResultStringSerializer();

  @override
  OkResult<String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return OkResult<String>((serialized[r'data'] as String));
  }

  @override
  Map<String, Object?> serialize(OkResult<String> value) =>
      {r'data': value.data};
}

final class OnlyFromJsonSerializer extends Serializer<OnlyFromJson> {
  const OnlyFromJsonSerializer();

  @override
  OnlyFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return OnlyFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(OnlyFromJson value) => {r'field': value.field};
}

final class OnlyToJsonSerializer extends Serializer<OnlyToJson> {
  const OnlyToJsonSerializer();

  @override
  OnlyToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return OnlyToJson((serialized[r'field'] as String));
  }

  @override
  Map<String, Object?> serialize(OnlyToJson value) => value.toJson();
}

final class OnlyToJsonWithDefaultsSerializer
    extends Serializer<OnlyToJsonWithDefaults> {
  const OnlyToJsonWithDefaultsSerializer();

  @override
  OnlyToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return OnlyToJsonWithDefaults(
        ((serialized?[r'field'] as String?)) ?? 'default');
  }

  @override
  Map<String, Object?> serialize(OnlyToJsonWithDefaults value) =>
      value.toJson();
}

final class ParentSerializer extends Serializer<Parent> {
  const ParentSerializer();

  @override
  Parent deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Parent(
      (serialized[r'name'] as String),
      (serialized[r'children'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<Node>(el))
          .toList(),
    );
  }

  @override
  Map<String, Object?> serialize(Parent value) => {
        r'name': value.name,
        r'children': value.children
            .map((el) => Serializers.instance.serialize<Node>(el))
            .toList(),
      };
}

final class Record$k7x4l9Serializer extends Serializer<Record$k7x4l9> {
  const Record$k7x4l9Serializer();

  @override
  Record$k7x4l9 deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      a: (serialized[r'a'] as String),
      b: (serialized[r'b'] as String),
      c: (serialized[r'c'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$k7x4l9 value) => {
        r'a': value.a,
        r'b': value.b,
        r'c': value.c,
      };
}

final class Record$rmm4wtSerializer extends Serializer<Record$rmm4wt> {
  const Record$rmm4wtSerializer();

  @override
  Record$rmm4wt deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Map<String, Object?> serialize(Record$rmm4wt value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

final class Record$wkpf9qSerializer extends Serializer<Record$wkpf9q> {
  const Record$wkpf9qSerializer();

  @override
  Record$wkpf9q deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aliased: Serializers.instance
          .deserialize<NamedFieldsRecord>(serialized[r'aliased']),
      nonAliased: Serializers.instance
          .deserialize<({String anotherField, String field})>(
              serialized[r'nonAliased'])
    );
  }

  @override
  Map<String, Object?> serialize(Record$wkpf9q value) => {
        r'aliased':
            Serializers.instance.serialize<NamedFieldsRecord>(value.aliased),
        r'nonAliased': Serializers.instance
            .serialize<({String anotherField, String field})>(value.nonAliased),
      };
}

final class RectangleSerializer extends Serializer<Rectangle> {
  const RectangleSerializer();

  @override
  Rectangle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Rectangle(
      (serialized[r'width'] as num).toDouble(),
      (serialized[r'height'] as num).toDouble(),
    );
  }

  @override
  Map<String, Object?> serialize(Rectangle value) => {
        r'width': value.width,
        r'height': value.height,
      };
}

final class RectangleWithCustomJsonSerializer
    extends Serializer<RectangleWithCustomJson> {
  const RectangleWithCustomJsonSerializer();

  @override
  RectangleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return RectangleWithCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(RectangleWithCustomJson value) =>
      value.toJson();
}

final class RectangleWithInheritedCustomJsonSerializer
    extends Serializer<RectangleWithInheritedCustomJson> {
  const RectangleWithInheritedCustomJsonSerializer();

  @override
  RectangleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'RectangleWithInheritedCustomJson',
      ...serialized,
    }) as RectangleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(RectangleWithInheritedCustomJson value) =>
      value.toJson();
}

final class RectangleWithOverriddenCustomJsonSerializer
    extends Serializer<RectangleWithOverriddenCustomJson> {
  const RectangleWithOverriddenCustomJsonSerializer();

  @override
  RectangleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (ShapeWithOverriddenCustomJson.fromJson({
      r'$type': r'RectangleWithOverriddenCustomJson',
      ...serialized,
    }) as RectangleWithOverriddenCustomJson);
  }

  @override
  Map<String, Object?> serialize(RectangleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class ResultSerializer<T extends Shape, E extends ShapeException>
    extends Serializer<Result<T, E>> {
  const ResultSerializer();

  @override
  Result<T, E> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return Serializers.instance.deserialize<OkResult<T>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance.deserialize<ErrResult<E>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance.deserialize<SwappedResult<E, T>>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(Result<T, E> value) {
    if (value is OkResult<T>) {
      return {
        ...(Serializers.instance.serialize<OkResult<T>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is ErrResult<E>) {
      return {
        ...(Serializers.instance.serialize<ErrResult<E>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value is SwappedResult<E, T>) {
      return {
        ...(Serializers.instance.serialize<SwappedResult<E, T>>(value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class ResultShapeStringSerializer
    extends Serializer<Result<Shape, String>> {
  const ResultShapeStringSerializer();

  @override
  Result<Shape, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return Serializers.instance.deserialize<OkResult<Shape>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance.deserialize<ErrResult<String>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance
          .deserialize<SwappedResult<String, Shape>>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(Result<Shape, String> value) {
    if (value is OkResult<Shape>) {
      return {
        ...(Serializers.instance.serialize<OkResult<Shape>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is ErrResult<String>) {
      return {
        ...(Serializers.instance.serialize<ErrResult<String>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value is SwappedResult<String, Shape>) {
      return {
        ...(Serializers.instance.serialize<SwappedResult<String, Shape>>(value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class ResultStringShapeSerializer
    extends Serializer<Result<String, Shape>> {
  const ResultStringShapeSerializer();

  @override
  Result<String, Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return Serializers.instance.deserialize<OkResult<String>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance.deserialize<ErrResult<Shape>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance
          .deserialize<SwappedResult<Shape, String>>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(Result<String, Shape> value) {
    if (value is OkResult<String>) {
      return {
        ...(Serializers.instance.serialize<OkResult<String>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is ErrResult<Shape>) {
      return {
        ...(Serializers.instance.serialize<ErrResult<Shape>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value is SwappedResult<Shape, String>) {
      return {
        ...(Serializers.instance.serialize<SwappedResult<Shape, String>>(value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class SelfReferencingSerializer extends Serializer<SelfReferencing> {
  const SelfReferencingSerializer();

  @override
  SelfReferencing deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return SelfReferencing(
      value: (Serializers.instance
              .deserialize<SelfReferencing?>(serialized[r'value'])) ??
          null,
      wrapper: (Serializers.instance
              .deserialize<SelfReferencingWrapper?>(serialized[r'wrapper'])) ??
          null,
      list: (serialized[r'list'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<SelfReferencing>(el))
          .toList(),
    );
  }

  @override
  Map<String, Object?> serialize(SelfReferencing value) => {
        r'value': Serializers.instance.serialize<SelfReferencing?>(value.value),
        r'wrapper': Serializers.instance
            .serialize<SelfReferencingWrapper?>(value.wrapper),
        r'list': value.list
            .map((el) => Serializers.instance.serialize<SelfReferencing>(el))
            .toList(),
      };
}

final class SelfReferencingWrapperSerializer
    extends Serializer<SelfReferencingWrapper> {
  const SelfReferencingWrapperSerializer();

  @override
  SelfReferencingWrapper deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return SelfReferencingWrapper(
        value: Serializers.instance
            .deserialize<SelfReferencing>(serialized[r'value']));
  }

  @override
  Map<String, Object?> serialize(SelfReferencingWrapper value) =>
      {r'value': Serializers.instance.serialize<SelfReferencing>(value.value)};
}

final class SerializableSerializer extends Serializer<Serializable> {
  const SerializableSerializer();

  @override
  Serializable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return Serializable(((serialized?[r'type'] as String?)) ?? null);
  }

  @override
  Map<String, Object?> serialize(Serializable value) => {r'type': value.type};
}

final class ShapeExceptionSerializer extends Serializer<ShapeException> {
  const ShapeExceptionSerializer();

  @override
  ShapeException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'BadShapeException') {
      return Serializers.instance.deserialize<BadShapeException>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeException')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(ShapeException value) {
    if (value is BadShapeException) {
      return {
        ...(Serializers.instance.serialize<BadShapeException>(value)
            as Map<String, Object?>),
        r'$type': r'BadShapeException',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeException')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class ShapeSerializer extends Serializer<Shape> {
  const ShapeSerializer();

  @override
  Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Rectangle') {
      return Serializers.instance.deserialize<Rectangle>(serialized);
    }
    if (serialized[r'$type'] == r'Circle') {
      return Serializers.instance.deserialize<Circle>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(Shape value) {
    if (value is Rectangle) {
      return {
        ...(Serializers.instance.serialize<Rectangle>(value)
            as Map<String, Object?>),
        r'$type': r'Rectangle',
      };
    }
    if (value is Circle) {
      return {
        ...(Serializers.instance.serialize<Circle>(value)
            as Map<String, Object?>),
        r'$type': r'Circle',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class ShapeWithCustomJsonSerializer
    extends Serializer<ShapeWithCustomJson> {
  const ShapeWithCustomJsonSerializer();

  @override
  ShapeWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'CircleWithCustomJson') {
      return Serializers.instance.deserialize<CircleWithCustomJson>(serialized);
    }
    if (serialized[r'$type'] == r'RectangleWithCustomJson') {
      return Serializers.instance
          .deserialize<RectangleWithCustomJson>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeWithCustomJson')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Map<String, Object?> serialize(ShapeWithCustomJson value) {
    if (value is CircleWithCustomJson) {
      return {
        ...(Serializers.instance.serialize<CircleWithCustomJson>(value)
            as Map<String, Object?>),
        r'$type': r'CircleWithCustomJson',
      };
    }
    if (value is RectangleWithCustomJson) {
      return {
        ...(Serializers.instance.serialize<RectangleWithCustomJson>(value)
            as Map<String, Object?>),
        r'$type': r'RectangleWithCustomJson',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeWithCustomJson')
          ..write(': ')
          ..write(value.runtimeType))
        .toString());
  }
}

final class ShapeWithInheritedCustomJsonSerializer
    extends Serializer<ShapeWithInheritedCustomJson> {
  const ShapeWithInheritedCustomJsonSerializer();

  @override
  ShapeWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ShapeWithInheritedCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(ShapeWithInheritedCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          RectangleWithInheritedCustomJson() =>
            r'RectangleWithInheritedCustomJson',
          CircleWithInheritedCustomJson() => r'CircleWithInheritedCustomJson',
        },
      };
}

final class ShapeWithOverriddenCustomJsonSerializer
    extends Serializer<ShapeWithOverriddenCustomJson> {
  const ShapeWithOverriddenCustomJsonSerializer();

  @override
  ShapeWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return ShapeWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(ShapeWithOverriddenCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          CircleWithOverriddenCustomJson() => r'CircleWithOverriddenCustomJson',
          RectangleWithOverriddenCustomJson() =>
            r'RectangleWithOverriddenCustomJson',
        },
      };
}

final class SimpleClassSerializer extends Serializer<SimpleClass> {
  const SimpleClassSerializer();

  @override
  SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return SimpleClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(SimpleClass value) => value.toJson();
}

final class SimpleStructSerializer extends Serializer<SimpleStruct> {
  const SimpleStructSerializer();

  @override
  SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(SimpleStruct value) => {};
}

final class StringXFromJsonImplSerializer
    extends Serializer<StringXFromJsonImpl> {
  const StringXFromJsonImplSerializer();

  @override
  StringXFromJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXFromJsonImpl.fromJson(serialized);
  }

  @override
  String serialize(StringXFromJsonImpl value) => value;
}

final class StringXFromJsonSerializer extends Serializer<StringXFromJson> {
  const StringXFromJsonSerializer();

  @override
  StringXFromJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXFromJson.fromJson(serialized);
  }

  @override
  String serialize(StringXFromJson value) => value.s;
}

final class StringXImplSerializer extends Serializer<StringXImpl> {
  const StringXImplSerializer();

  @override
  StringXImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXImpl((serialized as String));
  }

  @override
  String serialize(StringXImpl value) => value;
}

final class StringXPrivateCtorImplSerializer
    extends Serializer<StringXPrivateCtorImpl> {
  const StringXPrivateCtorImplSerializer();

  @override
  StringXPrivateCtorImpl deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return ((serialized as String) as StringXPrivateCtorImpl);
  }

  @override
  String serialize(StringXPrivateCtorImpl value) => value;
}

final class StringXPrivateCtorSerializer
    extends Serializer<StringXPrivateCtor> {
  const StringXPrivateCtorSerializer();

  @override
  StringXPrivateCtor deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return ((serialized as String) as StringXPrivateCtor);
  }

  @override
  String serialize(StringXPrivateCtor value) => value.s;
}

final class StringXPrivateFieldImplSerializer
    extends Serializer<StringXPrivateFieldImpl> {
  const StringXPrivateFieldImplSerializer();

  @override
  StringXPrivateFieldImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXPrivateFieldImpl((serialized as String));
  }

  @override
  String serialize(StringXPrivateFieldImpl value) => value;
}

final class StringXPrivateFieldSerializer
    extends Serializer<StringXPrivateField> {
  const StringXPrivateFieldSerializer();

  @override
  StringXPrivateField deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXPrivateField((serialized as String));
  }

  @override
  String serialize(StringXPrivateField value) => (value as String);
}

final class StringXSerializer extends Serializer<StringX> {
  const StringXSerializer();

  @override
  StringX deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringX((serialized as String));
  }

  @override
  String serialize(StringX value) => value.s;
}

final class StringXToFromJsonSerializer extends Serializer<StringXToFromJson> {
  const StringXToFromJsonSerializer();

  @override
  StringXToFromJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXToFromJson.fromJson(serialized);
  }

  @override
  String serialize(StringXToFromJson value) => value.toJson();
}

final class StringXToJsonImplSerializer extends Serializer<StringXToJsonImpl> {
  const StringXToJsonImplSerializer();

  @override
  StringXToJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXToJsonImpl((serialized as String));
  }

  @override
  String serialize(StringXToJsonImpl value) => value.toJson();
}

final class StringXToJsonSerializer extends Serializer<StringXToJson> {
  const StringXToJsonSerializer();

  @override
  StringXToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return StringXToJson((serialized as String));
  }

  @override
  String serialize(StringXToJson value) => value.toJson();
}

final class SupportedErrorTypeSerializer
    extends Serializer<SupportedErrorType> {
  const SupportedErrorTypeSerializer();

  @override
  SupportedErrorType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return SupportedErrorType.values.byName(serialized);
  }

  @override
  String serialize(SupportedErrorType value) => value.name;
}

final class SupportedExceptionTypeSerializer
    extends Serializer<SupportedExceptionType> {
  const SupportedExceptionTypeSerializer();

  @override
  SupportedExceptionType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return SupportedExceptionType.values.byName(serialized);
  }

  @override
  String serialize(SupportedExceptionType value) => value.name;
}

final class SwappedResultSerializer<E extends ShapeException, T extends Shape>
    extends Serializer<SwappedResult<E, T>> {
  const SwappedResultSerializer();

  @override
  SwappedResult<E, T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return SwappedResult<E, T>(
        Serializers.instance.deserialize<Result<E, T>>(serialized[r'result']));
  }

  @override
  Map<String, Object?> serialize(SwappedResult<E, T> value) =>
      {r'result': Serializers.instance.serialize<Result<E, T>>(value.result)};
}

final class SwappedResultShapeStringSerializer
    extends Serializer<SwappedResult<Shape, String>> {
  const SwappedResultShapeStringSerializer();

  @override
  SwappedResult<Shape, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return SwappedResult<Shape, String>(Serializers.instance
        .deserialize<Result<Shape, String>>(serialized[r'result']));
  }

  @override
  Map<String, Object?> serialize(SwappedResult<Shape, String> value) => {
        r'result':
            Serializers.instance.serialize<Result<Shape, String>>(value.result)
      };
}

final class SwappedResultStringShapeSerializer
    extends Serializer<SwappedResult<String, Shape>> {
  const SwappedResultStringShapeSerializer();

  @override
  SwappedResult<String, Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return SwappedResult<String, Shape>(Serializers.instance
        .deserialize<Result<String, Shape>>(serialized[r'result']));
  }

  @override
  Map<String, Object?> serialize(SwappedResult<String, Shape> value) => {
        r'result':
            Serializers.instance.serialize<Result<String, Shape>>(value.result)
      };
}

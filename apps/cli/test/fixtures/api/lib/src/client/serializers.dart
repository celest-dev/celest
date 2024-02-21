// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _$typed_data;

import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions.dart' as _$exceptions;
import 'package:celest_backend/src/models/classes.dart' as _$classes;
import 'package:celest_backend/src/models/cycles.dart' as _$cycles;
import 'package:celest_backend/src/models/exceptions.dart' as _$exceptions;
import 'package:celest_backend/src/models/extension_types.dart'
    as _$extension_types;
import 'package:celest_backend/src/models/generic_wrappers.dart'
    as _$generic_wrappers;
import 'package:celest_backend/src/models/metadata.dart' as _$metadata;
import 'package:celest_backend/src/models/parameter_types.dart'
    as _$parameter_types;
import 'package:celest_backend/src/models/records.dart' as _$records;
import 'package:celest_backend/src/models/sealed_classes.dart'
    as _$sealed_classes;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _$ilist;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _$imap;

typedef Record$k7x4l9 = ({String a, String b, String c});
typedef Record$rmm4wt = ({String anotherField, String field});
typedef Record$wkpf9q = ({
  _$records.NamedFieldsRecord aliased,
  ({String anotherField, String field}) nonAliased
});

final class BadRequestExceptionSerializer
    extends Serializer<BadRequestException> {
  const BadRequestExceptionSerializer();

  @override
  BadRequestException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return BadRequestException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(BadRequestException value) => {r'message': value.message};
}

final class BadShapeExceptionSerializer
    extends Serializer<_$exceptions.BadShapeException> {
  const BadShapeExceptionSerializer();

  @override
  _$exceptions.BadShapeException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$exceptions.BadShapeException(Serializers.instance
        .deserialize<_$sealed_classes.Shape>(serialized[r'shape']));
  }

  @override
  Object? serialize(_$exceptions.BadShapeException value) => {
        r'shape':
            Serializers.instance.serialize<_$sealed_classes.Shape>(value.shape)
      };
}

final class ChildSerializer extends Serializer<_$cycles.Child> {
  const ChildSerializer();

  @override
  _$cycles.Child deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$cycles.Child((serialized[r'name'] as String));
  }

  @override
  Object? serialize(_$cycles.Child value) => {r'name': value.name};
}

final class CircleSerializer extends Serializer<_$sealed_classes.Circle> {
  const CircleSerializer();

  @override
  _$sealed_classes.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Object? serialize(_$sealed_classes.Circle value) => {r'radius': value.radius};
}

final class CircleWithCustomJsonSerializer
    extends Serializer<_$sealed_classes.CircleWithCustomJson> {
  const CircleWithCustomJsonSerializer();

  @override
  _$sealed_classes.CircleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.CircleWithCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$sealed_classes.CircleWithCustomJson value) =>
      value.toJson();
}

final class CircleWithInheritedCustomJsonSerializer
    extends Serializer<_$sealed_classes.CircleWithInheritedCustomJson> {
  const CircleWithInheritedCustomJsonSerializer();

  @override
  _$sealed_classes.CircleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_$sealed_classes.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'CircleWithInheritedCustomJson',
      ...serialized,
    }) as _$sealed_classes.CircleWithInheritedCustomJson);
  }

  @override
  Object? serialize(_$sealed_classes.CircleWithInheritedCustomJson value) =>
      value.toJson();
}

final class CircleWithOverriddenCustomJsonSerializer
    extends Serializer<_$sealed_classes.CircleWithOverriddenCustomJson> {
  const CircleWithOverriddenCustomJsonSerializer();

  @override
  _$sealed_classes.CircleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.CircleWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$sealed_classes.CircleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class ColorSerializer extends Serializer<_$extension_types.Color> {
  const ColorSerializer();

  @override
  _$extension_types.Color deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.Color.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.Color value) => value.toJson();
}

final class ColorXFromJsonImplSerializer
    extends Serializer<_$extension_types.ColorXFromJsonImpl> {
  const ColorXFromJsonImplSerializer();

  @override
  _$extension_types.ColorXFromJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ColorXFromJsonImpl.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXFromJsonImpl value) =>
      value.toJson();
}

final class ColorXFromJsonSerializer
    extends Serializer<_$extension_types.ColorXFromJson> {
  const ColorXFromJsonSerializer();

  @override
  _$extension_types.ColorXFromJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ColorXFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXFromJson value) =>
      Serializers.instance.serialize<_$extension_types.Color>(value.c);
}

final class ColorXFromJsonStaticSerializer
    extends Serializer<_$extension_types.ColorXFromJsonStatic> {
  const ColorXFromJsonStaticSerializer();

  @override
  _$extension_types.ColorXFromJsonStatic deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ColorXFromJsonStatic.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXFromJsonStatic value) =>
      Serializers.instance.serialize<_$extension_types.Color>(value.c);
}

final class ColorXImplIndirectSerializer
    extends Serializer<_$extension_types.ColorXImplIndirect> {
  const ColorXImplIndirectSerializer();

  @override
  _$extension_types.ColorXImplIndirect deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_$extension_types.Color.fromJson(serialized)
        as _$extension_types.ColorXImplIndirect);
  }

  @override
  Object? serialize(_$extension_types.ColorXImplIndirect value) =>
      value.toJson();
}

final class ColorXImplSerializer
    extends Serializer<_$extension_types.ColorXImpl> {
  const ColorXImplSerializer();

  @override
  _$extension_types.ColorXImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_$extension_types.Color.fromJson(serialized)
        as _$extension_types.ColorXImpl);
  }

  @override
  Object? serialize(_$extension_types.ColorXImpl value) => value.toJson();
}

final class ColorXSerializer extends Serializer<_$extension_types.ColorX> {
  const ColorXSerializer();

  @override
  _$extension_types.ColorX deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ColorX(
        Serializers.instance.deserialize<_$extension_types.Color>(serialized));
  }

  @override
  Object? serialize(_$extension_types.ColorX value) =>
      Serializers.instance.serialize<_$extension_types.Color>(value.c);
}

final class ColorXToFromJsonCombinedSerializer
    extends Serializer<_$extension_types.ColorXToFromJsonCombined> {
  const ColorXToFromJsonCombinedSerializer();

  @override
  _$extension_types.ColorXToFromJsonCombined deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_$extension_types.ColorXFromJson.fromJson(serialized)
        as _$extension_types.ColorXToFromJsonCombined);
  }

  @override
  Object? serialize(_$extension_types.ColorXToFromJsonCombined value) =>
      value.toJson();
}

final class ColorXToFromJsonSerializer
    extends Serializer<_$extension_types.ColorXToFromJson> {
  const ColorXToFromJsonSerializer();

  @override
  _$extension_types.ColorXToFromJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ColorXToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXToFromJson value) => value.toJson();
}

final class ColorXToJsonImplSerializer
    extends Serializer<_$extension_types.ColorXToJsonImpl> {
  const ColorXToJsonImplSerializer();

  @override
  _$extension_types.ColorXToJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_$extension_types.Color.fromJson(serialized)
        as _$extension_types.ColorXToJsonImpl);
  }

  @override
  Object? serialize(_$extension_types.ColorXToJsonImpl value) => value.toJson();
}

final class ColorXToJsonSerializer
    extends Serializer<_$extension_types.ColorXToJson> {
  const ColorXToJsonSerializer();

  @override
  _$extension_types.ColorXToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ColorXToJson(
        Serializers.instance.deserialize<_$extension_types.Color>(serialized));
  }

  @override
  Object? serialize(_$extension_types.ColorXToJson value) => value.toJson();
}

final class ComplexClassSerializer
    extends Serializer<_$parameter_types.ComplexClass> {
  const ComplexClassSerializer();

  @override
  _$parameter_types.ComplexClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _$parameter_types.ComplexClass.fromJson(serialized);
  }

  @override
  Object? serialize(_$parameter_types.ComplexClass value) => value.toJson();
}

final class ComplexStructSerializer
    extends Serializer<_$parameter_types.ComplexStruct> {
  const ComplexStructSerializer();

  @override
  _$parameter_types.ComplexStruct deserialize(Object? value) {
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
          .map((el) =>
              Serializers.instance.deserialize<_$parameter_types.MyEnum>(el))
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
              .map((el) => Serializers.instance
                  .deserialize<_$parameter_types.SimpleClass>(el))
              .toList(),
      aListOfSimpleStruct:
          (serialized[r'aListOfSimpleStruct'] as Iterable<Object?>)
              .map((el) => Serializers.instance
                  .deserialize<_$parameter_types.SimpleStruct>(el))
              .toList(),
      aListOfStackTrace: (serialized[r'aListOfStackTrace'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<StackTrace>(el))
          .toList(),
      aListOfString: (serialized[r'aListOfString'] as Iterable<Object?>)
          .map((el) => (el as String))
          .toList(),
      aListOfUint8List: (serialized[r'aListOfUint8List'] as Iterable<Object?>)
          .map((el) =>
              Serializers.instance.deserialize<_$typed_data.Uint8List>(el))
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
            Serializers.instance.deserialize<_$parameter_types.MyEnum>(value),
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
                Serializers.instance
                    .deserialize<_$parameter_types.SimpleClass>(value),
              )),
      aMapOfSimpleStruct:
          (serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                Serializers.instance
                    .deserialize<_$parameter_types.SimpleStruct>(value),
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
                Serializers.instance.deserialize<_$typed_data.Uint8List>(value),
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
          .deserialize<_$parameter_types.SimpleClass>(
              serialized[r'aSimpleClass']),
      aSimpleStruct: Serializers.instance
          .deserialize<_$parameter_types.SimpleStruct>(
              serialized[r'aSimpleStruct']),
      aStackTrace: Serializers.instance
          .deserialize<StackTrace>(serialized[r'aStackTrace']),
      aString: (serialized[r'aString'] as String),
      aUint8List: Serializers.instance
          .deserialize<_$typed_data.Uint8List>(serialized[r'aUint8List']),
      aUri: Serializers.instance.deserialize<Uri>(serialized[r'aUri']),
      aUriData:
          Serializers.instance.deserialize<UriData>(serialized[r'aUriData']),
      anEnum: Serializers.instance
          .deserialize<_$parameter_types.MyEnum>(serialized[r'anEnum']),
      anInt: (serialized[r'anInt'] as num).toInt(),
      anIterableOfSimpleClass:
          (serialized[r'anIterableOfSimpleClass'] as Iterable<Object?>)
              .map((el) => Serializers.instance
                  .deserialize<_$parameter_types.SimpleClass>(el))
              .toList()
    );
  }

  @override
  Object? serialize(_$parameter_types.ComplexStruct value) => {
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
            .map((el) =>
                Serializers.instance.serialize<_$parameter_types.MyEnum>(el))
            .toList(),
        r'aListOfInt': value.aListOfInt,
        r'aListOfNull': value.aListOfNull,
        r'aListOfRegExp': value.aListOfRegExp
            .map((el) => Serializers.instance.serialize<RegExp>(el))
            .toList(),
        r'aListOfSimpleClass': value.aListOfSimpleClass
            .map((el) => Serializers.instance
                .serialize<_$parameter_types.SimpleClass>(el))
            .toList(),
        r'aListOfSimpleStruct': value.aListOfSimpleStruct
            .map((el) => Serializers.instance
                .serialize<_$parameter_types.SimpleStruct>(el))
            .toList(),
        r'aListOfStackTrace': value.aListOfStackTrace
            .map((el) => Serializers.instance.serialize<StackTrace>(el))
            .toList(),
        r'aListOfString': value.aListOfString,
        r'aListOfUint8List': value.aListOfUint8List
            .map((el) =>
                Serializers.instance.serialize<_$typed_data.Uint8List>(el))
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
              Serializers.instance.serialize<_$parameter_types.MyEnum>(value),
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
              Serializers.instance
                  .serialize<_$parameter_types.SimpleClass>(value),
            )),
        r'aMapOfSimpleStruct': value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance
                  .serialize<_$parameter_types.SimpleStruct>(value),
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
              Serializers.instance.serialize<_$typed_data.Uint8List>(value),
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
        r'aSimpleClass': Serializers.instance
            .serialize<_$parameter_types.SimpleClass>(value.aSimpleClass),
        r'aSimpleStruct': Serializers.instance
            .serialize<_$parameter_types.SimpleStruct>(value.aSimpleStruct),
        r'aStackTrace':
            Serializers.instance.serialize<StackTrace>(value.aStackTrace),
        r'aString': value.aString,
        r'aUint8List': Serializers.instance
            .serialize<_$typed_data.Uint8List>(value.aUint8List),
        r'aUri': Serializers.instance.serialize<Uri>(value.aUri),
        r'aUriData': Serializers.instance.serialize<UriData>(value.aUriData),
        r'anEnum': Serializers.instance
            .serialize<_$parameter_types.MyEnum>(value.anEnum),
        r'anInt': value.anInt,
        r'anIterableOfSimpleClass': value.anIterableOfSimpleClass
            .map((el) => Serializers.instance
                .serialize<_$parameter_types.SimpleClass>(el))
            .toList(),
      };
}

final class CustomErrorSerializer extends Serializer<_$exceptions.CustomError> {
  const CustomErrorSerializer();

  @override
  _$exceptions.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$exceptions.CustomError();
  }

  @override
  Object? serialize(_$exceptions.CustomError value) => {
        r'message': value.message,
        r'additionalInfo': Serializers.instance.serialize<JsonMap>(
          value.additionalInfo,
          const TypeToken<JsonMap>('JsonMap'),
        ),
      };
}

final class CustomErrorToFromJsonSerializer
    extends Serializer<_$exceptions.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  _$exceptions.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$exceptions.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$exceptions.CustomErrorToFromJson value) => value.toJson();
}

final class CustomErrorWithStackTraceSerializer
    extends Serializer<_$exceptions.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  _$exceptions.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$exceptions.CustomErrorWithStackTrace(
        stackTrace: (Serializers.instance
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Object? serialize(_$exceptions.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            Serializers.instance.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': Serializers.instance.serialize<JsonMap>(
          value.additionalInfo,
          const TypeToken<JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionSerializer
    extends Serializer<_$exceptions.CustomException> {
  const CustomExceptionSerializer();

  @override
  _$exceptions.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$exceptions.CustomException();
  }

  @override
  Object? serialize(_$exceptions.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': Serializers.instance.serialize<JsonMap>(
          value.additionalInfo,
          const TypeToken<JsonMap>('JsonMap'),
        ),
      };
}

final class CustomExceptionToFromJsonSerializer
    extends Serializer<_$exceptions.CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  _$exceptions.CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$exceptions.CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$exceptions.CustomExceptionToFromJson value) =>
      value.toJson();
}

final class DefaultValuesSerializer
    extends Serializer<_$classes.DefaultValues> {
  const DefaultValuesSerializer();

  @override
  _$classes.DefaultValues deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$classes.DefaultValues(
      field: ((serialized?[r'field'] as String?)) ?? 'default',
      nullableField: ((serialized?[r'nullableField'] as String?)) ?? null,
      nullableFieldWithDefault:
          ((serialized?[r'nullableFieldWithDefault'] as String?)) ?? 'default',
    );
  }

  @override
  Object? serialize(_$classes.DefaultValues value) => {
        r'field': value.field,
        r'nullableField': value.nullableField,
        r'nullableFieldWithDefault': value.nullableFieldWithDefault,
        r'fieldWithoutInitializer': value.fieldWithoutInitializer,
      };
}

final class EmptySerializer extends Serializer<_$classes.Empty> {
  const EmptySerializer();

  @override
  _$classes.Empty deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$classes.Empty();
  }

  @override
  Object? serialize(_$classes.Empty value) => {};
}

final class ErrResultSerializer<E extends _$exceptions.ShapeException>
    extends Serializer<_$sealed_classes.ErrResult<E>> {
  const ErrResultSerializer();

  @override
  _$sealed_classes.ErrResult<E> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.ErrResult<E>(
        Serializers.instance.deserialize<E>(serialized[r'error']));
  }

  @override
  Object? serialize(_$sealed_classes.ErrResult<E> value) =>
      {r'error': Serializers.instance.serialize<E>(value.error)};
}

final class ErrResultShapeSerializer
    extends Serializer<_$sealed_classes.ErrResult<_$sealed_classes.Shape>> {
  const ErrResultShapeSerializer();

  @override
  _$sealed_classes.ErrResult<_$sealed_classes.Shape> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.ErrResult<_$sealed_classes.Shape>(Serializers
        .instance
        .deserialize<_$sealed_classes.Shape>(serialized[r'error']));
  }

  @override
  Object? serialize(_$sealed_classes.ErrResult<_$sealed_classes.Shape> value) =>
      {
        r'error':
            Serializers.instance.serialize<_$sealed_classes.Shape>(value.error)
      };
}

final class ErrResultStringSerializer
    extends Serializer<_$sealed_classes.ErrResult<String>> {
  const ErrResultStringSerializer();

  @override
  _$sealed_classes.ErrResult<String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.ErrResult<String>((serialized[r'error'] as String));
  }

  @override
  Object? serialize(_$sealed_classes.ErrResult<String> value) =>
      {r'error': value.error};
}

final class ExportableSerializer extends Serializer<_$metadata.Exportable> {
  const ExportableSerializer();

  @override
  _$metadata.Exportable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$metadata.Exportable();
  }

  @override
  Object? serialize(_$metadata.Exportable value) => {};
}

final class FieldsSerializer extends Serializer<_$classes.Fields> {
  const FieldsSerializer();

  @override
  _$classes.Fields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$classes.Fields(
      (serialized[r'superField'] as String),
      (serialized[r'field'] as String),
    );
  }

  @override
  Object? serialize(_$classes.Fields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class FromJsonAndToJsonSerializer
    extends Serializer<_$classes.FromJsonAndToJson> {
  const FromJsonAndToJsonSerializer();

  @override
  _$classes.FromJsonAndToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$classes.FromJsonAndToJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$classes.FromJsonAndToJson value) => value.toJson();
}

final class FromJsonStaticSerializer
    extends Serializer<_$classes.FromJsonStatic> {
  const FromJsonStaticSerializer();

  @override
  _$classes.FromJsonStatic deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$classes.FromJsonStatic.fromJson(serialized);
  }

  @override
  Object? serialize(_$classes.FromJsonStatic value) => value.toJson();
}

final class GenericWrappersSerializer
    extends Serializer<_$generic_wrappers.GenericWrappers> {
  const GenericWrappersSerializer();

  @override
  _$generic_wrappers.GenericWrappers deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$generic_wrappers.GenericWrappers(
      listOfString: Serializers.instance
          .deserialize<_$ilist.IList<String>>(serialized[r'listOfString']),
      listOfUri: Serializers.instance
          .deserialize<_$ilist.IList<Uri>>(serialized[r'listOfUri']),
      listOfSimpleClass: Serializers.instance
          .deserialize<_$ilist.IList<_$parameter_types.SimpleClass>>(
              serialized[r'listOfSimpleClass']),
      listOfListOfString: Serializers.instance
          .deserialize<_$ilist.IList<_$ilist.IList<String>>>(
              serialized[r'listOfListOfString']),
      listOfListOfUri: Serializers.instance
          .deserialize<_$ilist.IList<_$ilist.IList<Uri>>>(
              serialized[r'listOfListOfUri']),
      listOfListOfSimpleClass: Serializers.instance.deserialize<
              _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>>>(
          serialized[r'listOfListOfSimpleClass']),
      mapOfString: Serializers.instance
          .deserialize<_$imap.IMap<String, String>>(serialized[r'mapOfString']),
      mapOfUri: Serializers.instance
          .deserialize<_$imap.IMap<String, Uri>>(serialized[r'mapOfUri']),
      mapOfSimpleClass: Serializers.instance
          .deserialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(
              serialized[r'mapOfSimpleClass']),
      mapOfListOfString: Serializers.instance
          .deserialize<_$imap.IMap<String, _$ilist.IList<String>>>(
              serialized[r'mapOfListOfString']),
      mapOfListOfUri: Serializers.instance
          .deserialize<_$imap.IMap<String, _$ilist.IList<Uri>>>(
              serialized[r'mapOfListOfUri']),
      mapOfListOfSimpleClass: Serializers.instance.deserialize<
              _$imap
              .IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>>(
          serialized[r'mapOfListOfSimpleClass']),
      mapOfMapOfString: Serializers.instance
          .deserialize<_$imap.IMap<String, _$imap.IMap<String, String>>>(
              serialized[r'mapOfMapOfString']),
      mapOfMapOfUri: Serializers.instance
          .deserialize<_$imap.IMap<String, _$imap.IMap<String, Uri>>>(
              serialized[r'mapOfMapOfUri']),
      mapOfMapOfSimpleClass: Serializers.instance.deserialize<
              _$imap.IMap<String,
                  _$imap.IMap<String, _$parameter_types.SimpleClass>>>(
          serialized[r'mapOfMapOfSimpleClass']),
    );
  }

  @override
  Object? serialize(_$generic_wrappers.GenericWrappers value) => {
        r'listOfString': Serializers.instance
            .serialize<_$ilist.IList<String>>(value.listOfString),
        r'listOfUri':
            Serializers.instance.serialize<_$ilist.IList<Uri>>(value.listOfUri),
        r'listOfSimpleClass': Serializers.instance
            .serialize<_$ilist.IList<_$parameter_types.SimpleClass>>(
                value.listOfSimpleClass),
        r'listOfListOfString': Serializers.instance
            .serialize<_$ilist.IList<_$ilist.IList<String>>>(
                value.listOfListOfString),
        r'listOfListOfUri': Serializers.instance
            .serialize<_$ilist.IList<_$ilist.IList<Uri>>>(
                value.listOfListOfUri),
        r'listOfListOfSimpleClass': Serializers.instance.serialize<
                _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>>>(
            value.listOfListOfSimpleClass),
        r'mapOfString': Serializers.instance
            .serialize<_$imap.IMap<String, String>>(value.mapOfString),
        r'mapOfUri': Serializers.instance
            .serialize<_$imap.IMap<String, Uri>>(value.mapOfUri),
        r'mapOfSimpleClass': Serializers.instance
            .serialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(
                value.mapOfSimpleClass),
        r'mapOfListOfString': Serializers.instance
            .serialize<_$imap.IMap<String, _$ilist.IList<String>>>(
                value.mapOfListOfString),
        r'mapOfListOfUri': Serializers.instance
            .serialize<_$imap.IMap<String, _$ilist.IList<Uri>>>(
                value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': Serializers.instance.serialize<
                _$imap
                .IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>>(
            value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': Serializers.instance
            .serialize<_$imap.IMap<String, _$imap.IMap<String, String>>>(
                value.mapOfMapOfString),
        r'mapOfMapOfUri': Serializers.instance
            .serialize<_$imap.IMap<String, _$imap.IMap<String, Uri>>>(
                value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': Serializers.instance.serialize<
                _$imap.IMap<String,
                    _$imap.IMap<String, _$parameter_types.SimpleClass>>>(
            value.mapOfMapOfSimpleClass),
      };
}

final class IListIListSimpleClassSerializer extends Serializer<
    _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>>> {
  const IListIListSimpleClassSerializer();

  @override
  _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>> deserialize(
      Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>>.fromJson(
      serialized,
      (value) => Serializers.instance
          .deserialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value),
    );
  }

  @override
  Object? serialize(
          _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>> value) =>
      value.toJson((value) => Serializers.instance
          .serialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value));
}

final class IListIListStringSerializer
    extends Serializer<_$ilist.IList<_$ilist.IList<String>>> {
  const IListIListStringSerializer();

  @override
  _$ilist.IList<_$ilist.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _$ilist.IList<_$ilist.IList<String>>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<_$ilist.IList<String>>(value),
    );
  }

  @override
  Object? serialize(_$ilist.IList<_$ilist.IList<String>> value) => value.toJson(
      (value) => Serializers.instance.serialize<_$ilist.IList<String>>(value));
}

final class IListIListUriSerializer
    extends Serializer<_$ilist.IList<_$ilist.IList<Uri>>> {
  const IListIListUriSerializer();

  @override
  _$ilist.IList<_$ilist.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _$ilist.IList<_$ilist.IList<Uri>>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<_$ilist.IList<Uri>>(value),
    );
  }

  @override
  Object? serialize(_$ilist.IList<_$ilist.IList<Uri>> value) => value.toJson(
      (value) => Serializers.instance.serialize<_$ilist.IList<Uri>>(value));
}

final class IListSimpleClassSerializer
    extends Serializer<_$ilist.IList<_$parameter_types.SimpleClass>> {
  const IListSimpleClassSerializer();

  @override
  _$ilist.IList<_$parameter_types.SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _$ilist.IList<_$parameter_types.SimpleClass>.fromJson(
      serialized,
      (value) => Serializers.instance
          .deserialize<_$parameter_types.SimpleClass>(value),
    );
  }

  @override
  Object? serialize(_$ilist.IList<_$parameter_types.SimpleClass> value) =>
      value.toJson((value) =>
          Serializers.instance.serialize<_$parameter_types.SimpleClass>(value));
}

final class IListStringSerializer extends Serializer<_$ilist.IList<String>> {
  const IListStringSerializer();

  @override
  _$ilist.IList<String> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _$ilist.IList<String>.fromJson(
      serialized,
      (value) => (value as String),
    );
  }

  @override
  Object? serialize(_$ilist.IList<String> value) =>
      value.toJson((value) => value);
}

final class IListUriSerializer extends Serializer<_$ilist.IList<Uri>> {
  const IListUriSerializer();

  @override
  _$ilist.IList<Uri> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _$ilist.IList<Uri>.fromJson(
      serialized,
      (value) => Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object? serialize(_$ilist.IList<Uri> value) =>
      value.toJson((value) => Serializers.instance.serialize<Uri>(value));
}

final class IMapStringIListSimpleClassSerializer extends Serializer<
    _$imap.IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>> {
  const IMapStringIListSimpleClassSerializer();

  @override
  _$imap.IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap
        .IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance
          .deserialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value),
    );
  }

  @override
  Object? serialize(
          _$imap.IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>
              value) =>
      value.toJson(
        (value) => value,
        (value) => Serializers.instance
            .serialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value),
      );
}

final class IMapStringIListStringSerializer
    extends Serializer<_$imap.IMap<String, _$ilist.IList<String>>> {
  const IMapStringIListStringSerializer();

  @override
  _$imap.IMap<String, _$ilist.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String, _$ilist.IList<String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<_$ilist.IList<String>>(value),
    );
  }

  @override
  Object? serialize(_$imap.IMap<String, _$ilist.IList<String>> value) =>
      value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<_$ilist.IList<String>>(value),
      );
}

final class IMapStringIListUriSerializer
    extends Serializer<_$imap.IMap<String, _$ilist.IList<Uri>>> {
  const IMapStringIListUriSerializer();

  @override
  _$imap.IMap<String, _$ilist.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String, _$ilist.IList<Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<_$ilist.IList<Uri>>(value),
    );
  }

  @override
  Object? serialize(_$imap.IMap<String, _$ilist.IList<Uri>> value) =>
      value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<_$ilist.IList<Uri>>(value),
      );
}

final class IMapStringIMapStringSimpleClassSerializer extends Serializer<
    _$imap.IMap<String, _$imap.IMap<String, _$parameter_types.SimpleClass>>> {
  const IMapStringIMapStringSimpleClassSerializer();

  @override
  _$imap.IMap<String, _$imap.IMap<String, _$parameter_types.SimpleClass>>
      deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String,
        _$imap.IMap<String, _$parameter_types.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance
          .deserialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(
              value),
    );
  }

  @override
  Object? serialize(
          _$imap
              .IMap<String, _$imap.IMap<String, _$parameter_types.SimpleClass>>
              value) =>
      value.toJson(
        (value) => value,
        (value) => Serializers.instance
            .serialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(
                value),
      );
}

final class IMapStringIMapStringStringSerializer
    extends Serializer<_$imap.IMap<String, _$imap.IMap<String, String>>> {
  const IMapStringIMapStringStringSerializer();

  @override
  _$imap.IMap<String, _$imap.IMap<String, String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String, _$imap.IMap<String, String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          Serializers.instance.deserialize<_$imap.IMap<String, String>>(value),
    );
  }

  @override
  Object? serialize(_$imap.IMap<String, _$imap.IMap<String, String>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            Serializers.instance.serialize<_$imap.IMap<String, String>>(value),
      );
}

final class IMapStringIMapStringUriSerializer
    extends Serializer<_$imap.IMap<String, _$imap.IMap<String, Uri>>> {
  const IMapStringIMapStringUriSerializer();

  @override
  _$imap.IMap<String, _$imap.IMap<String, Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String, _$imap.IMap<String, Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          Serializers.instance.deserialize<_$imap.IMap<String, Uri>>(value),
    );
  }

  @override
  Object? serialize(_$imap.IMap<String, _$imap.IMap<String, Uri>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            Serializers.instance.serialize<_$imap.IMap<String, Uri>>(value),
      );
}

final class IMapStringSimpleClassSerializer
    extends Serializer<_$imap.IMap<String, _$parameter_types.SimpleClass>> {
  const IMapStringSimpleClassSerializer();

  @override
  _$imap.IMap<String, _$parameter_types.SimpleClass> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String, _$parameter_types.SimpleClass>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance
          .deserialize<_$parameter_types.SimpleClass>(value),
    );
  }

  @override
  Object? serialize(_$imap.IMap<String, _$parameter_types.SimpleClass> value) =>
      value.toJson(
        (value) => value,
        (value) => Serializers.instance
            .serialize<_$parameter_types.SimpleClass>(value),
      );
}

final class IMapStringStringSerializer
    extends Serializer<_$imap.IMap<String, String>> {
  const IMapStringStringSerializer();

  @override
  _$imap.IMap<String, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String, String>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => (value as String),
    );
  }

  @override
  Object? serialize(_$imap.IMap<String, String> value) => value.toJson(
        (value) => value,
        (value) => value,
      );
}

final class IMapStringUriSerializer
    extends Serializer<_$imap.IMap<String, Uri>> {
  const IMapStringUriSerializer();

  @override
  _$imap.IMap<String, Uri> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$imap.IMap<String, Uri>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => Serializers.instance.deserialize<Uri>(value),
    );
  }

  @override
  Object? serialize(_$imap.IMap<String, Uri> value) => value.toJson(
        (value) => value,
        (value) => Serializers.instance.serialize<Uri>(value),
      );
}

final class InternalServerExceptionSerializer
    extends Serializer<InternalServerException> {
  const InternalServerExceptionSerializer();

  @override
  InternalServerException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return InternalServerException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(InternalServerException value) =>
      {r'message': value.message};
}

final class JsonBoolSerializer extends Serializer<JsonBool> {
  const JsonBoolSerializer();

  @override
  JsonBool deserialize(Object? value) {
    final serialized = assertWireType<bool>(value);
    return JsonBool((serialized as bool));
  }

  @override
  Object? serialize(JsonBool value) => value;
}

final class JsonDoubleSerializer extends Serializer<JsonDouble> {
  const JsonDoubleSerializer();

  @override
  JsonDouble deserialize(Object? value) {
    final serialized = assertWireType<double>(value);
    return JsonDouble((serialized as num).toDouble());
  }

  @override
  Object? serialize(JsonDouble value) => value;
}

final class JsonIntSerializer extends Serializer<JsonInt> {
  const JsonIntSerializer();

  @override
  JsonInt deserialize(Object? value) {
    final serialized = assertWireType<int>(value);
    return JsonInt((serialized as num).toInt());
  }

  @override
  Object? serialize(JsonInt value) => value;
}

final class JsonListSerializer extends Serializer<JsonList> {
  const JsonListSerializer();

  @override
  JsonList deserialize(Object? value) {
    final serialized = assertWireType<List<Object?>>(value);
    return JsonList((serialized as Iterable<Object?>).toList());
  }

  @override
  Object? serialize(JsonList value) => value;
}

final class JsonMapSerializer extends Serializer<JsonMap> {
  const JsonMapSerializer();

  @override
  JsonMap deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return JsonMap((serialized as Map<String, Object?>));
  }

  @override
  Object? serialize(JsonMap value) => value;
}

final class JsonNumSerializer extends Serializer<JsonNum> {
  const JsonNumSerializer();

  @override
  JsonNum deserialize(Object? value) {
    final serialized = assertWireType<num>(value);
    return JsonNum((serialized as num));
  }

  @override
  Object? serialize(JsonNum value) => value;
}

final class JsonStringSerializer extends Serializer<JsonString> {
  const JsonStringSerializer();

  @override
  JsonString deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return JsonString((serialized as String));
  }

  @override
  Object? serialize(JsonString value) => value;
}

final class JsonValueSerializer extends Serializer<JsonValue> {
  const JsonValueSerializer();

  @override
  JsonValue deserialize(Object? value) {
    final serialized = assertWireType<Object>(value);
    return JsonValue(serialized);
  }

  @override
  Object? serialize(JsonValue value) => value.value;
}

final class LiteralEnumSerializer extends Serializer<_$metadata.LiteralEnum> {
  const LiteralEnumSerializer();

  @override
  _$metadata.LiteralEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$metadata.LiteralEnum.values.byName(serialized);
  }

  @override
  Object? serialize(_$metadata.LiteralEnum value) => value.name;
}

final class MixedFieldsSerializer extends Serializer<_$classes.MixedFields> {
  const MixedFieldsSerializer();

  @override
  _$classes.MixedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$classes.MixedFields(
      (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Object? serialize(_$classes.MixedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class MyEnumSerializer extends Serializer<_$parameter_types.MyEnum> {
  const MyEnumSerializer();

  @override
  _$parameter_types.MyEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$parameter_types.MyEnum.values.byName(serialized);
  }

  @override
  Object? serialize(_$parameter_types.MyEnum value) => value.name;
}

final class NamedFieldsRecordSerializer
    extends Serializer<_$records.NamedFieldsRecord> {
  const NamedFieldsRecordSerializer();

  @override
  _$records.NamedFieldsRecord deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      anotherField: (serialized[r'anotherField'] as String),
      field: (serialized[r'field'] as String)
    );
  }

  @override
  Object? serialize(_$records.NamedFieldsRecord value) => {
        r'anotherField': value.anotherField,
        r'field': value.field,
      };
}

final class NamedFieldsSerializer extends Serializer<_$classes.NamedFields> {
  const NamedFieldsSerializer();

  @override
  _$classes.NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$classes.NamedFields(
      superField: (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Object? serialize(_$classes.NamedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class NestedClassSerializer extends Serializer<_$classes.NestedClass> {
  const NestedClassSerializer();

  @override
  _$classes.NestedClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$classes.NestedClass(
      Serializers.instance.deserialize<_$classes.Fields>(serialized[r'fields']),
      Serializers.instance
          .deserialize<_$classes.Fields?>(serialized[r'nullableFields']),
    );
  }

  @override
  Object? serialize(_$classes.NestedClass value) => {
        r'fields':
            Serializers.instance.serialize<_$classes.Fields>(value.fields),
        r'nullableFields': Serializers.instance
            .serialize<_$classes.Fields?>(value.nullableFields),
      };
}

final class NestedSerializer extends Serializer<_$records.Nested> {
  const NestedSerializer();

  @override
  _$records.Nested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: Serializers.instance
          .deserialize<_$records.NamedFieldsRecord>(serialized[r'namedFields'])
    );
  }

  @override
  Object? serialize(_$records.Nested value) => {
        r'namedFields': Serializers.instance
            .serialize<_$records.NamedFieldsRecord>(value.namedFields)
      };
}

final class NodeSerializer extends Serializer<_$cycles.Node> {
  const NodeSerializer();

  @override
  _$cycles.Node deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Parent') {
      return Serializers.instance.deserialize<_$cycles.Parent>(serialized);
    }
    if (serialized[r'$type'] == r'Child') {
      return Serializers.instance.deserialize<_$cycles.Child>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Node')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_$cycles.Node value) {
    if (value is _$cycles.Parent) {
      return {
        ...(Serializers.instance.serialize<_$cycles.Parent>(value)
            as Map<String, Object?>),
        r'$type': r'Parent',
      };
    }
    if (value is _$cycles.Child) {
      return {
        ...(Serializers.instance.serialize<_$cycles.Child>(value)
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
    extends Serializer<_$classes.NonMapFromAndToJson> {
  const NonMapFromAndToJsonSerializer();

  @override
  _$classes.NonMapFromAndToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$classes.NonMapFromAndToJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$classes.NonMapFromAndToJson value) => value.toJson();
}

final class NonMapToJsonSerializer extends Serializer<_$classes.NonMapToJson> {
  const NonMapToJsonSerializer();

  @override
  _$classes.NonMapToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$classes.NonMapToJson((serialized as String));
  }

  @override
  Object? serialize(_$classes.NonMapToJson value) => value.toJson();
}

final class NonMapToJsonWithDefaultsSerializer
    extends Serializer<_$classes.NonMapToJsonWithDefaults> {
  const NonMapToJsonWithDefaultsSerializer();

  @override
  _$classes.NonMapToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return _$classes.NonMapToJsonWithDefaults(
        ((serialized as String?)) ?? 'default');
  }

  @override
  Object? serialize(_$classes.NonMapToJsonWithDefaults value) => value.toJson();
}

final class NullableNestedSerializer
    extends Serializer<_$records.NullableNested> {
  const NullableNestedSerializer();

  @override
  _$records.NullableNested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: Serializers.instance
          .deserialize<_$records.NamedFieldsRecord?>(serialized[r'namedFields'])
    );
  }

  @override
  Object? serialize(_$records.NullableNested value) => {
        r'namedFields': Serializers.instance
            .serialize<_$records.NamedFieldsRecord?>(value.namedFields)
      };
}

final class OkResultSerializer<T extends _$sealed_classes.Shape>
    extends Serializer<_$sealed_classes.OkResult<T>> {
  const OkResultSerializer();

  @override
  _$sealed_classes.OkResult<T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.OkResult<T>(
        Serializers.instance.deserialize<T>(serialized[r'data']));
  }

  @override
  Object? serialize(_$sealed_classes.OkResult<T> value) =>
      {r'data': Serializers.instance.serialize<T>(value.data)};
}

final class OkResultShapeSerializer
    extends Serializer<_$sealed_classes.OkResult<_$sealed_classes.Shape>> {
  const OkResultShapeSerializer();

  @override
  _$sealed_classes.OkResult<_$sealed_classes.Shape> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.OkResult<_$sealed_classes.Shape>(Serializers
        .instance
        .deserialize<_$sealed_classes.Shape>(serialized[r'data']));
  }

  @override
  Object? serialize(_$sealed_classes.OkResult<_$sealed_classes.Shape> value) =>
      {
        r'data':
            Serializers.instance.serialize<_$sealed_classes.Shape>(value.data)
      };
}

final class OkResultStringSerializer
    extends Serializer<_$sealed_classes.OkResult<String>> {
  const OkResultStringSerializer();

  @override
  _$sealed_classes.OkResult<String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.OkResult<String>((serialized[r'data'] as String));
  }

  @override
  Object? serialize(_$sealed_classes.OkResult<String> value) =>
      {r'data': value.data};
}

final class OnlyFromJsonSerializer extends Serializer<_$classes.OnlyFromJson> {
  const OnlyFromJsonSerializer();

  @override
  _$classes.OnlyFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$classes.OnlyFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$classes.OnlyFromJson value) => {r'field': value.field};
}

final class OnlyToJsonSerializer extends Serializer<_$classes.OnlyToJson> {
  const OnlyToJsonSerializer();

  @override
  _$classes.OnlyToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$classes.OnlyToJson((serialized[r'field'] as String));
  }

  @override
  Object? serialize(_$classes.OnlyToJson value) => value.toJson();
}

final class OnlyToJsonWithDefaultsSerializer
    extends Serializer<_$classes.OnlyToJsonWithDefaults> {
  const OnlyToJsonWithDefaultsSerializer();

  @override
  _$classes.OnlyToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$classes.OnlyToJsonWithDefaults(
        ((serialized?[r'field'] as String?)) ?? 'default');
  }

  @override
  Object? serialize(_$classes.OnlyToJsonWithDefaults value) => value.toJson();
}

final class ParentSerializer extends Serializer<_$cycles.Parent> {
  const ParentSerializer();

  @override
  _$cycles.Parent deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$cycles.Parent(
      (serialized[r'name'] as String),
      (serialized[r'children'] as Iterable<Object?>)
          .map((el) => Serializers.instance.deserialize<_$cycles.Node>(el))
          .toList(),
    );
  }

  @override
  Object? serialize(_$cycles.Parent value) => {
        r'name': value.name,
        r'children': value.children
            .map((el) => Serializers.instance.serialize<_$cycles.Node>(el))
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
  Object? serialize(Record$k7x4l9 value) => {
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
  Object? serialize(Record$rmm4wt value) => {
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
          .deserialize<_$records.NamedFieldsRecord>(serialized[r'aliased']),
      nonAliased: Serializers.instance
          .deserialize<({String anotherField, String field})>(
              serialized[r'nonAliased'])
    );
  }

  @override
  Object? serialize(Record$wkpf9q value) => {
        r'aliased': Serializers.instance
            .serialize<_$records.NamedFieldsRecord>(value.aliased),
        r'nonAliased': Serializers.instance
            .serialize<({String anotherField, String field})>(value.nonAliased),
      };
}

final class RectangleSerializer extends Serializer<_$sealed_classes.Rectangle> {
  const RectangleSerializer();

  @override
  _$sealed_classes.Rectangle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.Rectangle(
      (serialized[r'width'] as num).toDouble(),
      (serialized[r'height'] as num).toDouble(),
    );
  }

  @override
  Object? serialize(_$sealed_classes.Rectangle value) => {
        r'width': value.width,
        r'height': value.height,
      };
}

final class RectangleWithCustomJsonSerializer
    extends Serializer<_$sealed_classes.RectangleWithCustomJson> {
  const RectangleWithCustomJsonSerializer();

  @override
  _$sealed_classes.RectangleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.RectangleWithCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$sealed_classes.RectangleWithCustomJson value) =>
      value.toJson();
}

final class RectangleWithInheritedCustomJsonSerializer
    extends Serializer<_$sealed_classes.RectangleWithInheritedCustomJson> {
  const RectangleWithInheritedCustomJsonSerializer();

  @override
  _$sealed_classes.RectangleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_$sealed_classes.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'RectangleWithInheritedCustomJson',
      ...serialized,
    }) as _$sealed_classes.RectangleWithInheritedCustomJson);
  }

  @override
  Object? serialize(_$sealed_classes.RectangleWithInheritedCustomJson value) =>
      value.toJson();
}

final class RectangleWithOverriddenCustomJsonSerializer
    extends Serializer<_$sealed_classes.RectangleWithOverriddenCustomJson> {
  const RectangleWithOverriddenCustomJsonSerializer();

  @override
  _$sealed_classes.RectangleWithOverriddenCustomJson deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_$sealed_classes.ShapeWithOverriddenCustomJson.fromJson({
      r'$type': r'RectangleWithOverriddenCustomJson',
      ...serialized,
    }) as _$sealed_classes.RectangleWithOverriddenCustomJson);
  }

  @override
  Object? serialize(_$sealed_classes.RectangleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class ResultSerializer<T extends _$sealed_classes.Shape,
        E extends _$exceptions.ShapeException>
    extends Serializer<_$sealed_classes.Result<T, E>> {
  const ResultSerializer();

  @override
  _$sealed_classes.Result<T, E> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.OkResult<T>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.ErrResult<E>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.SwappedResult<E, T>>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_$sealed_classes.Result<T, E> value) {
    if (value is _$sealed_classes.OkResult<T>) {
      return {
        ...(Serializers.instance.serialize<_$sealed_classes.OkResult<T>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is _$sealed_classes.ErrResult<E>) {
      return {
        ...(Serializers.instance.serialize<_$sealed_classes.ErrResult<E>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value is _$sealed_classes.SwappedResult<E, T>) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.SwappedResult<E, T>>(value)
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

final class ResultShapeStringSerializer extends Serializer<
    _$sealed_classes.Result<_$sealed_classes.Shape, String>> {
  const ResultShapeStringSerializer();

  @override
  _$sealed_classes.Result<_$sealed_classes.Shape, String> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.OkResult<_$sealed_classes.Shape>>(
              serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.ErrResult<String>>(serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance.deserialize<
          _$sealed_classes
          .SwappedResult<String, _$sealed_classes.Shape>>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(
      _$sealed_classes.Result<_$sealed_classes.Shape, String> value) {
    if (value is _$sealed_classes.OkResult<_$sealed_classes.Shape>) {
      return {
        ...(Serializers.instance
            .serialize<_$sealed_classes.OkResult<_$sealed_classes.Shape>>(
                value) as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is _$sealed_classes.ErrResult<String>) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.ErrResult<String>>(value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value
        is _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>) {
      return {
        ...(Serializers.instance.serialize<
                _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>>(
            value) as Map<String, Object?>),
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

final class ResultStringShapeSerializer extends Serializer<
    _$sealed_classes.Result<String, _$sealed_classes.Shape>> {
  const ResultStringShapeSerializer();

  @override
  _$sealed_classes.Result<String, _$sealed_classes.Shape> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'OkResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.OkResult<String>>(serialized);
    }
    if (serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.ErrResult<_$sealed_classes.Shape>>(
              serialized);
    }
    if (serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance.deserialize<
          _$sealed_classes
          .SwappedResult<_$sealed_classes.Shape, String>>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(
      _$sealed_classes.Result<String, _$sealed_classes.Shape> value) {
    if (value is _$sealed_classes.OkResult<String>) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.OkResult<String>>(value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if (value is _$sealed_classes.ErrResult<_$sealed_classes.Shape>) {
      return {
        ...(Serializers.instance
            .serialize<_$sealed_classes.ErrResult<_$sealed_classes.Shape>>(
                value) as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    if (value
        is _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>) {
      return {
        ...(Serializers.instance.serialize<
                _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>>(
            value) as Map<String, Object?>),
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

final class SelfReferencingSerializer
    extends Serializer<_$cycles.SelfReferencing> {
  const SelfReferencingSerializer();

  @override
  _$cycles.SelfReferencing deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$cycles.SelfReferencing(
      value: (Serializers.instance
              .deserialize<_$cycles.SelfReferencing?>(serialized[r'value'])) ??
          null,
      wrapper: (Serializers.instance
              .deserialize<_$cycles.SelfReferencingWrapper?>(
                  serialized[r'wrapper'])) ??
          null,
      list: (serialized[r'list'] as Iterable<Object?>)
          .map((el) =>
              Serializers.instance.deserialize<_$cycles.SelfReferencing>(el))
          .toList(),
    );
  }

  @override
  Object? serialize(_$cycles.SelfReferencing value) => {
        r'value': Serializers.instance
            .serialize<_$cycles.SelfReferencing?>(value.value),
        r'wrapper': Serializers.instance
            .serialize<_$cycles.SelfReferencingWrapper?>(value.wrapper),
        r'list': value.list
            .map((el) =>
                Serializers.instance.serialize<_$cycles.SelfReferencing>(el))
            .toList(),
      };
}

final class SelfReferencingWrapperSerializer
    extends Serializer<_$cycles.SelfReferencingWrapper> {
  const SelfReferencingWrapperSerializer();

  @override
  _$cycles.SelfReferencingWrapper deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$cycles.SelfReferencingWrapper(
        value: Serializers.instance
            .deserialize<_$cycles.SelfReferencing>(serialized[r'value']));
  }

  @override
  Object? serialize(_$cycles.SelfReferencingWrapper value) => {
        r'value': Serializers.instance
            .serialize<_$cycles.SelfReferencing>(value.value)
      };
}

final class SerializableSerializer extends Serializer<_$metadata.Serializable> {
  const SerializableSerializer();

  @override
  _$metadata.Serializable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _$metadata.Serializable(((serialized?[r'type'] as String?)) ?? null);
  }

  @override
  Object? serialize(_$metadata.Serializable value) => {r'type': value.type};
}

final class SerializationExceptionSerializer
    extends Serializer<SerializationException> {
  const SerializationExceptionSerializer();

  @override
  SerializationException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return SerializationException((serialized[r'message'] as String));
  }

  @override
  Object? serialize(SerializationException value) => {
        r'message': value.message,
        r'offset': value.offset,
        r'source': value.source,
      };
}

final class ShapeExceptionSerializer
    extends Serializer<_$exceptions.ShapeException> {
  const ShapeExceptionSerializer();

  @override
  _$exceptions.ShapeException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'BadShapeException') {
      return Serializers.instance
          .deserialize<_$exceptions.BadShapeException>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeException')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_$exceptions.ShapeException value) {
    if (value is _$exceptions.BadShapeException) {
      return {
        ...(Serializers.instance
                .serialize<_$exceptions.BadShapeException>(value)
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

final class ShapeSerializer extends Serializer<_$sealed_classes.Shape> {
  const ShapeSerializer();

  @override
  _$sealed_classes.Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'Rectangle') {
      return Serializers.instance
          .deserialize<_$sealed_classes.Rectangle>(serialized);
    }
    if (serialized[r'$type'] == r'Circle') {
      return Serializers.instance
          .deserialize<_$sealed_classes.Circle>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Shape')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_$sealed_classes.Shape value) {
    if (value is _$sealed_classes.Rectangle) {
      return {
        ...(Serializers.instance.serialize<_$sealed_classes.Rectangle>(value)
            as Map<String, Object?>),
        r'$type': r'Rectangle',
      };
    }
    if (value is _$sealed_classes.Circle) {
      return {
        ...(Serializers.instance.serialize<_$sealed_classes.Circle>(value)
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
    extends Serializer<_$sealed_classes.ShapeWithCustomJson> {
  const ShapeWithCustomJsonSerializer();

  @override
  _$sealed_classes.ShapeWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    if (serialized[r'$type'] == r'CircleWithCustomJson') {
      return Serializers.instance
          .deserialize<_$sealed_classes.CircleWithCustomJson>(serialized);
    }
    if (serialized[r'$type'] == r'RectangleWithCustomJson') {
      return Serializers.instance
          .deserialize<_$sealed_classes.RectangleWithCustomJson>(serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'ShapeWithCustomJson')
          ..write(': ')
          ..write(serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_$sealed_classes.ShapeWithCustomJson value) {
    if (value is _$sealed_classes.CircleWithCustomJson) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.CircleWithCustomJson>(value)
            as Map<String, Object?>),
        r'$type': r'CircleWithCustomJson',
      };
    }
    if (value is _$sealed_classes.RectangleWithCustomJson) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.RectangleWithCustomJson>(value)
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
    extends Serializer<_$sealed_classes.ShapeWithInheritedCustomJson> {
  const ShapeWithInheritedCustomJsonSerializer();

  @override
  _$sealed_classes.ShapeWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.ShapeWithInheritedCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$sealed_classes.ShapeWithInheritedCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _$sealed_classes.RectangleWithInheritedCustomJson() =>
            r'RectangleWithInheritedCustomJson',
          _$sealed_classes.CircleWithInheritedCustomJson() =>
            r'CircleWithInheritedCustomJson',
        },
      };
}

final class ShapeWithOverriddenCustomJsonSerializer
    extends Serializer<_$sealed_classes.ShapeWithOverriddenCustomJson> {
  const ShapeWithOverriddenCustomJsonSerializer();

  @override
  _$sealed_classes.ShapeWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.ShapeWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$sealed_classes.ShapeWithOverriddenCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _$sealed_classes.CircleWithOverriddenCustomJson() =>
            r'CircleWithOverriddenCustomJson',
          _$sealed_classes.RectangleWithOverriddenCustomJson() =>
            r'RectangleWithOverriddenCustomJson',
        },
      };
}

final class SimpleClassSerializer
    extends Serializer<_$parameter_types.SimpleClass> {
  const SimpleClassSerializer();

  @override
  _$parameter_types.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _$parameter_types.SimpleClass.fromJson(serialized);
  }

  @override
  Object? serialize(_$parameter_types.SimpleClass value) => value.toJson();
}

final class SimpleStructSerializer
    extends Serializer<_$parameter_types.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  _$parameter_types.SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Object? serialize(_$parameter_types.SimpleStruct value) => {};
}

final class StringXFromJsonImplSerializer
    extends Serializer<_$extension_types.StringXFromJsonImpl> {
  const StringXFromJsonImplSerializer();

  @override
  _$extension_types.StringXFromJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXFromJsonImpl.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.StringXFromJsonImpl value) => value;
}

final class StringXFromJsonSerializer
    extends Serializer<_$extension_types.StringXFromJson> {
  const StringXFromJsonSerializer();

  @override
  _$extension_types.StringXFromJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.StringXFromJson value) => value.s;
}

final class StringXFromJsonStaticSerializer
    extends Serializer<_$extension_types.StringXFromJsonStatic> {
  const StringXFromJsonStaticSerializer();

  @override
  _$extension_types.StringXFromJsonStatic deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXFromJsonStatic.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.StringXFromJsonStatic value) => value.s;
}

final class StringXImplSerializer
    extends Serializer<_$extension_types.StringXImpl> {
  const StringXImplSerializer();

  @override
  _$extension_types.StringXImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXImpl((serialized as String));
  }

  @override
  Object? serialize(_$extension_types.StringXImpl value) => value;
}

final class StringXPrivateCtorImplSerializer
    extends Serializer<_$extension_types.StringXPrivateCtorImpl> {
  const StringXPrivateCtorImplSerializer();

  @override
  _$extension_types.StringXPrivateCtorImpl deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return ((serialized as String) as _$extension_types.StringXPrivateCtorImpl);
  }

  @override
  Object? serialize(_$extension_types.StringXPrivateCtorImpl value) => value;
}

final class StringXPrivateCtorSerializer
    extends Serializer<_$extension_types.StringXPrivateCtor> {
  const StringXPrivateCtorSerializer();

  @override
  _$extension_types.StringXPrivateCtor deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return ((serialized as String) as _$extension_types.StringXPrivateCtor);
  }

  @override
  Object? serialize(_$extension_types.StringXPrivateCtor value) => value.s;
}

final class StringXPrivateFieldImplSerializer
    extends Serializer<_$extension_types.StringXPrivateFieldImpl> {
  const StringXPrivateFieldImplSerializer();

  @override
  _$extension_types.StringXPrivateFieldImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXPrivateFieldImpl((serialized as String));
  }

  @override
  Object? serialize(_$extension_types.StringXPrivateFieldImpl value) => value;
}

final class StringXPrivateFieldSerializer
    extends Serializer<_$extension_types.StringXPrivateField> {
  const StringXPrivateFieldSerializer();

  @override
  _$extension_types.StringXPrivateField deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXPrivateField((serialized as String));
  }

  @override
  Object? serialize(_$extension_types.StringXPrivateField value) =>
      (value as String);
}

final class StringXSerializer extends Serializer<_$extension_types.StringX> {
  const StringXSerializer();

  @override
  _$extension_types.StringX deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringX((serialized as String));
  }

  @override
  Object? serialize(_$extension_types.StringX value) => value.s;
}

final class StringXToFromJsonSerializer
    extends Serializer<_$extension_types.StringXToFromJson> {
  const StringXToFromJsonSerializer();

  @override
  _$extension_types.StringXToFromJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.StringXToFromJson value) =>
      value.toJson();
}

final class StringXToJsonImplSerializer
    extends Serializer<_$extension_types.StringXToJsonImpl> {
  const StringXToJsonImplSerializer();

  @override
  _$extension_types.StringXToJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXToJsonImpl((serialized as String));
  }

  @override
  Object? serialize(_$extension_types.StringXToJsonImpl value) =>
      value.toJson();
}

final class StringXToJsonSerializer
    extends Serializer<_$extension_types.StringXToJson> {
  const StringXToJsonSerializer();

  @override
  _$extension_types.StringXToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.StringXToJson((serialized as String));
  }

  @override
  Object? serialize(_$extension_types.StringXToJson value) => value.toJson();
}

final class SupportedErrorTypeSerializer
    extends Serializer<_$exceptions.SupportedErrorType> {
  const SupportedErrorTypeSerializer();

  @override
  _$exceptions.SupportedErrorType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$exceptions.SupportedErrorType.values.byName(serialized);
  }

  @override
  Object? serialize(_$exceptions.SupportedErrorType value) => value.name;
}

final class SupportedExceptionTypeSerializer
    extends Serializer<_$exceptions.SupportedExceptionType> {
  const SupportedExceptionTypeSerializer();

  @override
  _$exceptions.SupportedExceptionType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$exceptions.SupportedExceptionType.values.byName(serialized);
  }

  @override
  Object? serialize(_$exceptions.SupportedExceptionType value) => value.name;
}

final class SwappedResultSerializer<E extends _$exceptions.ShapeException,
        T extends _$sealed_classes.Shape>
    extends Serializer<_$sealed_classes.SwappedResult<E, T>> {
  const SwappedResultSerializer();

  @override
  _$sealed_classes.SwappedResult<E, T> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.SwappedResult<E, T>(Serializers.instance
        .deserialize<_$sealed_classes.Result<E, T>>(serialized[r'result']));
  }

  @override
  Object? serialize(_$sealed_classes.SwappedResult<E, T> value) => {
        r'result': Serializers.instance
            .serialize<_$sealed_classes.Result<E, T>>(value.result)
      };
}

final class SwappedResultShapeStringSerializer extends Serializer<
    _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>> {
  const SwappedResultShapeStringSerializer();

  @override
  _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>(
        Serializers.instance.deserialize<
            _$sealed_classes
            .Result<_$sealed_classes.Shape, String>>(serialized[r'result']));
  }

  @override
  Object? serialize(
          _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>
              value) =>
      {
        r'result': Serializers.instance
            .serialize<_$sealed_classes.Result<_$sealed_classes.Shape, String>>(
                value.result)
      };
}

final class SwappedResultStringShapeSerializer extends Serializer<
    _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>> {
  const SwappedResultStringShapeSerializer();

  @override
  _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>(
        Serializers.instance.deserialize<
            _$sealed_classes
            .Result<String, _$sealed_classes.Shape>>(serialized[r'result']));
  }

  @override
  Object? serialize(
          _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>
              value) =>
      {
        r'result': Serializers.instance
            .serialize<_$sealed_classes.Result<String, _$sealed_classes.Shape>>(
                value.result)
      };
}

final class ValueSerializer extends Serializer<_$extension_types.Value> {
  const ValueSerializer();

  @override
  _$extension_types.Value deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.Value.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.Value value) => value.toJson();
}

final class ValueXFromJsonImplSerializer
    extends Serializer<_$extension_types.ValueXFromJsonImpl> {
  const ValueXFromJsonImplSerializer();

  @override
  _$extension_types.ValueXFromJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ValueXFromJsonImpl.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXFromJsonImpl value) =>
      value.toJson();
}

final class ValueXFromJsonSerializer
    extends Serializer<_$extension_types.ValueXFromJson> {
  const ValueXFromJsonSerializer();

  @override
  _$extension_types.ValueXFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$extension_types.ValueXFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXFromJson value) =>
      Serializers.instance.serialize<_$extension_types.Value>(value.v);
}

final class ValueXFromJsonStaticSerializer
    extends Serializer<_$extension_types.ValueXFromJsonStatic> {
  const ValueXFromJsonStaticSerializer();

  @override
  _$extension_types.ValueXFromJsonStatic deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$extension_types.ValueXFromJsonStatic.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXFromJsonStatic value) =>
      Serializers.instance.serialize<_$extension_types.Value>(value.v);
}

final class ValueXImplIndirectSerializer
    extends Serializer<_$extension_types.ValueXImplIndirect> {
  const ValueXImplIndirectSerializer();

  @override
  _$extension_types.ValueXImplIndirect deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_$extension_types.Value.fromJson(serialized)
        as _$extension_types.ValueXImplIndirect);
  }

  @override
  Object? serialize(_$extension_types.ValueXImplIndirect value) =>
      value.toJson();
}

final class ValueXImplSerializer
    extends Serializer<_$extension_types.ValueXImpl> {
  const ValueXImplSerializer();

  @override
  _$extension_types.ValueXImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_$extension_types.Value.fromJson(serialized)
        as _$extension_types.ValueXImpl);
  }

  @override
  Object? serialize(_$extension_types.ValueXImpl value) => value.toJson();
}

final class ValueXSerializer extends Serializer<_$extension_types.ValueX> {
  const ValueXSerializer();

  @override
  _$extension_types.ValueX deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$extension_types.ValueX(
        Serializers.instance.deserialize<_$extension_types.Value>(serialized));
  }

  @override
  Object? serialize(_$extension_types.ValueX value) =>
      Serializers.instance.serialize<_$extension_types.Value>(value.v);
}

final class ValueXToFromJsonCombinedSerializer
    extends Serializer<_$extension_types.ValueXToFromJsonCombined> {
  const ValueXToFromJsonCombinedSerializer();

  @override
  _$extension_types.ValueXToFromJsonCombined deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_$extension_types.ValueXFromJson.fromJson(serialized)
        as _$extension_types.ValueXToFromJsonCombined);
  }

  @override
  Object? serialize(_$extension_types.ValueXToFromJsonCombined value) =>
      value.toJson();
}

final class ValueXToFromJsonSerializer
    extends Serializer<_$extension_types.ValueXToFromJson> {
  const ValueXToFromJsonSerializer();

  @override
  _$extension_types.ValueXToFromJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _$extension_types.ValueXToFromJson.fromJson(serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXToFromJson value) => value.toJson();
}

final class ValueXToJsonImplSerializer
    extends Serializer<_$extension_types.ValueXToJsonImpl> {
  const ValueXToJsonImplSerializer();

  @override
  _$extension_types.ValueXToJsonImpl deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return (_$extension_types.Value.fromJson(serialized)
        as _$extension_types.ValueXToJsonImpl);
  }

  @override
  Object? serialize(_$extension_types.ValueXToJsonImpl value) => value.toJson();
}

final class ValueXToJsonSerializer
    extends Serializer<_$extension_types.ValueXToJson> {
  const ValueXToJsonSerializer();

  @override
  _$extension_types.ValueXToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _$extension_types.ValueXToJson(
        Serializers.instance.deserialize<_$extension_types.Value>(serialized));
  }

  @override
  Object? serialize(_$extension_types.ValueXToJson value) => value.toJson();
}

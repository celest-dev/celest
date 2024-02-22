// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _$typed_data;

import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/exceptions.dart' as _$exceptions;
import 'package:celest_backend/models/classes.dart' as _$classes;
import 'package:celest_backend/models/cycles.dart' as _$cycles;
import 'package:celest_backend/models/exceptions.dart' as _$exceptions;
import 'package:celest_backend/models/extension_types.dart'
    as _$extension_types;
import 'package:celest_backend/models/generic_wrappers.dart'
    as _$generic_wrappers;
import 'package:celest_backend/models/metadata.dart' as _$metadata;
import 'package:celest_backend/models/parameter_types.dart'
    as _$parameter_types;
import 'package:celest_backend/models/records.dart' as _$records;
import 'package:celest_backend/models/sealed_classes.dart' as _$sealed_classes;
import 'package:celest_core/src/exception/cloud_exception.dart';
import 'package:celest_core/src/exception/serialization_exception.dart';
import 'package:celest_core/src/serialization/json_value.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _$ilist;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _$imap;

void initSerializers() {
  Serializers.instance
      .put(Serializer.define<Record$k2phuz, Map<String, Object?>>(
    serialize: ($value) => {
      r'aliased': Serializers.instance
          .serialize<_$records.NamedFieldsRecord>($value.aliased),
      r'nonAliased': Serializers.instance
          .serialize<({String anotherField, String field})>($value.nonAliased),
    },
    deserialize: ($serialized) {
      return (
        aliased: Serializers.instance
            .deserialize<_$records.NamedFieldsRecord>($serialized[r'aliased']),
        nonAliased: Serializers.instance
            .deserialize<({String anotherField, String field})>(
                $serialized[r'nonAliased'])
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<Record$k7x4l9, Map<String, Object?>>(
    serialize: ($value) => {
      r'a': $value.a,
      r'b': $value.b,
      r'c': $value.c,
    },
    deserialize: ($serialized) {
      return (
        a: ($serialized[r'a'] as String),
        b: ($serialized[r'b'] as String),
        c: ($serialized[r'c'] as String)
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<Record$rmm4wt, Map<String, Object?>>(
    serialize: ($value) => {
      r'anotherField': $value.anotherField,
      r'field': $value.field,
    },
    deserialize: ($serialized) {
      return (
        anotherField: ($serialized[r'anotherField'] as String),
        field: ($serialized[r'field'] as String)
      );
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$exceptions.BadShapeException, Map<String, Object?>>(
    serialize: ($value) => {
      r'shape':
          Serializers.instance.serialize<_$sealed_classes.Shape>($value.shape)
    },
    deserialize: ($serialized) {
      return _$exceptions.BadShapeException(Serializers.instance
          .deserialize<_$sealed_classes.Shape>($serialized[r'shape']));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.CustomError, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'additionalInfo': Serializers.instance.serialize<JsonMap>(
        $value.additionalInfo,
        const TypeToken<JsonMap>('JsonMap'),
      ),
    },
    deserialize: ($serialized) {
      return _$exceptions.CustomError();
    },
  ));
  Serializers.instance.put(Serializer.define<_$exceptions.CustomErrorToFromJson,
      Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$exceptions.CustomErrorToFromJson.fromJson($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$exceptions.CustomErrorWithStackTrace, Map<String, Object?>?>(
    serialize: ($value) => {
      r'stackTrace':
          Serializers.instance.serialize<StackTrace>($value.stackTrace),
      r'message': $value.message,
      r'additionalInfo': $value.additionalInfo,
    },
    deserialize: ($serialized) {
      return _$exceptions.CustomErrorWithStackTrace(
          stackTrace: (Serializers.instance
                  .deserialize<StackTrace?>($serialized?[r'stackTrace'])) ??
              null);
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$exceptions.CustomException, Map<String, Object?>?>(
    serialize: ($value) => {
      r'message': $value.message,
      r'additionalInfo': Serializers.instance.serialize<JsonMap>(
        $value.additionalInfo,
        const TypeToken<JsonMap>('JsonMap'),
      ),
    },
    deserialize: ($serialized) {
      return _$exceptions.CustomException();
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$exceptions.CustomExceptionToFromJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$exceptions.CustomExceptionToFromJson.fromJson($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.ShapeException, Map<String, Object?>>(
    serialize: ($value) {
      if ($value is _$exceptions.BadShapeException) {
        return {
          ...(Serializers.instance
                  .serialize<_$exceptions.BadShapeException>($value)
              as Map<String, Object?>),
          r'$type': r'BadShapeException',
        };
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'ShapeException')
            ..write(': ')
            ..write($value.runtimeType))
          .toString());
    },
    deserialize: ($serialized) {
      if ($serialized[r'$type'] == r'BadShapeException') {
        return Serializers.instance
            .deserialize<_$exceptions.BadShapeException>($serialized);
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'ShapeException')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString());
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.DefaultValues, Map<String, Object?>?>(
    serialize: ($value) => {
      r'field': $value.field,
      r'nullableField': $value.nullableField,
      r'nullableFieldWithDefault': $value.nullableFieldWithDefault,
      r'fieldWithoutInitializer': $value.fieldWithoutInitializer,
    },
    deserialize: ($serialized) {
      return _$classes.DefaultValues(
        field: (($serialized?[r'field'] as String?)) ?? 'default',
        nullableField: (($serialized?[r'nullableField'] as String?)) ?? null,
        nullableFieldWithDefault:
            (($serialized?[r'nullableFieldWithDefault'] as String?)) ??
                'default',
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.Empty, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return _$classes.Empty();
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.Fields, Map<String, Object?>>(
    serialize: ($value) => {
      r'superField': $value.superField,
      r'field': $value.field,
    },
    deserialize: ($serialized) {
      return _$classes.Fields(
        ($serialized[r'superField'] as String),
        ($serialized[r'field'] as String),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.FromJsonAndToJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$classes.FromJsonAndToJson.fromJson($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<_$classes.FromJsonStatic, String>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$classes.FromJsonStatic.fromJson($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.MixedFields, Map<String, Object?>>(
    serialize: ($value) => {
      r'superField': $value.superField,
      r'field': $value.field,
    },
    deserialize: ($serialized) {
      return _$classes.MixedFields(
        ($serialized[r'superField'] as String),
        field: ($serialized[r'field'] as String),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.NamedFields, Map<String, Object?>>(
    serialize: ($value) => {
      r'superField': $value.superField,
      r'field': $value.field,
    },
    deserialize: ($serialized) {
      return _$classes.NamedFields(
        superField: ($serialized[r'superField'] as String),
        field: ($serialized[r'field'] as String),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.NestedClass, Map<String, Object?>>(
    serialize: ($value) => {
      r'fields':
          Serializers.instance.serialize<_$classes.Fields>($value.fields),
      r'nullableFields': Serializers.instance
          .serialize<_$classes.Fields?>($value.nullableFields),
    },
    deserialize: ($serialized) {
      return _$classes.NestedClass(
        Serializers.instance
            .deserialize<_$classes.Fields>($serialized[r'fields']),
        Serializers.instance
            .deserialize<_$classes.Fields?>($serialized[r'nullableFields']),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.NonMapFromAndToJson, String>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$classes.NonMapFromAndToJson.fromJson($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<_$classes.NonMapToJson, String>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$classes.NonMapToJson(($serialized as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.NonMapToJsonWithDefaults, String?>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$classes.NonMapToJsonWithDefaults(
          (($serialized as String?)) ?? 'default');
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.OnlyFromJson, Map<String, Object?>>(
    serialize: ($value) => {r'field': $value.field},
    deserialize: ($serialized) {
      return _$classes.OnlyFromJson.fromJson($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$classes.OnlyToJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$classes.OnlyToJson(($serialized[r'field'] as String));
    },
  ));
  Serializers.instance.put(Serializer.define<_$classes.OnlyToJsonWithDefaults,
      Map<String, Object?>?>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$classes.OnlyToJsonWithDefaults(
          (($serialized?[r'field'] as String?)) ?? 'default');
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$cycles.Child, Map<String, Object?>>(
    serialize: ($value) => {r'name': $value.name},
    deserialize: ($serialized) {
      return _$cycles.Child(($serialized[r'name'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$cycles.Node, Map<String, Object?>>(
    serialize: ($value) {
      if ($value is _$cycles.Parent) {
        return {
          ...(Serializers.instance.serialize<_$cycles.Parent>($value)
              as Map<String, Object?>),
          r'$type': r'Parent',
        };
      }
      if ($value is _$cycles.Child) {
        return {
          ...(Serializers.instance.serialize<_$cycles.Child>($value)
              as Map<String, Object?>),
          r'$type': r'Child',
        };
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Node')
            ..write(': ')
            ..write($value.runtimeType))
          .toString());
    },
    deserialize: ($serialized) {
      if ($serialized[r'$type'] == r'Parent') {
        return Serializers.instance.deserialize<_$cycles.Parent>($serialized);
      }
      if ($serialized[r'$type'] == r'Child') {
        return Serializers.instance.deserialize<_$cycles.Child>($serialized);
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Node')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString());
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$cycles.Parent, Map<String, Object?>>(
    serialize: ($value) => {
      r'name': $value.name,
      r'children': $value.children
          .map((el) => Serializers.instance.serialize<_$cycles.Node>(el))
          .toList(),
    },
    deserialize: ($serialized) {
      return _$cycles.Parent(
        ($serialized[r'name'] as String),
        ($serialized[r'children'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<_$cycles.Node>(el))
            .toList(),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$cycles.SelfReferencing, Map<String, Object?>>(
    serialize: ($value) => {
      r'value': Serializers.instance
          .serialize<_$cycles.SelfReferencing?>($value.value),
      r'wrapper': Serializers.instance
          .serialize<_$cycles.SelfReferencingWrapper?>($value.wrapper),
      r'list': $value.list
          .map((el) =>
              Serializers.instance.serialize<_$cycles.SelfReferencing>(el))
          .toList(),
    },
    deserialize: ($serialized) {
      return _$cycles.SelfReferencing(
        value: (Serializers.instance.deserialize<_$cycles.SelfReferencing?>(
                $serialized[r'value'])) ??
            null,
        wrapper: (Serializers.instance
                .deserialize<_$cycles.SelfReferencingWrapper?>(
                    $serialized[r'wrapper'])) ??
            null,
        list: ($serialized[r'list'] as Iterable<Object?>)
            .map((el) =>
                Serializers.instance.deserialize<_$cycles.SelfReferencing>(el))
            .toList(),
      );
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$cycles.SelfReferencingWrapper, Map<String, Object?>>(
    serialize: ($value) => {
      r'value':
          Serializers.instance.serialize<_$cycles.SelfReferencing>($value.value)
    },
    deserialize: ($serialized) {
      return _$cycles.SelfReferencingWrapper(
          value: Serializers.instance
              .deserialize<_$cycles.SelfReferencing>($serialized[r'value']));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.SupportedErrorType, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return _$exceptions.SupportedErrorType.values.byName($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$exceptions.SupportedExceptionType, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return _$exceptions.SupportedExceptionType.values.byName($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<_$extension_types.Color, String>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$extension_types.Color.fromJson($serialized);
    },
  ));
  Serializers.instance.put(
    ColorXSerializer(),
    const TypeToken<_$extension_types.ColorX>('ColorX'),
  );
  Serializers.instance.put(
    ColorXFromJsonSerializer(),
    const TypeToken<_$extension_types.ColorXFromJson>('ColorXFromJson'),
  );
  Serializers.instance.put(
    ColorXFromJsonImplSerializer(),
    const TypeToken<_$extension_types.ColorXFromJsonImpl>('ColorXFromJsonImpl'),
  );
  Serializers.instance.put(
    ColorXFromJsonStaticSerializer(),
    const TypeToken<_$extension_types.ColorXFromJsonStatic>(
        'ColorXFromJsonStatic'),
  );
  Serializers.instance.put(
    ColorXImplSerializer(),
    const TypeToken<_$extension_types.ColorXImpl>('ColorXImpl'),
  );
  Serializers.instance.put(
    ColorXToFromJsonSerializer(),
    const TypeToken<_$extension_types.ColorXToFromJson>('ColorXToFromJson'),
  );
  Serializers.instance.put(
    ColorXToJsonSerializer(),
    const TypeToken<_$extension_types.ColorXToJson>('ColorXToJson'),
  );
  Serializers.instance.put(
    ColorXToJsonImplSerializer(),
    const TypeToken<_$extension_types.ColorXToJsonImpl>('ColorXToJsonImpl'),
  );
  Serializers.instance
      .put(Serializer.define<_$extension_types.NestedParent, String>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$extension_types.NestedParent.fromJson($serialized);
    },
  ));
  Serializers.instance.put(
    NestedResetSerializer(),
    const TypeToken<_$extension_types.NestedReset>('NestedReset'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringX, String>(
      serialize: ($value) => $value.s,
      deserialize: ($serialized) {
        return _$extension_types.StringX(($serialized as String));
      },
    ),
    const TypeToken<_$extension_types.StringX>('StringX'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXFromJson, String>(
      serialize: ($value) => $value.s,
      deserialize: ($serialized) {
        return _$extension_types.StringXFromJson.fromJson($serialized);
      },
    ),
    const TypeToken<_$extension_types.StringXFromJson>('StringXFromJson'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXFromJsonImpl, String>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return _$extension_types.StringXFromJsonImpl.fromJson($serialized);
      },
    ),
    const TypeToken<_$extension_types.StringXFromJsonImpl>(
        'StringXFromJsonImpl'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXFromJsonStatic, String>(
      serialize: ($value) => $value.s,
      deserialize: ($serialized) {
        return _$extension_types.StringXFromJsonStatic.fromJson($serialized);
      },
    ),
    const TypeToken<_$extension_types.StringXFromJsonStatic>(
        'StringXFromJsonStatic'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXImpl, String>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return _$extension_types.StringXImpl(($serialized as String));
      },
    ),
    const TypeToken<_$extension_types.StringXImpl>('StringXImpl'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXPrivateCtor, String?>(
      serialize: ($value) => $value.s,
      deserialize: ($serialized) {
        return (($serialized as String)
            as _$extension_types.StringXPrivateCtor);
      },
    ),
    const TypeToken<_$extension_types.StringXPrivateCtor>('StringXPrivateCtor'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXPrivateCtorImpl, String?>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return (($serialized as String)
            as _$extension_types.StringXPrivateCtorImpl);
      },
    ),
    const TypeToken<_$extension_types.StringXPrivateCtorImpl>(
        'StringXPrivateCtorImpl'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXPrivateField, String>(
      serialize: ($value) => ($value as String),
      deserialize: ($serialized) {
        return _$extension_types.StringXPrivateField(($serialized as String));
      },
    ),
    const TypeToken<_$extension_types.StringXPrivateField>(
        'StringXPrivateField'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXPrivateFieldImpl, String>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return _$extension_types.StringXPrivateFieldImpl(
            ($serialized as String));
      },
    ),
    const TypeToken<_$extension_types.StringXPrivateFieldImpl>(
        'StringXPrivateFieldImpl'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXToFromJson, String>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _$extension_types.StringXToFromJson.fromJson($serialized);
      },
    ),
    const TypeToken<_$extension_types.StringXToFromJson>('StringXToFromJson'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXToJson, String>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _$extension_types.StringXToJson(($serialized as String));
      },
    ),
    const TypeToken<_$extension_types.StringXToJson>('StringXToJson'),
  );
  Serializers.instance.put(
    Serializer.define<_$extension_types.StringXToJsonImpl, String>(
      serialize: ($value) => $value.toJson(),
      deserialize: ($serialized) {
        return _$extension_types.StringXToJsonImpl(($serialized as String));
      },
    ),
    const TypeToken<_$extension_types.StringXToJsonImpl>('StringXToJsonImpl'),
  );
  Serializers.instance.put(Serializer.define<_$extension_types.Value, String>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$extension_types.Value.fromJson($serialized);
    },
  ));
  Serializers.instance.put(
    ValueXSerializer(),
    const TypeToken<_$extension_types.ValueX>('ValueX'),
  );
  Serializers.instance.put(
    ValueXFromJsonSerializer(),
    const TypeToken<_$extension_types.ValueXFromJson>('ValueXFromJson'),
  );
  Serializers.instance.put(
    ValueXFromJsonImplSerializer(),
    const TypeToken<_$extension_types.ValueXFromJsonImpl>('ValueXFromJsonImpl'),
  );
  Serializers.instance.put(
    ValueXFromJsonStaticSerializer(),
    const TypeToken<_$extension_types.ValueXFromJsonStatic>(
        'ValueXFromJsonStatic'),
  );
  Serializers.instance.put(
    ValueXImplSerializer(),
    const TypeToken<_$extension_types.ValueXImpl>('ValueXImpl'),
  );
  Serializers.instance.put(
    ValueXToFromJsonSerializer(),
    const TypeToken<_$extension_types.ValueXToFromJson>('ValueXToFromJson'),
  );
  Serializers.instance.put(
    ValueXToJsonSerializer(),
    const TypeToken<_$extension_types.ValueXToJson>('ValueXToJson'),
  );
  Serializers.instance.put(
    ValueXToJsonImplSerializer(),
    const TypeToken<_$extension_types.ValueXToJsonImpl>('ValueXToJsonImpl'),
  );
  Serializers.instance.put(Serializer.define<_$generic_wrappers.GenericWrappers,
      Map<String, Object?>>(
    serialize: ($value) => {
      r'listOfString': Serializers.instance
          .serialize<_$ilist.IList<String>>($value.listOfString),
      r'listOfUri':
          Serializers.instance.serialize<_$ilist.IList<Uri>>($value.listOfUri),
      r'listOfSimpleClass': Serializers.instance
          .serialize<_$ilist.IList<_$parameter_types.SimpleClass>>(
              $value.listOfSimpleClass),
      r'listOfListOfString': Serializers.instance
          .serialize<_$ilist.IList<_$ilist.IList<String>>>(
              $value.listOfListOfString),
      r'listOfListOfUri': Serializers.instance
          .serialize<_$ilist.IList<_$ilist.IList<Uri>>>($value.listOfListOfUri),
      r'listOfListOfSimpleClass': Serializers.instance.serialize<
              _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>>>(
          $value.listOfListOfSimpleClass),
      r'mapOfString': Serializers.instance
          .serialize<_$imap.IMap<String, String>>($value.mapOfString),
      r'mapOfUri': Serializers.instance
          .serialize<_$imap.IMap<String, Uri>>($value.mapOfUri),
      r'mapOfSimpleClass': Serializers.instance
          .serialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(
              $value.mapOfSimpleClass),
      r'mapOfListOfString': Serializers.instance
          .serialize<_$imap.IMap<String, _$ilist.IList<String>>>(
              $value.mapOfListOfString),
      r'mapOfListOfUri': Serializers.instance
          .serialize<_$imap.IMap<String, _$ilist.IList<Uri>>>(
              $value.mapOfListOfUri),
      r'mapOfListOfSimpleClass': Serializers.instance.serialize<
              _$imap
              .IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>>(
          $value.mapOfListOfSimpleClass),
      r'mapOfMapOfString': Serializers.instance
          .serialize<_$imap.IMap<String, _$imap.IMap<String, String>>>(
              $value.mapOfMapOfString),
      r'mapOfMapOfUri': Serializers.instance
          .serialize<_$imap.IMap<String, _$imap.IMap<String, Uri>>>(
              $value.mapOfMapOfUri),
      r'mapOfMapOfSimpleClass': Serializers.instance.serialize<
              _$imap.IMap<String,
                  _$imap.IMap<String, _$parameter_types.SimpleClass>>>(
          $value.mapOfMapOfSimpleClass),
    },
    deserialize: ($serialized) {
      return _$generic_wrappers.GenericWrappers(
        listOfString: Serializers.instance
            .deserialize<_$ilist.IList<String>>($serialized[r'listOfString']),
        listOfUri: Serializers.instance
            .deserialize<_$ilist.IList<Uri>>($serialized[r'listOfUri']),
        listOfSimpleClass: Serializers.instance
            .deserialize<_$ilist.IList<_$parameter_types.SimpleClass>>(
                $serialized[r'listOfSimpleClass']),
        listOfListOfString: Serializers.instance
            .deserialize<_$ilist.IList<_$ilist.IList<String>>>(
                $serialized[r'listOfListOfString']),
        listOfListOfUri: Serializers.instance
            .deserialize<_$ilist.IList<_$ilist.IList<Uri>>>(
                $serialized[r'listOfListOfUri']),
        listOfListOfSimpleClass: Serializers.instance.deserialize<
                _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>>>(
            $serialized[r'listOfListOfSimpleClass']),
        mapOfString: Serializers.instance
            .deserialize<_$imap.IMap<String, String>>(
                $serialized[r'mapOfString']),
        mapOfUri: Serializers.instance
            .deserialize<_$imap.IMap<String, Uri>>($serialized[r'mapOfUri']),
        mapOfSimpleClass: Serializers.instance
            .deserialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(
                $serialized[r'mapOfSimpleClass']),
        mapOfListOfString: Serializers.instance
            .deserialize<_$imap.IMap<String, _$ilist.IList<String>>>(
                $serialized[r'mapOfListOfString']),
        mapOfListOfUri: Serializers.instance
            .deserialize<_$imap.IMap<String, _$ilist.IList<Uri>>>(
                $serialized[r'mapOfListOfUri']),
        mapOfListOfSimpleClass: Serializers.instance.deserialize<
                _$imap
                .IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>>(
            $serialized[r'mapOfListOfSimpleClass']),
        mapOfMapOfString: Serializers.instance
            .deserialize<_$imap.IMap<String, _$imap.IMap<String, String>>>(
                $serialized[r'mapOfMapOfString']),
        mapOfMapOfUri: Serializers.instance
            .deserialize<_$imap.IMap<String, _$imap.IMap<String, Uri>>>(
                $serialized[r'mapOfMapOfUri']),
        mapOfMapOfSimpleClass: Serializers.instance.deserialize<
                _$imap.IMap<String,
                    _$imap.IMap<String, _$parameter_types.SimpleClass>>>(
            $serialized[r'mapOfMapOfSimpleClass']),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$metadata.Exportable, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return _$metadata.Exportable();
    },
  ));
  Serializers.instance.put(Serializer.define<_$metadata.LiteralEnum, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return _$metadata.LiteralEnum.values.byName($serialized);
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$metadata.Serializable, Map<String, Object?>?>(
    serialize: ($value) => {r'type': $value.type},
    deserialize: ($serialized) {
      return _$metadata.Serializable(
          (($serialized?[r'type'] as String?)) ?? null);
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$parameter_types.ComplexClass, Map<String, dynamic>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$parameter_types.ComplexClass.fromJson($serialized);
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$parameter_types.ComplexStruct, Map<String, Object?>>(
    serialize: ($value) => {
      r'aBigInt': Serializers.instance.serialize<BigInt>($value.aBigInt),
      r'aBool': $value.aBool,
      r'aDateTime': Serializers.instance.serialize<DateTime>($value.aDateTime),
      r'aDouble': $value.aDouble,
      r'aDuration': Serializers.instance.serialize<Duration>($value.aDuration),
      r'aListOfBigInt': $value.aListOfBigInt
          .map((el) => Serializers.instance.serialize<BigInt>(el))
          .toList(),
      r'aListOfBool': $value.aListOfBool,
      r'aListOfDateTime': $value.aListOfDateTime
          .map((el) => Serializers.instance.serialize<DateTime>(el))
          .toList(),
      r'aListOfDouble': $value.aListOfDouble,
      r'aListOfDuration': $value.aListOfDuration
          .map((el) => Serializers.instance.serialize<Duration>(el))
          .toList(),
      r'aListOfEnum': $value.aListOfEnum
          .map((el) =>
              Serializers.instance.serialize<_$parameter_types.MyEnum>(el))
          .toList(),
      r'aListOfInt': $value.aListOfInt,
      r'aListOfNull': $value.aListOfNull,
      r'aListOfRegExp': $value.aListOfRegExp
          .map((el) => Serializers.instance.serialize<RegExp>(el))
          .toList(),
      r'aListOfSimpleClass': $value.aListOfSimpleClass
          .map((el) =>
              Serializers.instance.serialize<_$parameter_types.SimpleClass>(el))
          .toList(),
      r'aListOfSimpleStruct': $value.aListOfSimpleStruct
          .map((el) => Serializers.instance
              .serialize<_$parameter_types.SimpleStruct>(el))
          .toList(),
      r'aListOfStackTrace': $value.aListOfStackTrace
          .map((el) => Serializers.instance.serialize<StackTrace>(el))
          .toList(),
      r'aListOfString': $value.aListOfString,
      r'aListOfUint8List': $value.aListOfUint8List
          .map((el) =>
              Serializers.instance.serialize<_$typed_data.Uint8List>(el))
          .toList(),
      r'aListOfUri': $value.aListOfUri
          .map((el) => Serializers.instance.serialize<Uri>(el))
          .toList(),
      r'aListOfUriData': $value.aListOfUriData
          .map((el) => Serializers.instance.serialize<UriData>(el))
          .toList(),
      r'aMapOfBigInt': $value.aMapOfBigInt.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<BigInt>(value),
          )),
      r'aMapOfBool': $value.aMapOfBool,
      r'aMapOfDateTime': $value.aMapOfDateTime.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<DateTime>(value),
          )),
      r'aMapOfDouble': $value.aMapOfDouble,
      r'aMapOfDuration': $value.aMapOfDuration.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<Duration>(value),
          )),
      r'aMapOfEnum': $value.aMapOfEnum.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<_$parameter_types.MyEnum>(value),
          )),
      r'aMapOfInt': $value.aMapOfInt,
      r'aMapOfNull': $value.aMapOfNull,
      r'aMapOfRegExp': $value.aMapOfRegExp.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<RegExp>(value),
          )),
      r'aMapOfSimpleClass': $value.aMapOfSimpleClass.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance
                .serialize<_$parameter_types.SimpleClass>(value),
          )),
      r'aMapOfSimpleStruct': $value.aMapOfSimpleStruct.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance
                .serialize<_$parameter_types.SimpleStruct>(value),
          )),
      r'aMapOfStackTrace': $value.aMapOfStackTrace.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<StackTrace>(value),
          )),
      r'aMapOfString': $value.aMapOfString,
      r'aMapOfUint8List': $value.aMapOfUint8List.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<_$typed_data.Uint8List>(value),
          )),
      r'aMapOfUri': $value.aMapOfUri.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<Uri>(value),
          )),
      r'aMapOfUriData': $value.aMapOfUriData.map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            Serializers.instance.serialize<UriData>(value),
          )),
      r'aNull': $value.aNull,
      r'aRegExp': Serializers.instance.serialize<RegExp>($value.aRegExp),
      r'aSimpleClass': Serializers.instance
          .serialize<_$parameter_types.SimpleClass>($value.aSimpleClass),
      r'aSimpleStruct': Serializers.instance
          .serialize<_$parameter_types.SimpleStruct>($value.aSimpleStruct),
      r'aStackTrace':
          Serializers.instance.serialize<StackTrace>($value.aStackTrace),
      r'aString': $value.aString,
      r'aUint8List': Serializers.instance
          .serialize<_$typed_data.Uint8List>($value.aUint8List),
      r'aUri': Serializers.instance.serialize<Uri>($value.aUri),
      r'aUriData': Serializers.instance.serialize<UriData>($value.aUriData),
      r'anEnum': Serializers.instance
          .serialize<_$parameter_types.MyEnum>($value.anEnum),
      r'anInt': $value.anInt,
      r'anIterableOfSimpleClass': $value.anIterableOfSimpleClass
          .map((el) =>
              Serializers.instance.serialize<_$parameter_types.SimpleClass>(el))
          .toList(),
    },
    deserialize: ($serialized) {
      return (
        aBigInt:
            Serializers.instance.deserialize<BigInt>($serialized[r'aBigInt']),
        aBool: ($serialized[r'aBool'] as bool),
        aDateTime: Serializers.instance
            .deserialize<DateTime>($serialized[r'aDateTime']),
        aDouble: ($serialized[r'aDouble'] as num).toDouble(),
        aDuration: Serializers.instance
            .deserialize<Duration>($serialized[r'aDuration']),
        aListOfBigInt: ($serialized[r'aListOfBigInt'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<BigInt>(el))
            .toList(),
        aListOfBool: ($serialized[r'aListOfBool'] as Iterable<Object?>)
            .map((el) => (el as bool))
            .toList(),
        aListOfDateTime: ($serialized[r'aListOfDateTime'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<DateTime>(el))
            .toList(),
        aListOfDouble: ($serialized[r'aListOfDouble'] as Iterable<Object?>)
            .map((el) => (el as num).toDouble())
            .toList(),
        aListOfDuration: ($serialized[r'aListOfDuration'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<Duration>(el))
            .toList(),
        aListOfEnum: ($serialized[r'aListOfEnum'] as Iterable<Object?>)
            .map((el) =>
                Serializers.instance.deserialize<_$parameter_types.MyEnum>(el))
            .toList(),
        aListOfInt: ($serialized[r'aListOfInt'] as Iterable<Object?>)
            .map((el) => (el as num).toInt())
            .toList(),
        aListOfNull: ($serialized[r'aListOfNull'] as Iterable<Object?>)
            .map((el) => (el as Null))
            .toList(),
        aListOfRegExp: ($serialized[r'aListOfRegExp'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<RegExp>(el))
            .toList(),
        aListOfSimpleClass:
            ($serialized[r'aListOfSimpleClass'] as Iterable<Object?>)
                .map((el) => Serializers.instance
                    .deserialize<_$parameter_types.SimpleClass>(el))
                .toList(),
        aListOfSimpleStruct:
            ($serialized[r'aListOfSimpleStruct'] as Iterable<Object?>)
                .map((el) => Serializers.instance
                    .deserialize<_$parameter_types.SimpleStruct>(el))
                .toList(),
        aListOfStackTrace:
            ($serialized[r'aListOfStackTrace'] as Iterable<Object?>)
                .map((el) => Serializers.instance.deserialize<StackTrace>(el))
                .toList(),
        aListOfString: ($serialized[r'aListOfString'] as Iterable<Object?>)
            .map((el) => (el as String))
            .toList(),
        aListOfUint8List: ($serialized[r'aListOfUint8List']
                as Iterable<Object?>)
            .map((el) =>
                Serializers.instance.deserialize<_$typed_data.Uint8List>(el))
            .toList(),
        aListOfUri: ($serialized[r'aListOfUri'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<Uri>(el))
            .toList(),
        aListOfUriData: ($serialized[r'aListOfUriData'] as Iterable<Object?>)
            .map((el) => Serializers.instance.deserialize<UriData>(el))
            .toList(),
        aMapOfBigInt:
            ($serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance.deserialize<BigInt>(value),
                )),
        aMapOfBool: ($serialized[r'aMapOfBool'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as bool),
            )),
        aMapOfDateTime:
            ($serialized[r'aMapOfDateTime'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance.deserialize<DateTime>(value),
                )),
        aMapOfDouble:
            ($serialized[r'aMapOfDouble'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  (value as num).toDouble(),
                )),
        aMapOfDuration:
            ($serialized[r'aMapOfDuration'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance.deserialize<Duration>(value),
                )),
        aMapOfEnum: ($serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.deserialize<_$parameter_types.MyEnum>(value),
            )),
        aMapOfInt: ($serialized[r'aMapOfInt'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as num).toInt(),
            )),
        aMapOfNull: ($serialized[r'aMapOfNull'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              (value as Null),
            )),
        aMapOfRegExp:
            ($serialized[r'aMapOfRegExp'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance.deserialize<RegExp>(value),
                )),
        aMapOfSimpleClass:
            ($serialized[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance
                      .deserialize<_$parameter_types.SimpleClass>(value),
                )),
        aMapOfSimpleStruct:
            ($serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance
                      .deserialize<_$parameter_types.SimpleStruct>(value),
                )),
        aMapOfStackTrace:
            ($serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance.deserialize<StackTrace>(value),
                )),
        aMapOfString:
            ($serialized[r'aMapOfString'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  (value as String),
                )),
        aMapOfUint8List:
            ($serialized[r'aMapOfUint8List'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance
                      .deserialize<_$typed_data.Uint8List>(value),
                )),
        aMapOfUri: ($serialized[r'aMapOfUri'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              Serializers.instance.deserialize<Uri>(value),
            )),
        aMapOfUriData:
            ($serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
          key,
          value,
        ) =>
                MapEntry(
                  key,
                  Serializers.instance.deserialize<UriData>(value),
                )),
        aNull: ($serialized[r'aNull'] as Null),
        aRegExp:
            Serializers.instance.deserialize<RegExp>($serialized[r'aRegExp']),
        aSimpleClass: Serializers.instance
            .deserialize<_$parameter_types.SimpleClass>(
                $serialized[r'aSimpleClass']),
        aSimpleStruct: Serializers.instance
            .deserialize<_$parameter_types.SimpleStruct>(
                $serialized[r'aSimpleStruct']),
        aStackTrace: Serializers.instance
            .deserialize<StackTrace>($serialized[r'aStackTrace']),
        aString: ($serialized[r'aString'] as String),
        aUint8List: Serializers.instance
            .deserialize<_$typed_data.Uint8List>($serialized[r'aUint8List']),
        aUri: Serializers.instance.deserialize<Uri>($serialized[r'aUri']),
        aUriData:
            Serializers.instance.deserialize<UriData>($serialized[r'aUriData']),
        anEnum: Serializers.instance
            .deserialize<_$parameter_types.MyEnum>($serialized[r'anEnum']),
        anInt: ($serialized[r'anInt'] as num).toInt(),
        anIterableOfSimpleClass:
            ($serialized[r'anIterableOfSimpleClass'] as Iterable<Object?>)
                .map((el) => Serializers.instance
                    .deserialize<_$parameter_types.SimpleClass>(el))
                .toList()
      );
    },
  ));
  Serializers.instance.put(Serializer.define<_$parameter_types.MyEnum, String>(
    serialize: ($value) => $value.name,
    deserialize: ($serialized) {
      return _$parameter_types.MyEnum.values.byName($serialized);
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$parameter_types.SimpleClass, Map<String, dynamic>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$parameter_types.SimpleClass.fromJson($serialized);
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$parameter_types.SimpleStruct, Map<String, Object?>?>(
    serialize: ($value) => {},
    deserialize: ($serialized) {
      return ();
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$records.NamedFieldsRecord, Map<String, Object?>>(
    serialize: ($value) => {
      r'anotherField': $value.anotherField,
      r'field': $value.field,
    },
    deserialize: ($serialized) {
      return (
        anotherField: ($serialized[r'anotherField'] as String),
        field: ($serialized[r'field'] as String)
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$records.Nested, Map<String, Object?>>(
    serialize: ($value) => {
      r'namedFields': Serializers.instance
          .serialize<_$records.NamedFieldsRecord>($value.namedFields)
    },
    deserialize: ($serialized) {
      return (
        namedFields: Serializers.instance
            .deserialize<_$records.NamedFieldsRecord>(
                $serialized[r'namedFields'])
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$records.NullableNested, Map<String, Object?>>(
    serialize: ($value) => {
      r'namedFields': Serializers.instance
          .serialize<_$records.NamedFieldsRecord?>($value.namedFields)
    },
    deserialize: ($serialized) {
      return (
        namedFields: Serializers.instance
            .deserialize<_$records.NamedFieldsRecord?>(
                $serialized[r'namedFields'])
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$sealed_classes.Circle, Map<String, Object?>>(
    serialize: ($value) => {r'radius': $value.radius},
    deserialize: ($serialized) {
      return _$sealed_classes.Circle(
          ($serialized[r'radius'] as num).toDouble());
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.CircleWithCustomJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$sealed_classes.CircleWithCustomJson.fromJson($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.CircleWithInheritedCustomJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return (_$sealed_classes.ShapeWithInheritedCustomJson.fromJson({
        r'$type': r'CircleWithInheritedCustomJson',
        ...$serialized,
      }) as _$sealed_classes.CircleWithInheritedCustomJson);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.CircleWithOverriddenCustomJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$sealed_classes.CircleWithOverriddenCustomJson.fromJson(
          $serialized);
    },
  ));
  Serializers.instance.put(const ErrResult_E_ShapeExceptionSerializer());
  Serializers.instance.put(const ErrResult_E_ShapeExceptionSerializer<
      _$exceptions.ShapeException>());
  Serializers.instance.put(const ErrResult_E_ShapeExceptionSerializer<
      _$exceptions.BadShapeException>());
  Serializers.instance.put(Serializer.define<_$sealed_classes.ErrResult<String>,
      Map<String, Object?>>(
    serialize: ($value) => {r'error': $value.error},
    deserialize: ($serialized) {
      return _$sealed_classes.ErrResult<String>(
          ($serialized[r'error'] as String));
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.ErrResult<_$sealed_classes.Shape>, Map<String, Object?>>(
    serialize: ($value) => {
      r'error':
          Serializers.instance.serialize<_$sealed_classes.Shape>($value.error)
    },
    deserialize: ($serialized) {
      return _$sealed_classes.ErrResult<_$sealed_classes.Shape>(Serializers
          .instance
          .deserialize<_$sealed_classes.Shape>($serialized[r'error']));
    },
  ));
  Serializers.instance.put(const ErrResult_T_ShapeSerializer());
  Serializers.instance
      .put(const ErrResult_T_ShapeSerializer<_$sealed_classes.Shape>());
  Serializers.instance
      .put(const ErrResult_T_ShapeSerializer<_$sealed_classes.Circle>());
  Serializers.instance
      .put(const ErrResult_T_ShapeSerializer<_$sealed_classes.Rectangle>());
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.OkResult<_$sealed_classes.Shape>, Map<String, Object?>>(
    serialize: ($value) => {
      r'data':
          Serializers.instance.serialize<_$sealed_classes.Shape>($value.data)
    },
    deserialize: ($serialized) {
      return _$sealed_classes.OkResult<_$sealed_classes.Shape>(Serializers
          .instance
          .deserialize<_$sealed_classes.Shape>($serialized[r'data']));
    },
  ));
  Serializers.instance.put(const OkResult_E_ShapeExceptionSerializer());
  Serializers.instance.put(
      const OkResult_E_ShapeExceptionSerializer<_$exceptions.ShapeException>());
  Serializers.instance.put(const OkResult_E_ShapeExceptionSerializer<
      _$exceptions.BadShapeException>());
  Serializers.instance.put(const OkResult_T_ShapeSerializer());
  Serializers.instance
      .put(const OkResult_T_ShapeSerializer<_$sealed_classes.Shape>());
  Serializers.instance
      .put(const OkResult_T_ShapeSerializer<_$sealed_classes.Circle>());
  Serializers.instance
      .put(const OkResult_T_ShapeSerializer<_$sealed_classes.Rectangle>());
  Serializers.instance.put(Serializer.define<_$sealed_classes.OkResult<String>,
      Map<String, Object?>>(
    serialize: ($value) => {r'data': $value.data},
    deserialize: ($serialized) {
      return _$sealed_classes.OkResult<String>(
          ($serialized[r'data'] as String));
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$sealed_classes.OkShapeResult, Map<String, Object?>>(
    serialize: ($value) => {
      r'data':
          Serializers.instance.serialize<_$sealed_classes.Shape>($value.data)
    },
    deserialize: ($serialized) {
      return _$sealed_classes.OkShapeResult(Serializers.instance
          .deserialize<_$sealed_classes.Shape>($serialized[r'data']));
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$sealed_classes.Rectangle, Map<String, Object?>>(
    serialize: ($value) => {
      r'width': $value.width,
      r'height': $value.height,
    },
    deserialize: ($serialized) {
      return _$sealed_classes.Rectangle(
        ($serialized[r'width'] as num).toDouble(),
        ($serialized[r'height'] as num).toDouble(),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.RectangleWithCustomJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return _$sealed_classes.RectangleWithCustomJson.fromJson($serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.RectangleWithInheritedCustomJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return (_$sealed_classes.ShapeWithInheritedCustomJson.fromJson({
        r'$type': r'RectangleWithInheritedCustomJson',
        ...$serialized,
      }) as _$sealed_classes.RectangleWithInheritedCustomJson);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.RectangleWithOverriddenCustomJson, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(),
    deserialize: ($serialized) {
      return (_$sealed_classes.ShapeWithOverriddenCustomJson.fromJson({
        r'$type': r'RectangleWithOverriddenCustomJson',
        ...$serialized,
      }) as _$sealed_classes.RectangleWithOverriddenCustomJson);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.Result<_$sealed_classes.Shape, String>,
      Map<String, Object?>>(
    serialize: ($value) {
      if ($value
          is _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>) {
        return {
          ...(Serializers.instance.serialize<
                  _$sealed_classes
                  .SwappedResult<String, _$sealed_classes.Shape>>($value)
              as Map<String, Object?>),
          r'$type': r'SwappedResult',
        };
      }
      if ($value is _$sealed_classes.OkResult<_$sealed_classes.Shape>) {
        return {
          ...(Serializers.instance
              .serialize<_$sealed_classes.OkResult<_$sealed_classes.Shape>>(
                  $value) as Map<String, Object?>),
          r'$type': r'OkResult',
        };
      }
      if ($value is _$sealed_classes.ErrResult<String>) {
        return {
          ...(Serializers.instance
                  .serialize<_$sealed_classes.ErrResult<String>>($value)
              as Map<String, Object?>),
          r'$type': r'ErrResult',
        };
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($value.runtimeType))
          .toString());
    },
    deserialize: ($serialized) {
      if ($serialized[r'$type'] == r'SwappedResult') {
        return Serializers.instance.deserialize<
            _$sealed_classes
            .SwappedResult<String, _$sealed_classes.Shape>>($serialized);
      }
      if ($serialized[r'$type'] == r'OkResult') {
        return Serializers.instance
            .deserialize<_$sealed_classes.OkResult<_$sealed_classes.Shape>>(
                $serialized);
      }
      if ($serialized[r'$type'] == r'ErrResult') {
        return Serializers.instance
            .deserialize<_$sealed_classes.ErrResult<String>>($serialized);
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString());
    },
  ));
  Serializers.instance.put(const Result_E_ShapeException_T_ShapeSerializer());
  Serializers.instance.put(const Result_E_ShapeException_T_ShapeSerializer<
      _$exceptions.ShapeException, _$sealed_classes.Shape>());
  Serializers.instance.put(const Result_E_ShapeException_T_ShapeSerializer<
      _$exceptions.ShapeException, _$sealed_classes.Circle>());
  Serializers.instance.put(const Result_E_ShapeException_T_ShapeSerializer<
      _$exceptions.ShapeException, _$sealed_classes.Rectangle>());
  Serializers.instance.put(const Result_E_ShapeException_T_ShapeSerializer<
      _$exceptions.BadShapeException, _$sealed_classes.Shape>());
  Serializers.instance.put(const Result_E_ShapeException_T_ShapeSerializer<
      _$exceptions.BadShapeException, _$sealed_classes.Circle>());
  Serializers.instance.put(const Result_E_ShapeException_T_ShapeSerializer<
      _$exceptions.BadShapeException, _$sealed_classes.Rectangle>());
  Serializers.instance.put(const Result_T_Shape_E_ShapeExceptionSerializer());
  Serializers.instance.put(const Result_T_Shape_E_ShapeExceptionSerializer<
      _$sealed_classes.Shape, _$exceptions.ShapeException>());
  Serializers.instance.put(const Result_T_Shape_E_ShapeExceptionSerializer<
      _$sealed_classes.Shape, _$exceptions.BadShapeException>());
  Serializers.instance.put(const Result_T_Shape_E_ShapeExceptionSerializer<
      _$sealed_classes.Circle, _$exceptions.ShapeException>());
  Serializers.instance.put(const Result_T_Shape_E_ShapeExceptionSerializer<
      _$sealed_classes.Circle, _$exceptions.BadShapeException>());
  Serializers.instance.put(const Result_T_Shape_E_ShapeExceptionSerializer<
      _$sealed_classes.Rectangle, _$exceptions.ShapeException>());
  Serializers.instance.put(const Result_T_Shape_E_ShapeExceptionSerializer<
      _$sealed_classes.Rectangle, _$exceptions.BadShapeException>());
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.Result<String, _$sealed_classes.Shape>,
      Map<String, Object?>>(
    serialize: ($value) {
      if ($value
          is _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>) {
        return {
          ...(Serializers.instance.serialize<
                  _$sealed_classes
                  .SwappedResult<_$sealed_classes.Shape, String>>($value)
              as Map<String, Object?>),
          r'$type': r'SwappedResult',
        };
      }
      if ($value is _$sealed_classes.OkResult<String>) {
        return {
          ...(Serializers.instance
                  .serialize<_$sealed_classes.OkResult<String>>($value)
              as Map<String, Object?>),
          r'$type': r'OkResult',
        };
      }
      if ($value is _$sealed_classes.ErrResult<_$sealed_classes.Shape>) {
        return {
          ...(Serializers.instance
              .serialize<_$sealed_classes.ErrResult<_$sealed_classes.Shape>>(
                  $value) as Map<String, Object?>),
          r'$type': r'ErrResult',
        };
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($value.runtimeType))
          .toString());
    },
    deserialize: ($serialized) {
      if ($serialized[r'$type'] == r'SwappedResult') {
        return Serializers.instance.deserialize<
            _$sealed_classes
            .SwappedResult<_$sealed_classes.Shape, String>>($serialized);
      }
      if ($serialized[r'$type'] == r'OkResult') {
        return Serializers.instance
            .deserialize<_$sealed_classes.OkResult<String>>($serialized);
      }
      if ($serialized[r'$type'] == r'ErrResult') {
        return Serializers.instance
            .deserialize<_$sealed_classes.ErrResult<_$sealed_classes.Shape>>(
                $serialized);
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Result')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString());
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$sealed_classes.Shape, Map<String, Object?>>(
    serialize: ($value) {
      if ($value is _$sealed_classes.Circle) {
        return {
          ...(Serializers.instance.serialize<_$sealed_classes.Circle>($value)
              as Map<String, Object?>),
          r'$type': r'Circle',
        };
      }
      if ($value is _$sealed_classes.Rectangle) {
        return {
          ...(Serializers.instance.serialize<_$sealed_classes.Rectangle>($value)
              as Map<String, Object?>),
          r'$type': r'Rectangle',
        };
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Shape')
            ..write(': ')
            ..write($value.runtimeType))
          .toString());
    },
    deserialize: ($serialized) {
      if ($serialized[r'$type'] == r'Circle') {
        return Serializers.instance
            .deserialize<_$sealed_classes.Circle>($serialized);
      }
      if ($serialized[r'$type'] == r'Rectangle') {
        return Serializers.instance
            .deserialize<_$sealed_classes.Rectangle>($serialized);
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'Shape')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString());
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.ShapeWithCustomJson, Map<String, Object?>>(
    serialize: ($value) {
      if ($value is _$sealed_classes.CircleWithCustomJson) {
        return {
          ...(Serializers.instance
                  .serialize<_$sealed_classes.CircleWithCustomJson>($value)
              as Map<String, Object?>),
          r'$type': r'CircleWithCustomJson',
        };
      }
      if ($value is _$sealed_classes.RectangleWithCustomJson) {
        return {
          ...(Serializers.instance
                  .serialize<_$sealed_classes.RectangleWithCustomJson>($value)
              as Map<String, Object?>),
          r'$type': r'RectangleWithCustomJson',
        };
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'ShapeWithCustomJson')
            ..write(': ')
            ..write($value.runtimeType))
          .toString());
    },
    deserialize: ($serialized) {
      if ($serialized[r'$type'] == r'CircleWithCustomJson') {
        return Serializers.instance
            .deserialize<_$sealed_classes.CircleWithCustomJson>($serialized);
      }
      if ($serialized[r'$type'] == r'RectangleWithCustomJson') {
        return Serializers.instance
            .deserialize<_$sealed_classes.RectangleWithCustomJson>($serialized);
      }
      throw SerializationException((StringBuffer('Unknown subtype of ')
            ..write(r'ShapeWithCustomJson')
            ..write(': ')
            ..write($serialized[r'$type']))
          .toString());
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.ShapeWithInheritedCustomJson, Map<String, Object?>>(
    serialize: ($value) => {
      ...$value.toJson(),
      r'$type': switch ($value) {
        _$sealed_classes.CircleWithInheritedCustomJson() =>
          r'CircleWithInheritedCustomJson',
        _$sealed_classes.RectangleWithInheritedCustomJson() =>
          r'RectangleWithInheritedCustomJson',
      },
    },
    deserialize: ($serialized) {
      return _$sealed_classes.ShapeWithInheritedCustomJson.fromJson(
          $serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.ShapeWithOverriddenCustomJson, Map<String, Object?>>(
    serialize: ($value) => {
      ...$value.toJson(),
      r'$type': switch ($value) {
        _$sealed_classes.CircleWithOverriddenCustomJson() =>
          r'CircleWithOverriddenCustomJson',
        _$sealed_classes.RectangleWithOverriddenCustomJson() =>
          r'RectangleWithOverriddenCustomJson',
      },
    },
    deserialize: ($serialized) {
      return _$sealed_classes.ShapeWithOverriddenCustomJson.fromJson(
          $serialized);
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>,
      Map<String, Object?>>(
    serialize: ($value) => {
      r'result': Serializers.instance
          .serialize<_$sealed_classes.Result<String, _$sealed_classes.Shape>>(
              $value.result)
    },
    deserialize: ($serialized) {
      return _$sealed_classes.SwappedResult<String, _$sealed_classes.Shape>(
          Serializers.instance.deserialize<
              _$sealed_classes
              .Result<String, _$sealed_classes.Shape>>($serialized[r'result']));
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>,
      Map<String, Object?>>(
    serialize: ($value) => {
      r'result': Serializers.instance
          .serialize<_$sealed_classes.Result<_$sealed_classes.Shape, String>>(
              $value.result)
    },
    deserialize: ($serialized) {
      return _$sealed_classes.SwappedResult<_$sealed_classes.Shape, String>(
          Serializers.instance.deserialize<
              _$sealed_classes
              .Result<_$sealed_classes.Shape, String>>($serialized[r'result']));
    },
  ));
  Serializers.instance
      .put(const SwappedResult_E_ShapeException_T_ShapeSerializer());
  Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
          _$exceptions.ShapeException, _$sealed_classes.Shape>());
  Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
          _$exceptions.ShapeException, _$sealed_classes.Circle>());
  Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
          _$exceptions.ShapeException, _$sealed_classes.Rectangle>());
  Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
          _$exceptions.BadShapeException, _$sealed_classes.Shape>());
  Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
          _$exceptions.BadShapeException, _$sealed_classes.Circle>());
  Serializers.instance.put(
      const SwappedResult_E_ShapeException_T_ShapeSerializer<
          _$exceptions.BadShapeException, _$sealed_classes.Rectangle>());
  Serializers.instance
      .put(const SwappedResult_T_Shape_E_ShapeExceptionSerializer());
  Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
          _$sealed_classes.Shape, _$exceptions.ShapeException>());
  Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
          _$sealed_classes.Shape, _$exceptions.BadShapeException>());
  Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
          _$sealed_classes.Circle, _$exceptions.ShapeException>());
  Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
          _$sealed_classes.Circle, _$exceptions.BadShapeException>());
  Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
          _$sealed_classes.Rectangle, _$exceptions.ShapeException>());
  Serializers.instance.put(
      const SwappedResult_T_Shape_E_ShapeExceptionSerializer<
          _$sealed_classes.Rectangle, _$exceptions.BadShapeException>());
  Serializers.instance
      .put(Serializer.define<BadRequestException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return BadRequestException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<InternalServerException, Map<String, Object?>>(
    serialize: ($value) => {r'message': $value.message},
    deserialize: ($serialized) {
      return InternalServerException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance
      .put(Serializer.define<SerializationException, Map<String, Object?>>(
    serialize: ($value) => {
      r'message': $value.message,
      r'offset': $value.offset,
      r'source': $value.source,
    },
    deserialize: ($serialized) {
      return SerializationException(($serialized[r'message'] as String));
    },
  ));
  Serializers.instance.put(
    Serializer.define<JsonBool, bool>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return JsonBool(($serialized as bool));
      },
    ),
    const TypeToken<JsonBool>('JsonBool'),
  );
  Serializers.instance.put(
    Serializer.define<JsonDouble, double>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return JsonDouble(($serialized as num).toDouble());
      },
    ),
    const TypeToken<JsonDouble>('JsonDouble'),
  );
  Serializers.instance.put(
    Serializer.define<JsonInt, int>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return JsonInt(($serialized as num).toInt());
      },
    ),
    const TypeToken<JsonInt>('JsonInt'),
  );
  Serializers.instance.put(
    Serializer.define<JsonList, List<Object?>>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return JsonList(($serialized as Iterable<Object?>).toList());
      },
    ),
    const TypeToken<JsonList>('JsonList'),
  );
  Serializers.instance.put(
    Serializer.define<JsonMap, Map<String, Object?>>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return JsonMap(($serialized as Map<String, Object?>));
      },
    ),
    const TypeToken<JsonMap>('JsonMap'),
  );
  Serializers.instance.put(
    Serializer.define<JsonNum, num>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return JsonNum(($serialized as num));
      },
    ),
    const TypeToken<JsonNum>('JsonNum'),
  );
  Serializers.instance.put(
    Serializer.define<JsonString, String>(
      serialize: ($value) => $value,
      deserialize: ($serialized) {
        return JsonString(($serialized as String));
      },
    ),
    const TypeToken<JsonString>('JsonString'),
  );
  Serializers.instance.put(
    Serializer.define<JsonValue, Object>(
      serialize: ($value) => $value.value,
      deserialize: ($serialized) {
        return JsonValue($serialized);
      },
    ),
    const TypeToken<JsonValue>('JsonValue'),
  );
  Serializers.instance.put(Serializer.define<_$ilist.IList<Uri>, dynamic>(
    serialize: ($value) =>
        $value.toJson((value) => Serializers.instance.serialize<Uri>(value)),
    deserialize: ($serialized) {
      return _$ilist.IList<Uri>.fromJson(
        $serialized,
        (value) => Serializers.instance.deserialize<Uri>(value),
      );
    },
  ));
  Serializers.instance.put(
      Serializer.define<_$ilist.IList<_$parameter_types.SimpleClass>, dynamic>(
    serialize: ($value) => $value.toJson((value) =>
        Serializers.instance.serialize<_$parameter_types.SimpleClass>(value)),
    deserialize: ($serialized) {
      return _$ilist.IList<_$parameter_types.SimpleClass>.fromJson(
        $serialized,
        (value) => Serializers.instance
            .deserialize<_$parameter_types.SimpleClass>(value),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$ilist.IList<_$ilist.IList<String>>, dynamic>(
    serialize: ($value) => $value.toJson((value) =>
        Serializers.instance.serialize<_$ilist.IList<String>>(value)),
    deserialize: ($serialized) {
      return _$ilist.IList<_$ilist.IList<String>>.fromJson(
        $serialized,
        (value) =>
            Serializers.instance.deserialize<_$ilist.IList<String>>(value),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$ilist.IList<_$ilist.IList<Uri>>, dynamic>(
    serialize: ($value) => $value.toJson(
        (value) => Serializers.instance.serialize<_$ilist.IList<Uri>>(value)),
    deserialize: ($serialized) {
      return _$ilist.IList<_$ilist.IList<Uri>>.fromJson(
        $serialized,
        (value) => Serializers.instance.deserialize<_$ilist.IList<Uri>>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$ilist.IList<_$ilist.IList<_$parameter_types.SimpleClass>>, dynamic>(
    serialize: ($value) => $value.toJson((value) => Serializers.instance
        .serialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value)),
    deserialize: ($serialized) {
      return _$ilist
          .IList<_$ilist.IList<_$parameter_types.SimpleClass>>.fromJson(
        $serialized,
        (value) => Serializers.instance
            .deserialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<_$ilist.IList<String>, dynamic>(
    serialize: ($value) => $value.toJson((value) => value),
    deserialize: ($serialized) {
      return _$ilist.IList<String>.fromJson(
        $serialized,
        (value) => (value as String),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$imap.IMap<String, String>, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) => value,
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String, String>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) => (value as String),
      );
    },
  ));
  Serializers.instance
      .put(Serializer.define<_$imap.IMap<String, Uri>, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) => Serializers.instance.serialize<Uri>(value),
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String, Uri>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) => Serializers.instance.deserialize<Uri>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$imap.IMap<String, _$parameter_types.SimpleClass>, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) =>
          Serializers.instance.serialize<_$parameter_types.SimpleClass>(value),
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String, _$parameter_types.SimpleClass>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) => Serializers.instance
            .deserialize<_$parameter_types.SimpleClass>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$imap.IMap<String, _$ilist.IList<String>>, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) => Serializers.instance.serialize<_$ilist.IList<String>>(value),
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String, _$ilist.IList<String>>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) =>
            Serializers.instance.deserialize<_$ilist.IList<String>>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$imap.IMap<String, _$ilist.IList<Uri>>, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) => Serializers.instance.serialize<_$ilist.IList<Uri>>(value),
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String, _$ilist.IList<Uri>>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) => Serializers.instance.deserialize<_$ilist.IList<Uri>>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$imap.IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>,
      Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) => Serializers.instance
          .serialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value),
    ),
    deserialize: ($serialized) {
      return _$imap
          .IMap<String, _$ilist.IList<_$parameter_types.SimpleClass>>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) => Serializers.instance
            .deserialize<_$ilist.IList<_$parameter_types.SimpleClass>>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$imap.IMap<String, _$imap.IMap<String, String>>, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) =>
          Serializers.instance.serialize<_$imap.IMap<String, String>>(value),
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String, _$imap.IMap<String, String>>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) => Serializers.instance
            .deserialize<_$imap.IMap<String, String>>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$imap.IMap<String, _$imap.IMap<String, Uri>>, Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) =>
          Serializers.instance.serialize<_$imap.IMap<String, Uri>>(value),
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String, _$imap.IMap<String, Uri>>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) =>
            Serializers.instance.deserialize<_$imap.IMap<String, Uri>>(value),
      );
    },
  ));
  Serializers.instance.put(Serializer.define<
      _$imap.IMap<String, _$imap.IMap<String, _$parameter_types.SimpleClass>>,
      Map<String, Object?>>(
    serialize: ($value) => $value.toJson(
      (value) => value,
      (value) => Serializers.instance
          .serialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(value),
    ),
    deserialize: ($serialized) {
      return _$imap.IMap<String,
          _$imap.IMap<String, _$parameter_types.SimpleClass>>.fromJson(
        $serialized,
        (value) => (value as String),
        (value) => Serializers.instance
            .deserialize<_$imap.IMap<String, _$parameter_types.SimpleClass>>(
                value),
      );
    },
  ));
}

typedef Record$k2phuz = ({
  _$records.NamedFieldsRecord aliased,
  ({String anotherField, String field}) nonAliased
});
typedef Record$k7x4l9 = ({String a, String b, String c});
typedef Record$rmm4wt = ({String anotherField, String field});

final class ColorXFromJsonImplSerializer
    extends Serializer<_$extension_types.ColorXFromJsonImpl> {
  ColorXFromJsonImplSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorXFromJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorXFromJsonImpl.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXFromJsonImpl $value) =>
      $value.toJson();
}

final class ColorXFromJsonSerializer
    extends Serializer<_$extension_types.ColorXFromJson> {
  ColorXFromJsonSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorXFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorXFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXFromJson $value) =>
      $serializers.serialize<_$extension_types.Color>($value.c);
}

final class ColorXFromJsonStaticSerializer
    extends Serializer<_$extension_types.ColorXFromJsonStatic> {
  ColorXFromJsonStaticSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorXFromJsonStatic deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorXFromJsonStatic.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXFromJsonStatic $value) =>
      $serializers.serialize<_$extension_types.Color>($value.c);
}

final class ColorXImplSerializer
    extends Serializer<_$extension_types.ColorXImpl> {
  ColorXImplSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorXImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorXImpl(
        $serializers.deserialize<_$extension_types.Color>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ColorXImpl $value) =>
      $serializers.serialize<_$extension_types.Color>($value);
}

final class ColorXSerializer extends Serializer<_$extension_types.ColorX> {
  ColorXSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorX deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorX(
        $serializers.deserialize<_$extension_types.Color>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ColorX $value) =>
      $serializers.serialize<_$extension_types.Color>($value.c);
}

final class ColorXToFromJsonSerializer
    extends Serializer<_$extension_types.ColorXToFromJson> {
  ColorXToFromJsonSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorXToFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorXToFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ColorXToFromJson $value) =>
      $value.toJson();
}

final class ColorXToJsonImplSerializer
    extends Serializer<_$extension_types.ColorXToJsonImpl> {
  ColorXToJsonImplSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorXToJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorXToJsonImpl(
        $serializers.deserialize<_$extension_types.Color>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ColorXToJsonImpl $value) =>
      $value.toJson();
}

final class ColorXToJsonSerializer
    extends Serializer<_$extension_types.ColorXToJson> {
  ColorXToJsonSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Color, String>(
      serialize: ($value) => $value.name,
      deserialize: ($serialized) {
        return _$extension_types.Color.values.byName($serialized);
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ColorXToJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ColorXToJson(
        $serializers.deserialize<_$extension_types.Color>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ColorXToJson $value) => $value.toJson();
}

final class ErrResult_E_ShapeExceptionSerializer<
        E extends _$exceptions.ShapeException>
    extends Serializer<_$sealed_classes.ErrResult<E>> {
  const ErrResult_E_ShapeExceptionSerializer();

  @override
  _$sealed_classes.ErrResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$sealed_classes.ErrResult<E>(
        Serializers.instance.deserialize<E>($serialized[r'error']));
  }

  @override
  Object? serialize(_$sealed_classes.ErrResult<E> $value) =>
      {r'error': Serializers.instance.serialize<E>($value.error)};
}

final class ErrResult_T_ShapeSerializer<T extends _$sealed_classes.Shape>
    extends Serializer<_$sealed_classes.ErrResult<T>> {
  const ErrResult_T_ShapeSerializer();

  @override
  _$sealed_classes.ErrResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$sealed_classes.ErrResult<T>(
        Serializers.instance.deserialize<T>($serialized[r'error']));
  }

  @override
  Object? serialize(_$sealed_classes.ErrResult<T> $value) =>
      {r'error': Serializers.instance.serialize<T>($value.error)};
}

final class NestedResetSerializer
    extends Serializer<_$extension_types.NestedReset> {
  NestedResetSerializer() {
    $serializers
      ..put(Serializer.define<_$extension_types.NestedParent,
          Map<String, Object?>>(
        serialize: ($value) => {
          r'child': $serializers
              .serialize<_$extension_types.NestedChild>($value.child)
        },
        deserialize: ($serialized) {
          return _$extension_types.NestedParent(
              $serializers.deserialize<_$extension_types.NestedChild>(
                  $serialized[r'child']));
        },
      ))
      ..put(Serializer.define<_$extension_types.NestedChild,
          Map<String, Object?>>(
        serialize: ($value) => {r'value': $value.value},
        deserialize: ($serialized) {
          return _$extension_types.NestedChild(
              ($serialized[r'value'] as String));
        },
      ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.NestedReset deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$extension_types.NestedReset(
        $serializers.deserialize<_$extension_types.NestedParent>($serialized));
  }

  @override
  Object? serialize(_$extension_types.NestedReset $value) =>
      $serializers.serialize<_$extension_types.NestedParent>($value.it);
}

final class OkResult_E_ShapeExceptionSerializer<
        E extends _$exceptions.ShapeException>
    extends Serializer<_$sealed_classes.OkResult<E>> {
  const OkResult_E_ShapeExceptionSerializer();

  @override
  _$sealed_classes.OkResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$sealed_classes.OkResult<E>(
        Serializers.instance.deserialize<E>($serialized[r'data']));
  }

  @override
  Object? serialize(_$sealed_classes.OkResult<E> $value) =>
      {r'data': Serializers.instance.serialize<E>($value.data)};
}

final class OkResult_T_ShapeSerializer<T extends _$sealed_classes.Shape>
    extends Serializer<_$sealed_classes.OkResult<T>> {
  const OkResult_T_ShapeSerializer();

  @override
  _$sealed_classes.OkResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$sealed_classes.OkResult<T>(
        Serializers.instance.deserialize<T>($serialized[r'data']));
  }

  @override
  Object? serialize(_$sealed_classes.OkResult<T> $value) =>
      {r'data': Serializers.instance.serialize<T>($value.data)};
}

final class Result_E_ShapeException_T_ShapeSerializer<
        E extends _$exceptions.ShapeException, T extends _$sealed_classes.Shape>
    extends Serializer<_$sealed_classes.Result<E, T>> {
  const Result_E_ShapeException_T_ShapeSerializer();

  @override
  _$sealed_classes.Result<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.SwappedResult<T, E>>($serialized);
    }
    if ($serialized[r'$type'] == r'OkResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.OkResult<E>>($serialized);
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.ErrResult<T>>($serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_$sealed_classes.Result<E, T> $value) {
    if ($value is _$sealed_classes.SwappedResult<T, E>) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.SwappedResult<T, E>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is _$sealed_classes.OkResult<E>) {
      return {
        ...(Serializers.instance.serialize<_$sealed_classes.OkResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is _$sealed_classes.ErrResult<T>) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.ErrResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($value.runtimeType))
        .toString());
  }
}

final class Result_T_Shape_E_ShapeExceptionSerializer<
        T extends _$sealed_classes.Shape, E extends _$exceptions.ShapeException>
    extends Serializer<_$sealed_classes.Result<T, E>> {
  const Result_T_Shape_E_ShapeExceptionSerializer();

  @override
  _$sealed_classes.Result<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'SwappedResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.SwappedResult<E, T>>($serialized);
    }
    if ($serialized[r'$type'] == r'OkResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.OkResult<T>>($serialized);
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return Serializers.instance
          .deserialize<_$sealed_classes.ErrResult<E>>($serialized);
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(_$sealed_classes.Result<T, E> $value) {
    if ($value is _$sealed_classes.SwappedResult<E, T>) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.SwappedResult<E, T>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is _$sealed_classes.OkResult<T>) {
      return {
        ...(Serializers.instance.serialize<_$sealed_classes.OkResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is _$sealed_classes.ErrResult<E>) {
      return {
        ...(Serializers.instance
                .serialize<_$sealed_classes.ErrResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($value.runtimeType))
        .toString());
  }
}

final class SwappedResult_E_ShapeException_T_ShapeSerializer<
        E extends _$exceptions.ShapeException, T extends _$sealed_classes.Shape>
    extends Serializer<_$sealed_classes.SwappedResult<E, T>> {
  const SwappedResult_E_ShapeException_T_ShapeSerializer();

  @override
  _$sealed_classes.SwappedResult<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$sealed_classes.SwappedResult<E, T>(Serializers.instance
        .deserialize<_$sealed_classes.Result<E, T>>($serialized[r'result']));
  }

  @override
  Object? serialize(_$sealed_classes.SwappedResult<E, T> $value) => {
        r'result': Serializers.instance
            .serialize<_$sealed_classes.Result<E, T>>($value.result)
      };
}

final class SwappedResult_T_Shape_E_ShapeExceptionSerializer<
        T extends _$sealed_classes.Shape, E extends _$exceptions.ShapeException>
    extends Serializer<_$sealed_classes.SwappedResult<T, E>> {
  const SwappedResult_T_Shape_E_ShapeExceptionSerializer();

  @override
  _$sealed_classes.SwappedResult<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$sealed_classes.SwappedResult<T, E>(Serializers.instance
        .deserialize<_$sealed_classes.Result<T, E>>($serialized[r'result']));
  }

  @override
  Object? serialize(_$sealed_classes.SwappedResult<T, E> $value) => {
        r'result': Serializers.instance
            .serialize<_$sealed_classes.Result<T, E>>($value.result)
      };
}

final class ValueXFromJsonImplSerializer
    extends Serializer<_$extension_types.ValueXFromJsonImpl> {
  ValueXFromJsonImplSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Value, String>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueXFromJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ValueXFromJsonImpl.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXFromJsonImpl $value) =>
      $value.toJson();
}

final class ValueXFromJsonSerializer
    extends Serializer<_$extension_types.ValueXFromJson> {
  ValueXFromJsonSerializer() {
    $serializers
        .put(Serializer.define<_$extension_types.Value, Map<String, Object?>>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized[r'value'] as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueXFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$extension_types.ValueXFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXFromJson $value) =>
      $serializers.serialize<_$extension_types.Value>($value.v);
}

final class ValueXFromJsonStaticSerializer
    extends Serializer<_$extension_types.ValueXFromJsonStatic> {
  ValueXFromJsonStaticSerializer() {
    $serializers
        .put(Serializer.define<_$extension_types.Value, Map<String, Object?>>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized[r'value'] as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueXFromJsonStatic deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$extension_types.ValueXFromJsonStatic.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXFromJsonStatic $value) =>
      $serializers.serialize<_$extension_types.Value>($value.v);
}

final class ValueXImplSerializer
    extends Serializer<_$extension_types.ValueXImpl> {
  ValueXImplSerializer() {
    $serializers
        .put(Serializer.define<_$extension_types.Value, Map<String, Object?>>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized[r'value'] as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueXImpl deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$extension_types.ValueXImpl(
        $serializers.deserialize<_$extension_types.Value>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ValueXImpl $value) =>
      $serializers.serialize<_$extension_types.Value>($value);
}

final class ValueXSerializer extends Serializer<_$extension_types.ValueX> {
  ValueXSerializer() {
    $serializers
        .put(Serializer.define<_$extension_types.Value, Map<String, Object?>>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized[r'value'] as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueX deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$extension_types.ValueX(
        $serializers.deserialize<_$extension_types.Value>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ValueX $value) =>
      $serializers.serialize<_$extension_types.Value>($value.v);
}

final class ValueXToFromJsonSerializer
    extends Serializer<_$extension_types.ValueXToFromJson> {
  ValueXToFromJsonSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Value, String>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueXToFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ValueXToFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(_$extension_types.ValueXToFromJson $value) =>
      $value.toJson();
}

final class ValueXToJsonImplSerializer
    extends Serializer<_$extension_types.ValueXToJsonImpl> {
  ValueXToJsonImplSerializer() {
    $serializers.put(Serializer.define<_$extension_types.Value, String>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueXToJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return _$extension_types.ValueXToJsonImpl(
        $serializers.deserialize<_$extension_types.Value>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ValueXToJsonImpl $value) =>
      $value.toJson();
}

final class ValueXToJsonSerializer
    extends Serializer<_$extension_types.ValueXToJson> {
  ValueXToJsonSerializer() {
    $serializers
        .put(Serializer.define<_$extension_types.Value, Map<String, Object?>>(
      serialize: ($value) => {r'value': $value.value},
      deserialize: ($serialized) {
        return _$extension_types.Value(($serialized[r'value'] as String));
      },
    ));
  }

  final Serializers $serializers = Serializers();

  @override
  _$extension_types.ValueXToJson deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return _$extension_types.ValueXToJson(
        $serializers.deserialize<_$extension_types.Value>($serialized));
  }

  @override
  Object? serialize(_$extension_types.ValueXToJson $value) => $value.toJson();
}

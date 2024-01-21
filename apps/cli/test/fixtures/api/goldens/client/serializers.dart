// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i10;

import 'package:celest_core/celest_core.dart' as _i1;
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as _i5;
import 'package:fast_immutable_collections/src/imap/imap.dart' as _i7;

import '../../functions/classes.dart' as _i2;
import '../../functions/cycles.dart' as _i3;
import '../../functions/exceptions.dart' as _i4;
import '../../functions/generic_wrappers.dart' as _i6;
import '../../functions/metadata.dart' as _i8;
import '../../functions/parameter_types.dart' as _i9;
import '../../functions/records.dart' as _i11;
import '../../functions/sealed_classes.dart' as _i12;

final class EmptySerializer extends _i1.Serializer<_i2.Empty> {
  const EmptySerializer();

  @override
  String get dartType => r'project:functions/classes.dart#Empty';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Empty deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.Empty();
  }

  @override
  Map<String, Object?> serialize(_i2.Empty value) => {};
}

final class FieldsSerializer extends _i1.Serializer<_i2.Fields> {
  const FieldsSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#Fields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.Fields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.Fields(
      (serialized[r'superField'] as String),
      (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.Fields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class NamedFieldsSerializer extends _i1.Serializer<_i2.NamedFields> {
  const NamedFieldsSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NamedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NamedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.NamedFields(
      superField: (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NamedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class MixedFieldsSerializer extends _i1.Serializer<_i2.MixedFields> {
  const MixedFieldsSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#MixedFields';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.MixedFields deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.MixedFields(
      (serialized[r'superField'] as String),
      field: (serialized[r'field'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.MixedFields value) => {
        r'superField': value.superField,
        r'field': value.field,
      };
}

final class DefaultValuesSerializer extends _i1.Serializer<_i2.DefaultValues> {
  const DefaultValuesSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#DefaultValues';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.DefaultValues deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.DefaultValues(
      field: ((serialized?[r'field'] as String?)) ?? 'default',
      nullableField: ((serialized?[r'nullableField'] as String?)) ?? null,
      nullableFieldWithDefault:
          ((serialized?[r'nullableFieldWithDefault'] as String?)) ?? 'default',
    );
  }

  @override
  Map<String, Object?> serialize(_i2.DefaultValues value) => {
        r'field': value.field,
        r'nullableField': value.nullableField,
        r'nullableFieldWithDefault': value.nullableFieldWithDefault,
        r'fieldWithoutInitializer': value.fieldWithoutInitializer,
      };
}

final class NestedClassSerializer extends _i1.Serializer<_i2.NestedClass> {
  const NestedClassSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NestedClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NestedClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.NestedClass(
      _i1.Serializers.scoped.deserialize<_i2.Fields>(serialized[r'fields']),
      _i1.Serializers.scoped
          .deserialize<_i2.Fields?>(serialized[r'nullableFields']),
    );
  }

  @override
  Map<String, Object?> serialize(_i2.NestedClass value) => {
        r'fields': _i1.Serializers.scoped.serialize<_i2.Fields>(value.fields),
        r'nullableFields':
            _i1.Serializers.scoped.serialize<_i2.Fields?>(value.nullableFields),
      };
}

final class OnlyFromJsonSerializer extends _i1.Serializer<_i2.OnlyFromJson> {
  const OnlyFromJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#OnlyFromJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.OnlyFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.OnlyFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.OnlyFromJson value) =>
      {r'field': value.field};
}

final class OnlyToJsonSerializer extends _i1.Serializer<_i2.OnlyToJson> {
  const OnlyToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#OnlyToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.OnlyToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.OnlyToJson((serialized[r'field'] as String));
  }

  @override
  Map<String, Object?> serialize(_i2.OnlyToJson value) => value.toJson();
}

final class OnlyToJsonWithDefaultsSerializer
    extends _i1.Serializer<_i2.OnlyToJsonWithDefaults> {
  const OnlyToJsonWithDefaultsSerializer();

  @override
  String get dartType =>
      r'project:functions/classes.dart#OnlyToJsonWithDefaults';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.OnlyToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i2.OnlyToJsonWithDefaults(
        ((serialized?[r'field'] as String?)) ?? 'default');
  }

  @override
  Map<String, Object?> serialize(_i2.OnlyToJsonWithDefaults value) =>
      value.toJson();
}

final class FromJsonAndToJsonSerializer
    extends _i1.Serializer<_i2.FromJsonAndToJson> {
  const FromJsonAndToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#FromJsonAndToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.FromJsonAndToJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i2.FromJsonAndToJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i2.FromJsonAndToJson value) => value.toJson();
}

final class NonMapToJsonSerializer extends _i1.Serializer<_i2.NonMapToJson> {
  const NonMapToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NonMapToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NonMapToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.NonMapToJson((serialized as String));
  }

  @override
  String serialize(_i2.NonMapToJson value) => value.toJson();
}

final class NonMapToJsonWithDefaultsSerializer
    extends _i1.Serializer<_i2.NonMapToJsonWithDefaults> {
  const NonMapToJsonWithDefaultsSerializer();

  @override
  String get dartType =>
      r'project:functions/classes.dart#NonMapToJsonWithDefaults';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NonMapToJsonWithDefaults deserialize(Object? value) {
    final serialized = assertWireType<String?>(value);
    return _i2.NonMapToJsonWithDefaults(((serialized as String?)) ?? 'default');
  }

  @override
  String serialize(_i2.NonMapToJsonWithDefaults value) => value.toJson();
}

final class NonMapFromAndToJsonSerializer
    extends _i1.Serializer<_i2.NonMapFromAndToJson> {
  const NonMapFromAndToJsonSerializer();

  @override
  String get dartType => r'project:functions/classes.dart#NonMapFromAndToJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i2.NonMapFromAndToJson deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i2.NonMapFromAndToJson.fromJson(serialized);
  }

  @override
  String serialize(_i2.NonMapFromAndToJson value) => value.toJson();
}

final class NodeSerializer extends _i1.Serializer<_i3.Node> {
  const NodeSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#Node';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i3.Node deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return switch (serialized[r'$type']) {
      r'Child' => _i1.Serializers.scoped.deserialize<_i3.Child>(serialized),
      r'Parent' => _i1.Serializers.scoped.deserialize<_i3.Parent>(serialized),
      final unknownType =>
        throw _i1.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Node')
              ..write(': $unknownType'))
            .toString()),
    };
  }

  @override
  Map<String, Object?> serialize(_i3.Node value) => switch (value) {
        _i3.Child() => {
            ...(_i1.Serializers.scoped.serialize<_i3.Child>(value)
                as Map<String, Object?>),
            r'$type': r'Child',
          },
        _i3.Parent() => {
            ...(_i1.Serializers.scoped.serialize<_i3.Parent>(value)
                as Map<String, Object?>),
            r'$type': r'Parent',
          },
      };
}

final class ChildSerializer extends _i1.Serializer<_i3.Child> {
  const ChildSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#Child';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i3.Child deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.Child((serialized[r'name'] as String));
  }

  @override
  Map<String, Object?> serialize(_i3.Child value) => {r'name': value.name};
}

final class ParentSerializer extends _i1.Serializer<_i3.Parent> {
  const ParentSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#Parent';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i3.Parent deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.Parent(
      (serialized[r'name'] as String),
      (serialized[r'children'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<_i3.Node>(el))
          .toList(),
    );
  }

  @override
  Map<String, Object?> serialize(_i3.Parent value) => {
        r'name': value.name,
        r'children': value.children
            .map((el) => _i1.Serializers.scoped.serialize<_i3.Node>(el))
            .toList(),
      };
}

final class SelfReferencingWrapperSerializer
    extends _i1.Serializer<_i3.SelfReferencingWrapper> {
  const SelfReferencingWrapperSerializer();

  @override
  String get dartType =>
      r'project:functions/cycles.dart#SelfReferencingWrapper';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i3.SelfReferencingWrapper deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.SelfReferencingWrapper(
        value: _i1.Serializers.scoped
            .deserialize<_i3.SelfReferencing>(serialized[r'value']));
  }

  @override
  Map<String, Object?> serialize(_i3.SelfReferencingWrapper value) => {
        r'value':
            _i1.Serializers.scoped.serialize<_i3.SelfReferencing>(value.value)
      };
}

final class SelfReferencingSerializer
    extends _i1.Serializer<_i3.SelfReferencing> {
  const SelfReferencingSerializer();

  @override
  String get dartType => r'project:functions/cycles.dart#SelfReferencing';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i3.SelfReferencing deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i3.SelfReferencing(
      value: (_i1.Serializers.scoped
              .deserialize<_i3.SelfReferencing?>(serialized[r'value'])) ??
          null,
      wrapper: (_i1.Serializers.scoped.deserialize<_i3.SelfReferencingWrapper?>(
              serialized[r'wrapper'])) ??
          null,
      list: (serialized[r'list'] as Iterable<Object?>)
          .map((el) =>
              _i1.Serializers.scoped.deserialize<_i3.SelfReferencing>(el))
          .toList(),
    );
  }

  @override
  Map<String, Object?> serialize(_i3.SelfReferencing value) => {
        r'value':
            _i1.Serializers.scoped.serialize<_i3.SelfReferencing?>(value.value),
        r'wrapper': _i1.Serializers.scoped
            .serialize<_i3.SelfReferencingWrapper?>(value.wrapper),
        r'list': value.list
            .map((el) =>
                _i1.Serializers.scoped.serialize<_i3.SelfReferencing>(el))
            .toList(),
      };
}

final class SupportedExceptionTypeSerializer
    extends _i1.Serializer<_i4.SupportedExceptionType> {
  const SupportedExceptionTypeSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#SupportedExceptionType';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.SupportedExceptionType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.SupportedExceptionType.values.byName(serialized);
  }

  @override
  String serialize(_i4.SupportedExceptionType value) => value.name;
}

final class SupportedErrorTypeSerializer
    extends _i1.Serializer<_i4.SupportedErrorType> {
  const SupportedErrorTypeSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#SupportedErrorType';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.SupportedErrorType deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i4.SupportedErrorType.values.byName(serialized);
  }

  @override
  String serialize(_i4.SupportedErrorType value) => value.name;
}

final class CustomExceptionSerializer
    extends _i1.Serializer<_i4.CustomException> {
  const CustomExceptionSerializer();

  @override
  String get dartType => r'project:functions/exceptions.dart#CustomException';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.CustomException deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.CustomException();
  }

  @override
  Map<String, Object?> serialize(_i4.CustomException value) => {
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

final class CustomExceptionToFromJsonSerializer
    extends _i1.Serializer<_i4.CustomExceptionToFromJson> {
  const CustomExceptionToFromJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#CustomExceptionToFromJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.CustomExceptionToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.CustomExceptionToFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i4.CustomExceptionToFromJson value) =>
      value.toJson();
}

final class CustomErrorSerializer extends _i1.Serializer<_i4.CustomError> {
  const CustomErrorSerializer();

  @override
  String get dartType => r'project:functions/exceptions.dart#CustomError';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.CustomError deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.CustomError();
  }

  @override
  Map<String, Object?> serialize(_i4.CustomError value) => {
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

final class CustomErrorToFromJsonSerializer
    extends _i1.Serializer<_i4.CustomErrorToFromJson> {
  const CustomErrorToFromJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#CustomErrorToFromJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.CustomErrorToFromJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i4.CustomErrorToFromJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i4.CustomErrorToFromJson value) =>
      value.toJson();
}

final class CustomErrorWithStackTraceSerializer
    extends _i1.Serializer<_i4.CustomErrorWithStackTrace> {
  const CustomErrorWithStackTraceSerializer();

  @override
  String get dartType =>
      r'project:functions/exceptions.dart#CustomErrorWithStackTrace';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i4.CustomErrorWithStackTrace deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i4.CustomErrorWithStackTrace(
        stackTrace: (_i1.Serializers.scoped
                .deserialize<StackTrace?>(serialized?[r'stackTrace'])) ??
            null);
  }

  @override
  Map<String, Object?> serialize(_i4.CustomErrorWithStackTrace value) => {
        r'stackTrace':
            _i1.Serializers.scoped.serialize<StackTrace>(value.stackTrace),
        r'message': value.message,
        r'additionalInfo': value.additionalInfo,
      };
}

final class IListStringSerializer extends _i1.Serializer<_i5.IList<String>> {
  const IListStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=dart%3Acore%23String#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IList<String> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<String>.fromJson(
      serialized,
      (value) => (value as String),
    );
  }

  @override
  Object serialize(_i5.IList<String> value) => value.toJson((value) => value);
}

final class IListUriSerializer extends _i1.Serializer<_i5.IList<Uri>> {
  const IListUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=dart%3Acore%23Uri#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IList<Uri> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<Uri>.fromJson(
      serialized,
      (value) => _i1.Serializers.scoped.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(_i5.IList<Uri> value) =>
      value.toJson((value) => _i1.Serializers.scoped.serialize<Uri>(value));
}

final class SimpleClassSerializer extends _i1.Serializer<_i6.SimpleClass> {
  const SimpleClassSerializer();

  @override
  String get dartType => r'project:functions/generic_wrappers.dart#SimpleClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i6.SimpleClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i6.SimpleClass();
  }

  @override
  Map<String, Object?> serialize(_i6.SimpleClass value) => {};
}

final class IListSimpleClassSerializer
    extends _i1.Serializer<_i5.IList<_i6.SimpleClass>> {
  const IListSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=project%3Afunctions%2Fgeneric_wrappers.dart%23SimpleClass#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IList<_i6.SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i6.SimpleClass>.fromJson(
      serialized,
      (value) => _i1.Serializers.scoped.deserialize<_i6.SimpleClass>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i6.SimpleClass> value) => value.toJson(
      (value) => _i1.Serializers.scoped.serialize<_i6.SimpleClass>(value));
}

final class IListIListStringSerializer
    extends _i1.Serializer<_i5.IList<_i5.IList<String>>> {
  const IListIListStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523String%23IList#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IList<_i5.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i5.IList<String>>.fromJson(
      serialized,
      (value) => _i1.Serializers.scoped.deserialize<_i5.IList<String>>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i5.IList<String>> value) => value.toJson(
      (value) => _i1.Serializers.scoped.serialize<_i5.IList<String>>(value));
}

final class IListIListUriSerializer
    extends _i1.Serializer<_i5.IList<_i5.IList<Uri>>> {
  const IListIListUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523Uri%23IList#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IList<_i5.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i5.IList<Uri>>.fromJson(
      serialized,
      (value) => _i1.Serializers.scoped.deserialize<_i5.IList<Uri>>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i5.IList<Uri>> value) => value.toJson(
      (value) => _i1.Serializers.scoped.serialize<_i5.IList<Uri>>(value));
}

final class IListIListSimpleClassSerializer
    extends _i1.Serializer<_i5.IList<_i5.IList<_i6.SimpleClass>>> {
  const IListIListSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/ilist/ilist.dart?T=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Dproject%253Afunctions%252Fgeneric_wrappers.dart%2523SimpleClass%23IList#IList';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i5.IList<_i5.IList<_i6.SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<dynamic>(value);
    return _i5.IList<_i5.IList<_i6.SimpleClass>>.fromJson(
      serialized,
      (value) =>
          _i1.Serializers.scoped.deserialize<_i5.IList<_i6.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i5.IList<_i5.IList<_i6.SimpleClass>> value) =>
      value.toJson((value) =>
          _i1.Serializers.scoped.serialize<_i5.IList<_i6.SimpleClass>>(value));
}

final class IMapStringStringSerializer
    extends _i1.Serializer<_i7.IMap<String, String>> {
  const IMapStringStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=dart%3Acore%23String#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, String> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, String>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => (value as String),
    );
  }

  @override
  Object serialize(_i7.IMap<String, String> value) => value.toJson(
        (value) => value,
        (value) => value,
      );
}

final class IMapStringUriSerializer
    extends _i1.Serializer<_i7.IMap<String, Uri>> {
  const IMapStringUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=dart%3Acore%23Uri#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, Uri> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, Uri>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i1.Serializers.scoped.deserialize<Uri>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, Uri> value) => value.toJson(
        (value) => value,
        (value) => _i1.Serializers.scoped.serialize<Uri>(value),
      );
}

final class IMapStringSimpleClassSerializer
    extends _i1.Serializer<_i7.IMap<String, _i6.SimpleClass>> {
  const IMapStringSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=project%3Afunctions%2Fgeneric_wrappers.dart%23SimpleClass#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, _i6.SimpleClass> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i6.SimpleClass>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i1.Serializers.scoped.deserialize<_i6.SimpleClass>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i6.SimpleClass> value) => value.toJson(
        (value) => value,
        (value) => _i1.Serializers.scoped.serialize<_i6.SimpleClass>(value),
      );
}

final class IMapStringIListStringSerializer
    extends _i1.Serializer<_i7.IMap<String, _i5.IList<String>>> {
  const IMapStringIListStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523String%23IList#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, _i5.IList<String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i5.IList<String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i1.Serializers.scoped.deserialize<_i5.IList<String>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i5.IList<String>> value) => value.toJson(
        (value) => value,
        (value) => _i1.Serializers.scoped.serialize<_i5.IList<String>>(value),
      );
}

final class IMapStringIListUriSerializer
    extends _i1.Serializer<_i7.IMap<String, _i5.IList<Uri>>> {
  const IMapStringIListUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Ddart%253Acore%2523Uri%23IList#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, _i5.IList<Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i5.IList<Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i1.Serializers.scoped.deserialize<_i5.IList<Uri>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i5.IList<Uri>> value) => value.toJson(
        (value) => value,
        (value) => _i1.Serializers.scoped.serialize<_i5.IList<Uri>>(value),
      );
}

final class IMapStringIListSimpleClassSerializer
    extends _i1.Serializer<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>> {
  const IMapStringIListSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Filist%2Filist.dart%3FT%3Dproject%253Afunctions%252Fgeneric_wrappers.dart%2523SimpleClass%23IList#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, _i5.IList<_i6.SimpleClass>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i5.IList<_i6.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          _i1.Serializers.scoped.deserialize<_i5.IList<_i6.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i5.IList<_i6.SimpleClass>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            _i1.Serializers.scoped.serialize<_i5.IList<_i6.SimpleClass>>(value),
      );
}

final class IMapStringIMapStringStringSerializer
    extends _i1.Serializer<_i7.IMap<String, _i7.IMap<String, String>>> {
  const IMapStringIMapStringStringSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Fimap%2Fimap.dart%3FK%3Ddart%253Acore%2523String%26V%3Ddart%253Acore%2523String%23IMap#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, _i7.IMap<String, String>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i7.IMap<String, String>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          _i1.Serializers.scoped.deserialize<_i7.IMap<String, String>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i7.IMap<String, String>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            _i1.Serializers.scoped.serialize<_i7.IMap<String, String>>(value),
      );
}

final class IMapStringIMapStringUriSerializer
    extends _i1.Serializer<_i7.IMap<String, _i7.IMap<String, Uri>>> {
  const IMapStringIMapStringUriSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Fimap%2Fimap.dart%3FK%3Ddart%253Acore%2523String%26V%3Ddart%253Acore%2523Uri%23IMap#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, _i7.IMap<String, Uri>> deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i7.IMap<String, Uri>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) =>
          _i1.Serializers.scoped.deserialize<_i7.IMap<String, Uri>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i7.IMap<String, Uri>> value) =>
      value.toJson(
        (value) => value,
        (value) =>
            _i1.Serializers.scoped.serialize<_i7.IMap<String, Uri>>(value),
      );
}

final class IMapStringIMapStringSimpleClassSerializer extends _i1
    .Serializer<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>> {
  const IMapStringIMapStringSimpleClassSerializer();

  @override
  String get dartType =>
      r'package:fast_immutable_collections/src/imap/imap.dart?K=dart%3Acore%23String&V=package%3Afast_immutable_collections%2Fsrc%2Fimap%2Fimap.dart%3FK%3Ddart%253Acore%2523String%26V%3Dproject%253Afunctions%252Fgeneric_wrappers.dart%2523SimpleClass%23IMap#IMap';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>> deserialize(
      Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>.fromJson(
      serialized,
      (value) => (value as String),
      (value) => _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i6.SimpleClass>>(value),
    );
  }

  @override
  Object serialize(_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>> value) =>
      value.toJson(
        (value) => value,
        (value) => _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i6.SimpleClass>>(value),
      );
}

final class GenericWrappersSerializer
    extends _i1.Serializer<_i6.GenericWrappers> {
  const GenericWrappersSerializer();

  @override
  String get dartType =>
      r'project:functions/generic_wrappers.dart#GenericWrappers';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i6.GenericWrappers deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i6.GenericWrappers(
      listOfString: _i1.Serializers.scoped
          .deserialize<_i5.IList<String>>(serialized[r'listOfString']),
      listOfUri: _i1.Serializers.scoped
          .deserialize<_i5.IList<Uri>>(serialized[r'listOfUri']),
      listOfSimpleClass: _i1.Serializers.scoped
          .deserialize<_i5.IList<_i6.SimpleClass>>(
              serialized[r'listOfSimpleClass']),
      listOfListOfString: _i1.Serializers.scoped
          .deserialize<_i5.IList<_i5.IList<String>>>(
              serialized[r'listOfListOfString']),
      listOfListOfUri: _i1.Serializers.scoped
          .deserialize<_i5.IList<_i5.IList<Uri>>>(
              serialized[r'listOfListOfUri']),
      listOfListOfSimpleClass: _i1.Serializers.scoped
          .deserialize<_i5.IList<_i5.IList<_i6.SimpleClass>>>(
              serialized[r'listOfListOfSimpleClass']),
      mapOfString: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, String>>(serialized[r'mapOfString']),
      mapOfUri: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, Uri>>(serialized[r'mapOfUri']),
      mapOfSimpleClass: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i6.SimpleClass>>(
              serialized[r'mapOfSimpleClass']),
      mapOfListOfString: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i5.IList<String>>>(
              serialized[r'mapOfListOfString']),
      mapOfListOfUri: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i5.IList<Uri>>>(
              serialized[r'mapOfListOfUri']),
      mapOfListOfSimpleClass: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>>(
              serialized[r'mapOfListOfSimpleClass']),
      mapOfMapOfString: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i7.IMap<String, String>>>(
              serialized[r'mapOfMapOfString']),
      mapOfMapOfUri: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i7.IMap<String, Uri>>>(
              serialized[r'mapOfMapOfUri']),
      mapOfMapOfSimpleClass: _i1.Serializers.scoped
          .deserialize<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>>(
              serialized[r'mapOfMapOfSimpleClass']),
    );
  }

  @override
  Map<String, Object?> serialize(_i6.GenericWrappers value) => {
        r'listOfString': _i1.Serializers.scoped
            .serialize<_i5.IList<String>>(value.listOfString),
        r'listOfUri':
            _i1.Serializers.scoped.serialize<_i5.IList<Uri>>(value.listOfUri),
        r'listOfSimpleClass': _i1.Serializers.scoped
            .serialize<_i5.IList<_i6.SimpleClass>>(value.listOfSimpleClass),
        r'listOfListOfString': _i1.Serializers.scoped
            .serialize<_i5.IList<_i5.IList<String>>>(value.listOfListOfString),
        r'listOfListOfUri': _i1.Serializers.scoped
            .serialize<_i5.IList<_i5.IList<Uri>>>(value.listOfListOfUri),
        r'listOfListOfSimpleClass': _i1.Serializers.scoped
            .serialize<_i5.IList<_i5.IList<_i6.SimpleClass>>>(
                value.listOfListOfSimpleClass),
        r'mapOfString': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, String>>(value.mapOfString),
        r'mapOfUri': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, Uri>>(value.mapOfUri),
        r'mapOfSimpleClass': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i6.SimpleClass>>(
                value.mapOfSimpleClass),
        r'mapOfListOfString': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i5.IList<String>>>(
                value.mapOfListOfString),
        r'mapOfListOfUri': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i5.IList<Uri>>>(value.mapOfListOfUri),
        r'mapOfListOfSimpleClass': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i5.IList<_i6.SimpleClass>>>(
                value.mapOfListOfSimpleClass),
        r'mapOfMapOfString': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i7.IMap<String, String>>>(
                value.mapOfMapOfString),
        r'mapOfMapOfUri': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i7.IMap<String, Uri>>>(
                value.mapOfMapOfUri),
        r'mapOfMapOfSimpleClass': _i1.Serializers.scoped
            .serialize<_i7.IMap<String, _i7.IMap<String, _i6.SimpleClass>>>(
                value.mapOfMapOfSimpleClass),
      };
}

final class ExportableSerializer extends _i1.Serializer<_i8.Exportable> {
  const ExportableSerializer();

  @override
  String get dartType => r'project:functions/metadata.dart#Exportable';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i8.Exportable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i8.Exportable();
  }

  @override
  Map<String, Object?> serialize(_i8.Exportable value) => {};
}

final class SerializableSerializer extends _i1.Serializer<_i8.Serializable> {
  const SerializableSerializer();

  @override
  String get dartType => r'project:functions/metadata.dart#Serializable';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i8.Serializable deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return _i8.Serializable(((serialized?[r'type'] as String?)) ?? null);
  }

  @override
  Map<String, Object?> serialize(_i8.Serializable value) =>
      {r'type': value.type};
}

final class LiteralEnumSerializer extends _i1.Serializer<_i8.LiteralEnum> {
  const LiteralEnumSerializer();

  @override
  String get dartType => r'project:functions/metadata.dart#LiteralEnum';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i8.LiteralEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i8.LiteralEnum.values.byName(serialized);
  }

  @override
  String serialize(_i8.LiteralEnum value) => value.name;
}

final class Record$k7x4l9Serializer extends _i1.Serializer<Record$k7x4l9> {
  const Record$k7x4l9Serializer();

  @override
  String get dartType => r'#Record$k7x4l9';

  @override
  String get wireType => r'dart:core#Map';

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

final class MyEnumSerializer extends _i1.Serializer<_i9.MyEnum> {
  const MyEnumSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#MyEnum';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i9.MyEnum deserialize(Object? value) {
    final serialized = assertWireType<String>(value);
    return _i9.MyEnum.values.byName(serialized);
  }

  @override
  String serialize(_i9.MyEnum value) => value.name;
}

final class SimpleStructSerializer extends _i1.Serializer<_i9.SimpleStruct> {
  const SimpleStructSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#SimpleStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i9.SimpleStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>?>(value);
    return ();
  }

  @override
  Map<String, Object?> serialize(_i9.SimpleStruct value) => {};
}

final class ComplexStructSerializer extends _i1.Serializer<_i9.ComplexStruct> {
  const ComplexStructSerializer();

  @override
  String get dartType =>
      r'project:functions/parameter_types.dart#ComplexStruct';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i9.ComplexStruct deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aBigInt:
          _i1.Serializers.scoped.deserialize<BigInt>(serialized[r'aBigInt']),
      aBool: (serialized[r'aBool'] as bool),
      aDateTime: _i1.Serializers.scoped
          .deserialize<DateTime>(serialized[r'aDateTime']),
      aDouble: (serialized[r'aDouble'] as num).toDouble(),
      aDuration: _i1.Serializers.scoped
          .deserialize<Duration>(serialized[r'aDuration']),
      aListOfBigInt: (serialized[r'aListOfBigInt'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<BigInt>(el))
          .toList(),
      aListOfBool: (serialized[r'aListOfBool'] as Iterable<Object?>)
          .map((el) => (el as bool))
          .toList(),
      aListOfDateTime: (serialized[r'aListOfDateTime'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<DateTime>(el))
          .toList(),
      aListOfDouble: (serialized[r'aListOfDouble'] as Iterable<Object?>)
          .map((el) => (el as num).toDouble())
          .toList(),
      aListOfDuration: (serialized[r'aListOfDuration'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<Duration>(el))
          .toList(),
      aListOfEnum: (serialized[r'aListOfEnum'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<_i9.MyEnum>(el))
          .toList(),
      aListOfInt: (serialized[r'aListOfInt'] as Iterable<Object?>)
          .map((el) => (el as num).toInt())
          .toList(),
      aListOfNull: (serialized[r'aListOfNull'] as Iterable<Object?>)
          .map((el) => (el as Null))
          .toList(),
      aListOfRegExp: (serialized[r'aListOfRegExp'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<RegExp>(el))
          .toList(),
      aListOfSimpleClass: (serialized[r'aListOfSimpleClass']
              as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<_i9.SimpleClass>(el))
          .toList(),
      aListOfSimpleStruct: (serialized[r'aListOfSimpleStruct']
              as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<_i9.SimpleStruct>(el))
          .toList(),
      aListOfStackTrace: (serialized[r'aListOfStackTrace'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<StackTrace>(el))
          .toList(),
      aListOfString: (serialized[r'aListOfString'] as Iterable<Object?>)
          .map((el) => (el as String))
          .toList(),
      aListOfUint8List: (serialized[r'aListOfUint8List'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<_i10.Uint8List>(el))
          .toList(),
      aListOfUri: (serialized[r'aListOfUri'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<Uri>(el))
          .toList(),
      aListOfUriData: (serialized[r'aListOfUriData'] as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<UriData>(el))
          .toList(),
      aMapOfBigInt: (serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i1.Serializers.scoped.deserialize<BigInt>(value),
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
                _i1.Serializers.scoped.deserialize<DateTime>(value),
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
                _i1.Serializers.scoped.deserialize<Duration>(value),
              )),
      aMapOfEnum: (serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i1.Serializers.scoped.deserialize<_i9.MyEnum>(value),
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
            _i1.Serializers.scoped.deserialize<RegExp>(value),
          )),
      aMapOfSimpleClass:
          (serialized[r'aMapOfSimpleClass'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i1.Serializers.scoped.deserialize<_i9.SimpleClass>(value),
              )),
      aMapOfSimpleStruct:
          (serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i1.Serializers.scoped.deserialize<_i9.SimpleStruct>(value),
              )),
      aMapOfStackTrace:
          (serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i1.Serializers.scoped.deserialize<StackTrace>(value),
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
                _i1.Serializers.scoped.deserialize<_i10.Uint8List>(value),
              )),
      aMapOfUri: (serialized[r'aMapOfUri'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
          MapEntry(
            key,
            _i1.Serializers.scoped.deserialize<Uri>(value),
          )),
      aMapOfUriData:
          (serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
        key,
        value,
      ) =>
              MapEntry(
                key,
                _i1.Serializers.scoped.deserialize<UriData>(value),
              )),
      aNull: (serialized[r'aNull'] as Null),
      aRegExp:
          _i1.Serializers.scoped.deserialize<RegExp>(serialized[r'aRegExp']),
      aSimpleClass: _i1.Serializers.scoped
          .deserialize<_i9.SimpleClass>(serialized[r'aSimpleClass']),
      aSimpleStruct: _i1.Serializers.scoped
          .deserialize<_i9.SimpleStruct>(serialized[r'aSimpleStruct']),
      aStackTrace: _i1.Serializers.scoped
          .deserialize<StackTrace>(serialized[r'aStackTrace']),
      aString: (serialized[r'aString'] as String),
      aUint8List: _i1.Serializers.scoped
          .deserialize<_i10.Uint8List>(serialized[r'aUint8List']),
      aUri: _i1.Serializers.scoped.deserialize<Uri>(serialized[r'aUri']),
      aUriData:
          _i1.Serializers.scoped.deserialize<UriData>(serialized[r'aUriData']),
      anEnum:
          _i1.Serializers.scoped.deserialize<_i9.MyEnum>(serialized[r'anEnum']),
      anInt: (serialized[r'anInt'] as num).toInt(),
      anIterableOfSimpleClass: (serialized[r'anIterableOfSimpleClass']
              as Iterable<Object?>)
          .map((el) => _i1.Serializers.scoped.deserialize<_i9.SimpleClass>(el))
          .toList()
    );
  }

  @override
  Map<String, Object?> serialize(_i9.ComplexStruct value) => {
        r'aBigInt': _i1.Serializers.scoped.serialize<BigInt>(value.aBigInt),
        r'aBool': value.aBool,
        r'aDateTime':
            _i1.Serializers.scoped.serialize<DateTime>(value.aDateTime),
        r'aDouble': value.aDouble,
        r'aDuration':
            _i1.Serializers.scoped.serialize<Duration>(value.aDuration),
        r'aListOfBigInt': value.aListOfBigInt
            .map((el) => _i1.Serializers.scoped.serialize<BigInt>(el))
            .toList(),
        r'aListOfBool': value.aListOfBool,
        r'aListOfDateTime': value.aListOfDateTime
            .map((el) => _i1.Serializers.scoped.serialize<DateTime>(el))
            .toList(),
        r'aListOfDouble': value.aListOfDouble,
        r'aListOfDuration': value.aListOfDuration
            .map((el) => _i1.Serializers.scoped.serialize<Duration>(el))
            .toList(),
        r'aListOfEnum': value.aListOfEnum
            .map((el) => _i1.Serializers.scoped.serialize<_i9.MyEnum>(el))
            .toList(),
        r'aListOfInt': value.aListOfInt,
        r'aListOfNull': value.aListOfNull,
        r'aListOfRegExp': value.aListOfRegExp
            .map((el) => _i1.Serializers.scoped.serialize<RegExp>(el))
            .toList(),
        r'aListOfSimpleClass': value.aListOfSimpleClass
            .map((el) => _i1.Serializers.scoped.serialize<_i9.SimpleClass>(el))
            .toList(),
        r'aListOfSimpleStruct': value.aListOfSimpleStruct
            .map((el) => _i1.Serializers.scoped.serialize<_i9.SimpleStruct>(el))
            .toList(),
        r'aListOfStackTrace': value.aListOfStackTrace
            .map((el) => _i1.Serializers.scoped.serialize<StackTrace>(el))
            .toList(),
        r'aListOfString': value.aListOfString,
        r'aListOfUint8List': value.aListOfUint8List
            .map((el) => _i1.Serializers.scoped.serialize<_i10.Uint8List>(el))
            .toList(),
        r'aListOfUri': value.aListOfUri
            .map((el) => _i1.Serializers.scoped.serialize<Uri>(el))
            .toList(),
        r'aListOfUriData': value.aListOfUriData
            .map((el) => _i1.Serializers.scoped.serialize<UriData>(el))
            .toList(),
        r'aMapOfBigInt': value.aMapOfBigInt.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<BigInt>(value),
            )),
        r'aMapOfBool': value.aMapOfBool,
        r'aMapOfDateTime': value.aMapOfDateTime.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<DateTime>(value),
            )),
        r'aMapOfDouble': value.aMapOfDouble,
        r'aMapOfDuration': value.aMapOfDuration.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<Duration>(value),
            )),
        r'aMapOfEnum': value.aMapOfEnum.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<_i9.MyEnum>(value),
            )),
        r'aMapOfInt': value.aMapOfInt,
        r'aMapOfNull': value.aMapOfNull,
        r'aMapOfRegExp': value.aMapOfRegExp.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<RegExp>(value),
            )),
        r'aMapOfSimpleClass': value.aMapOfSimpleClass.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<_i9.SimpleClass>(value),
            )),
        r'aMapOfSimpleStruct': value.aMapOfSimpleStruct.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<_i9.SimpleStruct>(value),
            )),
        r'aMapOfStackTrace': value.aMapOfStackTrace.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<StackTrace>(value),
            )),
        r'aMapOfString': value.aMapOfString,
        r'aMapOfUint8List': value.aMapOfUint8List.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<_i10.Uint8List>(value),
            )),
        r'aMapOfUri': value.aMapOfUri.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<Uri>(value),
            )),
        r'aMapOfUriData': value.aMapOfUriData.map((
          key,
          value,
        ) =>
            MapEntry(
              key,
              _i1.Serializers.scoped.serialize<UriData>(value),
            )),
        r'aNull': value.aNull,
        r'aRegExp': _i1.Serializers.scoped.serialize<RegExp>(value.aRegExp),
        r'aSimpleClass': _i1.Serializers.scoped
            .serialize<_i9.SimpleClass>(value.aSimpleClass),
        r'aSimpleStruct': _i1.Serializers.scoped
            .serialize<_i9.SimpleStruct>(value.aSimpleStruct),
        r'aStackTrace':
            _i1.Serializers.scoped.serialize<StackTrace>(value.aStackTrace),
        r'aString': value.aString,
        r'aUint8List':
            _i1.Serializers.scoped.serialize<_i10.Uint8List>(value.aUint8List),
        r'aUri': _i1.Serializers.scoped.serialize<Uri>(value.aUri),
        r'aUriData': _i1.Serializers.scoped.serialize<UriData>(value.aUriData),
        r'anEnum': _i1.Serializers.scoped.serialize<_i9.MyEnum>(value.anEnum),
        r'anInt': value.anInt,
        r'anIterableOfSimpleClass': value.anIterableOfSimpleClass
            .map((el) => _i1.Serializers.scoped.serialize<_i9.SimpleClass>(el))
            .toList(),
      };
}

final class ComplexClassSerializer extends _i1.Serializer<_i9.ComplexClass> {
  const ComplexClassSerializer();

  @override
  String get dartType => r'project:functions/parameter_types.dart#ComplexClass';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i9.ComplexClass deserialize(Object? value) {
    final serialized = assertWireType<Map<String, dynamic>>(value);
    return _i9.ComplexClass.fromJson(serialized);
  }

  @override
  Map<String, dynamic> serialize(_i9.ComplexClass value) => value.toJson();
}

final class Record$rmm4wtSerializer extends _i1.Serializer<Record$rmm4wt> {
  const Record$rmm4wtSerializer();

  @override
  String get dartType => r'#Record$rmm4wt';

  @override
  String get wireType => r'dart:core#Map';

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

final class Record$sxv9hgSerializer extends _i1.Serializer<Record$sxv9hg> {
  const Record$sxv9hgSerializer();

  @override
  String get dartType => r'#Record$sxv9hg';

  @override
  String get wireType => r'dart:core#Map';

  @override
  Record$sxv9hg deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      aliased: _i1.Serializers.scoped
          .deserialize<_i11.NamedFields>(serialized[r'aliased']),
      nonAliased: _i1.Serializers.scoped
          .deserialize<({String anotherField, String field})>(
              serialized[r'nonAliased'])
    );
  }

  @override
  Map<String, Object?> serialize(Record$sxv9hg value) => {
        r'aliased':
            _i1.Serializers.scoped.serialize<_i11.NamedFields>(value.aliased),
        r'nonAliased': _i1.Serializers.scoped
            .serialize<({String anotherField, String field})>(value.nonAliased),
      };
}

final class NestedSerializer extends _i1.Serializer<_i11.Nested> {
  const NestedSerializer();

  @override
  String get dartType => r'project:functions/records.dart#Nested';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i11.Nested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: _i1.Serializers.scoped
          .deserialize<_i11.NamedFields>(serialized[r'namedFields'])
    );
  }

  @override
  Map<String, Object?> serialize(_i11.Nested value) => {
        r'namedFields': _i1.Serializers.scoped
            .serialize<_i11.NamedFields>(value.namedFields)
      };
}

final class NullableNestedSerializer
    extends _i1.Serializer<_i11.NullableNested> {
  const NullableNestedSerializer();

  @override
  String get dartType => r'project:functions/records.dart#NullableNested';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i11.NullableNested deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (
      namedFields: _i1.Serializers.scoped
          .deserialize<_i11.NamedFields?>(serialized[r'namedFields'])
    );
  }

  @override
  Map<String, Object?> serialize(_i11.NullableNested value) => {
        r'namedFields': _i1.Serializers.scoped
            .serialize<_i11.NamedFields?>(value.namedFields)
      };
}

final class ShapeSerializer extends _i1.Serializer<_i12.Shape> {
  const ShapeSerializer();

  @override
  String get dartType => r'project:functions/sealed_classes.dart#Shape';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.Shape deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return switch (serialized[r'$type']) {
      r'Rectangle' =>
        _i1.Serializers.scoped.deserialize<_i12.Rectangle>(serialized),
      r'Circle' => _i1.Serializers.scoped.deserialize<_i12.Circle>(serialized),
      final unknownType =>
        throw _i1.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'Shape')
              ..write(': $unknownType'))
            .toString()),
    };
  }

  @override
  Map<String, Object?> serialize(_i12.Shape value) => switch (value) {
        _i12.Rectangle() => {
            ...(_i1.Serializers.scoped.serialize<_i12.Rectangle>(value)
                as Map<String, Object?>),
            r'$type': r'Rectangle',
          },
        _i12.Circle() => {
            ...(_i1.Serializers.scoped.serialize<_i12.Circle>(value)
                as Map<String, Object?>),
            r'$type': r'Circle',
          },
      };
}

final class RectangleSerializer extends _i1.Serializer<_i12.Rectangle> {
  const RectangleSerializer();

  @override
  String get dartType => r'project:functions/sealed_classes.dart#Rectangle';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.Rectangle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i12.Rectangle(
      (serialized[r'width'] as num).toDouble(),
      (serialized[r'height'] as num).toDouble(),
    );
  }

  @override
  Map<String, Object?> serialize(_i12.Rectangle value) => {
        r'width': value.width,
        r'height': value.height,
      };
}

final class CircleSerializer extends _i1.Serializer<_i12.Circle> {
  const CircleSerializer();

  @override
  String get dartType => r'project:functions/sealed_classes.dart#Circle';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.Circle deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i12.Circle((serialized[r'radius'] as num).toDouble());
  }

  @override
  Map<String, Object?> serialize(_i12.Circle value) =>
      {r'radius': value.radius};
}

final class ShapeWithInheritedCustomJsonSerializer
    extends _i1.Serializer<_i12.ShapeWithInheritedCustomJson> {
  const ShapeWithInheritedCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#ShapeWithInheritedCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.ShapeWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i12.ShapeWithInheritedCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i12.ShapeWithInheritedCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i12.RectangleWithInheritedCustomJson() =>
            r'RectangleWithInheritedCustomJson',
          _i12.CircleWithInheritedCustomJson() =>
            r'CircleWithInheritedCustomJson',
        },
      };
}

final class RectangleWithInheritedCustomJsonSerializer
    extends _i1.Serializer<_i12.RectangleWithInheritedCustomJson> {
  const RectangleWithInheritedCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#RectangleWithInheritedCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.RectangleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i12.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'RectangleWithInheritedCustomJson',
      ...serialized,
    }) as _i12.RectangleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i12.RectangleWithInheritedCustomJson value) =>
      value.toJson();
}

final class CircleWithInheritedCustomJsonSerializer
    extends _i1.Serializer<_i12.CircleWithInheritedCustomJson> {
  const CircleWithInheritedCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#CircleWithInheritedCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.CircleWithInheritedCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i12.ShapeWithInheritedCustomJson.fromJson({
      r'$type': r'CircleWithInheritedCustomJson',
      ...serialized,
    }) as _i12.CircleWithInheritedCustomJson);
  }

  @override
  Map<String, Object?> serialize(_i12.CircleWithInheritedCustomJson value) =>
      value.toJson();
}

final class ShapeWithCustomJsonSerializer
    extends _i1.Serializer<_i12.ShapeWithCustomJson> {
  const ShapeWithCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#ShapeWithCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.ShapeWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return switch (serialized[r'$type']) {
      r'CircleWithCustomJson' => _i1.Serializers.scoped
          .deserialize<_i12.CircleWithCustomJson>(serialized),
      r'RectangleWithCustomJson' => _i1.Serializers.scoped
          .deserialize<_i12.RectangleWithCustomJson>(serialized),
      final unknownType =>
        throw _i1.SerializationException((StringBuffer('Unknown subtype of ')
              ..write(r'ShapeWithCustomJson')
              ..write(': $unknownType'))
            .toString()),
    };
  }

  @override
  Map<String, Object?> serialize(_i12.ShapeWithCustomJson value) =>
      switch (value) {
        _i12.CircleWithCustomJson() => {
            ...(_i1.Serializers.scoped
                    .serialize<_i12.CircleWithCustomJson>(value)
                as Map<String, Object?>),
            r'$type': r'CircleWithCustomJson',
          },
        _i12.RectangleWithCustomJson() => {
            ...(_i1.Serializers.scoped
                    .serialize<_i12.RectangleWithCustomJson>(value)
                as Map<String, Object?>),
            r'$type': r'RectangleWithCustomJson',
          },
      };
}

final class CircleWithCustomJsonSerializer
    extends _i1.Serializer<_i12.CircleWithCustomJson> {
  const CircleWithCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#CircleWithCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.CircleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i12.CircleWithCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i12.CircleWithCustomJson value) =>
      value.toJson();
}

final class RectangleWithCustomJsonSerializer
    extends _i1.Serializer<_i12.RectangleWithCustomJson> {
  const RectangleWithCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#RectangleWithCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.RectangleWithCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i12.RectangleWithCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i12.RectangleWithCustomJson value) =>
      value.toJson();
}

final class ShapeWithOverriddenCustomJsonSerializer
    extends _i1.Serializer<_i12.ShapeWithOverriddenCustomJson> {
  const ShapeWithOverriddenCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#ShapeWithOverriddenCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.ShapeWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i12.ShapeWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i12.ShapeWithOverriddenCustomJson value) => {
        ...value.toJson(),
        r'$type': switch (value) {
          _i12.RectangleWithOverriddenCustomJson() =>
            r'RectangleWithOverriddenCustomJson',
          _i12.CircleWithOverriddenCustomJson() =>
            r'CircleWithOverriddenCustomJson',
        },
      };
}

final class RectangleWithOverriddenCustomJsonSerializer
    extends _i1.Serializer<_i12.RectangleWithOverriddenCustomJson> {
  const RectangleWithOverriddenCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#RectangleWithOverriddenCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.RectangleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return (_i12.ShapeWithOverriddenCustomJson.fromJson({
      r'$type': r'RectangleWithOverriddenCustomJson',
      ...serialized,
    }) as _i12.RectangleWithOverriddenCustomJson);
  }

  @override
  Map<String, Object?> serialize(
          _i12.RectangleWithOverriddenCustomJson value) =>
      value.toJson();
}

final class CircleWithOverriddenCustomJsonSerializer
    extends _i1.Serializer<_i12.CircleWithOverriddenCustomJson> {
  const CircleWithOverriddenCustomJsonSerializer();

  @override
  String get dartType =>
      r'project:functions/sealed_classes.dart#CircleWithOverriddenCustomJson';

  @override
  String get wireType => r'dart:core#Map';

  @override
  _i12.CircleWithOverriddenCustomJson deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return _i12.CircleWithOverriddenCustomJson.fromJson(serialized);
  }

  @override
  Map<String, Object?> serialize(_i12.CircleWithOverriddenCustomJson value) =>
      value.toJson();
}

typedef Record$k7x4l9 = ({String a, String b, String c});
typedef Record$rmm4wt = ({String anotherField, String field});
typedef Record$sxv9hg = ({
  _i11.NamedFields aliased,
  ({String anotherField, String field}) nonAliased
});

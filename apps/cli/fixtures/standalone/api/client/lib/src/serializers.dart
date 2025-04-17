// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:_common/_common.dart' as _$_common__common;
import 'package:celest_backend/exceptions/demo.dart';
import 'package:celest_backend/exceptions/exceptions.dart';
import 'package:celest_backend/exceptions/overrides.dart';
import 'package:celest_backend/models/classes.dart';
import 'package:celest_backend/models/cycles.dart';
import 'package:celest_backend/models/demo.dart';
import 'package:celest_backend/models/exceptions.dart';
import 'package:celest_backend/models/extension_types.dart';
import 'package:celest_backend/models/generic_wrappers.dart';
import 'package:celest_backend/models/metadata.dart';
import 'package:celest_backend/models/overrides.dart';
import 'package:celest_backend/models/parameter_types.dart';
import 'package:celest_backend/models/records.dart';
import 'package:celest_backend/models/sealed_classes.dart';
import 'package:celest_backend/models/typedefs.dart';
import 'package:celest_core/celest_core.dart' as _$celest;
import 'package:celest_core/src/exception/cloud_exception.dart' as _$celest;
import 'package:celest_core/src/exception/serialization_exception.dart'
    as _$celest;
import 'package:celest_core/src/serialization/json_value.dart' as _$celest;
import 'package:fast_immutable_collections/src/ilist/ilist.dart'
    as _$fast_immutable_collections_ilist;
import 'package:fast_immutable_collections/src/imap/imap.dart'
    as _$fast_immutable_collections_imap;

void initSerializers({_$celest.Serializers? serializers}) {
  return runZoned(
    () {
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Record$k2phuz, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'aliased': _$celest.Serializers.instance
              .serialize<NamedFieldsRecord>($value.aliased),
          r'nonAliased': _$celest.Serializers.instance
              .serialize<({String anotherField, String field})>(
                  $value.nonAliased),
        },
        deserialize: ($serialized) {
          return (
            aliased: _$celest.Serializers.instance
                .deserialize<NamedFieldsRecord>($serialized[r'aliased']),
            nonAliased: _$celest.Serializers.instance
                .deserialize<({String anotherField, String field})>(
                    $serialized[r'nonAliased'])
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Record$k7x4l9, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
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
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Record$rmm4wt, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
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
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<AsyncError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'error': $value.error,
          r'stackTrace': _$celest.Serializers.instance
              .serialize<StackTrace>($value.stackTrace),
        },
        deserialize: ($serialized) {
          return AsyncError(
            $serialized[r'error']!,
            _$celest.Serializers.instance
                .deserialize<StackTrace?>($serialized[r'stackTrace']),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<TimeoutException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message,
          if (_$celest.Serializers.instance
                  .serialize<Duration?>($value.duration)
              case final duration?)
            r'duration': duration,
        },
        deserialize: ($serialized) {
          return TimeoutException(
            ($serialized[r'message'] as String?),
            _$celest.Serializers.instance
                .deserialize<Duration?>($serialized[r'duration']),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          JsonUnsupportedObjectError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.unsupportedObject case final unsupportedObject?)
            r'unsupportedObject': unsupportedObject,
          if ($value.cause case final cause?) r'cause': cause,
          if ($value.partialResult case final partialResult?)
            r'partialResult': partialResult,
        },
        deserialize: ($serialized) {
          return JsonUnsupportedObjectError(
            $serialized[r'unsupportedObject'],
            cause: $serialized[r'cause'],
            partialResult: ($serialized[r'partialResult'] as String?),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<ArgumentError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'invalidValue': $value.invalidValue,
          if ($value.name case final name?) r'name': name,
          r'message': $value.message,
        },
        deserialize: ($serialized) {
          return ArgumentError(
            $serialized?[r'message'],
            ($serialized?[r'name'] as String?),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<AssertionError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return AssertionError($serialized?[r'message']);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          ConcurrentModificationError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.modifiedObject case final modifiedObject?)
            r'modifiedObject': modifiedObject
        },
        deserialize: ($serialized) {
          return ConcurrentModificationError($serialized?[r'modifiedObject']);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Error, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if (_$celest.Serializers.instance
                  .serialize<StackTrace?>($value.stackTrace)
              case final stackTrace?)
            r'stackTrace': stackTrace
        },
        deserialize: ($serialized) {
          return Error();
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Exception, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return Exception($serialized?[r'message']);
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<FormatException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'source': $value.source,
          if ($value.offset case final offset?) r'offset': offset,
        },
        deserialize: ($serialized) {
          return FormatException(
            (($serialized?[r'message'] as String?)) ?? '',
            $serialized?[r'source'],
            ($serialized?[r'offset'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<IndexError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.name case final name?) r'name': name,
          r'message': $value.message,
          if ($value.indexable case final indexable?) r'indexable': indexable,
          r'length': $value.length,
          r'invalidValue': $value.invalidValue,
          r'start': $value.start,
          r'end': $value.end,
        },
        deserialize: ($serialized) {
          return IndexError(
            ($serialized[r'invalidValue'] as num).toInt(),
            $serialized[r'indexable'],
            ($serialized[r'name'] as String?),
            ($serialized[r'message'] as String?),
            ($serialized[r'length'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          IntegerDivisionByZeroException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return IntegerDivisionByZeroException();
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<OutOfMemoryError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return OutOfMemoryError();
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<RangeError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.name case final name?) r'name': name,
          r'message': $value.message,
          if ($value.start case final start?) r'start': start,
          if ($value.end case final end?) r'end': end,
          if ($value.invalidValue case final invalidValue?)
            r'invalidValue': invalidValue,
        },
        deserialize: ($serialized) {
          return RangeError($serialized[r'message']);
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<StackOverflowError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return StackOverflowError();
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<StateError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return StateError(($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<TypeError, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return TypeError();
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<UnimplementedError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return UnimplementedError(($serialized?[r'message'] as String?));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<UnsupportedError, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if ($value.message case final message?) r'message': message
        },
        deserialize: ($serialized) {
          return UnsupportedError(($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$_common__common.CommonException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _$_common__common.CommonException(
              ($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$_common__common.CustomException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return _$_common__common.CustomException(
              ($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<BadNameException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return BadNameException(($serialized[r'message'] as String));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<BadShapeException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'shape': _$celest.Serializers.instance.serialize<Shape>($value.shape)
        },
        deserialize: ($serialized) {
          return BadShapeException(_$celest.Serializers.instance
              .deserialize<Shape>($serialized[r'shape']));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<CustomError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'additionalInfo':
              _$celest.Serializers.instance.serialize<_$celest.JsonMap>(
            $value.additionalInfo,
            const _$celest.TypeToken<_$celest.JsonMap>('JsonMap'),
          ),
        },
        deserialize: ($serialized) {
          return CustomError();
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          CustomErrorToFromJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return CustomErrorToFromJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          CustomErrorWithStackTrace, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'stackTrace': _$celest.Serializers.instance
              .serialize<StackTrace>($value.stackTrace),
          r'message': $value.message,
          r'additionalInfo': $value.additionalInfo,
        },
        deserialize: ($serialized) {
          return CustomErrorWithStackTrace(
              stackTrace: _$celest.Serializers.instance
                  .deserialize<StackTrace?>($serialized?[r'stackTrace']));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<CustomException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'message': $value.message,
          r'additionalInfo':
              _$celest.Serializers.instance.serialize<_$celest.JsonMap>(
            $value.additionalInfo,
            const _$celest.TypeToken<_$celest.JsonMap>('JsonMap'),
          ),
        },
        deserialize: ($serialized) {
          return CustomException();
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          CustomExceptionToFromJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return CustomExceptionToFromJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<ShapeException, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is BadShapeException) {
            return {
              ...(_$celest.Serializers.instance
                      .serialize<BadShapeException>($value)
                  as Map<String, Object?>),
              r'$type': r'BadShapeException',
            };
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'ShapeException')
                    ..write(': ')
                    ..write($value.runtimeType))
                  .toString());
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'BadShapeException') {
            return _$celest.Serializers.instance
                .deserialize<BadShapeException>($serialized);
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'ShapeException')
                    ..write(': ')
                    ..write($serialized[r'$type']))
                  .toString());
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<OverriddenException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'message': $value.message},
        deserialize: ($serialized) {
          return (_$_common__common.OverriddenException(
              ($serialized[r'message'] as String)) as OverriddenException);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<DefaultValues, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'field': $value.field,
          if ($value.nullableField case final nullableField?)
            r'nullableField': nullableField,
          if ($value.nullableFieldWithDefault
              case final nullableFieldWithDefault?)
            r'nullableFieldWithDefault': nullableFieldWithDefault,
          r'fieldWithoutInitializer': $value.fieldWithoutInitializer,
        },
        deserialize: ($serialized) {
          return DefaultValues(
            field: (($serialized?[r'field'] as String?)) ?? 'default',
            nullableField: ($serialized?[r'nullableField'] as String?),
            nullableFieldWithDefault:
                (($serialized?[r'nullableFieldWithDefault'] as String?)) ??
                    'default',
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Empty, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return Empty();
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Fields, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'superField': $value.superField,
          r'field': $value.field,
        },
        deserialize: ($serialized) {
          return Fields(
            ($serialized[r'superField'] as String),
            ($serialized[r'field'] as String),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<FromJsonAndToJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return FromJsonAndToJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<FromJsonStatic, String>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return FromJsonStatic.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<MixedFields, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'superField': $value.superField,
          r'field': $value.field,
        },
        deserialize: ($serialized) {
          return MixedFields(
            ($serialized[r'superField'] as String),
            field: ($serialized[r'field'] as String),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NamedFields, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'superField': $value.superField,
          r'field': $value.field,
        },
        deserialize: ($serialized) {
          return NamedFields(
            superField: ($serialized[r'superField'] as String),
            field: ($serialized[r'field'] as String),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NestedClass, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'fields':
              _$celest.Serializers.instance.serialize<Fields>($value.fields),
          if (_$celest.Serializers.instance
                  .serialize<Fields?>($value.nullableFields)
              case final nullableFields?)
            r'nullableFields': nullableFields,
        },
        deserialize: ($serialized) {
          return NestedClass(
            _$celest.Serializers.instance
                .deserialize<Fields>($serialized[r'fields']),
            _$celest.Serializers.instance
                .deserialize<Fields?>($serialized[r'nullableFields']),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NonMapFromAndToJson, String>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return NonMapFromAndToJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NonMapToJson, String>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return NonMapToJson(($serialized as String));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NonMapToJsonWithDefaults, String?>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return NonMapToJsonWithDefaults(
              (($serialized as String?)) ?? 'default');
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<OnlyFromJson, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'field': $value.field},
        deserialize: ($serialized) {
          return OnlyFromJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<OnlyToJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return OnlyToJson(($serialized[r'field'] as String));
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          OnlyToJsonWithDefaults, Map<String, Object?>?>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return OnlyToJsonWithDefaults(
              (($serialized?[r'field'] as String?)) ?? 'default');
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Child, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'name': $value.name,
          r'children': $value.children
              .map((el) => _$celest.Serializers.instance.serialize<Node>(el))
              .toList(),
        },
        deserialize: ($serialized) {
          return Child(($serialized[r'name'] as String));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Node, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is Parent) {
            return {
              ...(_$celest.Serializers.instance.serialize<Parent>($value)
                  as Map<String, Object?>),
              r'$type': r'Parent',
            };
          }
          if ($value is Child) {
            return {
              ...(_$celest.Serializers.instance.serialize<Child>($value)
                  as Map<String, Object?>),
              r'$type': r'Child',
            };
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Node')
                    ..write(': ')
                    ..write($value.runtimeType))
                  .toString());
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'Parent') {
            return _$celest.Serializers.instance
                .deserialize<Parent>($serialized);
          }
          if ($serialized[r'$type'] == r'Child') {
            return _$celest.Serializers.instance
                .deserialize<Child>($serialized);
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Node')
                    ..write(': ')
                    ..write($serialized[r'$type']))
                  .toString());
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Parent, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'name': $value.name,
          r'children': $value.children
              .map((el) => _$celest.Serializers.instance.serialize<Node>(el))
              .toList(),
        },
        deserialize: ($serialized) {
          return Parent(
            ($serialized[r'name'] as String),
            ($serialized[r'children'] as Iterable<Object?>)
                .map(
                    (el) => _$celest.Serializers.instance.deserialize<Node>(el))
                .toList(),
          );
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<SelfReferencing, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if (_$celest.Serializers.instance
                  .serialize<SelfReferencing?>($value.value)
              case final value?)
            r'value': value,
          if (_$celest.Serializers.instance
                  .serialize<SelfReferencingWrapper?>($value.wrapper)
              case final wrapper?)
            r'wrapper': wrapper,
          r'list': $value.list
              .map((el) =>
                  _$celest.Serializers.instance.serialize<SelfReferencing>(el))
              .toList(),
        },
        deserialize: ($serialized) {
          return SelfReferencing(
            value: _$celest.Serializers.instance
                .deserialize<SelfReferencing?>($serialized[r'value']),
            wrapper: _$celest.Serializers.instance
                .deserialize<SelfReferencingWrapper?>($serialized[r'wrapper']),
            list: ($serialized[r'list'] as Iterable<Object?>)
                .map((el) => _$celest.Serializers.instance
                    .deserialize<SelfReferencing>(el))
                .toList(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          SelfReferencingWrapper, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'value': _$celest.Serializers.instance
              .serialize<SelfReferencing>($value.value)
        },
        deserialize: ($serialized) {
          return SelfReferencingWrapper(
              value: _$celest.Serializers.instance
                  .deserialize<SelfReferencing>($serialized[r'value']));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Person, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'name': $value.name},
        deserialize: ($serialized) {
          return Person(name: ($serialized[r'name'] as String));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<SupportedErrorType, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return SupportedErrorType.values.byName($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<SupportedExceptionType, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return SupportedExceptionType.values.byName($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return Color.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(
        ColorXSerializer(),
        const _$celest.TypeToken<ColorX>('ColorX'),
      );
      _$celest.Serializers.instance.put(
        ColorXFromJsonSerializer(),
        const _$celest.TypeToken<ColorXFromJson>('ColorXFromJson'),
      );
      _$celest.Serializers.instance.put(
        ColorXFromJsonImplSerializer(),
        const _$celest.TypeToken<ColorXFromJsonImpl>('ColorXFromJsonImpl'),
      );
      _$celest.Serializers.instance.put(
        ColorXFromJsonStaticSerializer(),
        const _$celest.TypeToken<ColorXFromJsonStatic>('ColorXFromJsonStatic'),
      );
      _$celest.Serializers.instance.put(
        ColorXImplSerializer(),
        const _$celest.TypeToken<ColorXImpl>('ColorXImpl'),
      );
      _$celest.Serializers.instance.put(
        ColorXToFromJsonSerializer(),
        const _$celest.TypeToken<ColorXToFromJson>('ColorXToFromJson'),
      );
      _$celest.Serializers.instance.put(
        ColorXToJsonSerializer(),
        const _$celest.TypeToken<ColorXToJson>('ColorXToJson'),
      );
      _$celest.Serializers.instance.put(
        ColorXToJsonImplSerializer(),
        const _$celest.TypeToken<ColorXToJsonImpl>('ColorXToJsonImpl'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringX, String>(
          serialize: ($value) => $value.s,
          deserialize: ($serialized) {
            return StringX(($serialized as String));
          },
        ),
        const _$celest.TypeToken<StringX>('StringX'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXFromJson, String>(
          serialize: ($value) => $value.s,
          deserialize: ($serialized) {
            return StringXFromJson.fromJson($serialized);
          },
        ),
        const _$celest.TypeToken<StringXFromJson>('StringXFromJson'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXFromJsonImpl, String>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return StringXFromJsonImpl.fromJson($serialized);
          },
        ),
        const _$celest.TypeToken<StringXFromJsonImpl>('StringXFromJsonImpl'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXFromJsonStatic, String>(
          serialize: ($value) => $value.s,
          deserialize: ($serialized) {
            return StringXFromJsonStatic.fromJson($serialized);
          },
        ),
        const _$celest.TypeToken<StringXFromJsonStatic>(
            'StringXFromJsonStatic'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXImpl, String>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return StringXImpl(($serialized as String));
          },
        ),
        const _$celest.TypeToken<StringXImpl>('StringXImpl'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXPrivateCtor, String?>(
          serialize: ($value) => $value.s,
          deserialize: ($serialized) {
            return (($serialized as String) as StringXPrivateCtor);
          },
        ),
        const _$celest.TypeToken<StringXPrivateCtor>('StringXPrivateCtor'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXPrivateCtorImpl, String?>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return (($serialized as String) as StringXPrivateCtorImpl);
          },
        ),
        const _$celest.TypeToken<StringXPrivateCtorImpl>(
            'StringXPrivateCtorImpl'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXPrivateField, String>(
          serialize: ($value) => ($value as String),
          deserialize: ($serialized) {
            return StringXPrivateField(($serialized as String));
          },
        ),
        const _$celest.TypeToken<StringXPrivateField>('StringXPrivateField'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXPrivateFieldImpl, String>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return StringXPrivateFieldImpl(($serialized as String));
          },
        ),
        const _$celest.TypeToken<StringXPrivateFieldImpl>(
            'StringXPrivateFieldImpl'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXToFromJson, String>(
          serialize: ($value) => $value.toJson(),
          deserialize: ($serialized) {
            return StringXToFromJson.fromJson($serialized);
          },
        ),
        const _$celest.TypeToken<StringXToFromJson>('StringXToFromJson'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXToJson, String>(
          serialize: ($value) => $value.toJson(),
          deserialize: ($serialized) {
            return StringXToJson(($serialized as String));
          },
        ),
        const _$celest.TypeToken<StringXToJson>('StringXToJson'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<StringXToJsonImpl, String>(
          serialize: ($value) => $value.toJson(),
          deserialize: ($serialized) {
            return StringXToJsonImpl(($serialized as String));
          },
        ),
        const _$celest.TypeToken<StringXToJsonImpl>('StringXToJsonImpl'),
      );
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Value, String>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return Value.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(
        ValueXSerializer(),
        const _$celest.TypeToken<ValueX>('ValueX'),
      );
      _$celest.Serializers.instance.put(
        ValueXFromJsonSerializer(),
        const _$celest.TypeToken<ValueXFromJson>('ValueXFromJson'),
      );
      _$celest.Serializers.instance.put(
        ValueXFromJsonImplSerializer(),
        const _$celest.TypeToken<ValueXFromJsonImpl>('ValueXFromJsonImpl'),
      );
      _$celest.Serializers.instance.put(
        ValueXFromJsonStaticSerializer(),
        const _$celest.TypeToken<ValueXFromJsonStatic>('ValueXFromJsonStatic'),
      );
      _$celest.Serializers.instance.put(
        ValueXImplSerializer(),
        const _$celest.TypeToken<ValueXImpl>('ValueXImpl'),
      );
      _$celest.Serializers.instance.put(
        ValueXToFromJsonSerializer(),
        const _$celest.TypeToken<ValueXToFromJson>('ValueXToFromJson'),
      );
      _$celest.Serializers.instance.put(
        ValueXToJsonSerializer(),
        const _$celest.TypeToken<ValueXToJson>('ValueXToJson'),
      );
      _$celest.Serializers.instance.put(
        ValueXToJsonImplSerializer(),
        const _$celest.TypeToken<ValueXToJsonImpl>('ValueXToJsonImpl'),
      );
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<GenericWrappers, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'listOfString': _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_ilist.IList<String>>(
                  $value.listOfString),
          r'listOfUri': _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_ilist.IList<Uri>>(
                  $value.listOfUri),
          r'listOfSimpleClass': _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_ilist.IList<SimpleClass>>(
                  $value.listOfSimpleClass),
          r'listOfListOfString': _$celest.Serializers.instance.serialize<
                  _$fast_immutable_collections_ilist
                  .IList<_$fast_immutable_collections_ilist.IList<String>>>(
              $value.listOfListOfString),
          r'listOfListOfUri': _$celest.Serializers.instance.serialize<
                  _$fast_immutable_collections_ilist
                  .IList<_$fast_immutable_collections_ilist.IList<Uri>>>(
              $value.listOfListOfUri),
          r'listOfListOfSimpleClass': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_ilist.IList<
                  _$fast_immutable_collections_ilist
                  .IList<SimpleClass>>>($value.listOfListOfSimpleClass),
          r'mapOfString': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap
              .IMap<String, String>>($value.mapOfString),
          r'mapOfUri': _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_imap.IMap<String, Uri>>(
                  $value.mapOfUri),
          r'mapOfSimpleClass': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap
              .IMap<String, SimpleClass>>($value.mapOfSimpleClass),
          r'mapOfListOfString': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap.IMap<
                  String,
                  _$fast_immutable_collections_ilist
                  .IList<String>>>($value.mapOfListOfString),
          r'mapOfListOfUri': _$celest.Serializers.instance.serialize<
                  _$fast_immutable_collections_imap
                  .IMap<String, _$fast_immutable_collections_ilist.IList<Uri>>>(
              $value.mapOfListOfUri),
          r'mapOfListOfSimpleClass': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap.IMap<
                  String,
                  _$fast_immutable_collections_ilist
                  .IList<SimpleClass>>>($value.mapOfListOfSimpleClass),
          r'mapOfMapOfString': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap.IMap<
                  String,
                  _$fast_immutable_collections_imap
                  .IMap<String, String>>>($value.mapOfMapOfString),
          r'mapOfMapOfUri': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap.IMap<
                  String,
                  _$fast_immutable_collections_imap
                  .IMap<String, Uri>>>($value.mapOfMapOfUri),
          r'mapOfMapOfSimpleClass': _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap.IMap<
                  String,
                  _$fast_immutable_collections_imap
                  .IMap<String, SimpleClass>>>($value.mapOfMapOfSimpleClass),
        },
        deserialize: ($serialized) {
          return GenericWrappers(
            listOfString: _$celest.Serializers.instance
                .deserialize<_$fast_immutable_collections_ilist.IList<String>>(
                    $serialized[r'listOfString']),
            listOfUri: _$celest.Serializers.instance
                .deserialize<_$fast_immutable_collections_ilist.IList<Uri>>(
                    $serialized[r'listOfUri']),
            listOfSimpleClass: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_ilist
                .IList<SimpleClass>>($serialized[r'listOfSimpleClass']),
            listOfListOfString: _$celest.Serializers.instance.deserialize<
                    _$fast_immutable_collections_ilist
                    .IList<_$fast_immutable_collections_ilist.IList<String>>>(
                $serialized[r'listOfListOfString']),
            listOfListOfUri: _$celest.Serializers.instance.deserialize<
                    _$fast_immutable_collections_ilist
                    .IList<_$fast_immutable_collections_ilist.IList<Uri>>>(
                $serialized[r'listOfListOfUri']),
            listOfListOfSimpleClass: _$celest.Serializers.instance.deserialize<
                    _$fast_immutable_collections_ilist.IList<
                        _$fast_immutable_collections_ilist.IList<SimpleClass>>>(
                $serialized[r'listOfListOfSimpleClass']),
            mapOfString: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap
                .IMap<String, String>>($serialized[r'mapOfString']),
            mapOfUri: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap
                .IMap<String, Uri>>($serialized[r'mapOfUri']),
            mapOfSimpleClass: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap
                .IMap<String, SimpleClass>>($serialized[r'mapOfSimpleClass']),
            mapOfListOfString: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap.IMap<
                    String,
                    _$fast_immutable_collections_ilist
                    .IList<String>>>($serialized[r'mapOfListOfString']),
            mapOfListOfUri: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap.IMap<
                    String,
                    _$fast_immutable_collections_ilist
                    .IList<Uri>>>($serialized[r'mapOfListOfUri']),
            mapOfListOfSimpleClass: _$celest.Serializers.instance.deserialize<
                    _$fast_immutable_collections_imap.IMap<String,
                        _$fast_immutable_collections_ilist.IList<SimpleClass>>>(
                $serialized[r'mapOfListOfSimpleClass']),
            mapOfMapOfString: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap.IMap<
                    String,
                    _$fast_immutable_collections_imap
                    .IMap<String, String>>>($serialized[r'mapOfMapOfString']),
            mapOfMapOfUri: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap.IMap<
                    String,
                    _$fast_immutable_collections_imap
                    .IMap<String, Uri>>>($serialized[r'mapOfMapOfUri']),
            mapOfMapOfSimpleClass: _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap.IMap<
                    String,
                    _$fast_immutable_collections_imap.IMap<String,
                        SimpleClass>>>($serialized[r'mapOfMapOfSimpleClass']),
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Exportable, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return Exportable();
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<LiteralEnum, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return LiteralEnum.values.byName($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Serializable, Map<String, Object?>?>(
        serialize: ($value) =>
            <String, Object?>{if ($value.type case final type?) r'type': type},
        deserialize: ($serialized) {
          return Serializable(($serialized?[r'type'] as String?));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NestedChild, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return NestedChild.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<NestedGrandparent, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'parent': _$celest.Serializers.instance
              .serialize<_$_common__common.NestedParent>($value.parent)
        },
        deserialize: ($serialized) {
          return NestedGrandparent(_$celest.Serializers.instance
              .deserialize<_$_common__common.NestedParent>(
                  $serialized[r'parent']));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NestedParent, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'child': _$celest.Serializers.instance
              .serialize<_$_common__common.NestedChild>($value.child)
        },
        deserialize: ($serialized) {
          return (_$_common__common.NestedParent(_$celest.Serializers.instance
              .deserialize<_$_common__common.NestedChild>(
                  $serialized[r'child'])) as NestedParent);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<ComplexClass, Map<String, dynamic>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return ComplexClass.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<ComplexStruct, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'aBigInt':
              _$celest.Serializers.instance.serialize<BigInt>($value.aBigInt),
          r'aBool': $value.aBool,
          r'aDateTime': _$celest.Serializers.instance
              .serialize<DateTime>($value.aDateTime),
          r'aDouble': $value.aDouble,
          r'aDuration': _$celest.Serializers.instance
              .serialize<Duration>($value.aDuration),
          r'aListOfBigInt': $value.aListOfBigInt
              .map((el) => _$celest.Serializers.instance.serialize<BigInt>(el))
              .toList(),
          r'aListOfBool': $value.aListOfBool,
          r'aListOfDateTime': $value.aListOfDateTime
              .map(
                  (el) => _$celest.Serializers.instance.serialize<DateTime>(el))
              .toList(),
          r'aListOfDouble': $value.aListOfDouble,
          r'aListOfDuration': $value.aListOfDuration
              .map(
                  (el) => _$celest.Serializers.instance.serialize<Duration>(el))
              .toList(),
          r'aListOfEnum': $value.aListOfEnum
              .map((el) => _$celest.Serializers.instance.serialize<MyEnum>(el))
              .toList(),
          r'aListOfInt': $value.aListOfInt,
          r'aListOfNull': $value.aListOfNull,
          r'aListOfRegExp': $value.aListOfRegExp
              .map((el) => _$celest.Serializers.instance.serialize<RegExp>(el))
              .toList(),
          r'aListOfSimpleClass': $value.aListOfSimpleClass
              .map((el) =>
                  _$celest.Serializers.instance.serialize<SimpleClass>(el))
              .toList(),
          r'aListOfSimpleStruct': $value.aListOfSimpleStruct
              .map((el) =>
                  _$celest.Serializers.instance.serialize<SimpleStruct>(el))
              .toList(),
          r'aListOfStackTrace': $value.aListOfStackTrace
              .map((el) =>
                  _$celest.Serializers.instance.serialize<StackTrace>(el))
              .toList(),
          r'aListOfString': $value.aListOfString,
          r'aListOfUint8List': $value.aListOfUint8List
              .map((el) =>
                  _$celest.Serializers.instance.serialize<Uint8List>(el))
              .toList(),
          r'aListOfUri': $value.aListOfUri
              .map((el) => _$celest.Serializers.instance.serialize<Uri>(el))
              .toList(),
          r'aListOfUriData': $value.aListOfUriData
              .map((el) => _$celest.Serializers.instance.serialize<UriData>(el))
              .toList(),
          r'aMapOfBigInt': $value.aMapOfBigInt.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<BigInt>(value),
              )),
          r'aMapOfBool': $value.aMapOfBool,
          r'aMapOfDateTime': $value.aMapOfDateTime.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<DateTime>(value),
              )),
          r'aMapOfDouble': $value.aMapOfDouble,
          r'aMapOfDuration': $value.aMapOfDuration.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<Duration>(value),
              )),
          r'aMapOfEnum': $value.aMapOfEnum.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<MyEnum>(value),
              )),
          r'aMapOfInt': $value.aMapOfInt,
          r'aMapOfNull': $value.aMapOfNull,
          r'aMapOfRegExp': $value.aMapOfRegExp.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<RegExp>(value),
              )),
          r'aMapOfSimpleClass': $value.aMapOfSimpleClass.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<SimpleClass>(value),
              )),
          r'aMapOfSimpleStruct': $value.aMapOfSimpleStruct.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<SimpleStruct>(value),
              )),
          r'aMapOfStackTrace': $value.aMapOfStackTrace.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<StackTrace>(value),
              )),
          r'aMapOfString': $value.aMapOfString,
          r'aMapOfUint8List': $value.aMapOfUint8List.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<Uint8List>(value),
              )),
          r'aMapOfUri': $value.aMapOfUri.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<Uri>(value),
              )),
          r'aMapOfUriData': $value.aMapOfUriData.map((
            key,
            value,
          ) =>
              MapEntry(
                key,
                _$celest.Serializers.instance.serialize<UriData>(value),
              )),
          r'aNull': $value.aNull,
          r'aRegExp':
              _$celest.Serializers.instance.serialize<RegExp>($value.aRegExp),
          r'aSimpleClass': _$celest.Serializers.instance
              .serialize<SimpleClass>($value.aSimpleClass),
          r'aSimpleStruct': _$celest.Serializers.instance
              .serialize<SimpleStruct>($value.aSimpleStruct),
          r'aStackTrace': _$celest.Serializers.instance
              .serialize<StackTrace>($value.aStackTrace),
          r'aString': $value.aString,
          r'aUint8List': _$celest.Serializers.instance
              .serialize<Uint8List>($value.aUint8List),
          r'aUri': _$celest.Serializers.instance.serialize<Uri>($value.aUri),
          r'aUriData':
              _$celest.Serializers.instance.serialize<UriData>($value.aUriData),
          r'anEnum':
              _$celest.Serializers.instance.serialize<MyEnum>($value.anEnum),
          r'anInt': $value.anInt,
          r'anIterableOfSimpleClass': $value.anIterableOfSimpleClass
              .map((el) =>
                  _$celest.Serializers.instance.serialize<SimpleClass>(el))
              .toList(),
        },
        deserialize: ($serialized) {
          return (
            aBigInt: _$celest.Serializers.instance
                .deserialize<BigInt>($serialized[r'aBigInt']),
            aBool: ($serialized[r'aBool'] as bool),
            aDateTime: _$celest.Serializers.instance
                .deserialize<DateTime>($serialized[r'aDateTime']),
            aDouble: ($serialized[r'aDouble'] as num).toDouble(),
            aDuration: _$celest.Serializers.instance
                .deserialize<Duration>($serialized[r'aDuration']),
            aListOfBigInt: ($serialized[r'aListOfBigInt'] as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<BigInt>(el))
                .toList(),
            aListOfBool: ($serialized[r'aListOfBool'] as Iterable<Object?>)
                .map((el) => (el as bool))
                .toList(),
            aListOfDateTime:
                ($serialized[r'aListOfDateTime'] as Iterable<Object?>)
                    .map((el) =>
                        _$celest.Serializers.instance.deserialize<DateTime>(el))
                    .toList(),
            aListOfDouble: ($serialized[r'aListOfDouble'] as Iterable<Object?>)
                .map((el) => (el as num).toDouble())
                .toList(),
            aListOfDuration:
                ($serialized[r'aListOfDuration'] as Iterable<Object?>)
                    .map((el) =>
                        _$celest.Serializers.instance.deserialize<Duration>(el))
                    .toList(),
            aListOfEnum: ($serialized[r'aListOfEnum'] as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<MyEnum>(el))
                .toList(),
            aListOfInt: ($serialized[r'aListOfInt'] as Iterable<Object?>)
                .map((el) => (el as num).toInt())
                .toList(),
            aListOfNull: ($serialized[r'aListOfNull'] as Iterable<Object?>)
                .map((el) => (el as Null))
                .toList(),
            aListOfRegExp: ($serialized[r'aListOfRegExp'] as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<RegExp>(el))
                .toList(),
            aListOfSimpleClass: ($serialized[r'aListOfSimpleClass']
                    as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<SimpleClass>(el))
                .toList(),
            aListOfSimpleStruct: ($serialized[r'aListOfSimpleStruct']
                    as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<SimpleStruct>(el))
                .toList(),
            aListOfStackTrace: ($serialized[r'aListOfStackTrace']
                    as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<StackTrace>(el))
                .toList(),
            aListOfString: ($serialized[r'aListOfString'] as Iterable<Object?>)
                .map((el) => (el as String))
                .toList(),
            aListOfUint8List: ($serialized[r'aListOfUint8List']
                    as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<Uint8List>(el))
                .toList(),
            aListOfUri: ($serialized[r'aListOfUri'] as Iterable<Object?>)
                .map((el) => _$celest.Serializers.instance.deserialize<Uri>(el))
                .toList(),
            aListOfUriData:
                ($serialized[r'aListOfUriData'] as Iterable<Object?>)
                    .map((el) =>
                        _$celest.Serializers.instance.deserialize<UriData>(el))
                    .toList(),
            aMapOfBigInt:
                ($serialized[r'aMapOfBigInt'] as Map<String, Object?>).map((
              key,
              value,
            ) =>
                    MapEntry(
                      key,
                      _$celest.Serializers.instance.deserialize<BigInt>(value),
                    )),
            aMapOfBool:
                ($serialized[r'aMapOfBool'] as Map<String, Object?>).map((
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
                      _$celest.Serializers.instance
                          .deserialize<DateTime>(value),
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
                      _$celest.Serializers.instance
                          .deserialize<Duration>(value),
                    )),
            aMapOfEnum:
                ($serialized[r'aMapOfEnum'] as Map<String, Object?>).map((
              key,
              value,
            ) =>
                    MapEntry(
                      key,
                      _$celest.Serializers.instance.deserialize<MyEnum>(value),
                    )),
            aMapOfInt: ($serialized[r'aMapOfInt'] as Map<String, Object?>).map((
              key,
              value,
            ) =>
                MapEntry(
                  key,
                  (value as num).toInt(),
                )),
            aMapOfNull:
                ($serialized[r'aMapOfNull'] as Map<String, Object?>).map((
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
                      _$celest.Serializers.instance.deserialize<RegExp>(value),
                    )),
            aMapOfSimpleClass:
                ($serialized[r'aMapOfSimpleClass'] as Map<String, Object?>)
                    .map((
              key,
              value,
            ) =>
                        MapEntry(
                          key,
                          _$celest.Serializers.instance
                              .deserialize<SimpleClass>(value),
                        )),
            aMapOfSimpleStruct:
                ($serialized[r'aMapOfSimpleStruct'] as Map<String, Object?>)
                    .map((
              key,
              value,
            ) =>
                        MapEntry(
                          key,
                          _$celest.Serializers.instance
                              .deserialize<SimpleStruct>(value),
                        )),
            aMapOfStackTrace:
                ($serialized[r'aMapOfStackTrace'] as Map<String, Object?>).map((
              key,
              value,
            ) =>
                    MapEntry(
                      key,
                      _$celest.Serializers.instance
                          .deserialize<StackTrace>(value),
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
                      _$celest.Serializers.instance
                          .deserialize<Uint8List>(value),
                    )),
            aMapOfUri: ($serialized[r'aMapOfUri'] as Map<String, Object?>).map((
              key,
              value,
            ) =>
                MapEntry(
                  key,
                  _$celest.Serializers.instance.deserialize<Uri>(value),
                )),
            aMapOfUriData:
                ($serialized[r'aMapOfUriData'] as Map<String, Object?>).map((
              key,
              value,
            ) =>
                    MapEntry(
                      key,
                      _$celest.Serializers.instance.deserialize<UriData>(value),
                    )),
            aNull: ($serialized[r'aNull'] as Null),
            aRegExp: _$celest.Serializers.instance
                .deserialize<RegExp>($serialized[r'aRegExp']),
            aSimpleClass: _$celest.Serializers.instance
                .deserialize<SimpleClass>($serialized[r'aSimpleClass']),
            aSimpleStruct: _$celest.Serializers.instance
                .deserialize<SimpleStruct>($serialized[r'aSimpleStruct']),
            aStackTrace: _$celest.Serializers.instance
                .deserialize<StackTrace>($serialized[r'aStackTrace']),
            aString: ($serialized[r'aString'] as String),
            aUint8List: _$celest.Serializers.instance
                .deserialize<Uint8List>($serialized[r'aUint8List']),
            aUri: _$celest.Serializers.instance
                .deserialize<Uri>($serialized[r'aUri']),
            aUriData: _$celest.Serializers.instance
                .deserialize<UriData>($serialized[r'aUriData']),
            anEnum: _$celest.Serializers.instance
                .deserialize<MyEnum>($serialized[r'anEnum']),
            anInt: ($serialized[r'anInt'] as num).toInt(),
            anIterableOfSimpleClass: ($serialized[r'anIterableOfSimpleClass']
                    as Iterable<Object?>)
                .map((el) =>
                    _$celest.Serializers.instance.deserialize<SimpleClass>(el))
                .toList()
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<MyEnum, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return MyEnum.values.byName($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<SimpleClass, Map<String, dynamic>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return SimpleClass.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<SimpleStruct, Map<String, Object?>?>(
        serialize: ($value) => const <String, Object?>{},
        deserialize: ($serialized) {
          return ();
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<NamedFieldsRecord, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
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
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Nested, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'namedFields': _$celest.Serializers.instance
              .serialize<NamedFieldsRecord>($value.namedFields)
        },
        deserialize: ($serialized) {
          return (
            namedFields: _$celest.Serializers.instance
                .deserialize<NamedFieldsRecord>($serialized[r'namedFields'])
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<NullableNested, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          if (_$celest.Serializers.instance
                  .serialize<NamedFieldsRecord?>($value.namedFields)
              case final namedFields?)
            r'namedFields': namedFields
        },
        deserialize: ($serialized) {
          return (
            namedFields: _$celest.Serializers.instance
                .deserialize<NamedFieldsRecord?>($serialized[r'namedFields'])
          );
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Circle, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'radius': $value.radius,
          r'area': $value.area,
        },
        deserialize: ($serialized) {
          return Circle(($serialized[r'radius'] as num).toDouble());
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          CircleWithCustomJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return CircleWithCustomJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          CircleWithInheritedCustomJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return (ShapeWithInheritedCustomJson.fromJson({
            r'$type': r'CircleWithInheritedCustomJson',
            ...$serialized,
          }) as CircleWithInheritedCustomJson);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          CircleWithOverriddenCustomJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return CircleWithOverriddenCustomJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<ErrResult<String>, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'error': $value.error},
        deserialize: ($serialized) {
          return ErrResult<String>(($serialized[r'error'] as String));
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<ErrResult<Shape>, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'error': _$celest.Serializers.instance.serialize<Shape>($value.error)
        },
        deserialize: ($serialized) {
          return ErrResult<Shape>(_$celest.Serializers.instance
              .deserialize<Shape>($serialized[r'error']));
        },
      ));
      _$celest.Serializers.instance
          .put(const ErrResult_E_ShapeExceptionSerializer());
      _$celest.Serializers.instance
          .put(const ErrResult_E_ShapeExceptionSerializer<ShapeException>());
      _$celest.Serializers.instance
          .put(const ErrResult_E_ShapeExceptionSerializer<BadShapeException>());
      _$celest.Serializers.instance.put(const ErrResult_T_ShapeSerializer());
      _$celest.Serializers.instance
          .put(const ErrResult_T_ShapeSerializer<Shape>());
      _$celest.Serializers.instance
          .put(const ErrResult_T_ShapeSerializer<Circle>());
      _$celest.Serializers.instance
          .put(const ErrResult_T_ShapeSerializer<Rectangle>());
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<OkResult<String>, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'data': $value.data},
        deserialize: ($serialized) {
          return OkResult<String>(($serialized[r'data'] as String));
        },
      ));
      _$celest.Serializers.instance.put(const OkResult_T_ShapeSerializer());
      _$celest.Serializers.instance
          .put(const OkResult_T_ShapeSerializer<Shape>());
      _$celest.Serializers.instance
          .put(const OkResult_T_ShapeSerializer<Circle>());
      _$celest.Serializers.instance
          .put(const OkResult_T_ShapeSerializer<Rectangle>());
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<OkResult<Shape>, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'data': _$celest.Serializers.instance.serialize<Shape>($value.data)
        },
        deserialize: ($serialized) {
          return OkResult<Shape>(_$celest.Serializers.instance
              .deserialize<Shape>($serialized[r'data']));
        },
      ));
      _$celest.Serializers.instance
          .put(const OkResult_E_ShapeExceptionSerializer());
      _$celest.Serializers.instance
          .put(const OkResult_E_ShapeExceptionSerializer<ShapeException>());
      _$celest.Serializers.instance
          .put(const OkResult_E_ShapeExceptionSerializer<BadShapeException>());
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<OkShapeResult, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'data': _$celest.Serializers.instance.serialize<Shape>($value.data)
        },
        deserialize: ($serialized) {
          return OkShapeResult(_$celest.Serializers.instance
              .deserialize<Shape>($serialized[r'data']));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Rectangle, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'width': $value.width,
          r'height': $value.height,
          r'area': $value.area,
        },
        deserialize: ($serialized) {
          return Rectangle(
            ($serialized[r'width'] as num).toDouble(),
            ($serialized[r'height'] as num).toDouble(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          RectangleWithCustomJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return RectangleWithCustomJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          RectangleWithInheritedCustomJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return (ShapeWithInheritedCustomJson.fromJson({
            r'$type': r'RectangleWithInheritedCustomJson',
            ...$serialized,
          }) as RectangleWithInheritedCustomJson);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          RectangleWithOverriddenCustomJson, Map<String, Object?>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return (ShapeWithOverriddenCustomJson.fromJson({
            r'$type': r'RectangleWithOverriddenCustomJson',
            ...$serialized,
          }) as RectangleWithOverriddenCustomJson);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          Result<String, Shape>, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is OkResult<String>) {
            return {
              ...(_$celest.Serializers.instance
                  .serialize<OkResult<String>>($value) as Map<String, Object?>),
              r'$type': r'OkResult',
            };
          }
          if ($value is SwappedResult<Shape, String>) {
            return {
              ...(_$celest.Serializers.instance
                      .serialize<SwappedResult<Shape, String>>($value)
                  as Map<String, Object?>),
              r'$type': r'SwappedResult',
            };
          }
          if ($value is ErrResult<Shape>) {
            return {
              ...(_$celest.Serializers.instance
                  .serialize<ErrResult<Shape>>($value) as Map<String, Object?>),
              r'$type': r'ErrResult',
            };
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Result')
                    ..write(': ')
                    ..write($value.runtimeType))
                  .toString());
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'OkResult') {
            return _$celest.Serializers.instance
                .deserialize<OkResult<String>>($serialized);
          }
          if ($serialized[r'$type'] == r'SwappedResult') {
            return _$celest.Serializers.instance
                .deserialize<SwappedResult<Shape, String>>($serialized);
          }
          if ($serialized[r'$type'] == r'ErrResult') {
            return _$celest.Serializers.instance
                .deserialize<ErrResult<Shape>>($serialized);
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Result')
                    ..write(': ')
                    ..write($serialized[r'$type']))
                  .toString());
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          Result<Shape, String>, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is OkResult<Shape>) {
            return {
              ...(_$celest.Serializers.instance
                  .serialize<OkResult<Shape>>($value) as Map<String, Object?>),
              r'$type': r'OkResult',
            };
          }
          if ($value is SwappedResult<String, Shape>) {
            return {
              ...(_$celest.Serializers.instance
                      .serialize<SwappedResult<String, Shape>>($value)
                  as Map<String, Object?>),
              r'$type': r'SwappedResult',
            };
          }
          if ($value is ErrResult<String>) {
            return {
              ...(_$celest.Serializers.instance
                      .serialize<ErrResult<String>>($value)
                  as Map<String, Object?>),
              r'$type': r'ErrResult',
            };
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Result')
                    ..write(': ')
                    ..write($value.runtimeType))
                  .toString());
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'OkResult') {
            return _$celest.Serializers.instance
                .deserialize<OkResult<Shape>>($serialized);
          }
          if ($serialized[r'$type'] == r'SwappedResult') {
            return _$celest.Serializers.instance
                .deserialize<SwappedResult<String, Shape>>($serialized);
          }
          if ($serialized[r'$type'] == r'ErrResult') {
            return _$celest.Serializers.instance
                .deserialize<ErrResult<String>>($serialized);
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Result')
                    ..write(': ')
                    ..write($serialized[r'$type']))
                  .toString());
        },
      ));
      _$celest.Serializers.instance
          .put(const Result_T_Shape_E_ShapeExceptionSerializer());
      _$celest.Serializers.instance.put(
          const Result_T_Shape_E_ShapeExceptionSerializer<Shape,
              ShapeException>());
      _$celest.Serializers.instance.put(
          const Result_T_Shape_E_ShapeExceptionSerializer<Shape,
              BadShapeException>());
      _$celest.Serializers.instance.put(
          const Result_T_Shape_E_ShapeExceptionSerializer<Circle,
              ShapeException>());
      _$celest.Serializers.instance.put(
          const Result_T_Shape_E_ShapeExceptionSerializer<Circle,
              BadShapeException>());
      _$celest.Serializers.instance.put(
          const Result_T_Shape_E_ShapeExceptionSerializer<Rectangle,
              ShapeException>());
      _$celest.Serializers.instance.put(
          const Result_T_Shape_E_ShapeExceptionSerializer<Rectangle,
              BadShapeException>());
      _$celest.Serializers.instance
          .put(const Result_E_ShapeException_T_ShapeSerializer());
      _$celest.Serializers.instance.put(
          const Result_E_ShapeException_T_ShapeSerializer<ShapeException,
              Shape>());
      _$celest.Serializers.instance.put(
          const Result_E_ShapeException_T_ShapeSerializer<ShapeException,
              Circle>());
      _$celest.Serializers.instance.put(
          const Result_E_ShapeException_T_ShapeSerializer<ShapeException,
              Rectangle>());
      _$celest.Serializers.instance.put(
          const Result_E_ShapeException_T_ShapeSerializer<BadShapeException,
              Shape>());
      _$celest.Serializers.instance.put(
          const Result_E_ShapeException_T_ShapeSerializer<BadShapeException,
              Circle>());
      _$celest.Serializers.instance.put(
          const Result_E_ShapeException_T_ShapeSerializer<BadShapeException,
              Rectangle>());
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Shape, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is Circle) {
            return {
              ...(_$celest.Serializers.instance.serialize<Circle>($value)
                  as Map<String, Object?>),
              r'$type': r'Circle',
            };
          }
          if ($value is Rectangle) {
            return {
              ...(_$celest.Serializers.instance.serialize<Rectangle>($value)
                  as Map<String, Object?>),
              r'$type': r'Rectangle',
            };
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Shape')
                    ..write(': ')
                    ..write($value.runtimeType))
                  .toString());
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'Circle') {
            return _$celest.Serializers.instance
                .deserialize<Circle>($serialized);
          }
          if ($serialized[r'$type'] == r'Rectangle') {
            return _$celest.Serializers.instance
                .deserialize<Rectangle>($serialized);
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'Shape')
                    ..write(': ')
                    ..write($serialized[r'$type']))
                  .toString());
        },
      ));
      _$celest.Serializers.instance.put(
          _$celest.Serializer.define<ShapeWithCustomJson, Map<String, Object?>>(
        serialize: ($value) {
          if ($value is CircleWithCustomJson) {
            return {
              ...(_$celest.Serializers.instance
                      .serialize<CircleWithCustomJson>($value)
                  as Map<String, Object?>),
              r'$type': r'CircleWithCustomJson',
            };
          }
          if ($value is RectangleWithCustomJson) {
            return {
              ...(_$celest.Serializers.instance
                      .serialize<RectangleWithCustomJson>($value)
                  as Map<String, Object?>),
              r'$type': r'RectangleWithCustomJson',
            };
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'ShapeWithCustomJson')
                    ..write(': ')
                    ..write($value.runtimeType))
                  .toString());
        },
        deserialize: ($serialized) {
          if ($serialized[r'$type'] == r'CircleWithCustomJson') {
            return _$celest.Serializers.instance
                .deserialize<CircleWithCustomJson>($serialized);
          }
          if ($serialized[r'$type'] == r'RectangleWithCustomJson') {
            return _$celest.Serializers.instance
                .deserialize<RectangleWithCustomJson>($serialized);
          }
          throw _$celest.SerializationException(
              (StringBuffer('Unknown subtype of ')
                    ..write(r'ShapeWithCustomJson')
                    ..write(': ')
                    ..write($serialized[r'$type']))
                  .toString());
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          ShapeWithInheritedCustomJson, Map<String, Object?>>(
        serialize: ($value) => {
          ...$value.toJson(),
          r'$type': switch ($value) {
            RectangleWithInheritedCustomJson() =>
              r'RectangleWithInheritedCustomJson',
            CircleWithInheritedCustomJson() => r'CircleWithInheritedCustomJson',
          },
        },
        deserialize: ($serialized) {
          return ShapeWithInheritedCustomJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          ShapeWithOverriddenCustomJson, Map<String, Object?>>(
        serialize: ($value) => {
          ...$value.toJson(),
          r'$type': switch ($value) {
            RectangleWithOverriddenCustomJson() =>
              r'RectangleWithOverriddenCustomJson',
            CircleWithOverriddenCustomJson() =>
              r'CircleWithOverriddenCustomJson',
          },
        },
        deserialize: ($serialized) {
          return ShapeWithOverriddenCustomJson.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance
          .put(const SwappedResult_T_Shape_E_ShapeExceptionSerializer());
      _$celest.Serializers.instance.put(
          const SwappedResult_T_Shape_E_ShapeExceptionSerializer<Shape,
              ShapeException>());
      _$celest.Serializers.instance.put(
          const SwappedResult_T_Shape_E_ShapeExceptionSerializer<Shape,
              BadShapeException>());
      _$celest.Serializers.instance.put(
          const SwappedResult_T_Shape_E_ShapeExceptionSerializer<Circle,
              ShapeException>());
      _$celest.Serializers.instance.put(
          const SwappedResult_T_Shape_E_ShapeExceptionSerializer<Circle,
              BadShapeException>());
      _$celest.Serializers.instance.put(
          const SwappedResult_T_Shape_E_ShapeExceptionSerializer<Rectangle,
              ShapeException>());
      _$celest.Serializers.instance.put(
          const SwappedResult_T_Shape_E_ShapeExceptionSerializer<Rectangle,
              BadShapeException>());
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          SwappedResult<String, Shape>, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'result': _$celest.Serializers.instance
              .serialize<Result<String, Shape>>($value.result)
        },
        deserialize: ($serialized) {
          return SwappedResult<String, Shape>(_$celest.Serializers.instance
              .deserialize<Result<String, Shape>>($serialized[r'result']));
        },
      ));
      _$celest.Serializers.instance
          .put(const SwappedResult_E_ShapeException_T_ShapeSerializer());
      _$celest.Serializers.instance.put(
          const SwappedResult_E_ShapeException_T_ShapeSerializer<ShapeException,
              Shape>());
      _$celest.Serializers.instance.put(
          const SwappedResult_E_ShapeException_T_ShapeSerializer<ShapeException,
              Circle>());
      _$celest.Serializers.instance.put(
          const SwappedResult_E_ShapeException_T_ShapeSerializer<ShapeException,
              Rectangle>());
      _$celest.Serializers.instance.put(
          const SwappedResult_E_ShapeException_T_ShapeSerializer<
              BadShapeException, Shape>());
      _$celest.Serializers.instance.put(
          const SwappedResult_E_ShapeException_T_ShapeSerializer<
              BadShapeException, Circle>());
      _$celest.Serializers.instance.put(
          const SwappedResult_E_ShapeException_T_ShapeSerializer<
              BadShapeException, Rectangle>());
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          SwappedResult<Shape, String>, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'result': _$celest.Serializers.instance
              .serialize<Result<Shape, String>>($value.result)
        },
        deserialize: ($serialized) {
          return SwappedResult<Shape, String>(_$celest.Serializers.instance
              .deserialize<Result<Shape, String>>($serialized[r'result']));
        },
      ));
      _$celest.Serializers.instance
          .put(_$celest.Serializer.define<Portfolio, Map<String, dynamic>>(
        serialize: ($value) => $value.toJson(),
        deserialize: ($serialized) {
          return Portfolio.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.AbortedException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.AbortedException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.AlreadyExistsException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.AlreadyExistsException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.BadRequestException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.BadRequestException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.CancelledException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.CancelledException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.CloudException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.CloudException.fromJson($serialized);
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.DataLossError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.DataLossError(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.DeadlineExceededError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.DeadlineExceededError(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.FailedPreconditionException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.FailedPreconditionException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.InternalServerError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.InternalServerError(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.NotFoundException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.NotFoundException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.OutOfRangeException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.OutOfRangeException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.PermissionDeniedException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.PermissionDeniedException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.ResourceExhaustedException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.ResourceExhaustedException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnauthorizedException, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnauthorizedException(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnavailableError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnavailableError(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnimplementedError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnimplementedError(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.UnknownError, Map<String, Object?>?>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.UnknownError(
            ($serialized?[r'message'] as String?),
            _$celest.Serializers.instance.deserialize<_$celest.JsonValue?>(
              $serialized?[r'details'],
              const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
            ),
            ($serialized?[r'code'] as num?)?.toInt(),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$celest.SerializationException, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{
          r'code': $value.code,
          r'message': $value.message,
          if (_$celest.Serializers.instance.serialize<_$celest.JsonValue?>(
            $value.details,
            const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
          )
              case final details?)
            r'details': details,
        },
        deserialize: ($serialized) {
          return _$celest.SerializationException(
              ($serialized[r'message'] as String?));
        },
      ));
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonBool, bool>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return _$celest.JsonBool(($serialized as bool));
          },
        ),
        const _$celest.TypeToken<_$celest.JsonBool>('JsonBool'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonDouble, double>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return _$celest.JsonDouble(($serialized as num).toDouble());
          },
        ),
        const _$celest.TypeToken<_$celest.JsonDouble>('JsonDouble'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonInt, int>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return _$celest.JsonInt(($serialized as num).toInt());
          },
        ),
        const _$celest.TypeToken<_$celest.JsonInt>('JsonInt'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonList, List<Object?>>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return _$celest.JsonList(
                ($serialized as Iterable<Object?>).toList());
          },
        ),
        const _$celest.TypeToken<_$celest.JsonList>('JsonList'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonMap, Map<String, Object?>>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return _$celest.JsonMap(($serialized as Map<String, Object?>));
          },
        ),
        const _$celest.TypeToken<_$celest.JsonMap>('JsonMap'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonNum, num>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return _$celest.JsonNum(($serialized as num));
          },
        ),
        const _$celest.TypeToken<_$celest.JsonNum>('JsonNum'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonString, String>(
          serialize: ($value) => $value,
          deserialize: ($serialized) {
            return _$celest.JsonString(($serialized as String));
          },
        ),
        const _$celest.TypeToken<_$celest.JsonString>('JsonString'),
      );
      _$celest.Serializers.instance.put(
        _$celest.Serializer.define<_$celest.JsonValue, Object>(
          serialize: ($value) => $value.value,
          deserialize: ($serialized) {
            return _$celest.JsonValue($serialized);
          },
        ),
        const _$celest.TypeToken<_$celest.JsonValue?>('JsonValue'),
      );
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_ilist.IList<String>, dynamic>(
        serialize: ($value) => $value.toJson((value) => value),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_ilist.IList<String>.fromJson(
            $serialized,
            (value) => (value as String),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_ilist.IList<Uri>, dynamic>(
        serialize: ($value) => $value.toJson(
            (value) => _$celest.Serializers.instance.serialize<Uri>(value)),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_ilist.IList<Uri>.fromJson(
            $serialized,
            (value) => _$celest.Serializers.instance.deserialize<Uri>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_ilist
          .IList<_$fast_immutable_collections_ilist.IList<SimpleClass>>,
          dynamic>(
        serialize: ($value) => $value.toJson((value) => _$celest
            .Serializers.instance
            .serialize<_$fast_immutable_collections_ilist.IList<SimpleClass>>(
                value)),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_ilist.IList<
              _$fast_immutable_collections_ilist.IList<SimpleClass>>.fromJson(
            $serialized,
            (value) => _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_ilist.IList<SimpleClass>>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_ilist
          .IList<_$fast_immutable_collections_ilist.IList<Uri>>,
          dynamic>(
        serialize: ($value) => $value.toJson((value) => _$celest
            .Serializers.instance
            .serialize<_$fast_immutable_collections_ilist.IList<Uri>>(value)),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_ilist
              .IList<_$fast_immutable_collections_ilist.IList<Uri>>.fromJson(
            $serialized,
            (value) => _$celest.Serializers.instance
                .deserialize<_$fast_immutable_collections_ilist.IList<Uri>>(
                    value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_ilist
          .IList<_$fast_immutable_collections_ilist.IList<String>>,
          dynamic>(
        serialize: ($value) => $value.toJson((value) => _$celest
            .Serializers.instance
            .serialize<_$fast_immutable_collections_ilist.IList<String>>(
                value)),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_ilist
              .IList<_$fast_immutable_collections_ilist.IList<String>>.fromJson(
            $serialized,
            (value) => _$celest.Serializers.instance
                .deserialize<_$fast_immutable_collections_ilist.IList<String>>(
                    value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_ilist.IList<SimpleClass>, dynamic>(
        serialize: ($value) => $value.toJson((value) =>
            _$celest.Serializers.instance.serialize<SimpleClass>(value)),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_ilist.IList<SimpleClass>.fromJson(
            $serialized,
            (value) =>
                _$celest.Serializers.instance.deserialize<SimpleClass>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap.IMap<String, String>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => value,
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap
              .IMap<String, String>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => (value as String),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap.IMap<String,
              _$fast_immutable_collections_imap.IMap<String, SimpleClass>>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap
              .IMap<String, SimpleClass>>(value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap.IMap<
              String,
              _$fast_immutable_collections_imap
              .IMap<String, SimpleClass>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap
                .IMap<String, SimpleClass>>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap
          .IMap<String, _$fast_immutable_collections_imap.IMap<String, Uri>>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_imap.IMap<String, Uri>>(
                  value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap.IMap<String,
              _$fast_immutable_collections_imap.IMap<String, Uri>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap.IMap<String, Uri>>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap
          .IMap<String, _$fast_immutable_collections_imap.IMap<String, String>>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => _$celest.Serializers.instance.serialize<
              _$fast_immutable_collections_imap.IMap<String, String>>(value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap.IMap<String,
              _$fast_immutable_collections_imap.IMap<String, String>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_imap.IMap<String, String>>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap
          .IMap<String, _$fast_immutable_collections_ilist.IList<SimpleClass>>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_ilist.IList<SimpleClass>>(
                  value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap.IMap<String,
              _$fast_immutable_collections_ilist.IList<SimpleClass>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _$celest.Serializers.instance.deserialize<
                _$fast_immutable_collections_ilist.IList<SimpleClass>>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap
          .IMap<String, _$fast_immutable_collections_ilist.IList<Uri>>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_ilist.IList<Uri>>(value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap.IMap<String,
              _$fast_immutable_collections_ilist.IList<Uri>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _$celest.Serializers.instance
                .deserialize<_$fast_immutable_collections_ilist.IList<Uri>>(
                    value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap
          .IMap<String, _$fast_immutable_collections_ilist.IList<String>>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => _$celest.Serializers.instance
              .serialize<_$fast_immutable_collections_ilist.IList<String>>(
                  value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap.IMap<String,
              _$fast_immutable_collections_ilist.IList<String>>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _$celest.Serializers.instance
                .deserialize<_$fast_immutable_collections_ilist.IList<String>>(
                    value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap.IMap<String, SimpleClass>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) =>
              _$celest.Serializers.instance.serialize<SimpleClass>(value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap
              .IMap<String, SimpleClass>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) =>
                _$celest.Serializers.instance.deserialize<SimpleClass>(value),
          );
        },
      ));
      _$celest.Serializers.instance.put(_$celest.Serializer.define<
          _$fast_immutable_collections_imap.IMap<String, Uri>,
          Map<String, Object?>>(
        serialize: ($value) => $value.toJson(
          (value) => value,
          (value) => _$celest.Serializers.instance.serialize<Uri>(value),
        ),
        deserialize: ($serialized) {
          return _$fast_immutable_collections_imap.IMap<String, Uri>.fromJson(
            $serialized,
            (value) => (value as String),
            (value) => _$celest.Serializers.instance.deserialize<Uri>(value),
          );
        },
      ));
    },
    zoneValues: {_$celest.Serializers: serializers},
  );
}

typedef Record$k2phuz = ({
  NamedFieldsRecord aliased,
  ({String anotherField, String field}) nonAliased
});
typedef Record$k7x4l9 = ({String a, String b, String c});
typedef Record$rmm4wt = ({String anotherField, String field});

final class ColorXFromJsonImplSerializer
    extends _$celest.Serializer<ColorXFromJsonImpl> {
  ColorXFromJsonImplSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorXFromJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorXFromJsonImpl.fromJson($serialized);
  }

  @override
  Object? serialize(ColorXFromJsonImpl $value) => $value.toJson();
}

final class ColorXFromJsonSerializer
    extends _$celest.Serializer<ColorXFromJson> {
  ColorXFromJsonSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorXFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorXFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(ColorXFromJson $value) =>
      $serializers.serialize<Color>($value.c);
}

final class ColorXFromJsonStaticSerializer
    extends _$celest.Serializer<ColorXFromJsonStatic> {
  ColorXFromJsonStaticSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorXFromJsonStatic deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorXFromJsonStatic.fromJson($serialized);
  }

  @override
  Object? serialize(ColorXFromJsonStatic $value) =>
      $serializers.serialize<Color>($value.c);
}

final class ColorXImplSerializer extends _$celest.Serializer<ColorXImpl> {
  ColorXImplSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorXImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorXImpl($serializers.deserialize<Color>($serialized));
  }

  @override
  Object? serialize(ColorXImpl $value) => $serializers.serialize<Color>($value);
}

final class ColorXSerializer extends _$celest.Serializer<ColorX> {
  ColorXSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorX deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorX($serializers.deserialize<Color>($serialized));
  }

  @override
  Object? serialize(ColorX $value) => $serializers.serialize<Color>($value.c);
}

final class ColorXToFromJsonSerializer
    extends _$celest.Serializer<ColorXToFromJson> {
  ColorXToFromJsonSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorXToFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorXToFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(ColorXToFromJson $value) => $value.toJson();
}

final class ColorXToJsonImplSerializer
    extends _$celest.Serializer<ColorXToJsonImpl> {
  ColorXToJsonImplSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorXToJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorXToJsonImpl($serializers.deserialize<Color>($serialized));
  }

  @override
  Object? serialize(ColorXToJsonImpl $value) => $value.toJson();
}

final class ColorXToJsonSerializer extends _$celest.Serializer<ColorXToJson> {
  ColorXToJsonSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Color, String>(
        serialize: ($value) => $value.name,
        deserialize: ($serialized) {
          return Color.values.byName($serialized);
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ColorXToJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ColorXToJson($serializers.deserialize<Color>($serialized));
  }

  @override
  Object? serialize(ColorXToJson $value) => $value.toJson();
}

final class ErrResult_E_ShapeExceptionSerializer<E extends ShapeException>
    extends _$celest.Serializer<ErrResult<E>> {
  const ErrResult_E_ShapeExceptionSerializer();

  @override
  ErrResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return ErrResult<E>(
        _$celest.Serializers.instance.deserialize<E>($serialized[r'error']));
  }

  @override
  Object? serialize(ErrResult<E> $value) => <String, Object?>{
        r'error': _$celest.Serializers.instance.serialize<E>($value.error)
      };
}

final class ErrResult_T_ShapeSerializer<T extends Shape>
    extends _$celest.Serializer<ErrResult<T>> {
  const ErrResult_T_ShapeSerializer();

  @override
  ErrResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return ErrResult<T>(
        _$celest.Serializers.instance.deserialize<T>($serialized[r'error']));
  }

  @override
  Object? serialize(ErrResult<T> $value) => <String, Object?>{
        r'error': _$celest.Serializers.instance.serialize<T>($value.error)
      };
}

final class OkResult_E_ShapeExceptionSerializer<E extends ShapeException>
    extends _$celest.Serializer<OkResult<E>> {
  const OkResult_E_ShapeExceptionSerializer();

  @override
  OkResult<E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return OkResult<E>(
        _$celest.Serializers.instance.deserialize<E>($serialized[r'data']));
  }

  @override
  Object? serialize(OkResult<E> $value) => <String, Object?>{
        r'data': _$celest.Serializers.instance.serialize<E>($value.data)
      };
}

final class OkResult_T_ShapeSerializer<T extends Shape>
    extends _$celest.Serializer<OkResult<T>> {
  const OkResult_T_ShapeSerializer();

  @override
  OkResult<T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return OkResult<T>(
        _$celest.Serializers.instance.deserialize<T>($serialized[r'data']));
  }

  @override
  Object? serialize(OkResult<T> $value) => <String, Object?>{
        r'data': _$celest.Serializers.instance.serialize<T>($value.data)
      };
}

final class Result_E_ShapeException_T_ShapeSerializer<E extends ShapeException,
    T extends Shape> extends _$celest.Serializer<Result<E, T>> {
  const Result_E_ShapeException_T_ShapeSerializer();

  @override
  Result<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'OkResult') {
      return _$celest.Serializers.instance
          .deserialize<OkResult<E>>($serialized);
    }
    if ($serialized[r'$type'] == r'SwappedResult') {
      return _$celest.Serializers.instance
          .deserialize<SwappedResult<T, E>>($serialized);
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return _$celest.Serializers.instance
          .deserialize<ErrResult<T>>($serialized);
    }
    throw _$celest.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(Result<E, T> $value) {
    if ($value is OkResult<E>) {
      return {
        ...(_$celest.Serializers.instance.serialize<OkResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is SwappedResult<T, E>) {
      return {
        ...(_$celest.Serializers.instance.serialize<SwappedResult<T, E>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is ErrResult<T>) {
      return {
        ...(_$celest.Serializers.instance.serialize<ErrResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw _$celest.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($value.runtimeType))
        .toString());
  }
}

final class Result_T_Shape_E_ShapeExceptionSerializer<T extends Shape,
    E extends ShapeException> extends _$celest.Serializer<Result<T, E>> {
  const Result_T_Shape_E_ShapeExceptionSerializer();

  @override
  Result<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    if ($serialized[r'$type'] == r'OkResult') {
      return _$celest.Serializers.instance
          .deserialize<OkResult<T>>($serialized);
    }
    if ($serialized[r'$type'] == r'SwappedResult') {
      return _$celest.Serializers.instance
          .deserialize<SwappedResult<E, T>>($serialized);
    }
    if ($serialized[r'$type'] == r'ErrResult') {
      return _$celest.Serializers.instance
          .deserialize<ErrResult<E>>($serialized);
    }
    throw _$celest.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($serialized[r'$type']))
        .toString());
  }

  @override
  Object? serialize(Result<T, E> $value) {
    if ($value is OkResult<T>) {
      return {
        ...(_$celest.Serializers.instance.serialize<OkResult<T>>($value)
            as Map<String, Object?>),
        r'$type': r'OkResult',
      };
    }
    if ($value is SwappedResult<E, T>) {
      return {
        ...(_$celest.Serializers.instance.serialize<SwappedResult<E, T>>($value)
            as Map<String, Object?>),
        r'$type': r'SwappedResult',
      };
    }
    if ($value is ErrResult<E>) {
      return {
        ...(_$celest.Serializers.instance.serialize<ErrResult<E>>($value)
            as Map<String, Object?>),
        r'$type': r'ErrResult',
      };
    }
    throw _$celest.SerializationException((StringBuffer('Unknown subtype of ')
          ..write(r'Result')
          ..write(': ')
          ..write($value.runtimeType))
        .toString());
  }
}

final class SwappedResult_E_ShapeException_T_ShapeSerializer<
    E extends ShapeException,
    T extends Shape> extends _$celest.Serializer<SwappedResult<E, T>> {
  const SwappedResult_E_ShapeException_T_ShapeSerializer();

  @override
  SwappedResult<E, T> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return SwappedResult<E, T>(_$celest.Serializers.instance
        .deserialize<Result<E, T>>($serialized[r'result']));
  }

  @override
  Object? serialize(SwappedResult<E, T> $value) => <String, Object?>{
        r'result':
            _$celest.Serializers.instance.serialize<Result<E, T>>($value.result)
      };
}

final class SwappedResult_T_Shape_E_ShapeExceptionSerializer<T extends Shape,
    E extends ShapeException> extends _$celest.Serializer<SwappedResult<T, E>> {
  const SwappedResult_T_Shape_E_ShapeExceptionSerializer();

  @override
  SwappedResult<T, E> deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return SwappedResult<T, E>(_$celest.Serializers.instance
        .deserialize<Result<T, E>>($serialized[r'result']));
  }

  @override
  Object? serialize(SwappedResult<T, E> $value) => <String, Object?>{
        r'result':
            _$celest.Serializers.instance.serialize<Result<T, E>>($value.result)
      };
}

final class ValueXFromJsonImplSerializer
    extends _$celest.Serializer<ValueXFromJsonImpl> {
  ValueXFromJsonImplSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, String>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueXFromJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ValueXFromJsonImpl.fromJson($serialized);
  }

  @override
  Object? serialize(ValueXFromJsonImpl $value) => $value.toJson();
}

final class ValueXFromJsonSerializer
    extends _$celest.Serializer<ValueXFromJson> {
  ValueXFromJsonSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized[r'value'] as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueXFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return ValueXFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(ValueXFromJson $value) =>
      $serializers.serialize<Value>($value.v);
}

final class ValueXFromJsonStaticSerializer
    extends _$celest.Serializer<ValueXFromJsonStatic> {
  ValueXFromJsonStaticSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized[r'value'] as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueXFromJsonStatic deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return ValueXFromJsonStatic.fromJson($serialized);
  }

  @override
  Object? serialize(ValueXFromJsonStatic $value) =>
      $serializers.serialize<Value>($value.v);
}

final class ValueXImplSerializer extends _$celest.Serializer<ValueXImpl> {
  ValueXImplSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized[r'value'] as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueXImpl deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return ValueXImpl($serializers.deserialize<Value>($serialized));
  }

  @override
  Object? serialize(ValueXImpl $value) => $serializers.serialize<Value>($value);
}

final class ValueXSerializer extends _$celest.Serializer<ValueX> {
  ValueXSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized[r'value'] as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueX deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return ValueX($serializers.deserialize<Value>($serialized));
  }

  @override
  Object? serialize(ValueX $value) => $serializers.serialize<Value>($value.v);
}

final class ValueXToFromJsonSerializer
    extends _$celest.Serializer<ValueXToFromJson> {
  ValueXToFromJsonSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, String>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueXToFromJson deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ValueXToFromJson.fromJson($serialized);
  }

  @override
  Object? serialize(ValueXToFromJson $value) => $value.toJson();
}

final class ValueXToJsonImplSerializer
    extends _$celest.Serializer<ValueXToJsonImpl> {
  ValueXToJsonImplSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, String>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueXToJsonImpl deserialize(Object? $value) {
    final $serialized = assertWireType<String>($value);
    return ValueXToJsonImpl($serializers.deserialize<Value>($serialized));
  }

  @override
  Object? serialize(ValueXToJsonImpl $value) => $value.toJson();
}

final class ValueXToJsonSerializer extends _$celest.Serializer<ValueXToJson> {
  ValueXToJsonSerializer() {
    $serializers
      ..put(_$celest.Serializer.define<Value, Map<String, Object?>>(
        serialize: ($value) => <String, Object?>{r'value': $value.value},
        deserialize: ($serialized) {
          return Value(($serialized[r'value'] as String));
        },
      ));
  }

  final _$celest.Serializers $serializers = _$celest.Serializers();

  @override
  ValueXToJson deserialize(Object? $value) {
    final $serialized = assertWireType<Map<String, Object?>>($value);
    return ValueXToJson($serializers.deserialize<Value>($serialized));
  }

  @override
  Object? serialize(ValueXToJson $value) => $value.toJson();
}

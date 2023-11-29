import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:code_builder/code_builder.dart'
    show Reference, TypeReference, TypeReferenceBuilder;

part 'serializers.g.dart';

@SerializersFor([
  Project,
  ProjectClass,
  Api,
  ApiMetadataAuthenticated,
  ApiMetadataMiddleware,
  CloudFunction,
  Parameter,
  SourceLocation,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(const ReferenceSerializer())
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Reference)]),
        BuiltList<Reference>.new,
      ))
    .build();

final class ReferenceSerializer implements StructuredSerializer<Reference> {
  const ReferenceSerializer();

  @override
  TypeReference deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = TypeReferenceBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final name = iterator.current as String;
      final value = iterator.moveNext() ? iterator.current : null;
      switch (name) {
        case 'symbol':
          builder.symbol = value as String;
        case 'url':
          builder.url = value as String?;
        case 'bound':
          if (value != null) {
            builder.bound = serializers.deserialize(
              value as Map<String, dynamic>,
              specifiedType: const FullType(Reference),
            ) as Reference;
          }
        case 'types':
          builder.types.replace(
            serializers.deserialize(
              value as Iterable<Object?>,
              specifiedType: const FullType(
                BuiltList,
                [FullType(Reference)],
              ),
            )! as BuiltList<Reference>,
          );
        case 'isNullable':
          builder.isNullable = value as bool?;
      }
    }
    return builder.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Reference object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'symbol',
      object.symbol,
    ];
    if (object.url case final url?) {
      result
        ..add('url')
        ..add(url);
    }
    if (object is TypeReference) {
      if (object.bound case final bound) {
        result
          ..add('bound')
          ..add(
            serializers.serialize(
              bound,
              specifiedType: const FullType(Reference),
            ),
          );
      }
      if (object.types.isNotEmpty) {
        result
          ..add('types')
          ..add(
            serializers.serialize(
              object.types,
              specifiedType: const FullType(
                BuiltList,
                [FullType(Reference)],
              ),
            ),
          );
      }
      if (object.isNullable case final isNullable) {
        result
          ..add('isNullable')
          ..add(isNullable);
      }
    }
    return result;
  }

  @override
  Iterable<Type> get types => [Reference, TypeReference];

  @override
  String get wireName => 'TypeReference';
}

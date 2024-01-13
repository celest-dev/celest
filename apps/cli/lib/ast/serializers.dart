import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/codegen/code_generator.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_span/source_span.dart';

part 'serializers.g.dart';

@SerializersFor([
  Project,
  Api,
  ApiAuthenticated,
  ApiPublic,
  ApiMiddleware,
  CloudFunction,
  CloudFunctionParameter,
  EnvironmentVariable,
  NodeReference,
  NodeType,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(_CustomJsonPlugin())
      ..add(const ReferenceSerializer())
      ..add(const TypeReferenceSerializer())
      ..add(const RecordTypeSerializer())
      ..add(const SourceLocationSerializer())
      ..add(const SourceSpanSerializer())
      ..add(const FileSpanSerializer())
      ..add(const ExpressionSerializer())
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Reference)]),
        BuiltList<Reference>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
        BuiltMap<String, Reference>.new,
      ))
    .build();

final class ReferenceSerializer implements StructuredSerializer<Reference> {
  const ReferenceSerializer();

  static final _serializationCache = <Reference, Iterable<Object?>>{};

  @override
  Reference deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final serializedList = serialized.toList();
    assert(
      serializedList.length.isOdd && serializedList.first is String,
      'Serialized references should include their runtime time as '
      'the first element.',
    );
    final wireName = serializedList.first as String;
    switch (wireName) {
      case 'Reference':
        switch (serializedList) {
          case [_, 'symbol', final String symbol, 'url', final String? url]:
            return Reference(symbol, url);
          default:
            throw ArgumentError.value(
              serializedList,
              'serialized',
              'Invalid serialized Reference type',
            );
        }
      default:
        final serializer = serializers.serializerForWireName(wireName);
        if (serializer == null) {
          throw ArgumentError.value(
            wireName,
            'wireName',
            'No serializer found for type',
          );
        }
        return serializers.deserializeWith(serializer, serialized) as Reference;
    }
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Reference object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    if (_serializationCache[object] case final cached?) {
      return cached;
    }
    final wireName = switch (object) {
      TypeReference() => 'TypeReference',
      RecordType() => 'RecordType',
      _ => 'Reference',
    };
    final result = <Object?>[
      wireName,
    ];
    switch (wireName) {
      case 'Reference':
        result
          ..add('symbol')
          ..add(object.symbol);
        if (object.url case final url?) {
          result
            ..add('url')
            ..add(url);
        }
      default:
        final serializer = serializers.serializerForWireName(wireName);
        if (serializer == null) {
          throw ArgumentError.value(
            wireName,
            'wireName',
            'No serializer found for type',
          );
        }
        result.addAll(
          (serializer as StructuredSerializer).serialize(serializers, object),
        );
    }
    return _serializationCache[object] = result;
  }

  @override
  Iterable<Type> get types => [Reference];

  @override
  String get wireName => 'Reference';
}

final class TypeReferenceSerializer
    implements StructuredSerializer<TypeReference> {
  const TypeReferenceSerializer();

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
    TypeReference object, {
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
    if (object.bound case final bound?) {
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
    if (object.isNullable case final isNullable?) {
      result
        ..add('isNullable')
        ..add(isNullable);
    }
    return result;
  }

  @override
  Iterable<Type> get types => [TypeReference];

  @override
  String get wireName => 'TypeReference';
}

final class RecordTypeSerializer implements StructuredSerializer<RecordType> {
  const RecordTypeSerializer();

  @override
  RecordType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = RecordTypeBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final name = iterator.current as String;
      final value = iterator.moveNext() ? iterator.current : null;
      switch (name) {
        case 'symbol':
          builder.symbol = value as String?;
        case 'url':
          builder.url = value as String?;
        case 'positionalFieldTypes':
          builder.positionalFieldTypes.replace(
            serializers.deserialize(
              value as Iterable<Object?>,
              specifiedType: const FullType(
                BuiltList,
                [FullType(Reference)],
              ),
            )! as BuiltList<Reference>,
          );
        case 'namedFieldTypes':
          builder.namedFieldTypes.replace(
            serializers.deserialize(
              value as Iterable<Object?>,
              specifiedType: const FullType(
                BuiltMap,
                [
                  FullType(String),
                  FullType(Reference),
                ],
              ),
            )! as BuiltMap<String, Reference>,
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
    RecordType object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    if (object.symbol case final symbol?) {
      result
        ..add('symbol')
        ..add(symbol);
    }
    if (object.url case final url?) {
      result
        ..add('url')
        ..add(url);
    }
    if (object.positionalFieldTypes.isNotEmpty) {
      result
        ..add('positionalFieldTypes')
        ..add(
          serializers.serialize(
            object.positionalFieldTypes,
            specifiedType: const FullType(
              BuiltList,
              [FullType(Reference)],
            ),
          ),
        );
    }
    if (object.namedFieldTypes.isNotEmpty) {
      result
        ..add('namedFieldTypes')
        ..add(
          serializers.serialize(
            object.namedFieldTypes,
            specifiedType: const FullType(
              BuiltMap,
              [
                FullType(String),
                FullType(Reference),
              ],
            ),
          ),
        );
    }
    if (object.isNullable case final isNullable?) {
      result
        ..add('isNullable')
        ..add(isNullable);
    }
    return result;
  }

  @override
  Iterable<Type> get types => [RecordType];

  @override
  String get wireName => 'RecordType';
}

final class _CustomJsonPlugin extends StandardJsonPlugin {
  @override
  Object? afterSerialize(Object? object, FullType specifiedType) {
    // Treat Reference's as unspecified for the purpose of encoding to JSON
    // so that their wire name is encoded as the discriminator.
    if (specifiedType.root == Reference) {
      specifiedType = FullType.unspecified;
    }
    return super.afterSerialize(object, specifiedType);
  }

  @override
  Object? beforeDeserialize(Object? object, FullType specifiedType) {
    if (specifiedType.root == Reference) {
      specifiedType = FullType.unspecified;
    }
    return super.beforeDeserialize(object, specifiedType);
  }
}

final class SourceLocationSerializer
    implements StructuredSerializer<SourceLocation> {
  const SourceLocationSerializer();

  @override
  Iterable<Type> get types => const [
        SourceLocation,
        SourceLocationBase,
      ];

  @override
  String get wireName => 'SourceLocation';

  @override
  SourceLocation deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    late final int offset;
    Uri? sourceUrl;
    late final int line;
    late final int column;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final name = iterator.current as String;
      final value = iterator.moveNext() ? iterator.current : null;
      switch (name) {
        case 'offset':
          offset = value as int;
        case 'uri':
          sourceUrl = value == null ? null : Uri.parse(value as String);
        case 'line':
          line = value as int;
        case 'column':
          column = value as int;
      }
    }
    return SourceLocation(
      offset,
      sourceUrl: sourceUrl,
      line: line,
      column: column,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SourceLocation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return <Object?>[
      'offset',
      object.offset,
      if (object.sourceUrl case final sourceUrl?) ...[
        'uri',
        sourceUrl.toString(),
      ],
      'line',
      object.line,
      'column',
      object.column,
    ];
  }
}

final class SourceSpanSerializer implements StructuredSerializer<SourceSpan> {
  const SourceSpanSerializer();

  @override
  Iterable<Type> get types => const [
        SourceSpan,
        SourceSpanBase,
      ];

  @override
  String get wireName => 'SourceSpan';

  @override
  SourceSpan deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    late final SourceLocation start;
    late final SourceLocation end;
    late final String text;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final name = iterator.current as String;
      final value = iterator.moveNext() ? iterator.current : null;
      switch (name) {
        case 'start':
          start = serializers.deserialize(
            value as Map<String, dynamic>,
            specifiedType: const FullType(SourceLocation),
          ) as SourceLocation;
        case 'end':
          end = serializers.deserialize(
            value as Map<String, dynamic>,
            specifiedType: const FullType(SourceLocation),
          ) as SourceLocation;
        case 'text':
          text = value as String;
      }
    }
    return SourceSpanBase(start, end, text);
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SourceSpan object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return <Object?>[
      'start',
      serializers.serialize(
        object.start,
        specifiedType: const FullType(SourceLocation),
      ),
      'end',
      serializers.serialize(
        object.end,
        specifiedType: const FullType(SourceLocation),
      ),
      'text',
      object.text,
    ];
  }
}

final class FileSpanSerializer implements StructuredSerializer<FileSpan> {
  const FileSpanSerializer();

  @override
  Iterable<Type> get types => const [FileSpan];

  @override
  String get wireName => 'FileSpan';

  @override
  FileSpan deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    late final Uri uri;
    late final int start;
    late final int end;
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final name = iterator.current as String;
      final value = iterator.moveNext() ? iterator.current : null;
      switch (name) {
        case 'uri':
          uri = Uri.parse(value as String);
        case 'start':
          start = value as int;
        case 'end':
          end = value as int;
      }
    }
    final sourceFile = SourceFile.fromString(
      fileSystem.file(projectPaths.denormalizeUri(uri)).readAsStringSync(),
      url: uri,
    );
    return sourceFile.span(start, end);
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    FileSpan object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return <Object>[
      'uri',
      projectPaths.normalizeUri(object.file.url!).toString(),
      'start',
      object.start.offset,
      'end',
      object.end.offset,
    ];
  }
}

final class ExpressionSerializer implements PrimitiveSerializer<Expression> {
  const ExpressionSerializer();

  @override
  Iterable<Type> get types => const [Expression];

  @override
  String get wireName => 'Expression';

  @override
  Expression deserialize(
    Serializers serializers,
    Object? serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  Object serialize(
    Serializers serializers,
    Expression object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return CodeGenerator.rawEmit(object, forFile: '');
  }
}

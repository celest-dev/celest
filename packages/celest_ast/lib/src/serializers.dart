import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cedar/ast.dart';
import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_ast/src/proto/celest/ast/v1/resolved_ast.pb.dart' as pb;
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;
import 'package:protobuf/protobuf.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:source_span/source_span.dart';

part 'serializers.g.dart';

@SerializersFor([
  // AST
  Project,
  Api,
  ApiAuthenticated,
  ApiPublic,
  ApiMiddleware,
  CloudFunction,
  CloudFunctionParameter,
  StreamType,
  ApiHttpConfig,
  ApiHttpError,
  Variable,
  Secret,
  NodeReference,
  NodeType,

  // Auth
  Auth,
  AuthProviderType,
  EmailAuthProvider,
  SmsAuthProvider,
  GoogleAuthProvider,
  GitHubAuthProvider,
  AppleAuthProvider,
  FirebaseExternalAuthProvider,
  SupabaseExternalAuthProvider,

  // Resolved AST
  ResolvedProject,
  ResolvedApi,
  ResolvedCloudFunction,
  ResolvedHttpConfig,
  ResolvedHttpRoute,
  ResolvedVariable,
  ResolvedSecret,
  ResolvedAuth,
  ResolvedAuthProvider,
  ResolvedEmailAuthProvider,
  ResolvedSmsAuthProvider,
  ResolvedGoogleAuthProvider,
  ResolvedGitHubAuthProvider,
  ResolvedAppleAuthProvider,
  ResolvedFirebaseExternalAuthProvider,
  ResolvedSupabaseExternalAuthProvider,

  // Dart values
  DartString,
  DartInt,
  DartDouble,
  DartBool,
  DartList,
  DartMap,
  DartNull,
  DartRecord,
  DartEnum,
  DartInstance,
  DartTypeLiteral,
  DartSymbolLiteral,

  // Other
  SdkType,
  SdkConfiguration,
  Sdk,
  FeatureFlag,
])
final Serializers serializers = () {
  final builder = _$serializers.toBuilder()
    ..addPlugin(_CustomJsonPlugin())
    ..add(const ReferenceSerializer())
    ..add(const TypeReferenceSerializer())
    ..add(const RecordTypeSerializer())
    ..add(const SourceLocationSerializer())
    ..add(const SourceSpanSerializer())
    ..add(const VersionSerializer())
    ..add(const PolicySerializer())
    ..add(const TemplateLinkSerializer())
    ..add(const ProtoEnumSerializer<pb.ResolvedAuthProvider_Type>(
      pb.ResolvedAuthProvider_Type.values,
    ))
    ..add(const ProtoEnumSerializer<pb.ResolvedExternalAuthProvider_Type>(
      pb.ResolvedExternalAuthProvider_Type.values,
    ))
    ..addBuilderFactory(
      const FullType(BuiltList, [FullType(Reference)]),
      BuiltList<Reference>.new,
    )
    ..addBuilderFactory(
      const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
      BuiltMap<String, Reference>.new,
    )
    ..addAll(cedarSerializers.serializers);

  for (final MapEntry(key: type, value: factory)
      in cedarSerializers.builderFactories.entries) {
    builder.addBuilderFactory(type, factory);
  }
  return builder.build();
}();

final class ProtoSerializer<T extends GeneratedMessage>
    implements PrimitiveSerializer<T> {
  const ProtoSerializer(this.type);

  final T type;

  @override
  T deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return (type.createEmptyInstance() as T)
      ..mergeFromProto3Json(
        serialized as Map<String, Object?>,
      );
  }

  @override
  Object serialize(
    Serializers serializers,
    T object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return object.toProto3Json()!;
  }

  @override
  Iterable<Type> get types => [T];

  @override
  String get wireName => type.info_.messageName;
}

final class ProtoEnumSerializer<T extends ProtobufEnum>
    implements PrimitiveSerializer<T> {
  const ProtoEnumSerializer(this.values);

  final List<T> values;

  @override
  T deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return values.firstWhere((el) => el.name == serialized as String);
  }

  @override
  Object serialize(
    Serializers serializers,
    T object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return object.name;
  }

  @override
  Iterable<Type> get types => [T];

  @override
  String get wireName => '$T';
}

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
    throw UnimplementedError();
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
        switch (sourceUrl) {
          Uri(scheme: 'file' || '') => p.basename(sourceUrl.toFilePath()),
          _ => sourceUrl.toString(),
        },
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
        FileSpan,
      ];

  @override
  String get wireName => 'SourceSpan';

  @override
  SourceSpan deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
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

final class VersionSerializer implements PrimitiveSerializer<Version> {
  const VersionSerializer();

  @override
  Iterable<Type> get types => [Version];

  @override
  String get wireName => 'Version';

  @override
  Version deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return Version.parse(serialized as String);
  }

  @override
  Object serialize(
    Serializers serializers,
    Version object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return object.toString();
  }
}

final class PolicySerializer implements PrimitiveSerializer<Policy> {
  const PolicySerializer();

  @override
  Iterable<Type> get types => [Policy];

  @override
  String get wireName => 'Policy';

  @override
  Policy deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return Policy.fromJson(serialized as Map<String, Object?>);
  }

  @override
  Object serialize(
    Serializers serializers,
    Policy object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return object.toJson();
  }
}

final class TemplateLinkSerializer
    implements PrimitiveSerializer<TemplateLink> {
  const TemplateLinkSerializer();

  @override
  Iterable<Type> get types => [TemplateLink];

  @override
  String get wireName => 'TemplateLink';

  @override
  TemplateLink deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return TemplateLink.fromJson(serialized as Map<String, Object?>);
  }

  @override
  Object serialize(
    Serializers serializers,
    TemplateLink object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return object.toJson();
  }
}

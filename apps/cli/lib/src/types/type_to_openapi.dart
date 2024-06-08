import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:celest_cli/serialization/common.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart' show Reference;
import 'package:lib_openapi/lib_openapi.dart';

final class _DartTypeToOpenApi
    implements TypeVisitor<OpenApiComponentOrRef<OpenApiSchema>> {
  _DartTypeToOpenApi({
    required this.ref,
    required this.schemas,
  });

  final String ref;
  final Map<String, OpenApiSchema> schemas;

  // ignore: unused_field
  static final Map<Reference, OpenApiSchema> coreTypes = run(() {
    final coreTypes = <Reference, OpenApiSchema>{};
    coreTypes[DartTypes.core.bool] = OpenApiSchema(
      ref: '#/components/schemas/bool',
      type: const ItemValue(JsonType.boolean),
    );
    coreTypes[DartTypes.core.double] = OpenApiSchema(
      ref: '#/components/schemas/double',
      type: const ItemValue(JsonType.number),
      format: JsonTypeFormat.double,
    );
    coreTypes[DartTypes.core.int] = OpenApiSchema(
      ref: '#/components/schemas/int',
      type: const ItemValue(JsonType.integer),
      format: JsonTypeFormat.int64,
    );
    coreTypes[DartTypes.core.string] = OpenApiSchema(
      ref: '#/components/schemas/String',
      type: const ItemValue(JsonType.string),
    );
    coreTypes[DartTypes.core.null$] = OpenApiSchema(
      ref: '#/components/schemas/Null',
      type: const ItemValue(JsonType.null$),
      nullable: true,
    );
    coreTypes[DartTypes.core.void$] = OpenApiSchema(
      ref: '#/components/schemas/void',
      type: null,
      nullable: true,
    );
    coreTypes[DartTypes.core.dynamic] = OpenApiSchema(
      ref: '#/components/schemas/dynamic',
      type: null,
      nullable: true,
    );
    coreTypes[DartTypes.core.never] = OpenApiSchema(
      ref: '#/components/schemas/Never',
      type: null,
      nullable: true,
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    coreTypes[DartTypes.core.exception] = OpenApiSchema(
      ref: '#/components/schemas/Exception',
      type: const ItemValue(JsonType.object),
      properties: {
        'message': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Exception/message',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/String',
            name: 'String',
          ),
        ),
      },
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    coreTypes[DartTypes.core.error] = OpenApiSchema(
      ref: '#/components/schemas/Error',
      type: const ItemValue(JsonType.object),
      properties: {
        'stackTrace': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Error/stackTrace',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/String',
            name: 'String',
          ),
        ),
      },
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    coreTypes[DartTypes.core.bigInt] = OpenApiSchema(
      ref: '#/components/schemas/BigInt',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.int64,
    );
    coreTypes[DartTypes.core.dateTime] = OpenApiSchema(
      ref: '#/components/schemas/DateTime',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.dateTime,
    );
    coreTypes[DartTypes.core.duration] = OpenApiSchema(
      ref: '#/components/schemas/Duration',
      type: const ItemValue(JsonType.object),
      format: JsonTypeFormat.duration,
      properties: {
        'days': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Duration/days',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/int',
            name: 'int',
          ),
        ),
        'hours': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Duration/hours',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/int',
            name: 'int',
          ),
        ),
        'minutes': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Duration/minutes',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/int',
            name: 'int',
          ),
        ),
        'seconds': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Duration/seconds',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/int',
            name: 'int',
          ),
        ),
        'milliseconds': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Duration/milliseconds',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/int',
            name: 'int',
          ),
        ),
        'microseconds': OpenApiComponentOrRef.reference(
          ref: '#/components/schemas/Duration/microseconds',
          reference: OpenApiSchemaReference(
            ref: '#/components/schemas/int',
            name: 'int',
          ),
        ),
      },
      additionalProperties: OpenApiAdditionalProperties(allow: false),
    );
    coreTypes[DartTypes.core.regExp] = OpenApiSchema(
      ref: '#/components/schemas/RegExp',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.regex,
    );
    coreTypes[DartTypes.core.uri] = OpenApiSchema(
      ref: '#/components/schemas/Uri',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.uri,
    );
    coreTypes[DartTypes.core.uriData] = OpenApiSchema(
      ref: '#/components/schemas/UriData',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.uri,
    );
    coreTypes[DartTypes.typedData.uint8List] = OpenApiSchema(
      ref: '#/components/schemas/Uint8List',
      type: const ItemValue(JsonType.string),
      format: JsonTypeFormat.byte,
    );

    assert(() {
      for (final type in builtInTypes.keys) {
        if (!coreTypes.containsKey(typeHelper.toReference(type))) {
          throw StateError('Missing core type: $type');
        }
      }
      return true;
    }());

    return coreTypes;
  });

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitDynamicType(DynamicType type) {
    TODO();
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitFunctionType(FunctionType type) {
    throw UnimplementedError();
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitInterfaceType(InterfaceType type) {
    if (type.isDartCoreMap) {
      assert(type.typeArguments[0].isDartCoreString);
      final valueType = type.typeArguments[1].accept(this);
      return OpenApiComponentOrRef.component(
        ref: ref,
        component: OpenApiSchema(
          type: const ItemValue(JsonType.object),
          nullable: type.nullabilitySuffix == NullabilitySuffix.none,
          additionalProperties: OpenApiAdditionalProperties(
            schema: valueType,
          ),
        ),
      );
    }
    if (type.isDartCoreIterable || type.isDartCoreList || type.isDartCoreSet) {
      final uniqueItems = type.isDartCoreSet;
      final elementType = type.typeArguments[0].accept(this);
      return OpenApiComponentOrRef.component(
        ref: ref,
        component: OpenApiSchema(
          type: const ItemValue(JsonType.array),
          nullable: type.nullabilitySuffix == NullabilitySuffix.none,
          items: elementType,
          uniqueItems: uniqueItems,
        ),
      );
    }

    throw UnimplementedError();
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitInvalidType(InvalidType type) {
    throw UnimplementedError();
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitNeverType(NeverType type) {
    TODO();
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitRecordType(RecordType type) {
    TODO();
    // final properties = <String, OpenApiComponentOrRef<OpenApiSchema>>{};
    // for (final parameter in type.namedFields) {
    //   final component = parameter.type.accept(this);
    //   properties[parameter.name] = OpenApiComponentOrRef.component(
    //     ref: '$ref/${parameter.name}',
    //     component: component,
    //   );
    // }
    // return OpenApiSchema(
    //   name: type.alias?.element.displayName,
    //   type: const ItemValue(JsonType.object),
    //   nullable: switch (type.alias) {
    //     null => type.nullabilitySuffix == NullabilitySuffix.none,
    //     // `TODO`(dnys1): https://github.com/dart-lang/sdk/issues/54346
    //     // alias.element.nullabilitySuffix != NullabilitySuffix.none,
    //     _ => typeHelper.typeSystem.isNullable(type),
    //   },
    //   properties: properties,
    //   additionalProperties: OpenApiAdditionalProperties(allow: false),
    // );
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitTypeParameterType(
    TypeParameterType type,
  ) {
    throw UnimplementedError();
  }

  @override
  OpenApiComponentOrRef<OpenApiSchema> visitVoidType(VoidType type) {
    TODO();
  }
}

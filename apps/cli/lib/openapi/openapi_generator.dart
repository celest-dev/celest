import 'dart:collection';
import 'dart:convert';

import 'package:aws_common/aws_common.dart';
import 'package:built_collection/built_collection.dart';
import 'package:celest_cli/openapi/generator/openapi_array_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_client_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_encoder.dart';
import 'package:celest_cli/openapi/generator/openapi_enum_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_json_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_record_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_struct_generator.dart';
import 'package:celest_cli/openapi/generator/openapi_union_generator.dart';
import 'package:celest_cli/openapi/model/openapi_schema_linker.dart';
import 'package:celest_cli/openapi/model/openapi_schema_transformer.dart';
import 'package:celest_cli/openapi/model/openapi_service.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/stripe/stripe_generator_context.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema_resolver.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
import 'package:celest_cli/src/types/dart_types.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';
import 'package:lib_openapi/lib_openapi.dart';
import 'package:lib_openapi/openapi_v3.dart' as v3;
import 'package:logging/logging.dart';

final class OpenApiGenerator {
  OpenApiGenerator({
    required this.context,
  });

  factory OpenApiGenerator.fromJsonOrYaml(
    String jsonOrYaml, {
    String? apiName,
  }) {
    final document = generateOpenApiV3(jsonOrYaml);
    return OpenApiGenerator.fromProto(document, apiName: apiName);
  }

  factory OpenApiGenerator.fromProto(
    v3.Document document, {
    String? apiName,
  }) {
    final resolver = OpenApiSchemaTransformer(
      document: document,
      typeSystem: OpenApiTypeSystem(),
    );
    final resolved = resolver.resolve();
    final context = StripeOpenApiGeneratorContext(
      apiName: apiName,
      document: resolved,
    );
    return OpenApiGenerator(
      context: context,
    );
  }

  static final Logger logger = Logger('OpenApiGenerator');

  final OpenApiGeneratorContext context;

  Map<String, Library> generate() {
    final service = OpenApiSchemaLinker(
      context: context as StripeOpenApiGeneratorContext,
    ).link();
    context.finish();
    final clientGenerator = OpenApiClientGenerator(
      context: context,
      service: service,
    );
    return {
      ...clientGenerator.generate(),
      ...context._schemasByUrl.build().toMap().map((url, schemas) {
        return MapEntry(
          url,
          Library((b) {
            switch (url) {
              case 'models.dart':
                b.directives.add(Directive.part('events.dart'));
              case 'events.dart':
                b.directives.add(Directive.partOf('models.dart'));
            }
            b.body.addAll(
              schemas.map((schema) {
                return context._schemaSpecs[schema] ??
                    context.fail('Schema not found: $schema');
              }),
            );
          }),
        );
      }),
    };
  }
}

class OpenApiGeneratorContext {
  OpenApiGeneratorContext({
    String? apiName,
    required this.document,
  }) : _apiName = apiName;

  static final Logger logger = Logger('OpenApiGeneratorContext');

  final String? _apiName;
  final OpenApiDocument document;
  late final OpenApiService service;
  final OpenApiTypeSystem typeSystem = OpenApiTypeSystem();
  final OpenApiJsonGenerator jsonGenerator = OpenApiJsonGenerator();

  late final OpenApiTypeSchemaResolver typeResolver =
      OpenApiTypeSchemaResolver(context: this);

  late final String apiName = run(() {
    if (_apiName != null) {
      return _apiName;
    }
    if (document.info.title case final title?) {
      return title.pascalCase;
    }
    return '';
  });

  final dartNames = <String, String>{};
  final dartRefs = <String, Reference>{};
  final _schemaSpecs = <String, Spec>{};
  final _schemasByUrl = SetMultimapBuilder<String, String>();

  Iterable<TypeReference> structImplements(OpenApiStructTypeSchema schema) {
    return const [];
  }

  Spec generateSpec(
    String name,
    String? key,
    OpenApiType type, {
    required String url,
    String? mimeType,
    bool? structuralEnum,
  }) {
    return registerSpec(
      key ?? name,
      url,
      () {
        final schema = type.schema.withNullability(false);
        final className = reserveName(name, schema);
        return switch (type) {
          OpenApiPrimitiveType(:final typeReference) => ExtensionType(
              (t) => t
                // ..name = typeReference.symbol == name ? '$name\$' : name
                ..name = className
                ..constant = true
                ..constructors.addAll([
                  Constructor(
                    (c) => c
                      ..constant = true
                      ..name = 'fromJson'
                      ..requiredParameters.add(
                        Parameter(
                          (p) => p
                            ..type = DartTypes.core.object.nullable
                            ..name = 'json',
                        ),
                      )
                      ..initializers.add(
                        refer('_')
                            .assign(refer('json').asA(typeReference))
                            .code,
                      ),
                  ),
                ])
                ..representationDeclaration = RepresentationDeclaration(
                  (r) => r
                    ..name = '_'
                    ..declaredRepresentationType = typeReference,
                )
                ..implements.add(typeReference)
                ..fields.add(codableExtensionTypeField(name))
                ..methods.addAll([
                  Method(
                    (m) => m
                      ..name = 'toJson'
                      ..returns = typeReference
                      ..lambda = true
                      ..body = refer('_').code,
                  ),
                  Method((m) {
                    m
                      ..static = true
                      ..name = 'encode'
                      ..types.add(refer('V'))
                      ..returns = refer('V')
                      ..requiredParameters.addAll([
                        Parameter(
                          (p) => p
                            ..type = refer(name)
                            ..name = 'instance',
                        ),
                        Parameter(
                          (p) => p
                            ..type = DartTypes.codable.encoder(refer('V'))
                            ..name = 'encoder',
                        ),
                      ])
                      ..lambda = false
                      ..body = Block((b) {
                        b.addExpression(
                          declareFinal('container').assign(
                            refer('encoder')
                                .property('singleValueContainer')
                                .call([]),
                          ),
                        );
                        b.addExpression(
                          openApiEncoder.encode(
                            type: type,
                            ref: refer('instance'),
                            container: refer('container'),
                            key: null,
                          ),
                        );
                        b.addExpression(
                          refer('container').property('value').returned,
                        );
                      });
                  }),
                  encodeWithMethod,
                ]),
            ),
          OpenApiIterableInterface() => OpenApiArrayGenerator(
              name: className,
              type: type,
            ).generate(),
          OpenApiEnumType() => OpenApiEnumGenerator(
              name: className,
              structuralEnum: false, // structuralEnum!,
              type: type,
            ).generate(),
          OpenApiStructType() => OpenApiStructGenerator(
              name: className,
              type: type,
              mimeType: mimeType,
            ).generate(),
          OpenApiSealedType() => OpenApiUnionGenerator(
              name: className,
              context: this,
              type: type,
            ).generate(),
          OpenApiRecordType() => OpenApiRecordGenerator(
              name: className,
              type: type,
            ).generate(),
          _ => unreachable('$type'),
        } as Spec;
      },
    );
  }

  String? urlOf(String dartName) => null;

  Spec registerSpec(
    String name,
    String url,
    Spec Function() builder,
  ) {
    _schemasByUrl.add(url, name);
    return _schemaSpecs.update(
      name,
      (value) => value,
      ifAbsent: () => builder(),
    );
  }

  void finish() {
    _implements.build().forEachKey((name, toImplement) {
      final spec = _schemaSpecs[name];
      if (spec is! Class) {
        return;
      }
      _schemaSpecs[name] = spec.rebuild((class_) {
        // TODO: Better way to do this? Should work across libraries.
        final allImplements = HashSet<Reference>(
          equals: (a, b) => a.symbol == b.symbol,
          hashCode: (ref) => ref.symbol.hashCode,
        )
          ..addAll(toImplement)
          ..addAll(spec.implements);
        class_.implements
          ..clear()
          ..addAll(
            allImplements.toList()
              ..sort((a, b) => a.symbol!.compareTo(b.symbol!)),
          );
      });
    });
  }

  TypeReference _wrapper(String name, OpenApiType baseType) {
    registerSpec(name, 'models.dart', () {
      return Class((c) {
        c
          ..name = name
          ..modifier = ClassModifier.final$
          ..constructors.addAll([
            Constructor(
              (ctor) {
                ctor.constant = true;
                if (identical(baseType, OpenApiEmptyType.instance)) {
                  ctor.name = '_';
                }
                if (!identical(baseType, OpenApiEmptyType.instance)) {
                  ctor.requiredParameters.add(
                    Parameter(
                      (b) => b
                        ..name = 'value'
                        ..toThis = true,
                    ),
                  );
                }
              },
            ),
            if (!identical(baseType, OpenApiEmptyType.instance))
              Constructor(
                (ctor) => ctor
                  ..factory = true
                  ..name = 'fromJson'
                  ..requiredParameters.add(
                    Parameter(
                      (p) => p
                        ..name = 'json'
                        ..type = DartTypes.core.object.nullable,
                    ),
                  )
                  ..lambda = true
                  ..body = refer(name).newInstance([
                    OpenApiJsonGenerator()
                        .fromJson(baseType.primitiveType!, refer('json')),
                  ]).code,
              ),
          ])
          ..fields.addAll([
            if (!identical(baseType, OpenApiEmptyType.instance))
              Field(
                (f) => f
                  ..modifier = FieldModifier.final$
                  ..type = baseType.typeReference
                  ..name = 'value',
              ),
          ])
          ..methods.addAll([
            if (!identical(baseType, OpenApiEmptyType.instance)) ...[
              Method(
                (m) => m
                  ..name = 'toJson'
                  ..returns = baseType.primitiveType!.typeReference.nonNullable
                  ..lambda = true
                  ..body = OpenApiJsonGenerator()
                      .toJson(baseType.primitiveType!, refer('value'))
                      .code,
              ),
              Method(
                (m) => m
                  ..name = 'toString'
                  ..annotations.add(DartTypes.core.override)
                  ..returns = DartTypes.core.string
                  ..lambda = true
                  ..body = refer('value').property('toString').call([]).code,
              ),
            ],
          ]);
      });
    });
    return refer(name, 'models.dart').toTypeReference;
  }

  late final TypeReference emptyType = _wrapper(
    r'Empty$',
    OpenApiEmptyType.instance,
  );
  late final TypeReference stringType = _wrapper(
    r'String$',
    OpenApiStringType(
      schema: OpenApiStringTypeSchema(),
      typeReference: DartTypes.core.string.toTypeReference,
      isNullable: false,
    ),
  );
  late final TypeReference intType = _wrapper(
    r'Integer$',
    OpenApiIntegerType(
      schema: OpenApiIntegerTypeSchema(),
      typeReference: DartTypes.core.int.toTypeReference,
      isNullable: false,
    ),
  );
  late final TypeReference doubleType = _wrapper(
    r'Double$',
    OpenApiDoubleType(
      schema: OpenApiNumberTypeSchema(),
      typeReference: DartTypes.core.double.toTypeReference,
      isNullable: false,
    ),
  );
  // late final TypeReference _numType = _wrapper(
  //   r'Number$',
  //   OpenApiNumberType(
  //     schema: OpenApiNumberTypeSchema(),
  //     typeReference: DartTypes.core.num.toTypeReference,
  //     isNullable: false,
  //   ),
  // );
  late final TypeReference boolType = _wrapper(
    r'Boolean$',
    OpenApiBooleanType(
      schema: OpenApiBooleanTypeSchema(),
      typeReference: DartTypes.core.bool.toTypeReference,
      isNullable: false,
    ),
  );
  late final TypeReference anyType = _wrapper(
    r'Any$',
    OpenApiAnyType(
      schema: OpenApiAnyTypeSchema(),
      typeReference: DartTypes.core.object.toTypeReference,
      isNullable: false,
    ),
  );

  final _implements = SetMultimapBuilder<String, Reference>();

  void implement(String name, Reference type) {
    // if (!_schemaSpecs.containsKey(name)) {
    //   fail(
    //     'Definition not found: $name',
    //     additionalContext: {
    //       'available': _schemaSpecs.keys.join(', '),
    //     },
    //   );
    // }
    _implements.add(name, type);
  }

  final _reservedNames = <String, OpenApiTypeSchema?>{};
  String reserveName(String name, [OpenApiTypeSchema? reservedBy]) {
    if (_reservedNames.containsKey(name)) {
      final existing = _reservedNames[name];
      if (existing != reservedBy) {
        fail(
          'Could not reserve "$name". Name already reserved by another type.',
          additionalContext: {
            'existing': //
                // existing,
                LineSplitter.split(existing.toString()).take(10).join('\n'),
            'reservedBy': //
                // reservedBy,
                LineSplitter.split(reservedBy.toString()).take(10).join('\n'),
            'reservedNames': _reservedNames.keys.join(', '),
          },
        );
      }
    }
    _reservedNames[name] = reservedBy;
    return name;
  }

  Never fail(
    String message, {
    Object? additionalContext,
  }) {
    final sb = StringBuffer(message);
    if (additionalContext != null) {
      sb
        ..writeln()
        ..write('Additional context: $additionalContext');
    }
    throw StateError(sb.toString());
  }
}

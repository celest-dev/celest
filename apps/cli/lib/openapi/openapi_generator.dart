import 'package:aws_common/aws_common.dart';
import 'package:celest_cli/openapi/generator/openapi_client_generator.dart';
import 'package:celest_cli/openapi/model/openapi_schema_linker.dart';
import 'package:celest_cli/openapi/model/openapi_schema_transformer.dart';
import 'package:celest_cli/openapi/model/openapi_service.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
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
    final context = OpenApiGeneratorContext(
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
      context: context,
      registerSpec: context._registerSpec,
    ).link();
    for (final callback in context._callbacks) {
      callback();
    }
    final clientGenerator = OpenApiClientGenerator(
      context: context,
      service: service,
    );
    return {
      'client.dart': clientGenerator
          .generate()
          .rebuild((lib) => lib.body.addAll(context._schemaSpecs.values)),
    };
  }
}

final class OpenApiGeneratorContext {
  OpenApiGeneratorContext({
    String? apiName,
    required this.document,
  }) : _apiName = apiName;

  static final Logger logger = Logger('OpenApiGeneratorContext');

  final String? _apiName;
  final OpenApiDocument document;
  late final OpenApiService service;
  final OpenApiTypeSystem typeSystem = OpenApiTypeSystem();

  late final String apiName = run(() {
    if (_apiName != null) {
      return _apiName;
    }
    if (document.info.title case final title?) {
      return title.pascalCase;
    }
    return '';
  });

  final Map<OpenApiType, String> _dartNames = {};
  final Map<String, Spec> _schemaSpecs = {};

  Spec _registerSpec(String name, Spec Function() builder) {
    return _schemaSpecs.update(
      name,
      (value) => value,
      ifAbsent: () => builder(),
    );
  }

  final _callbacks = <void Function()>[];
  void after(void Function() callback) {
    _callbacks.add(callback);
  }

  Spec updateDefinition(
    String name, {
    void Function(ClassBuilder class_)? updateClass,
    void Function(ExtensionTypeBuilder class_)? updateExtensionType,
  }) {
    return _schemaSpecs.update(
      name,
      (value) {
        return switch (value) {
          Class() => value.rebuild(updateClass!),
          // ExtensionType() => value.rebuild(updateExtensionType!),
          _ => fail('Unsupported spec type: $value'),
        } as Spec;
      },
      ifAbsent: () => fail(
        'Definition not found: $name',
        additionalContext: {
          'available': _schemaSpecs.keys.join(', '),
        },
      ),
    );
  }

  String dartNameOf(OpenApiType type) {
    return _dartNames[type] ??
        fail(
          'Dart name not reserved for type',
          additionalContext: {
            'schema': type,
          },
        );
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

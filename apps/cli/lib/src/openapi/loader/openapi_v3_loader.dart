import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:celest_cli/src/openapi/ast/openapi_ast.dart';
import 'package:celest_cli/src/openapi/type/json_type.dart';
import 'package:celest_cli/src/openapi/type/json_type_format.spec.dart';
import 'package:collection/collection.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

final class OpenApiV3Loader {
  OpenApiV3Loader({
    required this.version,
    required this.rootNode,
  }) : _document = OpenApiDocumentBuilder()
          ..version = version; // TODO(dnys1): Source

  static final _extensionPattern = RegExp('^x-');
  static final _pathPattern = RegExp(r'^/');
  static final _statusCodePattern = RegExp(r'^[1-5][\dX]{2}$');
  static final _mediaTypePattern = RegExp(r'^[a-z]+/[a-z0-9\.\-\+]+$');

  final OpenApiDocumentBuilder _document;

  late final OpenApiComponentsBuilder _components = _document.components;
  late final OpenApiComponents components = _components.build();

  final Version version;
  final YamlMap rootNode;

  MapBuilder<String, JsonObject>? _loadExtensions(YamlMap node) {
    MapBuilder<String, JsonObject>? extensions;
    for (final entry in node.nodes.entries) {
      final key = switch (entry.key) {
        final String key => key,
        YamlScalar(value: final String key) => key,
        _ => null,
      };
      if (key == null) {
        continue;
      }
      if (_extensionPattern.hasMatch(key)) {
        extensions ??= MapBuilder<String, JsonObject>();
        extensions[key] = JsonObject(entry.value.value);
      }
    }
    return extensions;
  }

  OpenApiDocument load() {
    rootNode.checkRequiredFields(['openapi', 'info', 'paths']);
    rootNode.checkAllowedFields([
      'components',
      'externalDocs',
      'info',
      'openapi',
      'paths',
      'security',
      'servers',
      'tags',
      _extensionPattern,
    ]);

    _document
      ..ref = '#'
      ..node = rootNode
      ..extensions = _loadExtensions(rootNode);

    _loadInfo();
    _loadServers();
    _loadComponents();
    _loadPaths();
    _loadSecurityRequirements();
    _loadExternalDocs();
    _loadTags();

    return _document.build();
  }

  OpenApiReference<T>
      _ref<T extends OpenApiComponent<T>, R extends OpenApiReference<T>>(
    YamlMap refNode,
  ) {
    final map = Map.fromEntries(refNode.yamlNodes);
    final ref = map[r'$ref']?.getScalar<String>();
    if (ref == null) {
      throw Exception('OpenAPI component reference is missing "$refNode"');
    }
    final summary = map['summary']?.getScalar<String>();
    final description = map['description']?.getScalar<String>();
    switch (ref.split('/')) {
      case ['#', 'components', final type, final name]:
        return switch (type) {
          'schemas' => OpenApiSchemaReference(
              ref: ref,
              name: name,
              summary: summary,
              description: description,
              node: refNode,
            ),
          'responses' => OpenApiResponseReference(
              ref: ref,
              name: name,
              summary: summary,
              description: description,
              node: refNode,
            ),
          'parameters' => OpenApiParameterReference(
              ref: ref,
              name: name,
              summary: summary,
              description: description,
              node: refNode,
            ),
          'requestBodies' => OpenApiRequestBodyReference(
              ref: ref,
              name: name,
              summary: summary,
              description: description,
              node: refNode,
            ),
          'headers' => OpenApiHeaderReference(
              ref: ref,
              name: name,
              summary: summary,
              description: description,
              node: refNode,
            ),
          _ => throw Exception('Invalid component type: $type'),
        } as R;
      default:
        throw Exception('Invalid component reference: $refNode');
    }
  }

  void _loadInfo() {
    final infoNode = rootNode.nodes['info'].getAs<YamlMap>();
    if (infoNode == null) {
      throw Exception('OpenAPI document is missing required key "info"');
    }

    infoNode.checkRequiredFields(['title', 'version']);
    infoNode.checkAllowedFields([
      'contact',
      'description',
      'license',
      'summary',
      'termsOfService',
      'title',
      'version',
      _extensionPattern,
    ]);

    _document.info
      ..title = infoNode.nodes['title']?.value as String?
      ..description = infoNode.nodes['description']?.value as String?
      ..apiVersion = infoNode.nodes['version']?.value as String?
      ..ref = '#/info'
      ..node = infoNode
      ..extensions = _loadExtensions(infoNode);

    final contactNode = infoNode.nodes['contact']?.getAs<YamlMap>();
    if (contactNode != null) {
      _document.info.contact = _loadContact(contactNode);
    }

    final licenseNode = infoNode.nodes['license']?.getAs<YamlMap>();
    if (licenseNode != null) {
      _document.info.license = _loadLicense(licenseNode);
    }
  }

  OpenApiContactBuilder _loadContact(YamlMap contactNode) {
    return OpenApiContactBuilder()
      ..ref = '#/info/contact'
      ..node = contactNode
      ..extensions = _loadExtensions(contactNode)
      ..name = contactNode.nodes['name']?.value as String?
      ..url = contactNode.nodes['url']?.value as String?
      ..email = contactNode.nodes['email']?.value as String?;
  }

  OpenApiLicenseBuilder _loadLicense(YamlMap licenseNode) {
    return OpenApiLicenseBuilder()
      ..ref = '#/info/license'
      ..node = licenseNode
      ..extensions = _loadExtensions(licenseNode)
      ..name = licenseNode.nodes['name']?.value as String?
      ..url = licenseNode.nodes['url']?.value as String?
      ..identifier = licenseNode.nodes['identifier']?.value as String?;
  }

  void _loadServers() {
    final serversNode = rootNode.nodes['servers'].getAs<YamlList>();
    if (serversNode == null) {
      return;
    }

    for (final serverNode in serversNode.nodes) {
      if (serverNode is! YamlMap) {
        throw Exception('OpenAPI server is not a map');
      }

      final server = _loadServer(
        serverNode,
        ref: '#/servers/${_document.servers.length}',
      );
      _document.servers.add(server.build());
    }
  }

  void _loadPaths() {
    final pathsNode = rootNode.nodes['paths'].getAs<YamlMap>();
    if (pathsNode == null) {
      throw Exception('OpenAPI document is missing required key "paths"');
    }

    pathsNode.checkAllowedFields([
      _pathPattern,
      _extensionPattern,
    ]);

    for (final entry in pathsNode.yamlNodes) {
      final pathNode = entry.value.getAs<YamlMap>();
      if (pathNode == null) {
        throw Exception('OpenAPI path is not a map');
      }

      final path = _loadPathItemOrRef(pathNode, ref: '#/paths/${entry.key}');
      _document.paths[entry.key] = path;
    }
  }

  void _loadComponents() {
    // Only load schemas, responses, parameters, requestBodies, headers, and paths
    final componentsNode = rootNode.nodes['components'].getAs<YamlMap>();
    if (componentsNode == null) {
      return;
    }

    componentsNode.checkAllowedFields([
      'schemas',
      'responses',
      'parameters',
      'examples',
      'requestBodies',
      'headers',
      'securitySchemes',
      'links',
      'callbacks',
      'pathItems',
      _extensionPattern,
    ]);

    _components
      ..ref = '#/components'
      ..node = componentsNode
      ..extensions = _loadExtensions(componentsNode);

    final schemasNode = componentsNode.nodes['schemas']?.getAs<YamlMap>();
    if (schemasNode != null) {
      for (final entry in schemasNode.yamlNodes) {
        final schemaNode = entry.value.getAs<YamlMap>();
        if (schemaNode == null) {
          throw Exception('OpenAPI schema is not a map');
        }
        final schemaName = entry.key;
        final schema = _loadSchema(
          schemaNode,
          ref: '#/components/schemas/$schemaName',
        );
        _components.schemas[schemaName] = schema;
      }
    }

    final responsesNode = componentsNode.nodes['responses']?.getAs<YamlMap>();
    if (responsesNode != null) {
      for (final entry in responsesNode.yamlNodes) {
        final responseNode = entry.value.getAs<YamlMap>();
        if (responseNode == null) {
          throw Exception('OpenAPI response is not a map');
        }

        final responseName = entry.key;
        final response = _loadResponse(
          responseNode,
          ref: '#/components/responses/$responseName',
        );
        _components.responses[responseName] = response;
      }
    }

    final parametersNode = componentsNode.nodes['parameters']?.getAs<YamlMap>();
    if (parametersNode != null) {
      for (final entry in parametersNode.yamlNodes) {
        final parameterNode = entry.value.getAs<YamlMap>();
        if (parameterNode == null) {
          throw Exception('OpenAPI parameter is not a map');
        }

        final parameterName = entry.key;
        final parameter = _loadParameter(
          parameterNode,
          ref: '#/components/parameters/$parameterName',
        );
        _components.parameters[parameterName] = parameter;
      }
    }

    final requestBodiesNode =
        componentsNode.nodes['requestBodies']?.getAs<YamlMap>();
    if (requestBodiesNode != null) {
      for (final entry in requestBodiesNode.yamlNodes) {
        final requestBodyNode = entry.value.getAs<YamlMap>();
        if (requestBodyNode == null) {
          throw Exception('OpenAPI request body is not a map');
        }

        final requestBodyName = entry.key;
        final requestBody = _loadRequestBody(
          requestBodyNode,
          ref: '#/components/requestBodies/$requestBodyName',
        );
        _components.requestBodies[requestBodyName] = requestBody;
      }
    }

    final headersNode = componentsNode.nodes['headers']?.getAs<YamlMap>();
    if (headersNode != null) {
      for (final entry in headersNode.yamlNodes) {
        final headerNode = entry.value.getAs<YamlMap>();
        if (headerNode == null) {
          throw Exception('OpenAPI header is not a map');
        }

        final headerName = entry.key;
        final header = _loadHeader(
          headerNode,
          ref: '#/components/headers/$headerName',
        );
        _components.headers[headerName] = header;
      }
    }

    final pathsNode = componentsNode.nodes['paths']?.getAs<YamlMap>();
    if (pathsNode != null) {
      for (final entry in pathsNode.yamlNodes) {
        final pathNode = entry.value.getAs<YamlMap>();
        if (pathNode == null) {
          throw Exception('OpenAPI path is not a map');
        }

        final pathName = entry.key;
        final path = _loadPathItem(
          pathNode,
          ref: '#/components/paths/$pathName',
        );
        _components.paths[pathName] = path;
      }
    }

    final securitySchemesNode =
        componentsNode.nodes['securitySchemes']?.getAs<YamlMap>();
    if (securitySchemesNode != null) {
      for (final entry in securitySchemesNode.yamlNodes) {
        final securitySchemeNode = entry.value.getAs<YamlMap>();
        if (securitySchemeNode == null) {
          throw Exception('OpenAPI security scheme is not a map');
        }

        final securitySchemeName = entry.key;
        final securityScheme = _loadSecurityScheme(
          securitySchemeNode,
          ref: '#/components/securitySchemes/$securitySchemeName',
        );
        _components.securitySchemes[securitySchemeName] = securityScheme;
      }
    }
  }

  void _loadSecurityRequirements() {
    final securityRequirementsNode =
        rootNode.nodes['security'].getAs<YamlList>();
    if (securityRequirementsNode == null) {
      return;
    }

    for (final (index, entry) in securityRequirementsNode.nodes.indexed) {
      final requirementNode = entry.getAs<YamlMap>();
      if (requirementNode == null) {
        throw Exception('OpenAPI security requirement is not a map');
      }

      final requirement = OpenApiSecurityRequirementBuilder()
        ..ref = '#/security/$index'
        ..node = entry
        ..extensions = _loadExtensions(requirementNode);

      for (final entry in requirementNode.yamlNodes) {
        requirement.schemes[entry.key] = entry.value
            .getAs<YamlList>()!
            .nodes
            .map((node) => node.getScalar<String>())
            .toBuiltList();
      }

      _document.securityRequirements.add(requirement.build());
    }
  }

  void _loadExternalDocs() {
    final externalDocsNode = rootNode.nodes['externalDocs'].getAs<YamlMap>();
    if (externalDocsNode == null) {
      return;
    }

    externalDocsNode.checkAllowedFields([
      'description',
      'url',
      _extensionPattern,
    ]);

    _document.externalDocs = OpenApiExternalDocsBuilder()
      ..ref = '#/externalDocs'
      ..node = externalDocsNode
      ..extensions = _loadExtensions(externalDocsNode);

    _document.externalDocs.url =
        externalDocsNode.nodes['url']?.value as String?;
    _document.externalDocs.description =
        externalDocsNode.nodes['description']?.value as String?;
  }

  void _loadTags() {
    final tagsNode = rootNode.nodes['tags'].getAs<YamlList>();
    if (tagsNode == null) {
      return;
    }

    for (final (index, tagNode) in tagsNode.nodes.indexed) {
      if (tagNode is! YamlMap) {
        throw Exception('OpenAPI tag is not a map');
      }

      final tag = OpenApiTagBuilder()
        ..ref = '#/tags/$index'
        ..node = tagNode
        ..extensions = _loadExtensions(tagNode);

      tag.name = tagNode.nodes['name']?.value as String?;
      tag.description = tagNode.nodes['description']?.value as String?;

      final externalDocsNode = tagNode.nodes['externalDocs'].getAs<YamlMap>();
      if (externalDocsNode != null) {
        tag.externalDocs = OpenApiExternalDocsBuilder()
          ..ref = '#/tags/$index/externalDocs'
          ..node = externalDocsNode
          ..extensions = _loadExtensions(externalDocsNode);
        tag.externalDocs.url = externalDocsNode.nodes['url']?.value as String?;
        tag.externalDocs.description =
            externalDocsNode.nodes['description']?.value as String?;
      }

      _document.tags.add(tag.build());
    }
  }

  OpenApiServerBuilder _loadServer(
    YamlMap serverNode, {
    required String ref,
  }) {
    serverNode.checkRequiredFields(['url']);
    serverNode.checkAllowedFields([
      'description',
      'url',
      'variables',
      _extensionPattern,
    ]);

    final server = OpenApiServerBuilder()
      ..ref = ref
      ..node = serverNode
      ..extensions = _loadExtensions(serverNode);
    server.url = serverNode.nodes['url']?.value as String?;
    server.description = serverNode.nodes['description']?.value as String?;

    final variablesNode = serverNode.nodes['variables'];
    if (variablesNode != null && variablesNode is YamlMap) {
      for (final entry in variablesNode.yamlNodes) {
        final variableNode = entry.value;
        if (variableNode is! YamlMap) {
          throw Exception('OpenAPI server variable is not a map');
        }

        variableNode.checkRequiredFields(['default']);
        variableNode.checkAllowedFields([
          'default',
          'description',
          'enum',
          'x-example',
          _extensionPattern,
        ]);

        final variable = OpenApiServerVariableBuilder();
        variable
          ..defaultValue = variableNode.nodes['default']?.value as String?
          ..description = variableNode.nodes['description']?.value as String?
          ..extensions = _loadExtensions(variableNode);

        final enumNode = variableNode.nodes['enum'].getAs<YamlList>();
        if (enumNode != null) {
          // The array MUST NOT be empty.
          if (enumNode.isEmpty) {
            throw Exception('OpenAPI server variable enum is empty');
          }
          for (final enumValueNode in enumNode.nodes) {
            if (enumValueNode is! YamlScalar) {
              throw Exception(
                'OpenAPI server variable enum value is not a scalar',
              );
            }
            variable.enumValues.add(enumValueNode.value as String);
          }
        }

        server.variables[entry.key] = variable.build();
      }
    }

    return server;
  }

  OpenApiComponentOrRef<OpenApiPathItem> _loadPathItemOrRef(
    YamlMap pathItemNode, {
    required String ref,
  }) {
    if (pathItemNode.nodes.containsKey(r'$ref')) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        node: pathItemNode,
        reference:
            _ref<OpenApiPathItem, OpenApiPathItemReference>(pathItemNode),
      );
    }
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: _loadPathItem(
        pathItemNode,
        ref: ref,
      ),
    );
  }

  OpenApiPathItem _loadPathItem(
    YamlMap pathItemNode, {
    required String ref,
  }) {
    if (pathItemNode.nodes.containsKey(r'$ref')) {
      throw Exception('OpenAPI path reference is not allowed');
    }

    pathItemNode.checkAllowedFields([
      'delete',
      'get',
      'head',
      'options',
      'parameters',
      'patch',
      'post',
      'put',
      'summary',
      _extensionPattern,
    ]);

    final path = OpenApiPathItemBuilder();
    path
      ..ref = ref
      ..node = pathItemNode
      ..summary = pathItemNode.nodes['summary']?.value as String?
      ..extensions = _loadExtensions(pathItemNode);

    for (final method in OpenApiOperationType.values) {
      final operationNode = pathItemNode.nodes[method.name].getAs<YamlMap>();
      if (operationNode == null) {
        continue;
      }

      operationNode.checkAllowedFields([
        'callbacks',
        'deprecated',
        'description',
        'externalDocs',
        'operationId',
        'parameters',
        'requestBody',
        'responses',
        'security',
        'servers',
        'summary',
        'tags',
        _extensionPattern,
      ]);

      final operation = OpenApiOperationBuilder()
        ..type = method
        ..deprecated = operationNode.nodes['deprecated']?.value as bool?
        ..description = operationNode.nodes['description']?.value as String?
        ..operationId = operationNode.nodes['operationId']?.value as String?
        ..summary = operationNode.nodes['summary']?.value as String?
        ..extensions = _loadExtensions(operationNode);

      final tagsNode = operationNode.nodes['tags'].getAs<YamlList>();
      if (tagsNode != null) {
        for (final tag in tagsNode.nodes) {
          operation.tags.add(tag.getScalar<String>());
        }
      }

      final requestBodyNode =
          operationNode.nodes['requestBody']?.getAs<YamlMap>();
      if (requestBodyNode != null) {
        final requestBody = _loadRequestBodyOrRef(
          requestBodyNode,
          ref: '$ref/${method.name}/requestBody',
        );
        operation.requestBody.replace(requestBody);
      }

      final responsesNode = operationNode.nodes['responses'].getAs<YamlMap>();
      if (responsesNode != null) {
        responsesNode.checkAllowedFields([
          'default',
          _statusCodePattern,
          _extensionPattern,
        ]);

        for (final entry in responsesNode.yamlNodes) {
          final responseNode = entry.value.getAs<YamlMap>();
          if (responseNode == null) {
            throw Exception('OpenAPI response is not a map');
          }

          final response = _loadResponseOrRef(
            responseNode,
            ref: '$ref/${method.name}/responses/${entry.key}',
          );
          if (entry.key == 'default') {
            operation.defaultResponse.replace(response);
            continue;
          }

          final statusCode = StatusCodeOrRange.tryParse(entry.key);
          if (statusCode == null) {
            throw Exception(
              'Invalid OpenAPI status code or range: ${entry.key}',
            );
          }
          operation.responses[statusCode] = response;
        }
      }

      final parametersNode =
          operationNode.nodes['parameters'].getAs<YamlList>();
      if (parametersNode != null) {
        for (final (parameterIndex, parameterNode)
            in parametersNode.nodes.indexed) {
          if (parameterNode is! YamlMap) {
            throw Exception('OpenAPI parameter is not a map');
          }

          final parameter = _loadParameterOrRef(
            parameterNode,
            ref: '$ref/${method.name}/parameters/$parameterIndex',
          );
          operation.parameters.add(parameter);
        }
      }

      final serversNode = operationNode.nodes['servers'].getAs<YamlList>();
      if (serversNode != null) {
        for (final (serverIndex, serverNode) in serversNode.nodes.indexed) {
          if (serverNode is! YamlMap) {
            throw Exception('OpenAPI server is not a map');
          }

          final server = _loadServer(
            serverNode,
            ref: '$ref/${method.name}/servers/$serverIndex',
          );
          operation.servers.add(server.build());
        }
      }

      path.operations[method] = operation.build();
    }

    return path.build();
  }

  OpenApiComponentOrRef<OpenApiSchema> _loadSchemaOrRef(
    YamlMap schemaNode, {
    required String ref,
  }) {
    if (schemaNode.nodes.containsKey(r'$ref')) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        node: schemaNode,
        reference: _ref<OpenApiSchema, OpenApiSchemaReference>(schemaNode),
      );
    }
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: _loadSchema(schemaNode, ref: ref),
    );
  }

  OpenApiSchema _loadSchema(
    YamlMap schemaNode, {
    required String ref,
  }) {
    if (schemaNode.nodes.containsKey(r'$ref')) {
      throw Exception('OpenAPI schema reference is not allowed');
    }
    schemaNode.checkAllowedFields([
      'allOf',
      'anyOf',
      'const',
      'contentEncoding', // TODO(dnys1): Implement
      'contentMediaType', // Implement
      'contentSchema', // Implement
      'default',
      'deprecated',
      'description',
      'discriminator',
      'enum',
      'example',
      'exclusiveMaximum',
      'exclusiveMinimum',
      'externalDocs',
      'format',
      'items',
      'maximum',
      'maxItems',
      'maxLength',
      'maxProperties',
      'minimum',
      'minItems',
      'minLength',
      'minProperties',
      'multipleOf',
      // TODO(dnys1): Needed?
      // 'not',
      'nullable',
      'oneOf',
      'pattern',
      'properties',
      'additionalProperties',
      'readOnly',
      'required',
      'title',
      'type',
      'uniqueItems',
      'writeOnly',
      _extensionPattern,
    ]);

    final yamlNodes = Map.fromEntries(schemaNode.yamlNodes);

    OpenApiComponentOrRef<OpenApiSchema>? schema(String key) {
      return yamlNodes[key]?.getAs<YamlMap>()?.let(
            (node) => _loadSchemaOrRef(node, ref: '$ref/$key'),
          );
    }

    Map<String, OpenApiComponentOrRef<OpenApiSchema>>? schemaMap(String key) {
      return yamlNodes[key]?.getAs<YamlMap>()?.nodes.map(
            (itemKey, node) => MapEntry(
              switch (itemKey) {
                final String key => key,
                YamlScalar(value: final String key) => key,
                _ => throw Exception('OpenAPI schema key is not a string'),
              },
              _loadSchemaOrRef(
                node.getAs<YamlMap>()!,
                ref: '$ref/$key/$itemKey',
              ),
            ),
          );
    }

    Iterable<OpenApiComponentOrRef<OpenApiSchema>>? schemaList(String key) {
      return yamlNodes[key]?.getAs<YamlList>()?.nodes.mapIndexed(
            (index, node) => _loadSchemaOrRef(
              node.getAs<YamlMap>()!,
              ref: '$ref/$key/$index',
            ),
          );
    }

    Iterable<T>? scalarList<T extends Object?>(String key) =>
        schemaNode.nodes[key]?.getAs<YamlList>()?.nodes.mapIndexed(
              (index, node) => node.getScalar<T>(ref: '$ref/$key/$index'),
            );

    T? scalar<T extends Object?>(String key) => switch (schemaNode.nodes[key]) {
          final YamlScalar scalar => scalar.getScalar<T>(ref: '$ref/$key'),
          final YamlList list => list.value as T,
          final node => node as T?,
        };

    OpenApiAdditionalProperties? additionalProperties;
    if (yamlNodes['additionalProperties']
        case final additionalPropertiesNode?) {
      switch (additionalPropertiesNode) {
        case YamlScalar(value: final bool allow):
          additionalProperties = OpenApiAdditionalProperties(allow: allow);
        case YamlMap():
          additionalProperties = OpenApiAdditionalProperties(
            schema: _loadSchemaOrRef(
              additionalPropertiesNode,
              ref: '$ref/additionalProperties',
            ),
          );
      }
    }

    Map<String, Object?>? extensions;
    for (final MapEntry(:key, value: valueNode) in yamlNodes.entries) {
      if (!_extensionPattern.hasMatch(key)) {
        continue;
      }
      extensions ??= {};
      extensions[key] = valueNode.value;
    }

    final type = switch (yamlNodes['type']) {
      final YamlScalar scalar => ItemValue(
          JsonType.fromYaml(scalar.value as String),
        ),
      final YamlList list => ItemList(
          list.nodes
              .map((it) => it.getScalar<String>())
              .map(JsonType.fromYaml)
              .toList(),
        ),
      null => null,
      _ => throw Exception('OpenAPI schema type is not a string or list'),
    };

    final discriminatorNode = yamlNodes['discriminator']?.getAs<YamlMap>();
    OpenApiDiscriminator? discriminator;
    if (discriminatorNode != null) {
      discriminatorNode.checkRequiredFields([
        'propertyName',
      ]);
      discriminatorNode.checkAllowedFields([
        'mapping',
        'propertyName',
        _extensionPattern,
      ]);
      final discriminatorMap = Map.fromEntries(discriminatorNode.yamlNodes);
      final mappingNode = discriminatorMap['mapping']?.getAs<YamlMap>();
      discriminator = OpenApiDiscriminator(
        ref: '$ref/discriminator',
        node: discriminatorNode,
        propertyName: discriminatorMap['propertyName'].getScalar(),
        mapping: switch (mappingNode) {
          final node? => {
              for (final MapEntry(:key, :value) in node.yamlNodes)
                key: value.getScalar(),
            },
          _ => null,
        },
      );
    }

    // TODO(dnys1): Give `const` it's own field.
    final enumValues = scalarList<Object?>('enum') ??
        scalar<Object?>('const')?.let((it) => [it]);

    return OpenApiSchema(
      ref: ref,
      name:
          ref.startsWith('#/components/schemas/') ? ref.split('/').last : null,
      node: schemaNode,
      type: type,
      allOf: schemaList('allOf'),
      anyOf: schemaList('anyOf'),
      defaultValue: scalar('default'),
      deprecated: scalar('deprecated'),
      description: scalar('description'),
      enumValues: enumValues,
      exclusiveMaximum: scalar('exclusiveMaximum'),
      exclusiveMinimum: scalar('exclusiveMinimum'),
      format: scalar<String>('format')?.let(JsonTypeFormat.new),
      items: schema('items'),
      maximum: scalar('maximum'),
      maxItems: scalar('maxItems'),
      maxLength: scalar('maxLength'),
      maxProperties: scalar('maxProperties'),
      minimum: scalar('minimum'),
      minItems: scalar('minItems'),
      minLength: scalar('minLength'),
      minProperties: scalar('minProperties'),
      multipleOf: scalar('multipleOf'),
      nullable: scalar('nullable'),
      oneOf: schemaList('oneOf'),
      pattern: scalar('pattern'),
      properties: schemaMap('properties'),
      additionalProperties: additionalProperties,
      readOnly: scalar('readOnly'),
      required: scalarList('required'),
      title: scalar('title'),
      uniqueItems: scalar('uniqueItems'),
      writeOnly: scalar('writeOnly'),
      discriminator: discriminator,
      example: scalar('example'),
      extensions: extensions,
    );
  }

  OpenApiComponentOrRef<OpenApiResponse> _loadResponseOrRef(
    YamlMap responseNode, {
    required String ref,
  }) {
    if (responseNode.nodes.containsKey(r'$ref')) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        node: responseNode,
        reference:
            _ref<OpenApiResponse, OpenApiResponseReference>(responseNode),
      );
    }
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: _loadResponse(responseNode, ref: ref),
    );
  }

  OpenApiResponse _loadResponse(
    YamlMap responseNode, {
    required String ref,
  }) {
    if (responseNode.nodes.containsKey(r'$ref')) {
      throw Exception('OpenAPI response reference is not allowed');
    }

    responseNode.checkAllowedFields([
      'content',
      'description',
      'headers',
      'links',
      'content',
      _extensionPattern,
    ]);

    final response = OpenApiResponseBuilder();
    response
      ..ref = ref
      ..node = responseNode
      ..description = responseNode.nodes['description']?.value as String?
      ..extensions = _loadExtensions(responseNode);

    final contentNode = responseNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkAllowedFields([
        _mediaTypePattern,
        _extensionPattern,
      ]);
      response.content; // Create the map builder -- null vs. {}

      for (final entry in contentNode.yamlNodes) {
        final mediaTypeNode = entry.value.getAs<YamlMap>();
        if (mediaTypeNode == null) {
          throw Exception('OpenAPI media type is not a map');
        }

        final mediaType = _loadMediaType(
          mediaTypeNode,
          ref: '$ref/content/${entry.key}',
        );
        response.content[MediaType.parse(entry.key)] = mediaType.build();
      }
    }

    final headersNode = responseNode.nodes['headers'].getAs<YamlMap>();
    if (headersNode != null) {
      response.headers; // Create the map builder -- null vs. {}

      for (final entry in headersNode.yamlNodes) {
        final headerNode = entry.value.getAs<YamlMap>();
        if (headerNode == null) {
          throw Exception('OpenAPI header is not a map');
        }

        final header = _loadHeaderOrRef(
          headerNode,
          ref: '$ref/headers/${entry.key}',
        );
        response.headers[entry.key] = header;
      }
    }

    return response.build();
  }

  OpenApiComponentOrRef<OpenApiParameter> _loadParameterOrRef(
    YamlMap parameterNode, {
    required String ref,
  }) {
    if (parameterNode.nodes.containsKey(r'$ref')) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        node: parameterNode,
        reference: _ref<OpenApiParameter, OpenApiParameterReference>(
          parameterNode,
        ),
      );
    }
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: _loadParameter(parameterNode, ref: ref),
    );
  }

  OpenApiParameter _loadParameter(
    YamlMap parameterNode, {
    required String ref,
  }) {
    if (parameterNode.nodes.containsKey(r'$ref')) {
      throw Exception('OpenAPI parameter reference is not allowed');
    }

    parameterNode.checkRequiredFields(['in', 'name']);
    parameterNode.checkAllowedFields([
      'allowEmptyValue',
      'allowReserved',
      'content',
      'deprecated',
      'description',
      'example',
      'examples',
      'explode',
      'in',
      'name',
      'required',
      'schema',
      'style',
      _extensionPattern,
    ]);

    final parameter = OpenApiParameterBuilder()
      ..ref = ref
      ..node = parameterNode;
    final location = parameterNode.nodes['in'].getScalar<String>();
    parameter.location = OpenApiParameterLocation.valueOf(location);
    parameter.name = parameterNode.nodes['name'].getScalar();
    parameter.description = parameterNode.nodes['description']?.getScalar();
    parameter.required = parameterNode.nodes['required']?.getScalar();
    parameter.extensions = _loadExtensions(parameterNode);

    final schemaNode = parameterNode.nodes['schema'].getAs<YamlMap>();
    if (schemaNode != null) {
      final schema = _loadSchemaOrRef(
        schemaNode,
        ref: '$ref/schema',
      );
      parameter.schema.replace(schema);
    }

    final contentNode = parameterNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkRequiredFields([_mediaTypePattern]);
      contentNode.checkAllowedFields([
        _mediaTypePattern,
        _extensionPattern,
      ]);

      if (contentNode.nodes.length > 1) {
        throw Exception('OpenAPI header has multiple content types');
      }

      final MapEntry(key: contentType, value: node) =
          contentNode.yamlNodes.first;
      final mediaTypeNode = node.getAs<YamlMap>();
      if (mediaTypeNode == null) {
        throw Exception('OpenAPI media type was not provided');
      }

      final mediaType = _loadMediaType(
        mediaTypeNode,
        ref: '$ref/content/$contentType',
      );
      parameter.content = (
        MediaType.parse(contentType),
        mediaType.build(),
      );
    }

    return parameter.build();
  }

  OpenApiComponentOrRef<OpenApiRequestBody> _loadRequestBodyOrRef(
    YamlMap requestBodyNode, {
    required String ref,
  }) {
    if (requestBodyNode.nodes.containsKey(r'$ref')) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        node: requestBodyNode,
        reference: _ref<OpenApiRequestBody, OpenApiRequestBodyReference>(
          requestBodyNode,
        ),
      );
    }
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: _loadRequestBody(requestBodyNode, ref: ref),
    );
  }

  OpenApiRequestBody _loadRequestBody(
    YamlMap requestBodyNode, {
    required String ref,
  }) {
    if (requestBodyNode.nodes.containsKey(r'$ref')) {
      throw Exception('OpenAPI request body reference is not allowed');
    }

    requestBodyNode.checkAllowedFields([
      'content',
      'description',
      'required',
      _extensionPattern,
    ]);

    final requestBody = OpenApiRequestBodyBuilder()
      ..ref = ref
      ..node = requestBodyNode
      ..extensions = _loadExtensions(requestBodyNode);
    requestBody.description =
        requestBodyNode.nodes['description']?.value as String?;
    requestBody.required = requestBodyNode.nodes['required']?.value as bool?;

    final contentNode = requestBodyNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkAllowedFields([
        'examples',
        _mediaTypePattern,
        _extensionPattern,
      ]);

      for (final entry in contentNode.yamlNodes) {
        final mediaTypeNode = entry.value.getAs<YamlMap>();
        if (mediaTypeNode == null) {
          throw Exception('OpenAPI media type is not a map');
        }

        final mediaType = _loadMediaType(
          mediaTypeNode,
          ref: '$ref/content/${entry.key}',
        );
        requestBody.content[MediaType.parse(entry.key)] = mediaType.build();
      }
    }

    return requestBody.build();
  }

  OpenApiComponentOrRef<OpenApiHeader> _loadHeaderOrRef(
    YamlMap headerNode, {
    required String ref,
  }) {
    if (headerNode.nodes.containsKey(r'$ref')) {
      return OpenApiComponentOrRef.reference(
        ref: ref,
        node: headerNode,
        reference: _ref<OpenApiHeader, OpenApiHeaderReference>(headerNode),
      );
    }
    return OpenApiComponentOrRef.component(
      ref: ref,
      component: _loadHeader(headerNode, ref: ref),
    );
  }

  OpenApiHeader _loadHeader(
    YamlMap headerNode, {
    required String ref,
  }) {
    if (headerNode.nodes.containsKey(r'$ref')) {
      throw Exception('OpenAPI header reference is not allowed');
    }

    headerNode.checkAllowedFields([
      'allowEmptyValue',
      'content',
      'deprecated',
      'description',
      'example',
      'examples',
      'explode',
      'required',
      'schema',
      'style',
      _extensionPattern,
    ]);

    final header = OpenApiHeaderBuilder()
      ..ref = ref
      ..node = headerNode
      ..extensions = _loadExtensions(headerNode);
    header.description = headerNode.nodes['description']?.value as String?;
    header.required = headerNode.nodes['required']?.value as bool? ?? false;

    final schemaNode = headerNode.nodes['schema'].getAs<YamlMap>();
    if (schemaNode != null) {
      final schema = _loadSchemaOrRef(
        schemaNode,
        ref: '$ref/schema',
      );
      header.schema.replace(schema);
    }

    final contentNode = headerNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkRequiredFields([_mediaTypePattern]);
      contentNode.checkAllowedFields([
        _mediaTypePattern,
        _extensionPattern,
      ]);

      if (contentNode.nodes.length > 1) {
        throw Exception('OpenAPI header has multiple content types');
      }

      final MapEntry(key: contentType, value: node) =
          contentNode.yamlNodes.first;
      final mediaTypeNode = node.getAs<YamlMap>();
      if (mediaTypeNode == null) {
        throw Exception('OpenAPI media type was not provided');
      }

      final mediaType = _loadMediaType(
        mediaTypeNode,
        ref: '$ref/content/$contentType',
      );
      header.content = (
        MediaType.parse(contentType),
        mediaType.build(),
      );
    }

    return header.build();
  }

  OpenApiMediaTypeBuilder _loadMediaType(
    YamlMap mediaTypeNode, {
    required String ref,
  }) {
    mediaTypeNode.checkRequiredFields(['schema']);
    mediaTypeNode.checkAllowedFields([
      'example',
      'examples',
      'encoding',
      'schema',
      _extensionPattern,
    ]);

    final mediaType = OpenApiMediaTypeBuilder()
      ..ref = ref
      ..node = mediaTypeNode
      ..extensions = _loadExtensions(mediaTypeNode);
    // mediaType.example = mediaTypeNode.nodes['example']?.value as String?;
    final schemaNode = mediaTypeNode.nodes['schema'].getAs<YamlMap>()!;
    final schema = _loadSchemaOrRef(
      schemaNode,
      ref: '$ref/schema',
    );
    mediaType.schema.replace(schema);

    final encodingNode = mediaTypeNode.nodes['encoding'].getAs<YamlMap>();
    if (encodingNode != null) {
      for (final entry in encodingNode.yamlNodes) {
        final encodingNode = entry.value.getAs<YamlMap>()!;
        encodingNode.checkAllowedFields([
          'allowReserved',
          'contentType',
          'explode',
          'headers',
          'style',
          _extensionPattern,
        ]);

        final encoding = OpenApiEncodingBuilder()
          ..ref = '$ref/encoding/${entry.key}'
          ..node = encodingNode
          ..allowReserved = encodingNode.nodes['allowReserved']?.value as bool?
          ..extensions = _loadExtensions(encodingNode);

        var contentType = encodingNode.nodes['contentType']?.value as String?;
        contentType ??= schema.defaultContentType(components);
        encoding.contentType = MediaType.parse(contentType);

        // https://spec.openapis.org/oas/v3.1.0#fixed-fields-12
        const ignoreExplode = [
          'application/x-www-form-urlencoded',
          'multipart/form-data',
        ];
        if (!ignoreExplode.contains(contentType)) {
          encoding.explode =
              encodingNode.nodes['explode']?.value as bool? ?? false;
        }

        // https://spec.openapis.org/oas/v3.1.0#fixed-fields-12
        const ignoreStyle = [
          'application/x-www-form-urlencoded',
          'multipart/form-data',
        ];
        if (!ignoreStyle.contains(contentType)) {
          final style = encodingNode.nodes['style']?.value as String?;
          if (style != null) {
            encoding.style = OpenApiParameterStyle.valueOf(style);
          }
        }

        final headersNode = encodingNode.nodes['headers'].getAs<YamlMap>();
        if (headersNode != null) {
          for (final headerEntry in headersNode.yamlNodes) {
            final headerNode = headerEntry.value.getAs<YamlMap>();
            if (headerNode == null) {
              throw Exception('OpenAPI header is not a map');
            }

            final header = _loadHeaderOrRef(
              headerNode,
              ref: '$ref/encoding/${entry.key}/headers/${headerEntry.key}',
            );
            encoding.headers[headerEntry.key] = header;
          }
        }

        mediaType.encoding[entry.key] = encoding.build();
      }
    }

    return mediaType;
  }

  OpenApiSecurityScheme _loadSecurityScheme(
    YamlMap securitySchemeNode, {
    required String ref,
  }) {
    securitySchemeNode.checkRequiredFields(['type']);
    securitySchemeNode.checkAllowedFields([
      'type',
      'description',
      'name',
      'in',
      'scheme',
      'bearerFormat',
      'flows',
      'openIdConnectUrl',
      _extensionPattern,
    ]);

    final securityScheme = OpenApiSecuritySchemeBuilder()
      ..ref = ref
      ..node = securitySchemeNode
      ..extensions = _loadExtensions(securitySchemeNode);

    final type = securitySchemeNode.nodes['type'].getScalar<String>();
    securityScheme.type = OpenApiSecuritySchemeType.valueOf(type);

    securityScheme.description =
        securitySchemeNode.nodes['description']?.value as String?;
    securityScheme.name = securitySchemeNode.nodes['name']?.value as String?;
    if (securitySchemeNode.nodes['in']?.value case final String location) {
      securityScheme.location = OpenApiParameterLocation.valueOf(location);
    }
    securityScheme.scheme =
        securitySchemeNode.nodes['scheme']?.value as String?;
    securityScheme.bearerFormat =
        securitySchemeNode.nodes['bearerFormat']?.value as String?;
    if (securitySchemeNode.nodes['flows'].getAs<YamlMap>()
        case final flowsNode?) {
      securityScheme.flows = _loadOAuthFlows(flowsNode, ref: '$ref/flows');
    }
    securityScheme.openIdConnectUrl =
        securitySchemeNode.nodes['openIdConnectUrl']?.value as String?;

    return securityScheme.build();
  }

  OpenApiOAuthFlowsBuilder _loadOAuthFlows(
    YamlMap flowsNode, {
    required String ref,
  }) {
    flowsNode.checkAllowedFields([
      'implicit',
      'password',
      'clientCredentials',
      'authorizationCode',
      _extensionPattern,
    ]);

    final flows = OpenApiOAuthFlowsBuilder()
      ..ref = ref
      ..node = flowsNode
      ..extensions = _loadExtensions(flowsNode);
    if (flowsNode.nodes['authorizationCode']?.getAs<YamlMap>()
        case final authorizationCodeNode?) {
      flows.authorizationCode = _loadOAuthFlow(
        authorizationCodeNode,
        ref: '$ref/authorizationCode',
      );
    }
    if (flowsNode.nodes['clientCredentials']?.getAs<YamlMap>()
        case final clientCredentialsNode?) {
      flows.clientCredentials = _loadOAuthFlow(
        clientCredentialsNode,
        ref: '$ref/clientCredentials',
      );
    }
    if (flowsNode.nodes['implicit']?.getAs<YamlMap>()
        case final implicitNode?) {
      flows.implicit = _loadOAuthFlow(implicitNode, ref: '$ref/implicit');
    }
    if (flowsNode.nodes['password']?.getAs<YamlMap>()
        case final passwordNode?) {
      flows.password = _loadOAuthFlow(passwordNode, ref: '$ref/password');
    }
    return flows;
  }

  OpenApiOAuthFlowBuilder _loadOAuthFlow(
    YamlMap flowNode, {
    required String ref,
  }) {
    flowNode.checkAllowedFields([
      'authorizationUrl',
      'tokenUrl',
      'refreshUrl',
      'scopes',
      _extensionPattern,
    ]);

    final flow = OpenApiOAuthFlowBuilder()
      ..ref = ref
      ..node = flowNode
      ..extensions = _loadExtensions(flowNode);
    flow.authorizationUrl =
        flowNode.nodes['authorizationUrl']?.value as String?;
    flow.tokenUrl = flowNode.nodes['tokenUrl']?.value as String?;
    flow.refreshUrl = flowNode.nodes['refreshUrl']?.value as String?;
    flow.scopes.addEntries(
      flowNode.nodes['scopes']
          .getAs<YamlMap>()!
          .yamlNodes
          .map((entry) => MapEntry(entry.key, entry.value.getScalar<String>())),
    );
    return flow;
  }
}

extension on OpenApiComponentOrRef<OpenApiSchema> {
  String defaultContentType(OpenApiComponents components) {
    final schema = resolve(components);
    return switch (schema.type?.value) {
      JsonType.object => 'application/json',
      JsonType.array => schema.items!.defaultContentType(components),
      _ => 'application/octet-stream',
    };
  }
}

extension on YamlMap {
  Iterable<MapEntry<String, YamlNode>> get yamlNodes =>
      nodes.entries.map((entry) {
        final key = switch (entry.key) {
          final String key => key,
          YamlScalar(value: final String key) => key,
          _ => throw Exception(
              'Invalid key: $entry. Expected String or YamlScalar, '
              // ignore: avoid_dynamic_calls
              'got ${entry.key?.runtimeType}',
            ),
        };
        return MapEntry(key, entry.value);
      });
}

extension on YamlNode? {
  T getScalar<T extends Object?>({
    String? ref,
  }) {
    final this_ = this;
    if (this_ is! YamlScalar) {
      throw ArgumentError(
        this_,
        'Expected a YamlScalar but got a $runtimeType. '
        'ref=$ref, context=${this_?.span.highlight()}',
      );
    }
    final value = this_.value;
    if (value is! T) {
      if (T == String) {
        switch (value) {
          // TODO(dnys1): Improve... YAML decodes "- " in list as null
          case null:
            return '' as T;
          // TODO(dnys1): Improve... YAML decodes "- true" in list as bool
          case true || false:
            return value.toString() as T;
        }
      }
      throw ArgumentError(
        this_,
        'Expected a $T but got a $runtimeType. '
        'ref=$ref, context=${this_.span.highlight()}',
      );
    }
    return value;
  }
}

extension on YamlNode? {
  Node? getAs<Node extends YamlNode>() {
    final this_ = this;
    if (this_ == null) {
      return null;
    }
    if (this_ is! Node) {
      throw Exception('Expected a $Node but got a $runtimeType');
    }
    return this_;
  }
}

extension on YamlMap {
  void checkRequiredFields(Iterable<Pattern> requiredFields) {
    final unmatched = List.of(requiredFields);
    for (final MapEntry(:key) in value.entries) {
      if (key is String) {
        for (final requiredField in requiredFields) {
          if (requiredField.allMatches(key).isNotEmpty) {
            unmatched.remove(requiredField);
            break;
          }
        }
      }
    }
    if (unmatched.isNotEmpty) {
      // TODO(dnys1): Use location in errors
      // final location = span;
      throw Exception('Missing required OpenAPI fields: $unmatched ($this)');
    }
  }

  void checkAllowedFields(Iterable<Pattern> allowedPatterns) {
    final invalid = <(String, YamlNode)>[];
    for (final MapEntry(:key, value: node) in yamlNodes) {
      var goodKey = false;
      for (final allowedPattern in allowedPatterns) {
        if (allowedPattern.allMatches(key).isNotEmpty) {
          goodKey = true;
          break;
        }
      }
      if (!goodKey) {
        invalid.add((key, node));
      }
    }
    if (invalid.isNotEmpty) {
      throw Exception('Invalid keys: $invalid ($this)');
    }
  }
}

extension<T> on T {
  R let<R>(R Function(T) block) => block(this);
}

import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

OpenApiDocument loadOpenApiDocument(
  String jsonOrYaml, {
  required Uri sourceUri,
}) {
  final document = loadYamlDocument(jsonOrYaml, sourceUrl: sourceUri);
  final root = document.contents as YamlMap;

  final version = (root.nodes['swagger'] ?? root.nodes['openapi'])?.value;
  if (version == null || version is! String) {
    throw Exception('Could not detect OpenAPI version');
  }

  final semver = Version.parse(version);
  return switch (semver.major) {
    3 => OpenApiV3Loader(version: semver, rootNode: root).load(),
    2 => throw Exception('OpenAPI 2.0 is not supported'),
    _ => throw Exception('Unknown OpenAPI version: $version'),
  };
}

final class OpenApiV3Loader {
  OpenApiV3Loader({required this.version, required this.rootNode})
    : _document = OpenApiDocumentBuilder()..version = version, // TODO: Source
      _components = OpenApiComponentsBuilder();

  static final _extensionPattern = RegExp('^x-');
  static final _pathPattern = RegExp(r'^/');
  static final _statusCodePattern = RegExp(r'^[1-5][\dX]{2}$');
  static final _mediaTypePattern = RegExp(r'^[a-z]+/[a-z0-9.-]+$');

  final OpenApiDocumentBuilder _document;
  final OpenApiComponentsBuilder _components;

  late final OpenApiComponents components = _components.build();

  final Version version;
  final YamlMap rootNode;

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

    _loadInfo();
    _loadServers();
    _loadComponents();
    _loadPaths();

    return _document.build();
  }

  Component _ref<Component>(String ref) {
    switch (ref.split('/')) {
      case ['#', 'components', final type, final name]:
        return switch (type) {
          'schemas' => components.schemas[name] as Component,
          'responses' => components.responses[name] as Component,
          'parameters' => components.parameters[name] as Component,
          'requestBodies' => components.requestBodies[name] as Component,
          'headers' => components.headers[name] as Component,
          _ => throw Exception('Invalid component type: $type'),
        };
      default:
        throw Exception('Invalid component reference: $ref');
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
      ..apiVersion = infoNode.nodes['version']?.value as String?;
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

      final server = _loadServer(serverNode);
      _document.servers.add(server.build());
    }
  }

  void _loadPaths() {
    final pathsNode = rootNode.nodes['paths'].getAs<YamlMap>();
    if (pathsNode == null) {
      throw Exception('OpenAPI document is missing required key "paths"');
    }

    pathsNode.checkAllowedFields([_pathPattern, _extensionPattern]);

    for (final entry in pathsNode.nodes.entries) {
      final pathNode = entry.value.getAs<YamlMap>();
      if (pathNode == null) {
        throw Exception('OpenAPI path is not a map');
      }
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

    final schemasNode = componentsNode.nodes['schemas'].getAs<YamlMap>();
    if (schemasNode != null) {
      for (final entry in schemasNode.nodes.entries) {
        final schemaNode = entry.value.getAs<YamlMap>();
        if (schemaNode == null) {
          throw Exception('OpenAPI schema is not a map');
        }

        final schema = _loadTypeSchema(schemaNode, allowRef: false);
        // _components.schemas[entry.key as String] = schema;
      }
    }

    final responsesNode = componentsNode.nodes['responses'].getAs<YamlMap>();
    if (responsesNode != null) {
      for (final entry in responsesNode.nodes.entries) {
        final responseNode = entry.value.getAs<YamlMap>();
        if (responseNode == null) {
          throw Exception('OpenAPI response is not a map');
        }

        final response = _loadResponse(responseNode, allowRef: false);
        _components.responses[entry.key as String] = response.build();
      }
    }

    final parametersNode = componentsNode.nodes['parameters'].getAs<YamlMap>();
    if (parametersNode != null) {
      for (final entry in parametersNode.nodes.entries) {
        final parameterNode = entry.value.getAs<YamlMap>();
        if (parameterNode == null) {
          throw Exception('OpenAPI parameter is not a map');
        }

        final parameter = _loadParameter(parameterNode, allowRef: false);
        _components.parameters[entry.key as String] = parameter.build();
      }
    }

    final requestBodiesNode =
        componentsNode.nodes['requestBodies'].getAs<YamlMap>();
    if (requestBodiesNode != null) {
      for (final entry in requestBodiesNode.nodes.entries) {
        final requestBodyNode = entry.value.getAs<YamlMap>();
        if (requestBodyNode == null) {
          throw Exception('OpenAPI request body is not a map');
        }

        final requestBody = _loadRequestBody(requestBodyNode, allowRef: false);
        _components.requestBodies[entry.key as String] = requestBody.build();
      }
    }

    final headersNode = componentsNode.nodes['headers'].getAs<YamlMap>();
    if (headersNode != null) {
      for (final entry in headersNode.nodes.entries) {
        final headerNode = entry.value.getAs<YamlMap>();
        if (headerNode == null) {
          throw Exception('OpenAPI header is not a map');
        }

        final header = _loadHeader(headerNode, allowRef: false);
        _components.headers[entry.key as String] = header.build();
      }
    }

    final pathsNode = componentsNode.nodes['paths'].getAs<YamlMap>();
    if (pathsNode != null) {
      for (final entry in pathsNode.nodes.entries) {
        final pathNode = entry.value.getAs<YamlMap>();
        if (pathNode == null) {
          throw Exception('OpenAPI path is not a map');
        }

        final path = _loadPathItem(pathNode, allowRef: false);
        _components.paths[entry.key as String] = path.build();
      }
    }
  }

  OpenApiServerBuilder _loadServer(YamlMap serverNode, {bool allowRef = true}) {
    if (serverNode.nodes[r'$ref']?.value case final String ref) {
      if (!allowRef) {
        throw Exception('OpenAPI server reference is not allowed');
      }
      return _ref<OpenApiServerBuilder>(ref);
    }

    serverNode.checkRequiredFields(['url']);
    serverNode.checkAllowedFields([
      'description',
      'url',
      'variables',
      _extensionPattern,
    ]);

    final server = OpenApiServerBuilder();
    server.url = serverNode.nodes['url']?.value as String?;
    server.description = serverNode.nodes['description']?.value as String?;

    final variablesNode = serverNode.nodes['variables'];
    if (variablesNode != null && variablesNode is YamlMap) {
      for (final entry in variablesNode.nodes.entries) {
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
          ..description = variableNode.nodes['description']?.value as String?;

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

        server.variables[entry.key as String] = variable.build();
      }
    }

    return server;
  }

  OpenApiPathItemBuilder _loadPathItem(
    YamlMap pathItemNode, {
    bool allowRef = true,
  }) {
    if (pathItemNode.nodes[r'$ref']?.value case final String ref) {
      if (!allowRef) {
        throw Exception('OpenAPI path reference is not allowed');
      }
      return _ref<OpenApiPathItemBuilder>(ref);
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
    path.summary = pathItemNode.nodes['summary']?.value as String?;

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

      final operation =
          OpenApiOperationBuilder()
            ..deprecated = operationNode.nodes['deprecated']?.value as bool?
            ..description = operationNode.nodes['description']?.value as String?
            ..operationId = operationNode.nodes['operationId']?.value as String
            ..summary = operationNode.nodes['summary']?.value as String?;

      final requestBodyNode =
          operationNode.nodes['requestBody'].getAs<YamlMap>();
      if (requestBodyNode != null) {
        final requestBody = _loadRequestBody(requestBodyNode);
        operation.requestBody = requestBody;
      }

      final responsesNode = operationNode.nodes['responses'].getAs<YamlMap>();
      if (responsesNode != null) {
        responsesNode.checkAllowedFields([
          'default',
          _statusCodePattern,
          _extensionPattern,
        ]);

        for (final entry in responsesNode.nodes.entries) {
          final responseNode = entry.value.getAs<YamlMap>();
          if (responseNode == null) {
            throw Exception('OpenAPI response is not a map');
          }

          final statusCode = int.parse(entry.key as String); // TODO: Or range
          final response = _loadResponse(responseNode);
          operation.responses[statusCode] = response.build();
        }
      }

      final parametersNode =
          operationNode.nodes['parameters'].getAs<YamlList>();
      if (parametersNode != null) {
        for (final parameterNode in parametersNode.nodes) {
          if (parameterNode is! YamlMap) {
            throw Exception('OpenAPI parameter is not a map');
          }

          final parameter = _loadParameter(parameterNode);
          operation.parameters.add(parameter.build());
        }
      }

      final serversNode = operationNode.nodes['servers'].getAs<YamlList>();
      if (serversNode != null) {
        for (final serverNode in serversNode.nodes) {
          if (serverNode is! YamlMap) {
            throw Exception('OpenAPI server is not a map');
          }

          final server = _loadServer(serverNode);
          operation.servers.add(server.build());
        }
      }

      path.operations[method] = operation.build();
    }

    return path;
  }

  OpenApiTypeSchemaBuilder _loadTypeSchema(
    YamlMap schemaNode, {
    bool allowRef = true,
  }) {
    if (schemaNode.nodes[r'$ref']?.value case final String ref) {
      if (!allowRef) {
        throw Exception('OpenAPI schema reference is not allowed');
      }
      return _ref<OpenApiTypeSchemaBuilder>(ref);
    }
    schemaNode.checkRequiredFields(['type']);
    schemaNode.checkAllowedFields([
      'allOf',
      'anyOf',
      'default',
      'deprecated',
      'description',
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
      'not',
      'nullable',
      'oneOf',
      'pattern',
      'properties',
      'readOnly',
      'required',
      'title',
      'type',
      'uniqueItems',
      'writeOnly',
      _extensionPattern,
    ]);
    throw UnimplementedError();
  }

  OpenApiResponseBuilder _loadResponse(
    YamlMap responseNode, {
    bool allowRef = true,
  }) {
    if (responseNode.nodes[r'$ref']?.value case final String ref) {
      if (!allowRef) {
        throw Exception('OpenAPI response reference is not allowed');
      }
      return _ref<OpenApiResponseBuilder>(ref);
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
    response.description = responseNode.nodes['description']?.value as String?;

    final contentNode = responseNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkAllowedFields([_mediaTypePattern, _extensionPattern]);

      for (final entry in contentNode.nodes.entries) {
        final mediaTypeNode = entry.value.getAs<YamlMap>();
        if (mediaTypeNode == null) {
          throw Exception('OpenAPI media type is not a map');
        }

        final mediaType = _loadMediaType(mediaTypeNode);
        response.content[MediaType.parse(entry.key as String)] =
            mediaType.build();
      }
    }

    final headersNode = responseNode.nodes['headers'].getAs<YamlMap>();
    if (headersNode != null) {
      for (final entry in headersNode.nodes.entries) {
        final headerNode = entry.value.getAs<YamlMap>();
        if (headerNode == null) {
          throw Exception('OpenAPI header is not a map');
        }

        final header = _loadHeader(headerNode);
        response.headers[entry.key as String] = header.build();
      }
    }

    return response;
  }

  OpenApiParameterBuilder _loadParameter(
    YamlMap parameterNode, {
    bool allowRef = true,
  }) {
    if (parameterNode.nodes[r'$ref']?.value case final String ref) {
      if (!allowRef) {
        throw Exception('OpenAPI parameter reference is not allowed');
      }
      return _ref<OpenApiParameterBuilder>(ref);
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

    final parameter = OpenApiParameterBuilder();
    final location = parameterNode.nodes['in']?.value as String;
    parameter.location = OpenApiParameterLocation.valueOf(location);
    parameter.name = parameterNode.nodes['name']?.value as String;
    parameter.description =
        parameterNode.nodes['description']?.value as String?;
    parameter.required = parameterNode.nodes['required']?.value as bool?;

    final schemaNode = parameterNode.nodes['schema'].getAs<YamlMap>();
    if (schemaNode != null) {
      final schema = _loadTypeSchema(schemaNode);
      // parameter.schema = schema.build();
    }

    final contentNode = parameterNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkRequiredFields([_mediaTypePattern]);
      contentNode.checkAllowedFields([_mediaTypePattern, _extensionPattern]);

      if (contentNode.nodes.length > 1) {
        throw Exception('OpenAPI header has multiple content types');
      }

      final MapEntry(key: contentType, value: node) =
          contentNode.nodes.entries.first;
      final mediaTypeNode = node.getAs<YamlMap>();
      if (mediaTypeNode == null) {
        throw Exception('OpenAPI media type was not provided');
      }

      final mediaType = _loadMediaType(mediaTypeNode);
      parameter.content = (
        MediaType.parse(contentType as String),
        mediaType.build(),
      );
    }

    return parameter;
  }

  OpenApiRequestBodyBuilder _loadRequestBody(
    YamlMap requestBodyNode, {
    bool allowRef = true,
  }) {
    if (requestBodyNode.nodes[r'$ref']?.value case final String ref) {
      if (!allowRef) {
        throw Exception('OpenAPI request body reference is not allowed');
      }
      return _ref<OpenApiRequestBodyBuilder>(ref);
    }

    requestBodyNode.checkAllowedFields([
      'content',
      'description',
      'required',
      _extensionPattern,
    ]);

    final requestBody = OpenApiRequestBodyBuilder();
    requestBody.description =
        requestBodyNode.nodes['description']?.value as String?;
    requestBody.required = requestBodyNode.nodes['required']?.value as bool?;

    final contentNode = requestBodyNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkAllowedFields([_mediaTypePattern, _extensionPattern]);

      for (final entry in contentNode.nodes.entries) {
        final mediaTypeNode = entry.value.getAs<YamlMap>();
        if (mediaTypeNode == null) {
          throw Exception('OpenAPI media type is not a map');
        }

        final mediaType = _loadMediaType(mediaTypeNode);
        requestBody.content[MediaType.parse(entry.key as String)] =
            mediaType.build();
      }
    }

    return requestBody;
  }

  OpenApiHeaderBuilder _loadHeader(YamlMap headerNode, {bool allowRef = true}) {
    if (headerNode.nodes[r'$ref']?.value case final String ref) {
      if (!allowRef) {
        throw Exception('OpenAPI header reference is not allowed');
      }
      return _ref<OpenApiHeaderBuilder>(ref);
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

    final header = OpenApiHeaderBuilder();
    header.description = headerNode.nodes['description']?.value as String?;
    header.required = headerNode.nodes['required']?.value as bool? ?? false;

    final schemaNode = headerNode.nodes['schema'].getAs<YamlMap>();
    if (schemaNode != null) {
      final schema = _loadTypeSchema(schemaNode);
      // header.schema = schema.build();
    }

    final contentNode = headerNode.nodes['content'].getAs<YamlMap>();
    if (contentNode != null) {
      contentNode.checkRequiredFields([_mediaTypePattern]);
      contentNode.checkAllowedFields([_mediaTypePattern, _extensionPattern]);

      if (contentNode.nodes.length > 1) {
        throw Exception('OpenAPI header has multiple content types');
      }

      final MapEntry(key: contentType, value: node) =
          contentNode.nodes.entries.first;
      final mediaTypeNode = node.getAs<YamlMap>();
      if (mediaTypeNode == null) {
        throw Exception('OpenAPI media type was not provided');
      }

      final mediaType = _loadMediaType(mediaTypeNode);
      header.content = (
        MediaType.parse(contentType as String),
        mediaType.build(),
      );
    }

    return header;
  }

  OpenApiMediaTypeBuilder _loadMediaType(YamlMap mediaTypeNode) {
    mediaTypeNode.checkRequiredFields(['schema']);
    mediaTypeNode.checkAllowedFields([
      'example',
      'examples',
      'encoding',
      'schema',
      _extensionPattern,
    ]);

    final mediaType = OpenApiMediaTypeBuilder();
    // mediaType.example = mediaTypeNode.nodes['example']?.value as String?;
    final schema = mediaTypeNode.nodes['schema'].getAs<YamlMap>()!;
    // mediaType.schema = _loadTypeSchema(schema).build();

    final encodingNode = mediaTypeNode.nodes['encoding'].getAs<YamlMap>();
    if (encodingNode != null) {
      encodingNode.checkAllowedFields([_mediaTypePattern, _extensionPattern]);

      for (final entry in encodingNode.nodes.entries) {
        final encoding = OpenApiEncodingBuilder();
        // encoding.contentType = entry.key as String;
        final encodingNode = entry.value.getAs<YamlMap>()!;
        encodingNode.checkAllowedFields([
          'allowReserved',
          'contentType',
          'explode',
          'headers',
          'style',
          _extensionPattern,
        ]);

        encoding.allowReserved =
            encodingNode.nodes['allowReserved']?.value as bool?;
        final contentType =
            encodingNode.nodes['contentType']?.value
                as String?; // TODO: fallback
        encoding.contentType = MediaType.parse(contentType!);
        encoding.explode =
            encodingNode.nodes['explode']?.value as bool? ?? false;

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
          for (final headerEntry in headersNode.nodes.entries) {
            final headerNode = headerEntry.value.getAs<YamlMap>();
            if (headerNode == null) {
              throw Exception('OpenAPI header is not a map');
            }

            final header = _loadHeader(headerNode);
            encoding.headers[headerEntry.key as String] = header.build();
          }
        }
      }
    }

    return mediaType;
  }
}

extension on YamlNode? {
  Node? getAs<Node extends YamlNode>() {
    final this_ = this;
    if (this_ is! Node) {
      throw Exception('Expected a $Node but got a $runtimeType');
    }
    return this_;
  }
}

extension on YamlMap {
  void checkRequiredFields(Iterable<Pattern> requiredFields) {
    final unmatched = List.of(requiredFields);
    for (final MapEntry(:key) in nodes.entries) {
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
      final location = span;
      throw Exception('Missing required OpenAPI fields: $unmatched');
    }
  }

  void checkAllowedFields(Iterable<Pattern> allowedPatterns) {
    final invalid = <(String, YamlNode)>[];
    for (final MapEntry(:key, value: node) in nodes.entries) {
      var goodKey = false;
      if (key is String) {
        for (final allowedPattern in allowedPatterns) {
          if (allowedPattern.allMatches(key).isNotEmpty) {
            goodKey = true;
            break;
          }
        }
      }
      if (!goodKey) {
        invalid.add((key, node));
      }
    }
    if (invalid.isNotEmpty) {
      throw Exception('Invalid keys: $invalid');
    }
  }
}

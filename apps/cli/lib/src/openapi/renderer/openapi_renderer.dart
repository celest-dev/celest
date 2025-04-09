import 'package:celest_cli/src/openapi/ast/openapi_ast.dart';
import 'package:celest_cli/src/openapi/ast/openapi_visitor.dart';
import 'package:source_span/source_span.dart';
// ignore: implementation_imports
import 'package:yaml/src/null_span.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

extension OpenApiRenderer on OpenApiDocument {
  YamlDocument toYamlDocument() {
    final renderer = _OpenApiDocumentRenderer();
    final contents = accept(renderer);
    final rendered = contents.toString();
    return YamlDocument.internal(
      contents,
      SourceFile.fromString(rendered).span(0),
      null,
      const [],
    );
  }

  String toYaml() {
    final renderer = _OpenApiRenderer();
    accept(renderer);
    return renderer._editor.toString();
  }
}

final class _OpenApiRenderer extends _OpenApiDocumentRenderer {
  _OpenApiRenderer() : super(useCachedNode: false);

  late final YamlEditor _editor;

  @override
  YamlNode visitDocument(OpenApiDocument document) {
    _editor = YamlEditor('''
openapi:
info:
servers:
paths:
components:
  schemas:
  responses:
  parameters:
  requestBodies:
  headers:
  paths:
  securitySchemes:
security:
''');
    // Always use the document version as specified if available.
    final version = switch (document.node) {
      final YamlMap node => YamlScalar.wrap(
          node.nodes['openapi']?.value,
          style: ScalarStyle.SINGLE_QUOTED,
        ),
      _ => YamlScalar.wrap(
          document.version.toString(),
          style: ScalarStyle.SINGLE_QUOTED,
        ),
    };
    _editor.update(['openapi'], version);
    _editor.update(['info'], document.info.accept(this));
    if (document.servers.isNotEmpty) {
      _editor.update(
        ['servers'],
        _list(
          document.servers.map((server) => server.accept(this)).toList(),
        ),
      );
    } else {
      _editor.remove(['servers']);
    }
    if (document.paths.isNotEmpty) {
      _editor.update(
        ['paths'],
        _map({
          for (final entry in document.paths.entries)
            YamlScalar.wrap(entry.key, style: ScalarStyle.SINGLE_QUOTED):
                entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['paths']);
    }
    if (document.components.schemas.isNotEmpty) {
      _editor.update(
        ['components', 'schemas'],
        _map({
          for (final entry in document.components.schemas.entries)
            entry.key: entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['components', 'schemas']);
    }
    if (document.components.responses.isNotEmpty) {
      _editor.update(
        ['components', 'responses'],
        _map({
          for (final entry in document.components.responses.entries)
            entry.key: entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['components', 'responses']);
    }
    if (document.components.parameters.isNotEmpty) {
      _editor.update(
        ['components', 'parameters'],
        _map({
          for (final entry in document.components.parameters.entries)
            entry.key: entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['components', 'parameters']);
    }
    if (document.components.requestBodies.isNotEmpty) {
      _editor.update(
        ['components', 'requestBodies'],
        _map({
          for (final entry in document.components.requestBodies.entries)
            entry.key: entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['components', 'requestBodies']);
    }
    if (document.components.headers.isNotEmpty) {
      _editor.update(
        ['components', 'headers'],
        _map({
          for (final entry in document.components.headers.entries)
            entry.key: entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['components', 'headers']);
    }
    if (document.components.paths.isNotEmpty) {
      _editor.update(
        ['components', 'paths'],
        _map({
          for (final entry in document.components.paths.entries)
            YamlScalar.wrap(entry.key, style: ScalarStyle.SINGLE_QUOTED):
                entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['components', 'paths']);
    }
    if (document.components.securitySchemes.isNotEmpty) {
      _editor.update(
        ['components', 'securitySchemes'],
        _map({
          for (final entry in document.components.securitySchemes.entries)
            entry.key: entry.value.accept(this),
        }),
      );
    } else {
      _editor.remove(['components', 'securitySchemes']);
    }
    if (document.securityRequirements.isNotEmpty) {
      _editor.update(
        ['security'],
        _list(
          document.securityRequirements
              .map((requirement) => requirement.accept(this))
              .toList(),
        ),
      );
    } else {
      _editor.remove(['security']);
    }
    return super.visitDocument(document);
  }
}

YamlMap _map(Map<Object /* String | YamlNode */, Object> nodes) {
  return wrapAsYamlNode(
    nodes.map(
      (key, value) => MapEntry(
        key is YamlNode ? key : YamlScalar.wrap(key),
        switch (value) {
          YamlScalar(value: List() || Map()) => value.value,
          _ => value,
        },
      ),
    ),
    collectionStyle: CollectionStyle.BLOCK,
  ) as YamlMap;
}

YamlList _list(Iterable<YamlNode> nodes) {
  return wrapAsYamlNode(
    YamlList.internal(
      nodes.toList(),
      NullSpan(null),
      CollectionStyle.BLOCK,
    ),
    collectionStyle: CollectionStyle.BLOCK,
  ) as YamlList;
}

final class _OpenApiDocumentRenderer extends OpenApiVisitor<YamlNode> {
  _OpenApiDocumentRenderer({
    this.useCachedNode = true,
  });

  final bool useCachedNode;

  @override
  YamlNode visitDocument(OpenApiDocument document) {
    if (document.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'openapi': YamlScalar.wrap(
        document.version.toString(),
        style: ScalarStyle.SINGLE_QUOTED,
      ),
      'info': document.info.accept(this),
      if (document.servers.isNotEmpty)
        'servers': _list(
          document.servers.map((server) => server.accept(this)),
        ),
      if (document.paths.isNotEmpty)
        'paths': _map({
          for (final entry in document.paths.entries)
            YamlScalar.wrap(entry.key, style: ScalarStyle.SINGLE_QUOTED):
                entry.value.accept(this),
        }),
      'components': document.components.accept(this),
      if (document.securityRequirements.isNotEmpty)
        'security': _list([
          for (final requirement in document.securityRequirements)
            requirement.accept(this),
        ]),
    });
  }

  @override
  YamlNode visitComponents(OpenApiComponents components) {
    if (components.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'schemas': _map({
        for (final entry in components.schemas.entries)
          entry.key: entry.value.accept(this),
      }),
      'responses': _map({
        for (final entry in components.responses.entries)
          entry.key: entry.value.accept(this),
      }),
      'parameters': _map({
        for (final entry in components.parameters.entries)
          entry.key: entry.value.accept(this),
      }),
      'requestBodies': _map({
        for (final entry in components.requestBodies.entries)
          entry.key: entry.value.accept(this),
      }),
      'headers': _map({
        for (final entry in components.headers.entries)
          entry.key: entry.value.accept(this),
      }),
      'paths': _map({
        for (final entry in components.paths.entries)
          YamlScalar.wrap(entry.key, style: ScalarStyle.SINGLE_QUOTED):
              entry.value.accept(this),
      }),
      'securitySchemes': _map({
        for (final entry in components.securitySchemes.entries)
          entry.key: entry.value.accept(this),
      }),
    });
  }

  @override
  YamlNode visitDiscriminator(OpenApiDiscriminator discriminator) {
    if (discriminator.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'propertyName': YamlScalar.wrap(discriminator.propertyName),
      if (discriminator.mapping case final mapping? when mapping.isNotEmpty)
        'mapping': _map({
          for (final entry in mapping.entries)
            entry.key: YamlScalar.wrap(
              entry.value,
              style: ScalarStyle.SINGLE_QUOTED,
            ),
        }),
    });
  }

  @override
  YamlNode visitEncoding(OpenApiEncoding encoding) {
    if (encoding.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'contentType': YamlScalar.wrap(encoding.contentType.toString()),
      if (encoding.headers.isNotEmpty)
        'headers': _map({
          for (final entry in encoding.headers.entries)
            entry.key: entry.value.accept(this),
        }),
      if (encoding.style case final style?)
        'style': YamlScalar.wrap(style.name),
      if (encoding.explode) 'explode': YamlScalar.wrap(encoding.explode),
      if (encoding.allowReserved)
        'allowReserved': YamlScalar.wrap(encoding.allowReserved),
    });
  }

  @override
  YamlNode visitHeader(OpenApiHeader header) {
    if (header.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      if (header.description != null)
        'description': YamlScalar.wrap(
          header.description,
          style: ScalarStyle.LITERAL,
        ),
      if (header.required) 'required': YamlScalar.wrap(header.required),
      if (header.deprecated) 'deprecated': YamlScalar.wrap(header.deprecated),
      if (header.allowEmptyValue)
        'allowEmptyValue': YamlScalar.wrap(header.allowEmptyValue),
      if (header.style case final style?) 'style': YamlScalar.wrap(style.name),
      if (header.explode case final explode?)
        'explode': YamlScalar.wrap(explode),
      if (header.allowReserved case final allowReserved?)
        'allowReserved': YamlScalar.wrap(allowReserved),
      if (header.schema case final schema) 'schema': schema.accept(this),
      if (header.content case final content?)
        'content': _map({
          content.$1.toString(): content.$2.accept(this),
        }),
    });
  }

  @override
  YamlNode visitInfo(OpenApiInfo info) {
    if (info.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      if (info.title != null) 'title': YamlScalar.wrap(info.title),
      if (info.description != null)
        'description': YamlScalar.wrap(
          info.description,
          style: ScalarStyle.LITERAL,
        ),
      if (info.apiVersion != null)
        'version': YamlScalar.wrap(
          info.apiVersion,
          style: ScalarStyle.SINGLE_QUOTED,
        ),
    });
  }

  @override
  YamlNode visitMediaType(OpenApiMediaType mediaType) {
    if (mediaType.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'schema': mediaType.schema.accept(this),
      if (mediaType.encoding.isNotEmpty)
        'encoding': _map({
          for (final entry in mediaType.encoding.entries)
            entry.key: entry.value.accept(this),
        }),
    });
  }

  @override
  YamlNode visitOperation(OpenApiOperation operation) {
    if (operation.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      if (operation.summary != null)
        'summary': YamlScalar.wrap(operation.summary),
      if (operation.description != null)
        'description': YamlScalar.wrap(
          operation.description,
          style: ScalarStyle.LITERAL,
        ),
      if (operation.deprecated)
        'deprecated': YamlScalar.wrap(operation.deprecated),
      if (operation.operationId != null)
        'operationId': YamlScalar.wrap(operation.operationId),
      if (operation.parameters.isNotEmpty)
        'parameters': _list(
          operation.parameters
              .map((parameter) => parameter.accept(this))
              .toList(),
        ),
      if (operation.requestBody case final requestBody?)
        'requestBody': requestBody.accept(this),
      if (operation.responses.isNotEmpty || operation.defaultResponse != null)
        'responses': _map({
          for (final entry in operation.responses.entries)
            YamlScalar.wrap(
              entry.key.toString(),
              style: ScalarStyle.SINGLE_QUOTED,
            ): entry.value.accept(this),
          if (operation.defaultResponse case final defaultResponse?)
            'default': defaultResponse.accept(this),
        }),
      if (operation.servers case final servers? when servers.isNotEmpty)
        'servers': _list(
          servers.map((server) => server.accept(this)).toList(),
        ),
    });
  }

  @override
  YamlNode visitParameter(OpenApiParameter parameter) {
    if (parameter.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'name': YamlScalar.wrap(parameter.name),
      'in': YamlScalar.wrap(parameter.location.name),
      'required': YamlScalar.wrap(parameter.required),
      if (parameter.description != null)
        'description': YamlScalar.wrap(
          parameter.description,
          style: ScalarStyle.LITERAL,
        ),
      if (parameter.deprecated)
        'deprecated': YamlScalar.wrap(parameter.deprecated),
      if (parameter.allowEmptyValue)
        'allowEmptyValue': YamlScalar.wrap(parameter.allowEmptyValue),
      if (parameter.style case final style?)
        'style': YamlScalar.wrap(style.name),
      if (parameter.explode case final explode?)
        'explode': YamlScalar.wrap(explode),
      if (parameter.allowReserved case final allowReserved?)
        'allowReserved': YamlScalar.wrap(allowReserved),
      if (parameter.schema case final schema?) 'schema': schema.accept(this),
      if (parameter.content case final content?)
        'content': _map({
          content.$1.toString(): content.$2.accept(this),
        }),
    });
  }

  @override
  YamlNode visitPathItem(OpenApiPathItem pathItem) {
    if (pathItem.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      for (final operation in pathItem.operations.values)
        operation.type.name: operation.accept(this),
      if (pathItem.parameters.isNotEmpty)
        'parameters': _list(
          pathItem.parameters
              .map((parameter) => parameter.accept(this))
              .toList(),
        ),
      if (pathItem.servers case final servers? when servers.isNotEmpty)
        'servers': _list(
          servers.map((server) => server.accept(this)).toList(),
        ),
    });
  }

  @override
  YamlNode visitReference(OpenApiReference reference) {
    if (reference.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      r'$ref': YamlScalar.wrap(
        reference.ref,
        style: ScalarStyle.SINGLE_QUOTED,
      ),
    });
  }

  @override
  YamlNode visitRequestBody(OpenApiRequestBody requestBody) {
    if (requestBody.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      if (requestBody.description != null)
        'description': YamlScalar.wrap(
          requestBody.description,
          style: ScalarStyle.LITERAL,
        ),
      if (requestBody.content.isNotEmpty)
        'content': _map({
          for (final entry in requestBody.content.entries)
            entry.key.toString(): entry.value.accept(this),
        }),
      if (requestBody.required)
        'required': YamlScalar.wrap(requestBody.required),
    });
  }

  @override
  YamlNode visitResponse(OpenApiResponse response) {
    if (response.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'description': YamlScalar.wrap(
        response.description,
        style: ScalarStyle.LITERAL,
      ),
      if (response.content.isNotEmpty)
        'content': _map({
          for (final entry in response.content.entries)
            entry.key.toString(): entry.value.accept(this),
        }),
      if (response.headers.isNotEmpty)
        'headers': _map({
          for (final entry in response.headers.entries)
            entry.key: entry.value.accept(this),
        }),
    });
  }

  @override
  YamlNode visitSchema(OpenApiSchema schema) {
    if (schema.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      if (schema.title != null) 'title': YamlScalar.wrap(schema.title),
      if (schema.description != null)
        'description': YamlScalar.wrap(
          schema.description,
          style: ScalarStyle.LITERAL,
        ),
      if (schema.type case final type?)
        'type': switch (type) {
          ItemValue() => YamlScalar.wrap(type.value.toYaml()),
          ItemList() => _list(type.map((it) => YamlScalar.wrap(it.toYaml()))),
        },
      if (schema.nullable case final nullable?)
        'nullable': YamlScalar.wrap(nullable),
      if (schema.allOf case final allOf? when allOf.isNotEmpty)
        'allOf': _list(
          allOf.map((schema) => schema.accept(this)).toList(),
        ),
      if (schema.oneOf case final oneOf? when oneOf.isNotEmpty)
        'oneOf': _list(
          oneOf.map((schema) => schema.accept(this)).toList(),
        ),
      if (schema.anyOf case final anyOf? when anyOf.isNotEmpty)
        'anyOf': _list(
          anyOf.map((schema) => schema.accept(this)).toList(),
        ),
      if (schema.items case final items?) 'items': items.accept(this),
      if (schema.maxItems case final maxItems?)
        'maxItems': YamlScalar.wrap(maxItems),
      if (schema.minItems case final minItems?)
        'minItems': YamlScalar.wrap(minItems),
      if (schema.uniqueItems case final uniqueItems?)
        'uniqueItems': YamlScalar.wrap(uniqueItems),
      if (schema.properties case final properties? when properties.isNotEmpty)
        'properties': _map({
          for (final entry in properties.entries)
            entry.key: entry.value.accept(this),
        }),
      if (schema.additionalProperties case final additionalProperties?)
        'additionalProperties': additionalProperties.accept(this),
      if (schema.minProperties case final minProperties?)
        'minProperties': YamlScalar.wrap(minProperties),
      if (schema.maxProperties case final maxProperties?)
        'maxProperties': YamlScalar.wrap(maxProperties),
      if (schema.required case final required? when required.isNotEmpty)
        'required': _list(required.map(YamlScalar.wrap)),
      if (schema.format case final format?) 'format': YamlScalar.wrap(format),
      if (schema.multipleOf case final multipleOf?)
        'multipleOf': YamlScalar.wrap(multipleOf),
      if (schema.maximum case final maximum?)
        'maximum': YamlScalar.wrap(maximum),
      if (schema.exclusiveMaximum case final exclusiveMaximum?)
        'exclusiveMaximum': YamlScalar.wrap(exclusiveMaximum),
      if (schema.minimum case final minimum?)
        'minimum': YamlScalar.wrap(minimum),
      if (schema.exclusiveMinimum case final exclusiveMinimum?)
        'exclusiveMinimum': YamlScalar.wrap(exclusiveMinimum),
      if (schema.maxLength case final maxLength?)
        'maxLength': YamlScalar.wrap(maxLength),
      if (schema.minLength case final minLength?)
        'minLength': YamlScalar.wrap(minLength),
      if (schema.pattern != null) 'pattern': YamlScalar.wrap(schema.pattern),
      if (schema.enumValues case final enumValues? when enumValues.isNotEmpty)
        'enum': _list(enumValues.map(YamlScalar.wrap)),
      if (schema.discriminator case final discriminator?)
        'discriminator': discriminator.accept(this),
      if (schema.deprecated case final deprecated?)
        'deprecated': YamlScalar.wrap(deprecated),
      if (schema.defaultValue case final defaultValue?)
        'default': wrapAsYamlNode(
          defaultValue,
          collectionStyle: CollectionStyle.FLOW,
          scalarStyle: ScalarStyle.PLAIN,
        ),
      if (schema.readOnly case final readOnly?)
        'readOnly': YamlScalar.wrap(readOnly),
      if (schema.writeOnly case final writeOnly?)
        'writeOnly': YamlScalar.wrap(writeOnly),
      if (schema.extensions case final extensions?)
        for (final extension in extensions.entries)
          extension.key: wrapAsYamlNode(extension.value.value),
    });
  }

  @override
  YamlNode visitAdditionalProperties(
    OpenApiAdditionalProperties additionalProperties,
  ) {
    if (additionalProperties.node case final node? when useCachedNode) {
      return node;
    }
    if (additionalProperties.allow case final allow?) {
      return YamlScalar.wrap(allow);
    }
    if (additionalProperties.schema case final schema?) {
      return schema.accept(this);
    }
    throw StateError(
      'Expected either allow or schema, got $additionalProperties',
    );
  }

  @override
  YamlNode visitServer(OpenApiServer server) {
    if (server.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'url': YamlScalar.wrap(server.url),
      if (server.description != null)
        'description': YamlScalar.wrap(server.description),
      if (server.variables.isNotEmpty)
        'variables': _map({
          for (final MapEntry(:key, :value) in server.variables.entries)
            key: value.accept(this),
        }),
    });
  }

  @override
  YamlNode visitServerVariable(OpenApiServerVariable serverVariable) {
    if (serverVariable.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'default': YamlScalar.wrap(serverVariable.defaultValue),
      if (serverVariable.enumValues case final enumValues?
          when enumValues.isNotEmpty)
        'enum': _list(enumValues.map(YamlScalar.wrap)),
      if (serverVariable.description != null)
        'description': YamlScalar.wrap(serverVariable.description),
    });
  }

  @override
  YamlNode visitOAuthFlow(OpenApiOAuthFlow oauthFlow) {
    if (oauthFlow.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      if (oauthFlow.authorizationUrl case final authorizationUrl?)
        'authorizationUrl': YamlScalar.wrap(authorizationUrl),
      if (oauthFlow.tokenUrl case final tokenUrl?)
        'tokenUrl': YamlScalar.wrap(tokenUrl),
      if (oauthFlow.refreshUrl case final refreshUrl?)
        'refreshUrl': YamlScalar.wrap(refreshUrl),
      if (oauthFlow.scopes.isNotEmpty)
        'scopes': _map({
          for (final entry in oauthFlow.scopes.entries)
            entry.key: YamlScalar.wrap(entry.value),
        }),
    });
  }

  @override
  YamlNode visitOAuthFlows(OpenApiOAuthFlows oauthFlows) {
    if (oauthFlows.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      if (oauthFlows.implicit case final implicit?)
        'implicit': implicit.accept(this),
      if (oauthFlows.password case final password?)
        'password': password.accept(this),
      if (oauthFlows.clientCredentials case final clientCredentials?)
        'clientCredentials': clientCredentials.accept(this),
      if (oauthFlows.authorizationCode case final authorizationCode?)
        'authorizationCode': authorizationCode.accept(this),
    });
  }

  @override
  YamlNode visitSecurityScheme(OpenApiSecurityScheme securityScheme) {
    if (securityScheme.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      'type': YamlScalar.wrap(securityScheme.type.name),
      if (securityScheme.description case final description?)
        'description': YamlScalar.wrap(description),
      if (securityScheme.name case final name?) 'name': YamlScalar.wrap(name),
      if (securityScheme.location case final location?)
        'in': YamlScalar.wrap(location.name),
      if (securityScheme.scheme case final scheme?)
        'scheme': YamlScalar.wrap(scheme),
      if (securityScheme.bearerFormat case final bearerFormat?)
        'bearerFormat': YamlScalar.wrap(bearerFormat),
      if (securityScheme.flows case final flows?) 'flows': flows.accept(this),
      if (securityScheme.openIdConnectUrl case final openIdConnectUrl?)
        'openIdConnectUrl': YamlScalar.wrap(openIdConnectUrl),
    });
  }

  @override
  YamlNode visitSecurityRequirement(
    OpenApiSecurityRequirement securityRequirement,
  ) {
    if (securityRequirement.node case final node? when useCachedNode) {
      return node;
    }
    return _map({
      for (final entry in securityRequirement.schemes.entries)
        entry.key: _list(entry.value.map(YamlScalar.wrap)),
    });
  }
}

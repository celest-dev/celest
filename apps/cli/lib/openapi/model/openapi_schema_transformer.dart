// ignore_for_file: unused_import

import 'dart:async';

import 'package:aws_common/aws_common.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:celest_cli/openapi/model/openapi_schema_visitor.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/openapi_generator.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema_resolver.dart';
import 'package:celest_cli/openapi/type/openapi_type_system.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_cli/src/utils/run.dart';
import 'package:code_builder/code_builder.dart';
import 'package:http_parser/http_parser.dart';
import 'package:lib_openapi/openapi_v3.dart' as v3;
import 'package:path/path.dart';
import 'package:protobuf/protobuf.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

/// Transforms an OpenAPI schema proto to a Dart structure.
///
/// An OpenAPI schema in its raw form is not immediately suitable for codegen.
/// For example, schemas may be in [v3.Reference] form, which must be resolved
/// to a concrete schema before codegen can proceed.
///
/// Further, OpenAPI types are not compatible with the Dart type system. For
/// example, OpenAPI has `allOf` and `anyOf` types, which are not directly
/// representable in Dart, but can be mapped to Dart representations. This work
/// is performed here.
///
/// Instead of doing these inline at the codegen site, we run the resolver
/// as a first-pass step to prepare the schema for codegen.
final class OpenApiSchemaTransformer {
  OpenApiSchemaTransformer({
    required this.document,
    required this.typeSystem,
  });

  final v3.Document document;
  final OpenApiTypeSystem typeSystem;

  final OpenApiDocumentBuilder _builder = OpenApiDocumentBuilder();

  /// Resolves the schema to a concrete schema.
  ///
  /// This method will:
  /// - Resolve any [v3.Reference]s in the schema to their concrete form.
  OpenApiDocument resolve() {
    _resolveVersion();
    _resolveInfo();
    _resolveComponents();
    _resolveServers();
    _resolvePaths();
    return _builder.build();
  }

  static final _versionRegex = RegExp(r'^(\d+)\.(\d+)\.?(\d+)?$');

  void _resolveVersion() {
    final versionStr = document.openapi;
    final versionMatch = _versionRegex.firstMatch(versionStr);
    switch ((versionMatch?.group(1), versionMatch?.group(2))) {
      case (final major?, final minor?):
        final patch = versionMatch?.group(3) ?? '0';
        _builder.version = Version(
          int.parse(major),
          int.parse(minor),
          int.parse(patch),
        );
      default:
        unreachable('Could not parse version "$versionStr"');
    }
  }

  void _resolveInfo() {
    if (document.info.hasTitle()) {
      _builder.info.title = document.info.title;
    }
    if (document.info.hasVersion()) {
      _builder.info.apiVersion = document.info.version;
    }
    if (document.info.hasDescription()) {
      _builder.info.description = document.info.description;
    }
    // if (document.info.hasTermsOfService()) {
    //   _builder.info.termsOfService = document.info.termsOfService;
    // }
    // if (document.info.hasContact()) {
    //   _builder.info.contact = document.info.contact;
    // }
    // if (document.info.hasLicense()) {
    //   _builder.info.license = document.info.license;
    // }
  }

  void _resolveServers() {
    for (final server in document.servers) {
      _builder.servers.add(_transformServer(server));
    }
  }

  void _resolvePaths() {
    for (final path in document.paths.path) {
      final pathName = path.name;
      final pathItem = path.value;
      _builder.paths[pathName] = _transformPathItem(pathItem, pathName);
    }
  }

  void _resolveComponents() {
    for (final schema in document.components.schemas.additionalProperties) {
      final schemaName = schema.name;
      final schemaOrRef = schema.value;
      final resolved = _transformSchema(
        schemaOrRef.schema,
        name: schemaName,
        ref: '#/components/schemas/$schemaName',
      );
      _builder.components.schemas[schemaName] = resolved;
    }
    for (final parameter
        in document.components.parameters.additionalProperties) {
      final parameterName = parameter.name;
      final parameterValue = parameter.value;
      _builder.components.parameters[parameterName] =
          _transformParameter(_resolveParameter(parameterValue));
    }
    for (final requestBody
        in document.components.requestBodies.additionalProperties) {
      final requestBodyName = requestBody.name;
      final requestBodyValue = requestBody.value;
      _builder.components.requestBodies[requestBodyName] =
          _transformRequestBody(
        _resolveRequestBody(requestBodyValue),
      );
    }
    for (final response in document.components.responses.additionalProperties) {
      final responseName = response.name;
      final responseValue = response.value;
      _builder.components.responses[responseName] = _transformResponse(
        _resolveResponse(responseValue),
      );
    }
    for (final header in document.components.headers.additionalProperties) {
      final headerName = header.name;
      final headerValue = header.value;
      _builder.components.headers[headerName] =
          _transformHeader(_resolveHeader(headerValue));
    }
  }

  OpenApiServer _transformServer(v3.Server server) {
    return OpenApiServer.build((b) {
      b.url = server.url;
      b.description = server.description;

      for (final serverVar in server.variables.additionalProperties) {
        b.variables[serverVar.name] = OpenApiServerVariable.build((b) {
          b.name = serverVar.name;
          if (serverVar.value.hasDefault_2()) {
            b.defaultValue = serverVar.value.default_2;
          }
          if (serverVar.value.hasDescription()) {
            b.description = serverVar.value.description;
          }
          final enumTag = serverVar.value.getTagNumber('enum')!;
          if (serverVar.value.hasField(enumTag)) {
            b.enumValues.addAll(serverVar.value.enum_1);
          }
        });
      }
    });
  }

  OpenApiPathItem _transformPathItem(
    v3.PathItem pathItem,
    String pathName,
  ) {
    return OpenApiPathItem.build((b) {
      b.path = pathName;
      if (pathItem.hasSummary()) {
        b.summary = pathItem.summary;
      }
      if (pathItem.hasDescription()) {
        b.description = pathItem.description;
      }
      for (final method in OpenApiOperationType.values) {
        switch (method) {
          case OpenApiOperationType.delete:
            if (pathItem.hasDelete()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.delete,
                method,
              );
            }
          case OpenApiOperationType.get:
            if (pathItem.hasGet()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.get,
                method,
              );
            }
          case OpenApiOperationType.head:
            if (pathItem.hasHead()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.head,
                method,
              );
            }
          case OpenApiOperationType.options:
            if (pathItem.hasOptions()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.options,
                method,
              );
            }
          case OpenApiOperationType.patch:
            if (pathItem.hasPatch()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.patch,
                method,
              );
            }
          case OpenApiOperationType.post:
            if (pathItem.hasPost()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.post,
                method,
              );
            }
          case OpenApiOperationType.put:
            if (pathItem.hasPut()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.put,
                method,
              );
            }
          case OpenApiOperationType.trace:
            if (pathItem.hasTrace()) {
              b.operations[method] = _transformOperation(
                pathName,
                pathItem.trace,
                method,
              );
            }
        }
      }
      for (final server in pathItem.servers) {
        b.servers.add(_transformServer(server));
      }
      for (final parameterOrRef in pathItem.parameters) {
        final parameter = _resolveParameter(parameterOrRef);
        b.parameters.add(_transformParameter(parameter));
      }
    });
  }

  OpenApiParameter _transformParameter(v3.Parameter parameter) {
    return OpenApiParameter.build((b) {
      b.name = parameter.name;
      b.location = OpenApiParameterLocation.valueOf(parameter.in_2);
      if (parameter.hasDescription()) {
        b.description = parameter.description;
      }
      b.required = parameter.required;
      b.deprecated = parameter.deprecated;
      b.allowEmptyValue = parameter.allowEmptyValue;
      if (parameter.hasStyle()) {
        b.style = OpenApiParameterStyle.valueOf(parameter.style);
      }
      if (parameter.hasExplode()) {
        b.explode = parameter.explode;
      }
      if (parameter.hasAllowReserved()) {
        b.allowReserved = parameter.allowReserved;
      }
      if (parameter.hasSchema()) {
        b.schema = _transformSchemaOrRef(parameter.schema);
      }
      final contents = parameter.content.additionalProperties;
      if (parameter.hasContent() && contents.isNotEmpty) {
        if (contents.length > 1) {
          throw StateError('Spec disallows this');
        }
        final content = contents.first;
        final key = MediaType.parse(content.name);
        final value = _transformMediaType(
          content.value,
          key,
        );
        b.content = (key, value);
      }
    });
  }

  OpenApiOperation _transformOperation(
    String path,
    v3.Operation operation,
    OpenApiOperationType type,
  ) {
    return OpenApiOperation.build((b) {
      final operationName =
          operation.hasOperationId() && operation.operationId.isNotEmpty
              ? operation.operationId
              : '${type.name}_$path';
      b.name = operationName;
      b.path = path;
      b.type = type;
      if (operation.hasSummary()) {
        b.summary = operation.summary;
      }
      if (operation.hasDescription()) {
        b.description = operation.description;
      }
      if (operation.hasOperationId() && operation.operationId.isNotEmpty) {
        b.operationId = operation.operationId;
      }
      for (final tag in operation.tags) {
        b.tags.add(tag);
      }
      for (final parameterOrRef in operation.parameters) {
        final parameter = _resolveParameter(parameterOrRef);
        b.parameters.add(_transformParameter(parameter));
      }

      if (operation.hasRequestBody()) {
        final requestBody = _resolveRequestBody(operation.requestBody);
        b.requestBody.replace(_transformRequestBody(requestBody));
      }
      if (operation.hasResponses()) {
        if (operation.responses.hasDefault_1()) {
          final response = _resolveResponse(operation.responses.default_1);
          b.defaultResponse.replace(
            _transformResponse(response),
          );
        }
        for (final responseOrRef in operation.responses.responseOrReference) {
          final statusCode = int.parse(responseOrRef.name);
          final response = _resolveResponse(responseOrRef.value);
          final value = _transformResponse(response);
          b.responses[statusCode] = value;
        }
      }
      if (operation.hasDeprecated()) {
        b.deprecated = operation.deprecated;
      }
      for (final server in operation.servers) {
        b.servers.add(_transformServer(server));
      }
    });
  }

  OpenApiRequestBody _transformRequestBody(
    v3.RequestBody requestBody,
  ) {
    return OpenApiRequestBody.build((b) {
      b.required = requestBody.required;
      if (requestBody.hasDescription()) {
        b.description = requestBody.description;
      }
      for (final content in requestBody.content.additionalProperties) {
        final key = MediaType.parse(content.name);
        final value = _transformMediaType(
          content.value,
          key,
        );
        b.content[key] = value;
      }
    });
  }

  OpenApiMediaType _transformMediaType(
    v3.MediaType mediaType,
    MediaType contentType,
  ) {
    return OpenApiMediaType.build((b) {
      b.contentType = contentType;
      b.schema = _transformSchemaOrRef(
        mediaType.schema,
      );
      if (mediaType.hasEncoding()) {
        for (final encodings in mediaType.encoding.additionalProperties) {
          final propertyName = encodings.name;
          final encoding = encodings.value;
          b.encoding[propertyName] = OpenApiEncoding.build((b) {
            try {
              b.contentType = MediaType.parse(encoding.contentType);
            } catch (e) {
              // TODO:
              b.contentType = MediaType('', '');
            }
            if (encoding.hasHeaders()) {
              for (final headerOrRef in encoding.headers.additionalProperties) {
                final headerName = headerOrRef.name;
                final header = _resolveHeader(headerOrRef.value);
                b.headers[headerName] = _transformHeader(header);
              }
            }
            if (encoding.hasStyle()) {
              b.style = OpenApiParameterStyle.valueOf(encoding.style);
            }
            if (encoding.hasExplode()) {
              b.explode = encoding.explode;
            } else {
              // When [style] is `form`, the default value is `true`.
              //
              // For all other styles, the default value is `false`.
              b.explode = b.style == OpenApiParameterStyle.form;
            }
            if (encoding.hasAllowReserved()) {
              b.allowReserved = encoding.allowReserved;
            }
          });
        }
      }
    });
  }

  OpenApiHeader _transformHeader(v3.Header header) {
    return OpenApiHeader.build((b) {
      final schema = _transformSchemaOrRef(header.schema);
      b.schema = schema;
      if (header.hasDescription()) {
        b.description = header.description;
      }
      if (header.hasRequired()) {
        b.required = header.required;
      }
      if (header.hasDeprecated()) {
        b.deprecated = header.deprecated;
      }
      if (header.hasAllowEmptyValue()) {
        b.allowEmptyValue = header.allowEmptyValue;
      }
      if (header.hasStyle()) {
        b.style = OpenApiParameterStyle.valueOf(header.style);
      }
      if (header.hasExplode()) {
        b.explode = header.explode;
      }
      if (header.hasAllowReserved()) {
        b.allowReserved = header.allowReserved;
      }
    });
  }

  OpenApiResponse _transformResponse(v3.Response response) {
    return OpenApiResponse.build((b) {
      b.description = response.description;
      if (response.hasHeaders()) {
        for (final headerOrRef in response.headers.additionalProperties) {
          final headerName = headerOrRef.name;
          final header = _resolveHeader(headerOrRef.value);
          b.headers[headerName] = _transformHeader(header);
        }
      }
      if (response.hasContent()) {
        for (final content in response.content.additionalProperties) {
          final key = MediaType.parse(content.name);
          final value = _transformMediaType(
            content.value,
            key,
          );
          b.content[key] = value;
        }
      }
    });
  }

  final _cachedSchemas = <v3.Schema, OpenApiTypeSchema>{};

  OpenApiTypeSchema _transformSchema(
    v3.Schema schema, {
    String? name,
    String? ref,
  }) {
    if (_cachedSchemas[schema] case final cached?) {
      return cached;
    }

    final extensions = BuiltMap.of({
      for (final extension in schema.specificationExtension)
        extension.name: JsonObject(loadYamlNode(extension.value.yaml).value),
    });

    final title = schema.hasTitle() ? schema.title : null;
    final description = schema.hasDescription() ? schema.description : null;
    final isDeprecated = schema.deprecated;

    Object? defaultValue;
    if (schema.hasDefault_33()) {
      final schemaDefault = schema.default_33;
      defaultValue = switch (schema) {
        _ when schemaDefault.hasBoolean() => schemaDefault.boolean,
        _ when schemaDefault.hasNumber() => schemaDefault.number,
        _ when schemaDefault.hasString() => schemaDefault.string,
        _ => null, // TODO: Tripped by bugs/issue_11957 when throw here. Why?
      };
    }
    final readOnly = schema.readOnly;
    final writeOnly = schema.writeOnly;

    final discriminator = schema.hasDiscriminator()
        ? OpenApiDiscriminator(
            propertyName: schema.discriminator.propertyName,
            mapping: {
              for (final mapping
                  in schema.discriminator.mapping.additionalProperties)
                mapping.name: mapping.value,
            },
          )
        : null;

    return _cachedSchemas[schema] = _transformTypeSchema(schema).rebuild((b) {
      b
        ..ref = ref
        ..name = name
        ..title = title
        ..description = description
        ..isDeprecated = isDeprecated
        ..defaultValue = defaultValue?.let(JsonObject.new)
        ..readOnly = readOnly
        ..writeOnly = writeOnly
        ..extensions.replace(extensions)
        ..required.addAll(schema.required);
      if (discriminator != null) {
        b.discriminator.replace(discriminator);
      }
    });
  }

  OpenApiTypeSchema _transformSchemaOrRef(
    v3.SchemaOrReference schemaOrRef, [
    Set<v3.Schema>? seen,
  ]) {
    if (schemaOrRef.hasReference()) {
      final ref = schemaOrRef.reference.ref;
      assert(ref.startsWith('#/components/schemas/'));
      final name = ref.split('/').last;
      return OpenApiTypeSchemaReference(
        name: name,
        ref: ref,
      );
    }
    final schema = schemaOrRef.schema;
    return _transformSchema(schema);
  }

  v3.Schema _mergeAllOf(v3.Schema schema) {
    final schemas = schema.allOf.map((schemaOrRef) {
      if (schemaOrRef.hasSchema()) {
        return schemaOrRef.schema;
      }
      final ref = schemaOrRef.reference.ref;
      assert(ref.startsWith('#/components/schemas/'));
      final name = ref.split('/').last;
      return document.components.schemas.additionalProperties
          .firstWhere((el) => el.name == name)
          .value
          .schema;
    }).toList();

    if (schemas.length == 1) {
      return schemas.first;
    }

    final merged = v3.Schema()
      ..mergeFromMessage(schema)
      ..allOf.clear();

    if (schemas.any((schema) => schema.hasType() && schema.type != 'object')) {
      throw StateError('Schema without object type: $schemas');
    }

    final properties = <String, v3.SchemaOrReference>{
      for (final property in merged.properties.additionalProperties)
        property.name: property.value,
    };
    final required = <String>{...merged.required};
    OpenApiDiscriminatorBuilder? discriminator;
    if (schema.hasDiscriminator()) {
      discriminator = OpenApiDiscriminatorBuilder();
      discriminator.propertyName = schema.discriminator.propertyName;
      for (final mapping in schema.discriminator.mapping.additionalProperties) {
        discriminator.mapping[mapping.name] = mapping.value;
      }
    }

    for (final branch in schemas) {
      for (final property in branch.properties.additionalProperties) {
        properties[property.name] = property.value;
      }
      required.addAll(branch.required);
      if (branch.hasDiscriminator()) {
        final propertyName = branch.discriminator.propertyName;
        assert(
          discriminator?.propertyName == null ||
              discriminator?.propertyName == propertyName,
        );
        discriminator ??= OpenApiDiscriminatorBuilder()
          ..propertyName = propertyName;
        for (final mapping
            in branch.discriminator.mapping.additionalProperties) {
          discriminator.mapping[mapping.name] = mapping.value;
        }
      }
    }

    merged.properties = v3.Properties(
      additionalProperties: properties.entries.map(
        (entry) => v3.NamedSchemaOrReference(
          name: entry.key,
          value: entry.value,
        ),
      ),
    );
    merged.required
      ..clear()
      ..addAll(required);

    if (discriminator != null) {
      final mergedDiscriminator = discriminator.build();
      merged.discriminator = v3.Discriminator(
        propertyName: mergedDiscriminator.propertyName,
        mapping: v3.Strings(
          additionalProperties: mergedDiscriminator.mapping?.entries.map(
            (entry) => v3.NamedString(name: entry.key, value: entry.value),
          ),
        ),
      );
    }

    return merged.freeze() as v3.Schema;
  }

  OpenApiTypeSchema _transformTypeSchema(
    v3.Schema schema, [
    Set<v3.Schema>? seen,
  ]) {
    seen ??= Set.identity();
    if (!seen.add(schema)) {
      // Change recursive types (array, oneOf, etc.) to OpenApiType Function() to prevent
      // infinite recursion.
      //
      // Non-collection types should throw though... ?
      throw UnimplementedError('Recursive type: $schema');
    }

    bool? isNullable;
    if (schema.hasNullable()) {
      isNullable = schema.nullable;
    }

    if (schema.allOf.isNotEmpty) {
      if (schema.allOf.length == 1) {
        final typeSchema = _transformTypeSchema(
          _resolveSchema(schema.allOf.single),
        );
        return typeSchema;
      }
      return _transformTypeSchema(_mergeAllOf(schema));
    }
    if (schema.anyOf.isNotEmpty) {
      if (schema.anyOf.length == 1) {
        final typeSchema = _transformTypeSchema(
          _resolveSchema(schema.anyOf.single),
        );
        return typeSchema
            .withNullability(isNullable ?? typeSchema.isNullableOrFalse);
      }
      final types = schema.anyOf.map(_transformSchemaOrRef).toList();
      // TODO: Needed? When?
      // if (discriminator == null) {
      //   return OpenApiSumTypeSchema(
      //     types: types,
      //     discriminator: null,
      //     isNullable: isNullable,
      //   );
      // }
      // APIs like Stripe (mistakenly) use anyOf + discriminator for sealed
      // types instead of `oneOf` which would be more accurate.
      return OpenApiDisjointUnionTypeSchema(
        types: types,
        isNullable: isNullable,
      );
    }
    if (schema.oneOf.isNotEmpty) {
      if (schema.oneOf.length == 1) {
        final typeSchema = _transformTypeSchema(
          _resolveSchema(schema.oneOf.single),
        );
        return typeSchema
            .withNullability(isNullable ?? typeSchema.isNullableOrFalse);
      }
      final types = schema.oneOf.map(_transformSchemaOrRef).toList();
      return OpenApiDisjointUnionTypeSchema(
        types: types,
        isNullable: isNullable,
      );
    }

    String? name;
    // for (final extension in schema.specificationExtension) {
    //   if (extension.name == 'x-stripeResource') {
    //     final map = loadYamlNode(extension.value.yaml).value as Map;
    //     name = map['class_name'] as String?;
    //     if (map['in_package'] case final String inPackage when name != null) {
    //       name = '$inPackage$name';
    //     }
    //   }
    //   if (extension.name == 'x-stripeEvent') {
    //     // final map = loadYamlNode(extension.value.yaml).value as Map;
    //     // name = map['type'] as String?;
    //   }
    // }

    // TODO: Find citation for this, but seems correct.
    final type = schema.hasType() ? schema.type : 'object';
    final format = schema.hasFormat() ? schema.format : null;
    final baseType = switch (type) {
      'array' => OpenApiArrayTypeSchema(
          name: name,
          itemType: _transformSchemaOrRef(
            schema.items.schemaOrReference.single,
          ),
          uniqueItems: schema.uniqueItems,
          isNullable: isNullable,
        ),
      'boolean' => OpenApiBooleanTypeSchema(isNullable: isNullable),
      'integer' || 'int' || 'long' => OpenApiIntegerTypeSchema(
          format: format,
          isNullable: isNullable,
        ),
      'number' => OpenApiNumberTypeSchema(
          format: format,
          isNullable: isNullable,
        ),
      'object' => run(() {
          final properties = schema.properties.additionalProperties;
          if (properties.isNotEmpty) {
            return OpenApiStructTypeSchema(
              name: name,
              required: schema.required,
              fields: {
                for (final properties in schema.properties.additionalProperties)
                  properties.name: OpenApiFieldSchema(
                    name: properties.name,
                    schema: _transformSchemaOrRef(properties.value),
                  ),
              },
              isNullable: isNullable,
            );
          }
          if (!schema.hasAdditionalProperties()) {
            return OpenApiAnyTypeSchema(isNullable: isNullable ?? false);
          }
          final additionalProperties = schema.additionalProperties;
          if (additionalProperties.hasBoolean()) {
            return additionalProperties.boolean
                ? OpenApiRecordTypeSchema(
                    name: name,
                    valueType: OpenApiAnyTypeSchema(isNullable: true),
                    isNullable: isNullable,
                  )
                : OpenApiEmptyTypeSchema.instance;
          }
          assert(additionalProperties.hasSchemaOrReference());
          final additionalPropertiesType = _transformSchemaOrRef(
            additionalProperties.schemaOrReference,
          );
          return OpenApiRecordTypeSchema(
            name: name,
            valueType: additionalPropertiesType,
            isNullable: isNullable,
          );
        }),
      'string' => OpenApiStringTypeSchema(
          format: format,
          isNullable: isNullable,
        ),
      'null' => OpenApiNullTypeSchema.instance,
      // TODO
      'file' => OpenApiAnyTypeSchema(isNullable: true),
      _ => throw UnimplementedError('Unsupported type: $type'),
    };

    return switch (schema.enum_24) {
      [] => baseType,
      [final singleValue] => OpenApiSingleValueTypeSchema(
          baseType: baseType.withNullability(false),
          value: run(() {
            assert(singleValue.hasYaml());
            return JsonObject(loadYamlNode(singleValue.yaml).value);
          }),
          isNullable: false,
        ),
      final values => OpenApiEnumTypeSchema(
          name: name,
          baseType: baseType,
          values: values.map((value) {
            assert(value.hasYaml(), '$value');
            return JsonObject(loadYamlNode(value.yaml).value);
          }),
          isNullable: isNullable,
        ),
    };
  }

  v3.Schema _resolveSchema(v3.SchemaOrReference schemaOrRef) {
    if (schemaOrRef.hasSchema()) {
      return schemaOrRef.schema;
    }
    assert(schemaOrRef.reference.ref.startsWith('#/components/schemas/'));
    final parts = schemaOrRef.reference.ref.split('/');
    return document.components.schemas.additionalProperties
        .firstWhere((schema) => schema.name == parts.last)
        .value
        .schema;
  }

  v3.Parameter _resolveParameter(v3.ParameterOrReference paramOrRef) {
    if (paramOrRef.hasParameter()) {
      return paramOrRef.parameter;
    }
    assert(paramOrRef.reference.ref.startsWith('#/components/parameters/'));
    final parts = paramOrRef.reference.ref.split('/');
    return document.components.parameters.additionalProperties
        .firstWhere((parameter) => parameter.name == parts.last)
        .value
        .parameter;
  }

  v3.RequestBody _resolveRequestBody(v3.RequestBodyOrReference bodyOrRef) {
    if (bodyOrRef.hasRequestBody()) {
      return bodyOrRef.requestBody;
    }
    assert(bodyOrRef.reference.ref.startsWith('#/components/requestBodies/'));
    final parts = bodyOrRef.reference.ref.split('/');
    return document.components.requestBodies.additionalProperties
        .firstWhere((requestBody) => requestBody.name == parts.last)
        .value
        .requestBody;
  }

  v3.Header _resolveHeader(v3.HeaderOrReference headerOrRef) {
    if (headerOrRef.hasHeader()) {
      return headerOrRef.header;
    }
    assert(headerOrRef.reference.ref.startsWith('#/components/headers/'));
    final parts = headerOrRef.reference.ref.split('/');
    return document.components.headers.additionalProperties
        .firstWhere((header) => header.name == parts.last)
        .value
        .header;
  }

  v3.Response _resolveResponse(v3.ResponseOrReference responseOrRef) {
    if (responseOrRef.hasResponse()) {
      return responseOrRef.response;
    }
    assert(responseOrRef.reference.ref.startsWith('#/components/responses/'));
    final parts = responseOrRef.reference.ref.split('/');
    return document.components.responses.additionalProperties
        .firstWhere((response) => response.name == parts.last)
        .value
        .response;
  }
}

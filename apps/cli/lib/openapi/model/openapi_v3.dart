import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:http_parser/http_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'openapi_v3.g.dart';

/// This is the root object of the OpenAPI document.
///
/// https://spec.openapis.org/oas/v3.1.0#openapi-object
abstract class OpenApiDocument
    implements Built<OpenApiDocument, OpenApiDocumentBuilder> {
  factory OpenApiDocument({
    required Version version,
    required OpenApiInfo info,
    String? jsonSchemaDialect,
    List<OpenApiServer>? servers,
    Map<String, OpenApiPathItem>? paths,
    OpenApiComponents? components,
  }) {
    return _$OpenApiDocument._(
      version: version,
      info: info,
      jsonSchemaDialect: jsonSchemaDialect,
      servers: (servers ?? [OpenApiServer(url: '/')]).build(),
      paths: (paths ?? {}).build(),
      components: components ?? OpenApiComponents(),
    );
  }

  factory OpenApiDocument.build(
    void Function(OpenApiDocumentBuilder) updates,
  ) = _$OpenApiDocument;

  OpenApiDocument._();

  /// REQUIRED. This string MUST be the version number of the OpenAPI
  /// Specification that the OpenAPI document uses.
  ///
  /// The openapi field SHOULD be used by tooling to interpret the OpenAPI
  /// document.
  ///
  /// This is not related to the API [OpenApiDocumentInfo.apiVersion]
  /// (`info.version`) string.
  @JsonKey(name: 'openapi')
  Version get version;

  /// REQUIRED. Provides metadata about the API.
  ///
  /// The metadata MAY be used by tooling as required.
  OpenApiInfo get info;

  /// The default value for the $schema keyword within Schema Objects contained
  /// within this OAS document.
  ///
  /// This MUST be in the form of a URI.
  String? get jsonSchemaDialect;

  /// An array of Server Objects, which provide connectivity information to a
  /// target server.
  ///
  /// If the servers property is not provided, or is an empty array, the
  /// default value would be a Server Object with a url value of /.
  BuiltList<OpenApiServer> get servers;

  /// The available paths and operations for the API.
  ///
  /// The key of this map is a relative path to an individual endpoint.
  ///
  /// The field name MUST begin with a forward slash (/). The path is appended
  /// (no relative URL resolution) to the expanded URL from the Server Object’s
  /// [OpenApiServer.url] field in order to construct the full URL.
  ///
  /// Path templating is allowed. When matching URLs, concrete (non-templated)
  /// paths would be matched before their templated counterparts. Templated
  /// paths with the same hierarchy but different templated names MUST NOT
  /// exist as they are identical. In case of ambiguous matching, it’s up to
  /// the tooling to decide which one to use.
  BuiltMap<String, OpenApiPathItem> get paths;

  // TODO: webhooks

  /// An element to hold various schemas for the specification.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#components-object
  OpenApiComponents get components;
}

abstract class OpenApiInfo implements Built<OpenApiInfo, OpenApiInfoBuilder> {
  factory OpenApiInfo({
    String? title,
    String? description,
    String? apiVersion,
  }) {
    return _$OpenApiInfo._(
      title: title,
      description: description,
      apiVersion: apiVersion,
    );
  }

  factory OpenApiInfo.build(
    void Function(OpenApiInfoBuilder) updates,
  ) = _$OpenApiInfo;

  OpenApiInfo._();

  String? get title;
  String? get description;
  String? get apiVersion;
}

/// An object representing a Server.
///
/// https://spec.openapis.org/oas/v3.1.0#server-object
abstract class OpenApiServer
    implements Built<OpenApiServer, OpenApiServerBuilder> {
  factory OpenApiServer({
    required String url,
    String? description,
    Map<String, OpenApiServerVariable>? variables,
  }) {
    return _$OpenApiServer._(
      url: url,
      description: description,
      variables: (variables ?? {}).build(),
    );
  }

  factory OpenApiServer.build(
    void Function(OpenApiServerBuilder) updates,
  ) = _$OpenApiServer;

  OpenApiServer._();

  /// REQUIRED. A URL to the target host.
  ///
  /// This URL supports Server Variables and MAY be relative, to indicate that
  /// the host location is relative to the location where the OpenAPI document
  /// is being served. Variable substitutions will be made when a variable is
  /// named in {brackets}.
  String get url;

  // TODO(dnys1): Provide citation
  /// May be relative or absolute.
  Uri get uri => Uri.parse(url);

  /// An optional string describing the host designated by the URL.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  String? get description;

  /// A map between a variable name and its value.
  ///
  /// The value is used for substitution in the server’s URL template.
  BuiltMap<String, OpenApiServerVariable> get variables;
}

/// An object representing a Server Variable for server URL template
/// substitution.
///
/// https://spec.openapis.org/oas/v3.1.0#server-variable-object
abstract class OpenApiServerVariable
    implements Built<OpenApiServerVariable, OpenApiServerVariableBuilder> {
  factory OpenApiServerVariable({
    required String name,
    required String defaultValue,
    String? description,
    Iterable<String>? enumValues,
  }) {
    return _$OpenApiServerVariable._(
      name: name,
      defaultValue: defaultValue,
      description: description,
      enumValues: enumValues?.toBuiltList(),
    );
  }

  factory OpenApiServerVariable.build(
    void Function(OpenApiServerVariableBuilder) updates,
  ) = _$OpenApiServerVariable;

  OpenApiServerVariable._();

  String get name;

  /// An enumeration of string values to be used if the substitution options
  /// are from a limited set.
  ///
  /// The array MUST NOT be empty if provided.
  @JsonKey(name: 'enum')
  BuiltList<String>? get enumValues;

  /// REQUIRED. The default value to use for substitution, which SHALL be sent
  /// if an alternate value is not supplied.
  ///
  /// Note this behavior is different than the Schema Object’s treatment of
  /// default values, because in those cases parameter values are optional.
  /// If the enum is defined, the value MUST exist in the enum’s values.
  @JsonKey(name: 'default')
  String get defaultValue;

  /// An optional description for the server variable.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  String? get description;
}

final class OpenApiOperationType extends EnumClass {
  const OpenApiOperationType._(super.name);

  static const OpenApiOperationType get = _$get;
  static const OpenApiOperationType put = _$put;
  static const OpenApiOperationType post = _$post;
  static const OpenApiOperationType delete = _$delete;
  static const OpenApiOperationType options = _$options;
  static const OpenApiOperationType head = _$head;
  static const OpenApiOperationType patch = _$patch;
  static const OpenApiOperationType trace = _$trace;

  static BuiltSet<OpenApiOperationType> get values =>
      _$OpenApiOperationTypeValues;
  static OpenApiOperationType valueOf(String name) =>
      _$OpenApiOperationTypeValueOf(name);
}

/// Holds the relative paths to the individual endpoints and their operations.
///
/// The path is appended to the URL from the Server Object in order to construct
/// the full URL.
///
/// The Paths MAY be empty, due to Access Control List (ACL) constraints.
///
/// https://spec.openapis.org/oas/v3.1.0#path-item-object
abstract class OpenApiPathItem
    implements Built<OpenApiPathItem, OpenApiPathItemBuilder> {
  factory OpenApiPathItem({
    required String path,
    String? summary,
    String? description,
    Map<OpenApiOperationType, OpenApiOperation>? operations,
    List<OpenApiParameter>? parameters,
    List<OpenApiServer>? servers,
  }) {
    return _$OpenApiPathItem._(
      path: path,
      summary: summary,
      description: description,
      operations: (operations ?? const {}).build(),
      parameters: (parameters ?? const []).build(),
      servers: servers?.build(),
    );
  }

  factory OpenApiPathItem.build(
    void Function(OpenApiPathItemBuilder) updates,
  ) = _$OpenApiPathItem;

  OpenApiPathItem._();

  /// REQUIRED. The path to the endpoint.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#path-item-object
  String get path;

  /// An optional, string summary, intended to apply to all operations in this
  /// path.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#path-item-object
  String? get summary;

  /// An optional, string description, intended to apply to all operations in
  /// this path.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#path-item-object
  String? get description;

  /// A definition of the operations on this path.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#path-item-object
  BuiltMap<OpenApiOperationType, OpenApiOperation> get operations;

  /// An alternative server array to service all operations in this path.
  BuiltList<OpenApiServer>? get servers;

  /// A list of parameters that are applicable for all the operations described
  /// under this path.
  ///
  /// These parameters can be overridden at the operation level, but cannot be
  /// removed there. The list MUST NOT include duplicated parameters.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#path-item-object
  BuiltList<OpenApiParameter> get parameters;
}

/// Describes a single API operation on a path.
///
/// https://spec.openapis.org/oas/v3.1.0#operation-object
abstract class OpenApiOperation
    implements Built<OpenApiOperation, OpenApiOperationBuilder> {
  factory OpenApiOperation({
    required String path,
    required String name,
    required OpenApiOperationType type,
    List<String>? tags,
    String? summary,
    String? description,
    String? operationId,
    List<OpenApiParameter>? parameters,
    OpenApiRequestBody? requestBody,
    OpenApiResponse? defaultResponse,
    Map<int, OpenApiResponse>? responses,
    bool deprecated = false,
    List<OpenApiServer>? servers,
  }) {
    return _$OpenApiOperation._(
      path: path,
      name: name,
      type: type,
      tags: (tags ?? const []).build(),
      summary: summary,
      description: description,
      operationId: operationId,
      parameters: (parameters ?? const []).build(),
      requestBody: requestBody,
      defaultResponse: defaultResponse,
      responses: (responses ?? const {}).build(),
      deprecated: deprecated,
      servers: servers?.build(),
    );
  }

  factory OpenApiOperation.build(
    void Function(OpenApiOperationBuilder) updates,
  ) = _$OpenApiOperation;

  OpenApiOperation._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OpenApiOperationBuilder b) {
    // TODO: this is wrong but refresh on what to do in edge cases here
    // if (b._defaultResponse != null && b.responses.build().containsKey(200)) {
    //   throw ArgumentError.value(
    //     b,
    //     'operation',
    //     'Cannot have both a default response and a 200 response',
    //   );
    // }
    b.deprecated ??= false;
  }

  /// The path to this operation.
  String get path;

  /// REQUIRED. The type of the operation.
  OpenApiOperationType get type;

  String get name;

  /// A list of tags for API documentation control.
  ///
  /// Tags can be used for logical grouping of operations by resources or any
  /// other qualifier.
  BuiltList<String> get tags;

  /// A short summary of what the operation does.
  String? get summary;

  /// A verbose explanation of the operation behavior.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  String? get description;

  /// Additional external documentation for this operation.
  // final OpenApiExternalDocumentation? externalDocs;

  /// A unique string used to identify the operation.
  ///
  /// The id MUST be unique among all operations described in the API. The
  /// operationId value is case-sensitive. Tools and libraries MAY use the
  /// operationId to uniquely identify an operation, therefore, it is
  /// RECOMMENDED to follow common programming naming conventions.
  String? get operationId;

  /// A list of parameters that are applicable for this operation.
  ///
  /// If a parameter is already defined at the Path Item, the new definition
  /// will override it but can never remove it.
  ///
  /// The list MUST NOT include duplicated parameters. A unique parameter is
  /// defined by a combination of a `name` and `location`. The list can use the
  /// Reference Object to link to parameters that are defined at the OpenAPI
  /// Object’s components/parameters.
  BuiltList<OpenApiParameter> get parameters;

  /// The request body applicable for this operation.
  ///
  /// The requestBody is only supported in HTTP methods where the HTTP 1.1
  /// specification RFC7231 has explicitly defined semantics for request bodies.
  ///
  /// In other cases where the HTTP spec is vague (such as `GET`, `HEAD` and
  /// `DELETE`), requestBody is permitted but does not have well-defined
  /// semantics and SHOULD be avoided if possible.
  OpenApiRequestBody? get requestBody;

  /// {@template openapi_response}
  /// A container for the expected responses of an operation.
  ///
  /// The container maps a HTTP response code to the expected response.
  ///
  /// The documentation is not necessarily expected to cover all possible HTTP
  /// response codes because they may not be known in advance. However,
  /// documentation is expected to cover a successful operation response and
  /// any known errors.
  ///
  /// The default MAY be used as a default response object for all HTTP codes
  /// that are not covered individually by the Responses Object.
  ///
  /// The Responses Object MUST contain at least one response code, and if only
  /// one response code is provided it SHOULD be the response for a successful
  /// operation call.
  /// {@endtemplate}
  BuiltMap<int, OpenApiResponse> get responses;

  OpenApiResponse? get defaultResponse;

  /// A map of possible out-of band callbacks related to the parent operation.
  ///
  /// Each value in the map is a Path Item Object that describes a set of
  /// requests that may be initiated by the API provider and the expected
  /// responses.
  // final Map<String, OpenApiPathItem> callbacks;

  /// Declares this operation to be deprecated.
  ///
  /// Consumers SHOULD refrain from usage of the declared operation.
  bool get deprecated;

  /// A declaration of which security mechanisms can be used for this operation.
  ///
  /// The list of values includes alternative security requirement objects that
  /// can be used. Only one of the security requirement objects need to be
  /// satisfied to authorize a request. To make security optional, an empty
  /// security requirement ({}) can be included in the array.
  ///
  /// This definition overrides any declared top-level security. To remove a
  /// top-level security declaration, an empty array can be used.
  // final List<OpenApiSecurityRequirement> security;

  /// An alternative server array to service this operation.
  ///
  /// If an alternative server object is specified at the Path Item Object or
  /// Root level, it will be overridden by this value.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#operation-object
  BuiltList<OpenApiServer>? get servers;
}

final class OpenApiParameterLocation extends EnumClass {
  const OpenApiParameterLocation._(super.name);

  static const OpenApiParameterLocation query = _$query;
  static const OpenApiParameterLocation header = _$header;
  static const OpenApiParameterLocation path = _$path;
  static const OpenApiParameterLocation cookie = _$cookie;

  static BuiltSet<OpenApiParameterLocation> get values =>
      _$OpenApiParameterLocationValues;
  static OpenApiParameterLocation valueOf(String name) =>
      _$OpenApiParameterLocationValueOf(name);
}

/// In order to support common ways of serializing simple parameters, a set of
/// style values are defined.
///
/// https://spec.openapis.org/oas/v3.1.0#style-values
final class OpenApiParameterStyle extends EnumClass {
  const OpenApiParameterStyle._(super.name);

  /// Path-style parameters defined by [RFC6570](https://tools.ietf.org/html/rfc6570).
  ///
  /// - Valid for `path` parameters.
  /// - Valid for types: `primitive`, `array`, `object`.
  static const OpenApiParameterStyle matrix = _$matrix;

  /// Label style parameters defined by [RFC6570](https://tools.ietf.org/html/rfc6570).
  ///
  /// - Valid for `path` parameters.
  /// - Valid for types: `primitive`, `array`, `object`.
  static const OpenApiParameterStyle label = _$label;

  /// Form style parameters defined by [RFC6570](https://tools.ietf.org/html/rfc6570).
  ///
  /// This option replaces `collectionFormat` with a `csv` (when explode is
  /// `false`) or `multi` (when `explode` is true) value from OpenAPI 2.0.
  ///
  /// - Valid for parameters: `query`, `cookie`.
  /// - Valid for types: `primitive`, `array`, `object`.
  static const OpenApiParameterStyle form = _$form;

  /// Simple style parameters defined by [RFC6570](https://tools.ietf.org/html/rfc6570).
  ///
  /// This option replaces `collectionFormat` with a `csv` value from OpenAPI 2.0.
  ///
  /// - Valid for parameters: `path`, `header`.
  /// - Valid for types: `array`.
  static const OpenApiParameterStyle simple = _$simple;

  /// Space separated array or object values.
  ///
  /// This option replaces `collectionFormat` equal to `ssv` from OpenAPI 2.0.
  ///
  /// - Valid for parameters: `query`.
  /// - Valid for types: `array`, `object`.
  static const OpenApiParameterStyle spaceDelimited = _$spaceDelimited;

  /// Pipe separated array or object values.
  ///
  /// This option replaces `collectionFormat` equal to `pipes` from OpenAPI 2.0.
  ///
  /// - Valid for parameters: `query`.
  /// - Valid for types: `array`, `object`.
  static const OpenApiParameterStyle pipeDelimited = _$pipeDelimited;

  /// Provides a simple way of rendering nested objects using form parameters.
  ///
  /// Objects with properties of simple types are rendered as if they were
  /// query parameters.
  ///
  /// - Valid for parameters: `query`.
  /// - Valid for types: `object`.
  static const OpenApiParameterStyle deepObject = _$deepObject;

  static BuiltSet<OpenApiParameterStyle> get values =>
      _$OpenApiParameterStyleValues;
  static OpenApiParameterStyle valueOf(String name) =>
      _$OpenApiParameterStyleValueOf(name);
}

/// Describes a single operation parameter.
///
/// A unique parameter is defined by a combination of a [name] and [location].
///
/// https://spec.openapis.org/oas/v3.1.0#parameter-object
abstract class OpenApiParameter
    implements Built<OpenApiParameter, OpenApiParameterBuilder> {
  factory OpenApiParameter({
    required String name,
    required OpenApiParameterLocation location,
    String? description,
    bool required = false,
    bool deprecated = false,
    bool allowEmptyValue = false,
    OpenApiParameterStyle? style,
    bool? explode,
    bool? allowReserved,
    OpenApiTypeSchema? schema,
    // Map<String, OpenApiExample> examples = const {},
    (MediaType, OpenApiMediaType)? content,
  }) {
    return _$OpenApiParameter._(
      name: name,
      location: location,
      description: description,
      required: required,
      deprecated: deprecated,
      allowEmptyValue: allowEmptyValue,
      style: style,
      explode: explode,
      allowReserved: allowReserved,
      schema: schema,
      // examples: examples.build(),
      content: content,
    );
  }

  factory OpenApiParameter.build(
    void Function(OpenApiParameterBuilder) updates,
  ) = _$OpenApiParameter;

  OpenApiParameter._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OpenApiParameterBuilder b) {
    // For more complex scenarios, the content property can define the media type
    // and schema of the parameter. A parameter MUST contain either a schema
    // property, or a content property, but not both. When example or examples
    // are provided in conjunction with the schema object, the example MUST follow
    // the prescribed serialization strategy for the parameter.
    //
    // https://spec.openapis.org/oas/v3.1.0#parameter-object
    if (b._schema != null && b.content != null ||
        b._schema == null && b.content == null) {
      throw ArgumentError.value(
        b,
        'parameter',
        'Exactly one of schema or content must be set',
      );
    }
    b
      ..required ??= false
      ..deprecated ??= false
      ..allowEmptyValue ??= false;
  }

  /// REQUIRED. The name of the parameter.
  ///
  /// Parameter names are case sensitive.
  ///
  /// - If [location] is `path`, the [name] field MUST correspond to a template
  ///   expression occurring within the [OpenApiPathItem.path] field.
  ///
  /// - If [location] is `header` and the [name] field is `Accept`, `Content-Type`
  ///   or `Authorization`, the parameter definition SHALL be ignored.
  ///
  /// - For all other cases, the [name] corresponds to the parameter name used
  ///   by the in property.
  String get name;

  /// REQUIRED. The location of the parameter.
  OpenApiParameterLocation get location;

  /// A brief description of the parameter.
  ///
  /// This could contain examples of use. CommonMark syntax MAY be used for
  /// rich text representation.
  String? get description;

  /// Determines whether this parameter is mandatory.
  ///
  /// If the parameter location is "path", this property is REQUIRED and its
  /// value MUST be `true`. Otherwise, the property MAY be included and its
  /// default value is `false`.
  bool get required;

  /// Specifies that a parameter is deprecated and SHOULD be transitioned out
  /// of usage.
  bool get deprecated;

  /// Sets the ability to pass empty-valued parameters.
  ///
  /// This is valid only for query parameters and allows sending a parameter
  /// with an empty value.
  ///
  /// Default value is false.
  bool get allowEmptyValue;

  /// Describes how the parameter value will be serialized depending on the
  /// type of the parameter value.
  ///
  /// Default values (based on value of in):
  /// - for query: form
  /// - for path: simple
  /// - for header: simple
  /// - for cookie: form
  OpenApiParameterStyle? get style;

  /// When this is true, parameter values of type `array` or `object` generate
  /// separate parameters for each value of the array or key-value pair of the
  /// map.
  ///
  /// For other types of parameters this property has no effect. When [style] is
  /// `form`, the default value is `true`. For all other styles, the default value
  /// is `false`.
  bool? get explode;

  /// Determines whether the parameter value SHOULD allow reserved characters,
  /// as defined by [RFC3986](https://tools.ietf.org/html/rfc3986).
  ///
  /// This property only applies to parameters with a location of query. The
  /// default value is false.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  bool? get allowReserved;

  /// The schema defining the type used for the parameter.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  OpenApiTypeSchema? get schema;

  /// Examples of the media type.
  ///
  /// Each example object SHOULD match the media type and specified schema if
  /// present.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  // final Map<String, OpenApiExample> examples;

  /// A map containing the representations for the parameter.
  ///
  /// The key is the media type and the value describes it. The map MUST only
  /// contain one entry.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  (MediaType, OpenApiMediaType)? get content;
}

/// Each Media Type Object provides schema and examples for the media type identified by its key.
///
/// https://spec.openapis.org/oas/v3.1.0#media-type-object
abstract class OpenApiMediaType
    implements Built<OpenApiMediaType, OpenApiMediaTypeBuilder> {
  factory OpenApiMediaType({
    required MediaType contentType,
    required OpenApiTypeSchema schema,
    // Map<String, OpenApiExample> examples = const {},
    Map<String, OpenApiEncoding>? encoding,
  }) {
    return _$OpenApiMediaType._(
      contentType: contentType,
      schema: schema,
      // examples: examples.build(),
      encoding: (encoding ?? {}).build(),
    );
  }

  factory OpenApiMediaType.build(
    void Function(OpenApiMediaTypeBuilder) updates,
  ) = _$OpenApiMediaType;

  OpenApiMediaType._();

  /// The content type.
  // TODO: Or media type range.
  MediaType get contentType;

  /// The schema defining the content of the request, response, or parameter.
  OpenApiTypeSchema get schema;

  /// Examples of the media type.
  ///
  /// Each example object SHOULD match the media type and specified schema if
  /// present.
  // final Map<String, OpenApiExample> examples;

  /// A map between a property name and its encoding information.
  ///
  /// The key, being the property name, MUST exist in the schema as a property.
  /// The encoding object SHALL only apply to [OpenApiOperation.requestBody]
  /// objects when the media type is `multipart` or `application/x-www-form-urlencoded`.
  BuiltMap<String, OpenApiEncoding> get encoding;
}

/// Describes a single request body.
///
/// https://spec.openapis.org/oas/v3.1.0#request-body-object
abstract class OpenApiRequestBody
    implements Built<OpenApiRequestBody, OpenApiRequestBodyBuilder> {
  factory OpenApiRequestBody({
    required Map<MediaType, OpenApiMediaType> content,
    String? description,
    bool required = false,
  }) {
    return _$OpenApiRequestBody._(
      content: content.build(),
      description: description,
      required: required,
    );
  }

  factory OpenApiRequestBody.build(
    void Function(OpenApiRequestBodyBuilder) updates,
  ) = _$OpenApiRequestBody;

  OpenApiRequestBody._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OpenApiRequestBodyBuilder b) {
    if (b.content.isEmpty) {
      throw ArgumentError.value(
        b,
        'requestBody',
        'At least one content type must be provided',
      );
    }
    b.required ??= false;
  }

  /// REQUIRED. The content of the request body.
  ///
  /// The key is a media type or [media type range](https://tools.ietf.org/html/rfc7231#appendix-D)
  /// and the value describes it.
  ///
  /// For requests that match multiple keys, only the most specific key is
  /// applicable. e.g. `text/plain` overrides `text/*`.
  BuiltMap<MediaType, OpenApiMediaType> get content;

  /// A brief description of the request body.
  ///
  /// This could contain examples of use. CommonMark syntax MAY be used for
  /// rich text representation.
  String? get description;

  /// Determines if the request body is required in the request.
  ///
  /// Defaults to `false`.
  bool get required;
}

/// A single encoding definition applied to a single schema property.
///
/// https://spec.openapis.org/oas/v3.1.0#encoding-object
abstract class OpenApiEncoding
    implements Built<OpenApiEncoding, OpenApiEncodingBuilder> {
  factory OpenApiEncoding({
    required MediaType contentType,
    Map<String, OpenApiHeader> headers = const {},
    OpenApiParameterStyle? style,
    required bool explode,
    bool allowReserved = false,
  }) {
    return _$OpenApiEncoding._(
      contentType: contentType,
      headers: headers.build(),
      style: style,
      explode: explode,
      allowReserved: allowReserved,
    );
  }

  factory OpenApiEncoding.build(
    void Function(OpenApiEncodingBuilder) updates,
  ) = _$OpenApiEncoding;

  OpenApiEncoding._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OpenApiEncodingBuilder b) {
    b.allowReserved ??= false;
  }

  /// The Content-Type for encoding a specific property.
  ///
  /// Default value depends on the property type: for `string` with `format`
  /// being `binary` – `application/octet-stream`; for other primitive types –
  /// `application/json`; for `object` – `application/json`; for `array` – the
  /// default is defined based on the inner type. The value can be a specific
  /// media type (e.g. `application/json`), a wildcard media type (e.g. `image/*`),
  /// or a comma-separated list of the two types.
  MediaType get contentType;

  /// A map allowing additional information to be provided as headers, for
  /// example `Content-Disposition`. Content-Type is described separately and
  /// SHALL be ignored in this section. This property SHALL be ignored if the
  /// request body media type is not `multipart` or `application/x-www-form-urlencoded`.
  BuiltMap<String, OpenApiHeader> get headers;

  /// Describes how a specific property value will be serialized depending on
  /// its type.
  ///
  /// This property SHALL be ignored if the request body media type is not
  /// `application/x-www-form-urlencoded` or `multipart/form-data`. If a value
  /// is explicitly defined, then the value of contentType (implicit or explicit)
  /// SHALL be ignored.
  OpenApiParameterStyle? get style;

  /// When this is true, property values of type `array` or `object` generate
  /// separate parameters for each value of the array, or key-value pair of the
  /// map.
  ///
  /// For other types of properties this property has no effect.
  ///
  /// When [style] is `form`, the default value is `true`. For all other styles,
  /// the default value is `false`.
  bool get explode;

  /// Determines whether the parameter value SHOULD allow reserved characters,
  /// as defined by [RFC3986](https://tools.ietf.org/html/rfc3986): `:/?#[]@!$&'()*+,;=`
  ///
  /// This property SHALL be ignored if the request body media type is not
  /// `application/x-www-form-urlencoded` or `multipart/form-data`. If a value
  /// is explicitly defined, then the value of [contentType] (implicit or
  /// explicit) SHALL be ignored.
  bool get allowReserved;
}

/// {@macro openapi_response}
///
/// https://spec.openapis.org/oas/v3.1.0#responses-object
abstract class OpenApiResponse
    implements Built<OpenApiResponse, OpenApiResponseBuilder> {
  factory OpenApiResponse({
    required String description,
    Map<String, OpenApiHeader>? headers,
    Map<MediaType, OpenApiMediaType>? content,
    // Map<String, OpenApiLink> links = const {},
  }) {
    return _$OpenApiResponse._(
      description: description,
      headers: (headers ?? const {}).build(),
      content: (content ?? const {}).build(),
      // links: links,
    );
  }

  factory OpenApiResponse.build(
    void Function(OpenApiResponseBuilder) updates,
  ) = _$OpenApiResponse;

  OpenApiResponse._();

  /// REQUIRED. A short description of the response.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  String get description;

  /// Maps a header name to its definition.
  ///
  /// [RFC7230](https://tools.ietf.org/html/rfc7230) states header names are
  /// case insensitive. If a response header is defined with the name
  /// "Content-Type", it SHALL be ignored.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#responses-object
  BuiltMap<String, OpenApiHeader> get headers;

  /// A map containing descriptions of potential response payloads.
  ///
  /// The key is a media type or [media type range](https://tools.ietf.org/html/rfc7231#appendix-D)
  /// and the value describes it. For responses that match multiple keys, only
  /// the most specific key is applicable. e.g. `text/plain` overrides `text/*`.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#responses-object
  BuiltMap<MediaType, OpenApiMediaType> get content;

  /// A map of operations links that can be followed from the response.
  ///
  /// The key of the map is a short name for the link, following the naming
  /// constraints of the names for Component Objects.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#responses-object
  // final Map<String, OpenApiLink> links;
}

/// The Header Object follows the structure of the Parameter Object with the following changes:
///
/// 1. `name` MUST NOT be specified, it is given in the corresponding `headers` map.
/// 2. `in` MUST NOT be specified, it is implicitly in `header`.
/// 3. All traits that are affected by the location MUST be applicable to a location of `header` (for example, `style`).
///
/// https://spec.openapis.org/oas/v3.1.0#header-object
abstract class OpenApiHeader
    implements Built<OpenApiHeader, OpenApiHeaderBuilder> {
  factory OpenApiHeader({
    required OpenApiTypeSchema schema,
    String? description,
    bool required = false,
    bool deprecated = false,
    bool allowEmptyValue = false,
    OpenApiParameterStyle? style,
    bool? explode,
    bool? allowReserved,
  }) {
    return _$OpenApiHeader._(
      schema: schema,
      description: description,
      required: required,
      deprecated: deprecated,
      allowEmptyValue: allowEmptyValue,
      style: style,
      explode: explode,
      allowReserved: allowReserved,
    );
  }

  factory OpenApiHeader.build(
    void Function(OpenApiHeaderBuilder) updates,
  ) = _$OpenApiHeader;

  OpenApiHeader._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OpenApiHeaderBuilder b) {
    b
      ..required ??= false
      ..deprecated ??= false
      ..allowEmptyValue ??= false;
  }

  /// The schema defining the type used for the parameter.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  OpenApiTypeSchema get schema;

  /// A brief description of the parameter.
  ///
  /// This could contain examples of use. CommonMark syntax MAY be used for
  /// rich text representation.
  String? get description;

  /// Determines whether this parameter is mandatory.
  ///
  /// If the parameter location is "path", this property is REQUIRED and its
  /// value MUST be `true`. Otherwise, the property MAY be included and its
  /// default value is `false`.
  bool get required;

  /// Specifies that a parameter is deprecated and SHOULD be transitioned out
  /// of usage.
  bool get deprecated;

  /// Sets the ability to pass empty-valued parameters.
  ///
  /// This is valid only for query parameters and allows sending a parameter
  /// with an empty value.
  ///
  /// Default value is false.
  bool get allowEmptyValue;

  /// Describes how the parameter value will be serialized depending on the
  /// type of the parameter value.
  ///
  /// Default values (based on value of in):
  /// - for query: form
  /// - for path: simple
  /// - for header: simple
  /// - for cookie: form
  OpenApiParameterStyle? get style;

  /// When this is true, parameter values of type `array` or `object` generate
  /// separate parameters for each value of the array or key-value pair of the
  /// map.
  ///
  /// For other types of parameters this property has no effect. When [style] is
  /// `form`, the default value is `true`. For all other styles, the default value
  /// is `false`.
  bool? get explode;

  /// Determines whether the parameter value SHOULD allow reserved characters,
  /// as defined by [RFC3986](https://tools.ietf.org/html/rfc3986).
  ///
  /// This property only applies to parameters with a location of query. The
  /// default value is false.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  bool? get allowReserved;
}

/// Holds a set of reusable objects for different aspects of the OAS.
///
/// All objects defined within the components object will have no effect on the
/// API unless they are explicitly referenced from properties outside the
/// components object.
///
/// All the fixed fields of objects that MUST use keys that match the regular
/// expression: `^[a-zA-Z0-9\.\-_]+$`
///
/// https://spec.openapis.org/oas/v3.1.0#components-object
abstract class OpenApiComponents
    implements Built<OpenApiComponents, OpenApiComponentsBuilder> {
  factory OpenApiComponents({
    Map<String, OpenApiTypeSchema>? schemas,
    Map<String, OpenApiResponse>? responses,
    Map<String, OpenApiParameter>? parameters,
    // Map<String, OpenApiExample> examples = const {},
    Map<String, OpenApiRequestBody>? requestBodies,
    Map<String, OpenApiHeader>? headers,
    // Map<String, OpenApiSecurityScheme> securitySchemes = const {},
    // Map<String, OpenApiLink> links = const {},
    // Map<String, OpenApiPathItem> callbacks = const {},
    Map<String, OpenApiPathItem>? paths,
  }) {
    return _$OpenApiComponents._(
      schemas: (schemas ?? {}).build(),
      responses: (responses ?? {}).build(),
      parameters: (parameters ?? {}).build(),
      // examples: examples.build(),
      requestBodies: (requestBodies ?? {}).build(),
      headers: (headers ?? {}).build(),
      // securitySchemes: securitySchemes.build(),
      // links: links.build(),
      // callbacks: callbacks.build(),
      paths: (paths ?? {}).build(),
    );
  }

  factory OpenApiComponents.build(
    void Function(OpenApiComponentsBuilder) updates,
  ) = _$OpenApiComponents;

  OpenApiComponents._();

  /// An object to hold reusable Schema Objects.
  BuiltMap<String, OpenApiTypeSchema> get schemas;

  /// An object to hold reusable Response Objects.
  BuiltMap<String, OpenApiResponse> get responses;

  /// An object to hold reusable Parameter Objects.
  BuiltMap<String, OpenApiParameter> get parameters;

  /// An object to hold reusable Example Objects.
  // final Map<String, OpenApiExample> examples;

  /// An object to hold reusable Request Body Objects.
  BuiltMap<String, OpenApiRequestBody> get requestBodies;

  /// An object to hold reusable Header Objects.
  BuiltMap<String, OpenApiHeader> get headers;

  /// An object to hold reusable Security Scheme Objects.
  // final Map<String, OpenApiSecurityScheme> securitySchemes;

  /// An object to hold reusable Link Objects.
  // final Map<String, OpenApiLink> links;

  /// An object to hold reusable Callback Objects.
  // final Map<String, OpenApiPathItem> callbacks;

  /// An object to hold reusable Path Item Object.
  BuiltMap<String, OpenApiPathItem> get paths;
}

/// The Schema Object allows the definition of input and output data types.
///
/// These types can be objects, but also primitives and arrays. This object is
/// a superset of the JSON Schema Specification Draft 2020-12.
///
/// For more information about the properties, see JSON Schema Core and JSON
/// Schema Validation.
///
/// Unless stated otherwise, the property definitions follow those of JSON
/// Schema and do not add any additional semantics. Where JSON Schema indicates
/// that behavior is defined by the application (e.g. for annotations), OAS
/// also defers the definition of semantics to the application consuming the
/// OpenAPI document.
///
/// https://spec.openapis.org/oas/v3.1.0#schema-object
// abstract class OpenApiSchema
//     implements Built<OpenApiSchema, OpenApiSchemaBuilder> {
//   factory OpenApiSchema({
//     String? ref,
//     String? name,
//     required OpenApiTypeSchema typeSchema,
//     String? title,
//     String? description,
//     bool deprecated = false,
//     bool readOnly = false,
//     bool writeOnly = false,
//     Iterable<String> required = const [],
//     Map<String, Object?> extensions = const {},
//   }) {
//     return _$OpenApiSchema._(
//       ref: ref,
//       name: name,
//       typeSchema: typeSchema,
//       title: title,
//       description: description,
//       deprecated: deprecated,
//       readOnly: readOnly,
//       writeOnly: writeOnly,
//       required: required.toBuiltSet(),
//       extensions: extensions.build(),
//     );
//   }

//   factory OpenApiSchema.build(
//     void Function(OpenApiSchemaBuilder) updates,
//   ) = _$OpenApiSchema;

//   OpenApiSchema._();

//   @BuiltValueHook(finalizeBuilder: true)
//   static void _validate(OpenApiSchemaBuilder b) {
//     b.deprecated ??= false;
//     b.readOnly ??= false;
//     b.writeOnly ??= false;
//   }

//   /// The intrinsic name of the type, if any.
//   ///
//   /// This is the exact value from the source YAML and is not suitable for use
//   /// in Dart representations, unlike [name].
//   String? get ref;

//   String? get name;

//   /// The resolved type of the schema.
//   ///
//   /// This combines the structural elements of the source schema into a suitable
//   /// Dart type representation.
//   OpenApiTypeSchema get typeSchema;

//   /// Adds support for polymorphism.
//   ///
//   /// The discriminator is an object name that is used to differentiate between
//   /// other schemas which may satisfy the payload description.
//   ///
//   /// See Composition and Inheritance for more details.
//   ///
//   /// https://spec.openapis.org/oas/v3.1.0#schema-object
//   OpenApiDiscriminator? get discriminator;

//   // xml
//   // externalDocs
//   // example

//   /// Both [title] and [description] can be used to decorate a user interface
//   /// with information about the data produced by this user interface. A title
//   /// will preferably be short, whereas a description will provide explanation
//   /// about the purpose of the instance described by this schema.
//   ///
//   /// https://json-schema.org/draft/2020-12/json-schema-validation#name-title-and-description
//   String? get title;

//   /// CommonMark syntax MAY be used for rich text representation.
//   String? get description;

//   /// Specifies that a schema is deprecated and SHOULD be transitioned out of usage.
//   bool get deprecated;

//   /// This keyword can be used to supply a default JSON value associated with a
//   /// particular schema.
//   ///
//   /// It is RECOMMENDED that a default value be valid against the associated
//   /// schema.
//   ///
//   /// https://json-schema.org/draft/2020-12/json-schema-validation#name-default
//   Expression? get defaultValue;

//   /// If "readOnly" has a value of boolean true, it indicates that the value of
//   /// the instance is managed exclusively by the owning authority, and attempts
//   /// by an application to modify the value of this property are expected to be
//   /// ignored or rejected by that owning authority.
//   ///
//   /// An instance document that is marked as "readOnly" for the entire document
//   /// MAY be ignored if sent to the owning authority, or MAY result in an error,
//   /// at the authority's discretion.
//   ///
//   /// These keywords can be used to assist in user interface instance
//   /// generation. In particular, an application MAY choose to use a widget that
//   /// hides input values as they are typed for write-only fields.
//   ///
//   /// https://json-schema.org/draft/2020-12/json-schema-validation#name-readonly-and-writeonly
//   bool get readOnly;

//   /// If "writeOnly" has a value of boolean true, it indicates that the value is
//   /// never present when the instance is retrieved from the owning authority. It
//   /// can be present when sent to the owning authority to update or create the
//   /// document (or the resource it represents), but it will not be included in
//   /// any updated or newly created version of the instance.
//   ///
//   /// An instance document that is marked as "writeOnly" for the entire document
//   /// MAY be returned as a blank document of some sort, or MAY produce an error
//   /// upon retrieval, or have the retrieval request ignored, at the authority's
//   /// discretion.
//   ///
//   /// For example, "readOnly" would be used to mark a database-generated serial
//   /// number as read-only, while "writeOnly" would be used to mark a password
//   /// input field.
//   ///
//   /// These keywords can be used to assist in user interface instance
//   /// generation. In particular, an application MAY choose to use a widget that
//   /// hides input values as they are typed for write-only fields.
//   ///
//   /// https://json-schema.org/draft/2020-12/json-schema-validation#name-readonly-and-writeonly
//   bool get writeOnly;

//   /// The list of required properties, if any.
//   ///
//   /// The value of this keyword MUST be an array. Elements of this array, if
//   /// any, MUST be strings, and MUST be unique.
//   ///
//   /// An object instance is valid against this keyword if every item in the
//   /// array is the name of a property in the instance.
//   ///
//   /// Omitting this keyword has the same behavior as an empty array.
//   ///
//   /// https://json-schema.org/draft/2020-12/json-schema-validation#name-required
//   BuiltSet<String> get required;

//   BuiltMap<String, Object?> get extensions;
// }

/// When request bodies or response payloads may be one of a number of different
/// schemas, a discriminator object can be used to aid in serialization,
/// deserialization, and validation.
///
/// The discriminator is a specific object in a schema which is used to inform
/// the consumer of the document of an alternative schema based on the value
/// associated with it.
///
/// When using the discriminator, inline schemas will not be considered.
///
/// https://spec.openapis.org/oas/v3.1.0#discriminator-object
abstract class OpenApiDiscriminator
    implements Built<OpenApiDiscriminator, OpenApiDiscriminatorBuilder> {
  factory OpenApiDiscriminator({
    required String propertyName,
    Map<String, String>? mapping,
  }) {
    return _$OpenApiDiscriminator._(
      propertyName: propertyName,
      mapping: mapping?.build(),
    );
  }

  factory OpenApiDiscriminator.build(
    void Function(OpenApiDiscriminatorBuilder) updates,
  ) = _$OpenApiDiscriminator;

  OpenApiDiscriminator._();

  /// REQUIRED. The name of the property in the payload that will hold the
  /// discriminator value.
  String get propertyName;

  /// An object to hold mappings between payload values and schema names or
  /// references.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#discriminator-object
  BuiltMap<String, String>? get mapping;
}

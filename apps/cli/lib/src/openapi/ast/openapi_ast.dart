import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:celest_cli/src/openapi/ast/openapi_visitor.dart';
import 'package:celest_cli/src/openapi/type/json_type.dart';
import 'package:celest_cli/src/openapi/type/json_type_format.spec.dart';
import 'package:collection/collection.dart';
import 'package:http_parser/http_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';

part 'openapi_ast.g.dart';
part 'openapi_reference.dart';

abstract interface class OpenApiNode {
  String? get ref;
  YamlNode? get node;
  BuiltMap<String, JsonObject>? get extensions;

  R accept<R>(OpenApiVisitor<R> visitor);
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg);
}

@BuiltValue(instantiable: false)
sealed class OpenApiComponent<T extends OpenApiComponent<T>>
    implements OpenApiNode {
  String? get summary;
  String? get description;

  OpenApiComponentBuilder<T> toBuilder();
  T rebuild(void Function(OpenApiComponentBuilder<T> b) updates);
}

/// Additional external documentation.
///
/// https://spec.openapis.org/oas/v3.1.0#external-documentation-object
abstract class OpenApiExternalDocs
    implements
        Built<OpenApiExternalDocs, OpenApiExternalDocsBuilder>,
        OpenApiNode {
  factory OpenApiExternalDocs({
    required String url,
    String? description,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiExternalDocs._(
      url: url,
      description: description,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiExternalDocs.build(
    void Function(OpenApiExternalDocsBuilder) updates,
  ) = _$OpenApiExternalDocs;

  OpenApiExternalDocs._();

  /// REQUIRED. The URL for the target documentation.
  /// This MUST be in the form of a URL.
  String get url;

  /// A description of the target documentation.
  /// CommonMark syntax MAY be used for rich text representation.
  String? get description;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitExternalDocs(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitExternalDocs(this, arg);
}

/// This is the root object of the OpenAPI document.
///
/// https://spec.openapis.org/oas/v3.1.0#openapi-object
abstract class OpenApiDocument
    implements Built<OpenApiDocument, OpenApiDocumentBuilder>, OpenApiNode {
  factory OpenApiDocument({
    required Version version,
    required OpenApiInfo info,
    String? jsonSchemaDialect,
    List<OpenApiServer>? servers,
    Map<String, OpenApiComponentOrRef<OpenApiPathItem>>? paths,
    OpenApiComponents? components,
    List<OpenApiSecurityRequirement>? securityRequirements,
    OpenApiExternalDocs? externalDocs,
    List<OpenApiTag>? tags,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiDocument._(
      version: version,
      info: info,
      jsonSchemaDialect: jsonSchemaDialect,
      servers: (servers ?? [OpenApiServer(url: '/')]).build(),
      paths: (paths ?? {}).build(),
      components: components ?? OpenApiComponents(),
      securityRequirements: (securityRequirements ?? []).build(),
      externalDocs: externalDocs,
      tags: (tags ?? []).build(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
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
  /// This is not related to the API [OpenApiInfo.apiVersion]
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
  /// (no relative URL resolution) to the expanded URL from the Server Object's
  /// [OpenApiServer.url] field in order to construct the full URL.
  ///
  /// Path templating is allowed. When matching URLs, concrete (non-templated)
  /// paths would be matched before their templated counterparts. Templated
  /// paths with the same hierarchy but different templated names MUST NOT
  /// exist as they are identical. In case of ambiguous matching, it's up to
  /// the tooling to decide which one to use.
  BuiltMap<String, OpenApiComponentOrRef<OpenApiPathItem>> get paths;

  // TODO(dnys1): webhooks

  /// An element to hold various schemas for the specification.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#components-object
  OpenApiComponents get components;

  /// A declaration of which security mechanisms can be used across the API.
  /// The list of values includes alternative security requirement objects that
  /// can be used. Only one of the security requirement objects need to be valid
  /// at any point in time.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#security-requirement-object
  BuiltList<OpenApiSecurityRequirement> get securityRequirements;

  /// Additional external documentation.
  OpenApiExternalDocs? get externalDocs;

  /// A list of tags used by the specification with additional metadata.
  ///
  /// The order of the tags can be used to reflect on their order by the parsing tools.
  /// Not all tags that are used by the Operation Object must be declared.
  /// The tags that are not declared MAY be organized randomly or based on the tools' logic.
  /// Each tag name in the list MUST be unique.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#tag-object
  BuiltList<OpenApiTag> get tags;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitDocument(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitDocument(this, arg);
}

abstract class OpenApiInfo
    implements Built<OpenApiInfo, OpenApiInfoBuilder>, OpenApiNode {
  factory OpenApiInfo({
    String? title,
    String? description,
    String? apiVersion,
    OpenApiContact? contact,
    OpenApiLicense? license,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiInfo._(
      title: title,
      description: description,
      apiVersion: apiVersion,
      contact: contact,
      license: license,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiInfo.build(
    void Function(OpenApiInfoBuilder) updates,
  ) = _$OpenApiInfo;

  OpenApiInfo._();

  String? get title;
  String? get description;
  String? get apiVersion;

  /// The contact information for the exposed API.
  OpenApiContact? get contact;

  /// The license information for the exposed API.
  OpenApiLicense? get license;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitInfo(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitInfo(this, arg);
}

/// License information for the exposed API.
abstract class OpenApiLicense
    implements Built<OpenApiLicense, OpenApiLicenseBuilder>, OpenApiNode {
  factory OpenApiLicense({
    required String name,
    String? identifier,
    String? url,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiLicense._(
      name: name,
      identifier: identifier,
      url: url,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiLicense.build(
    void Function(OpenApiLicenseBuilder) updates,
  ) = _$OpenApiLicense;

  OpenApiLicense._();

  /// REQUIRED. The license name used for the API.
  String get name;

  /// An [SPDX-Licenses] expression for the API.
  ///
  /// The identifier field is mutually exclusive of the url field.
  String? get identifier;

  /// A URI for the license used for the API.
  ///
  /// This MUST be in the form of a URI. The url field is mutually exclusive of
  /// the identifier field.
  String? get url;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitLicense(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitLicense(this, arg);
}

/// An object representing a Server.
///
/// https://spec.openapis.org/oas/v3.1.0#server-object
abstract class OpenApiServer
    implements Built<OpenApiServer, OpenApiServerBuilder>, OpenApiNode {
  factory OpenApiServer({
    required String url,
    String? description,
    Map<String, OpenApiServerVariable>? variables,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiServer._(
      url: url,
      description: description,
      variables: (variables ?? {}).build(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
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
  /// The value is used for substitution in the server's URL template.
  BuiltMap<String, OpenApiServerVariable> get variables;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitServer(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitServer(this, arg);
}

/// An object representing a Server Variable for server URL template
/// substitution.
///
/// https://spec.openapis.org/oas/v3.1.0#server-variable-object
abstract class OpenApiServerVariable
    implements
        Built<OpenApiServerVariable, OpenApiServerVariableBuilder>,
        OpenApiNode {
  factory OpenApiServerVariable({
    required String name,
    required String defaultValue,
    String? description,
    Iterable<String>? enumValues,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiServerVariable._(
      name: name,
      defaultValue: defaultValue,
      description: description,
      enumValues: enumValues?.toBuiltList(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
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
  /// Note this behavior is different than the Schema Object's treatment of
  /// default values, because in those cases parameter values are optional.
  /// If the enum is defined, the value MUST exist in the enum's values.
  @JsonKey(name: 'default')
  String get defaultValue;

  /// An optional description for the server variable.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  String? get description;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitServerVariable(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitServerVariable(this, arg);
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
    implements
        Built<OpenApiPathItem, OpenApiPathItemBuilder>,
        OpenApiComponent<OpenApiPathItem> {
  factory OpenApiPathItem({
    String? ref,
    String? summary,
    String? description,
    Map<OpenApiOperationType, OpenApiOperation>? operations,
    List<OpenApiComponentOrRef<OpenApiParameter>>? parameters,
    List<OpenApiServer>? servers,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiPathItem._(
      ref: ref,
      summary: summary,
      description: description,
      operations: (operations ?? const {}).build(),
      parameters: (parameters ?? const []).build(),
      servers: servers?.build(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiPathItem.build(
    void Function(OpenApiPathItemBuilder) updates,
  ) = _$OpenApiPathItem;

  OpenApiPathItem._();

  /// An optional, string summary, intended to apply to all operations in this
  /// path.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#path-item-object
  @override
  String? get summary;

  /// An optional, string description, intended to apply to all operations in
  /// this path.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#path-item-object
  @override
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
  BuiltList<OpenApiComponentOrRef<OpenApiParameter>> get parameters;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitPathItem(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitPathItem(this, arg);
}

/// Describes a single API operation on a path.
///
/// https://spec.openapis.org/oas/v3.1.0#operation-object
abstract class OpenApiOperation
    implements Built<OpenApiOperation, OpenApiOperationBuilder>, OpenApiNode {
  factory OpenApiOperation({
    required OpenApiOperationType type,
    List<String>? tags,
    String? summary,
    String? description,
    String? operationId,
    List<OpenApiComponentOrRef<OpenApiParameter>>? parameters,
    OpenApiComponentOrRef<OpenApiRequestBody>? requestBody,
    OpenApiComponentOrRef<OpenApiResponse>? defaultResponse,
    Map<StatusCodeOrRange, OpenApiComponentOrRef<OpenApiResponse>>? responses,
    bool? deprecated,
    List<OpenApiServer>? servers,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiOperation._(
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
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
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
  }

  /// REQUIRED. The type of the operation.
  OpenApiOperationType get type;

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
  /// Object's components/parameters.
  BuiltList<OpenApiComponentOrRef<OpenApiParameter>> get parameters;

  /// The request body applicable for this operation.
  ///
  /// The requestBody is only supported in HTTP methods where the HTTP 1.1
  /// specification RFC7231 has explicitly defined semantics for request bodies.
  ///
  /// In other cases where the HTTP spec is vague (such as `GET`, `HEAD` and
  /// `DELETE`), requestBody is permitted but does not have well-defined
  /// semantics and SHOULD be avoided if possible.
  OpenApiComponentOrRef<OpenApiRequestBody>? get requestBody;

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
  BuiltMap<StatusCodeOrRange, OpenApiComponentOrRef<OpenApiResponse>>
      get responses;

  OpenApiComponentOrRef<OpenApiResponse>? get defaultResponse;

  /// A map of possible out-of band callbacks related to the parent operation.
  ///
  /// Each value in the map is a Path Item Object that describes a set of
  /// requests that may be initiated by the API provider and the expected
  /// responses.
  // final Map<String, OpenApiPathItem> callbacks;

  /// Declares this operation to be deprecated.
  ///
  /// Consumers SHOULD refrain from usage of the declared operation.
  bool? get deprecated;

  /// The computed value of [deprecated].
  bool get isDeprecated => deprecated ?? false;

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

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitOperation(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitOperation(this, arg);
}

@immutable
sealed class StatusCodeOrRange {
  static StatusCodeOrRange? tryParse(String statusCode) {
    if (int.tryParse(statusCode) case final code?) {
      return StatusCode(code);
    }
    if (_validRanges.firstMatch(statusCode) case final match?) {
      return StatusCodeRange(int.parse(match.group(1)!));
    }
    return null;
  }

  static final _validRanges = RegExp(r'^([1-5])XX$');
}

final class StatusCode implements StatusCodeOrRange {
  const StatusCode(this.code);

  final int code;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is StatusCode && other.code == code;
  }

  @override
  int get hashCode => code.hashCode;

  @override
  String toString() => code.toString();
}

final class StatusCodeRange implements StatusCodeOrRange {
  const StatusCodeRange(this.group);

  final int group; // e.g. 4, 5

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is StatusCodeRange && other.group == group;
  }

  @override
  int get hashCode => group.hashCode;

  @override
  String toString() => '${group}XX';
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
    implements
        Built<OpenApiParameter, OpenApiParameterBuilder>,
        OpenApiComponent<OpenApiParameter> {
  factory OpenApiParameter({
    required String name,
    required OpenApiParameterLocation location,
    String? description,
    bool? required,
    bool? deprecated,
    bool? allowEmptyValue,
    OpenApiParameterStyle? style,
    bool? explode,
    bool? allowReserved,
    OpenApiComponentOrRef<OpenApiSchema>? schema,
    // Map<String, OpenApiExample> examples = const {},
    // TODO: Or media type range.
    (MediaType, OpenApiMediaType)? content,
    Map<String, Object?>? extensions,
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
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
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
  }

  /// REQUIRED. The name of the parameter.
  ///
  /// Parameter names are case sensitive.
  ///
  /// - If [location] is `path`, the [name] field MUST correspond to a template
  ///   expression occurring within a [OpenApiPathItem] key.
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
  @override
  String? get description;

  /// Determines whether this parameter is mandatory.
  ///
  /// If the parameter location is "path", this property is REQUIRED and its
  /// value MUST be `true`. Otherwise, the property MAY be included and its
  /// default value is `false`.
  bool? get required;

  /// The computed value of [required].
  bool get isRequired => required ?? false;

  /// Specifies that a parameter is deprecated and SHOULD be transitioned out
  /// of usage.
  bool? get deprecated;

  /// The computed value of [deprecated].
  bool get isDeprecated => deprecated ?? false;

  /// Sets the ability to pass empty-valued parameters.
  ///
  /// This is valid only for query parameters and allows sending a parameter
  /// with an empty value.
  ///
  /// Default value is false.
  bool? get allowEmptyValue;

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
  OpenApiComponentOrRef<OpenApiSchema>? get schema;

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
  // TODO: Or media type range.
  (MediaType, OpenApiMediaType)? get content;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitParameter(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitParameter(this, arg);
}

/// Each Media Type Object provides schema and examples for the media type identified by its key.
///
/// https://spec.openapis.org/oas/v3.1.0#media-type-object
abstract class OpenApiMediaType
    implements Built<OpenApiMediaType, OpenApiMediaTypeBuilder>, OpenApiNode {
  factory OpenApiMediaType({
    required OpenApiComponentOrRef<OpenApiSchema> schema,
    // Map<String, OpenApiExample> examples = const {},
    Map<String, OpenApiEncoding>? encoding,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiMediaType._(
      schema: schema,
      // examples: examples.build(),
      encoding: (encoding ?? {}).build(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiMediaType.build(
    void Function(OpenApiMediaTypeBuilder) updates,
  ) = _$OpenApiMediaType;

  OpenApiMediaType._();

  /// The schema defining the content of the request, response, or parameter.
  OpenApiComponentOrRef<OpenApiSchema> get schema;

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

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitMediaType(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitMediaType(this, arg);
}

/// Describes a single request body.
///
/// https://spec.openapis.org/oas/v3.1.0#request-body-object
abstract class OpenApiRequestBody
    implements
        Built<OpenApiRequestBody, OpenApiRequestBodyBuilder>,
        OpenApiComponent<OpenApiRequestBody> {
  factory OpenApiRequestBody({
    // TODO: Or media type range.
    required Map<MediaType, OpenApiMediaType> content,
    String? description,
    bool? required,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiRequestBody._(
      content: content.build(),
      description: description,
      required: required,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
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
  }

  /// REQUIRED. The content of the request body.
  ///
  /// The key is a media type or [media type range](https://tools.ietf.org/html/rfc7231#appendix-D)
  /// and the value describes it.
  ///
  /// For requests that match multiple keys, only the most specific key is
  /// applicable. e.g. `text/plain` overrides `text/*`.
  // TODO: Or media type range.
  BuiltMap<MediaType, OpenApiMediaType> get content;

  /// A brief description of the request body.
  ///
  /// This could contain examples of use. CommonMark syntax MAY be used for
  /// rich text representation.
  @override
  String? get description;

  /// Determines if the request body is required in the request.
  ///
  /// Defaults to `false`.
  bool? get required;

  /// The computed value of [required].
  bool get isRequired => required ?? false;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitRequestBody(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitRequestBody(this, arg);
}

/// A single encoding definition applied to a single schema property.
///
/// https://spec.openapis.org/oas/v3.1.0#encoding-object
abstract class OpenApiEncoding
    implements Built<OpenApiEncoding, OpenApiEncodingBuilder>, OpenApiNode {
  factory OpenApiEncoding({
    required MediaType contentType,
    Map<String, OpenApiComponentOrRef<OpenApiHeader>> headers = const {},
    OpenApiParameterStyle? style,
    bool? explode,
    bool? allowReserved,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiEncoding._(
      contentType: contentType,
      headers: headers.build(),
      style: style,
      explode: explode,
      allowReserved: allowReserved,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiEncoding.build(
    void Function(OpenApiEncodingBuilder) updates,
  ) = _$OpenApiEncoding;

  OpenApiEncoding._();

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
  BuiltMap<String, OpenApiComponentOrRef<OpenApiHeader>> get headers;

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
  bool? get explode;

  /// The computed value of [explode].
  bool get shouldExplode =>
      explode ??
      switch (style) {
        OpenApiParameterStyle.form => true,
        _ => false,
      };

  /// Determines whether the parameter value SHOULD allow reserved characters,
  /// as defined by [RFC3986](https://tools.ietf.org/html/rfc3986): `:/?#[]@!$&'()*+,;=`
  ///
  /// This property SHALL be ignored if the request body media type is not
  /// `application/x-www-form-urlencoded` or `multipart/form-data`. If a value
  /// is explicitly defined, then the value of [contentType] (implicit or
  /// explicit) SHALL be ignored.
  bool? get allowReserved;

  /// The computed value of [allowReserved].
  bool get allowsReserved => allowReserved ?? false;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitEncoding(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitEncoding(this, arg);
}

/// {@macro openapi_response}
///
/// https://spec.openapis.org/oas/v3.1.0#responses-object
abstract class OpenApiResponse
    implements
        Built<OpenApiResponse, OpenApiResponseBuilder>,
        OpenApiComponent<OpenApiResponse> {
  factory OpenApiResponse({
    required StatusCodeOrRange? statusCode,
    required String description,
    Map<String, OpenApiComponentOrRef<OpenApiHeader>>? headers,
    Map<MediaType, OpenApiMediaType>? content,
    // Map<String, OpenApiLink> links = const {},
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiResponse._(
      statusCode: statusCode,
      description: description,
      headers: headers?.build(),
      content: content?.build(),
      // links: links,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiResponse.build(
    void Function(OpenApiResponseBuilder) updates,
  ) = _$OpenApiResponse;

  OpenApiResponse._();

  StatusCodeOrRange? get statusCode;

  /// REQUIRED. A short description of the response.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  @override
  String get description;

  /// Maps a header name to its definition.
  ///
  /// [RFC7230](https://tools.ietf.org/html/rfc7230) states header names are
  /// case insensitive. If a response header is defined with the name
  /// "Content-Type", it SHALL be ignored.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#responses-object
  BuiltMap<String, OpenApiComponentOrRef<OpenApiHeader>>? get headers;

  /// A map containing descriptions of potential response payloads.
  ///
  /// The key is a media type or [media type range](https://tools.ietf.org/html/rfc7231#appendix-D)
  /// and the value describes it. For responses that match multiple keys, only
  /// the most specific key is applicable. e.g. `text/plain` overrides `text/*`.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#responses-object
  BuiltMap<MediaType, OpenApiMediaType>? get content;

  /// A map of operations links that can be followed from the response.
  ///
  /// The key of the map is a short name for the link, following the naming
  /// constraints of the names for Component Objects.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#responses-object
  // final Map<String, OpenApiLink> links;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitResponse(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitResponse(this, arg);
}

/// The Header Object follows the structure of the Parameter Object with the following changes:
///
/// 1. `name` MUST NOT be specified, it is given in the corresponding `headers` map.
/// 2. `in` MUST NOT be specified, it is implicitly in `header`.
/// 3. All traits that are affected by the location MUST be applicable to a location of `header` (for example, `style`).
///
/// https://spec.openapis.org/oas/v3.1.0#header-object
abstract class OpenApiHeader
    implements
        Built<OpenApiHeader, OpenApiHeaderBuilder>,
        OpenApiComponent<OpenApiHeader> {
  factory OpenApiHeader({
    required OpenApiComponentOrRef<OpenApiSchema> schema,
    String? description,
    bool? required,
    bool? deprecated,
    bool? allowEmptyValue,
    OpenApiParameterStyle? style,
    bool? explode,
    bool? allowReserved,
    (MediaType, OpenApiMediaType)? content,
    Map<String, Object?>? extensions,
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
      content: content,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiHeader.build(
    void Function(OpenApiHeaderBuilder) updates,
  ) = _$OpenApiHeader;

  OpenApiHeader._();

  /// The schema defining the type used for the parameter.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  OpenApiComponentOrRef<OpenApiSchema> get schema;

  /// A brief description of the parameter.
  ///
  /// This could contain examples of use. CommonMark syntax MAY be used for
  /// rich text representation.
  @override
  String? get description;

  /// Determines whether this parameter is mandatory.
  ///
  /// If the parameter location is "path", this property is REQUIRED and its
  /// value MUST be `true`. Otherwise, the property MAY be included and its
  /// default value is `false`.
  bool? get required;

  /// The computed value of [required].
  bool get isRequired => required ?? false;

  /// Specifies that a parameter is deprecated and SHOULD be transitioned out
  /// of usage.
  bool? get deprecated;

  /// The computed value of [deprecated].
  bool get isDeprecated => deprecated ?? false;

  /// Sets the ability to pass empty-valued parameters.
  ///
  /// This is valid only for query parameters and allows sending a parameter
  /// with an empty value.
  ///
  /// Default value is false.
  bool? get allowEmptyValue;

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

  /// A map containing the representations for the parameter.
  ///
  /// The key is the media type and the value describes it. The map MUST only
  /// contain one entry.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#parameter-object
  (MediaType, OpenApiMediaType)? get content;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitHeader(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitHeader(this, arg);
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
    implements Built<OpenApiComponents, OpenApiComponentsBuilder>, OpenApiNode {
  factory OpenApiComponents({
    Map<String, OpenApiSchema>? schemas,
    Map<String, OpenApiResponse>? responses,
    Map<String, OpenApiParameter>? parameters,
    // Map<String, OpenApiExample> examples = const {},
    Map<String, OpenApiRequestBody>? requestBodies,
    Map<String, OpenApiHeader>? headers,
    Map<String, OpenApiSecurityScheme> securitySchemes = const {},
    // Map<String, OpenApiLink> links = const {},
    // Map<String, OpenApiPathItem> callbacks = const {},
    Map<String, OpenApiPathItem>? paths,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiComponents._(
      schemas: (schemas ?? {}).build(),
      responses: (responses ?? {}).build(),
      parameters: (parameters ?? {}).build(),
      // examples: examples.build(),
      requestBodies: (requestBodies ?? {}).build(),
      headers: (headers ?? {}).build(),
      securitySchemes: securitySchemes.build(),
      // links: links.build(),
      // callbacks: callbacks.build(),
      paths: (paths ?? {}).build(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiComponents.build(
    void Function(OpenApiComponentsBuilder) updates,
  ) = _$OpenApiComponents;

  OpenApiComponents._();

  /// An object to hold reusable Schema Objects.
  BuiltMap<String, OpenApiSchema> get schemas;

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
  BuiltMap<String, OpenApiSecurityScheme> get securitySchemes;

  /// An object to hold reusable Link Objects.
  // final Map<String, OpenApiLink> links;

  /// An object to hold reusable Callback Objects.
  // final Map<String, OpenApiPathItem> callbacks;

  /// An object to hold reusable Path Item Object.
  BuiltMap<String, OpenApiPathItem> get paths;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitComponents(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitComponents(this, arg);
}

@immutable
sealed class ItemOrList<T extends Object> {
  T? get value;
}

final class ItemValue<T extends Object> implements ItemOrList<T> {
  const ItemValue(this.value);

  @override
  final T value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is ItemValue && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value.toString();
}

final class ItemList<T extends Object> extends DelegatingList<T>
    implements ItemOrList<T> {
  const ItemList(super.base);

  @override
  T? get value => null;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ItemList<T> && ListEquality<T>().equals(this, other);
  }

  @override
  int get hashCode => ListEquality<T>().hash(this);

  @override
  String toString() => '[${join(', ')}]';
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
abstract class OpenApiSchema
    implements
        Built<OpenApiSchema, OpenApiSchemaBuilder>,
        OpenApiComponent<OpenApiSchema> {
  factory OpenApiSchema({
    String? ref,
    YamlNode? node,
    String? name,
    String? title,
    String? description,
    ItemOrList<JsonType>? type,
    bool? nullable,
    Iterable<OpenApiComponentOrRef<OpenApiSchema>>? allOf,
    Iterable<OpenApiComponentOrRef<OpenApiSchema>>? oneOf,
    Iterable<OpenApiComponentOrRef<OpenApiSchema>>? anyOf,
    // required OpenApiComponentOrRef<OpenApiSchema>? not,
    OpenApiComponentOrRef<OpenApiSchema>? items,
    int? maxItems,
    int? minItems,
    bool? uniqueItems,
    Map<String, OpenApiComponentOrRef<OpenApiSchema>>? properties,
    OpenApiAdditionalProperties? additionalProperties,
    int? maxProperties,
    int? minProperties,
    Iterable<String>? required,
    JsonTypeFormat? format,
    Object? defaultValue,
    num? multipleOf,
    num? maximum,
    bool? exclusiveMaximum,
    num? minimum,
    bool? exclusiveMinimum,
    int? maxLength,
    int? minLength,
    String? pattern,
    Iterable<Object?>? enumValues,
    bool? deprecated,
    bool? readOnly,
    bool? writeOnly,
    OpenApiDiscriminator? discriminator,
    Object? example,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiSchema._(
      ref: ref,
      node: node,
      name: name,
      title: title,
      description: description,
      type: type,
      nullable: nullable,
      allOf: allOf?.toBuiltList(),
      oneOf: oneOf?.toBuiltList(),
      anyOf: anyOf?.toBuiltList(),
      // not: not,
      items: items,
      maxItems: maxItems,
      minItems: minItems,
      uniqueItems: uniqueItems,
      properties: properties?.build(),
      additionalProperties: additionalProperties,
      maxProperties: maxProperties,
      minProperties: minProperties,
      required: required?.toBuiltSet(),
      format: format,
      defaultValue: defaultValue,
      multipleOf: multipleOf,
      maximum: maximum,
      exclusiveMaximum: exclusiveMaximum,
      minimum: minimum,
      exclusiveMinimum: exclusiveMinimum,
      maxLength: maxLength,
      minLength: minLength,
      pattern: pattern,
      enumValues: enumValues?.toBuiltSet(),
      deprecated: deprecated,
      readOnly: readOnly,
      writeOnly: writeOnly,
      discriminator: discriminator,
      example: example == null ? null : JsonObject(example),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiSchema.build(
    void Function(OpenApiSchemaBuilder) updates,
  ) = _$OpenApiSchema;

  OpenApiSchema._();

  /// The intrinsic name of the type, if any.
  ///
  /// This is the exact value from the source YAML and is not suitable for use
  /// in Dart representations, unlike [name].
  String? get name;

  /// The value of this keyword MUST be either a string or an array. If it is
  /// an array, elements of the array MUST be strings and MUST be unique.
  ///
  /// String values MUST be one of the six primitive types ("null", "boolean",
  /// "object", "array", "number", or "string"), or "integer" which matches any
  /// number with a zero fractional part.
  ///
  /// If the value of "type" is a string, then an instance validates
  /// successfully if its type matches the type represented by the value of the
  /// string. If the value of "type" is an array, then an instance validates
  /// successfully if its type matches any of the types indicated by the strings
  /// in the array.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-type
  ItemOrList<JsonType>? get type;

  bool? get nullable;

  BuiltList<OpenApiComponentOrRef<OpenApiSchema>>? get allOf;

  BuiltList<OpenApiComponentOrRef<OpenApiSchema>>? get oneOf;

  BuiltList<OpenApiComponentOrRef<OpenApiSchema>>? get anyOf;

  // OpenApiComponentOrRef<OpenApiSchema>? get not;

  OpenApiComponentOrRef<OpenApiSchema>? get items;

  int? get maxItems;

  int? get minItems;

  bool? get uniqueItems;

  BuiltMap<String, OpenApiComponentOrRef<OpenApiSchema>>? get properties;

  OpenApiAdditionalProperties? get additionalProperties;

  int? get maxProperties;

  int? get minProperties;

  /// The list of required properties, if any.
  ///
  /// The value of this keyword MUST be an array. Elements of this array, if
  /// any, MUST be strings, and MUST be unique.
  ///
  /// An object instance is valid against this keyword if every item in the
  /// array is the name of a property in the instance.
  ///
  /// Omitting this keyword has the same behavior as an empty array.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-required
  BuiltSet<String>? get required;

  JsonTypeFormat? get format;

  num? get multipleOf;

  num? get maximum;

  bool? get exclusiveMaximum;

  num? get minimum;

  bool? get exclusiveMinimum;

  int? get maxLength;

  int? get minLength;

  String? get pattern;

  /// The value of this keyword MUST be an array. This array SHOULD have at
  /// least one element. Elements in the array SHOULD be unique.
  ///
  /// An instance validates successfully against this keyword if its value is
  /// equal to one of the elements in this keyword's array value.
  ///
  /// Elements in the array might be of any type, including `null`.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#section-6.1.2
  BuiltSet<Object?>? get enumValues;

  // const
  // https://json-schema.org/draft/2020-12/json-schema-validation#section-6.1.3

  /// Adds support for polymorphism.
  ///
  /// The discriminator is an object name that is used to differentiate between
  /// other schemas which may satisfy the payload description.
  ///
  /// See Composition and Inheritance for more details.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#schema-object
  OpenApiDiscriminator? get discriminator;

  // xml
  // externalDocs

  /// A free-form property to include an example of an instance for this schema.
  ///
  /// To represent examples that cannot be naturally represented in JSON or
  /// YAML, a string value can be used to contain the example with escaping
  /// where necessary.
  ///
  /// **Deprecated**: The example property has been deprecated in favor of the
  /// JSON Schema examples keyword. Use of example is discouraged, and later
  /// versions of this specification may remove it.
  ///
  /// https://spec.openapis.org/oas/v3.1.0#fixed-fields-19
  JsonObject? get example;

  /// Both [title] and [description] can be used to decorate a user interface
  /// with information about the data produced by this user interface. A title
  /// will preferably be short, whereas a description will provide explanation
  /// about the purpose of the instance described by this schema.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-title-and-description
  String? get title;

  /// CommonMark syntax MAY be used for rich text representation.
  @override
  String? get description;

  /// Specifies that a schema is deprecated and SHOULD be transitioned out of usage.
  bool? get deprecated;

  /// This keyword can be used to supply a default JSON value associated with a
  /// particular schema.
  ///
  /// It is RECOMMENDED that a default value be valid against the associated
  /// schema.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-default
  Object? get defaultValue;

  /// If "readOnly" has a value of boolean true, it indicates that the value of
  /// the instance is managed exclusively by the owning authority, and attempts
  /// by an application to modify the value of this property are expected to be
  /// ignored or rejected by that owning authority.
  ///
  /// An instance document that is marked as "readOnly" for the entire document
  /// MAY be ignored if sent to the owning authority, or MAY result in an error,
  /// at the authority's discretion.
  ///
  /// These keywords can be used to assist in user interface instance
  /// generation. In particular, an application MAY choose to use a widget that
  /// hides input values as they are typed for write-only fields.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-readonly-and-writeonly
  bool? get readOnly;

  /// If "writeOnly" has a value of boolean true, it indicates that the value is
  /// never present when the instance is retrieved from the owning authority. It
  /// can be present when sent to the owning authority to update or create the
  /// document (or the resource it represents), but it will not be included in
  /// any updated or newly created version of the instance.
  ///
  /// An instance document that is marked as "writeOnly" for the entire document
  /// MAY be returned as a blank document of some sort, or MAY produce an error
  /// upon retrieval, or have the retrieval request ignored, at the authority's
  /// discretion.
  ///
  /// For example, "readOnly" would be used to mark a database-generated serial
  /// number as read-only, while "writeOnly" would be used to mark a password
  /// input field.
  ///
  /// These keywords can be used to assist in user interface instance
  /// generation. In particular, an application MAY choose to use a widget that
  /// hides input values as they are typed for write-only fields.
  ///
  /// https://json-schema.org/draft/2020-12/json-schema-validation#name-readonly-and-writeonly
  bool? get writeOnly;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitSchema(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitSchema(this, arg);
}

abstract class OpenApiAdditionalProperties
    implements
        Built<OpenApiAdditionalProperties, OpenApiAdditionalPropertiesBuilder>,
        OpenApiNode {
  factory OpenApiAdditionalProperties({
    bool? allow,
    OpenApiComponentOrRef<OpenApiSchema>? schema,
  }) {
    assert(
      allow != null || schema != null,
      'Either allow or schema must be provided',
    );
    return _$OpenApiAdditionalProperties._(
      allow: allow,
      schema: schema,
    );
  }

  factory OpenApiAdditionalProperties.build([
    void Function(OpenApiAdditionalPropertiesBuilder) updates,
  ]) = _$OpenApiAdditionalProperties;

  OpenApiAdditionalProperties._();

  bool? get allow;

  OpenApiComponentOrRef<OpenApiSchema>? get schema;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) =>
      visitor.visitAdditionalProperties(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitAdditionalProperties(this, arg);
}

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
    implements
        Built<OpenApiDiscriminator, OpenApiDiscriminatorBuilder>,
        OpenApiNode {
  factory OpenApiDiscriminator({
    required String propertyName,
    Map<String, String>? mapping,
    String? ref,
    YamlNode? node,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiDiscriminator._(
      ref: ref,
      node: node,
      propertyName: propertyName,
      mapping: mapping?.build(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
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

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitDiscriminator(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitDiscriminator(this, arg);
}

/// Defines a security scheme that can be used by the operations.
///
/// Supported schemes are HTTP authentication, an API key (either as a header, a cookie parameter or as a query parameter),
/// OAuth2's common flows (implicit, password, client credentials and authorization code) as defined in RFC6749,
/// and OpenID Connect Discovery.
///
/// https://spec.openapis.org/oas/v3.1.0#security-scheme-object
abstract class OpenApiSecurityScheme
    implements
        Built<OpenApiSecurityScheme, OpenApiSecuritySchemeBuilder>,
        OpenApiComponent<OpenApiSecurityScheme> {
  factory OpenApiSecurityScheme({
    required OpenApiSecuritySchemeType type,
    String? description,
    String? name,
    OpenApiParameterLocation? location,
    String? scheme,
    String? bearerFormat,
    OpenApiOAuthFlows? flows,
    String? openIdConnectUrl,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiSecurityScheme._(
      type: type,
      description: description,
      name: name,
      location: location,
      scheme: scheme,
      bearerFormat: bearerFormat,
      flows: flows,
      openIdConnectUrl: openIdConnectUrl,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiSecurityScheme.build(
    void Function(OpenApiSecuritySchemeBuilder) updates,
  ) = _$OpenApiSecurityScheme;

  OpenApiSecurityScheme._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OpenApiSecuritySchemeBuilder b) {
    switch (b.type) {
      case OpenApiSecuritySchemeType.apiKey:
        if (b.name == null || b.location == null) {
          throw ArgumentError.value(
            b,
            'securityScheme',
            'name and location are required for apiKey type',
          );
        }
      case OpenApiSecuritySchemeType.http:
        if (b.scheme == null) {
          throw ArgumentError.value(
            b,
            'securityScheme',
            'scheme is required for http type',
          );
        }
      case OpenApiSecuritySchemeType.oauth2:
        if (b._flows == null) {
          throw ArgumentError.value(
            b,
            'securityScheme',
            'flows is required for oauth2 type',
          );
        }
      case OpenApiSecuritySchemeType.openIdConnect:
        if (b.openIdConnectUrl == null) {
          throw ArgumentError.value(
            b,
            'securityScheme',
            'openIdConnectUrl is required for openIdConnect type',
          );
        }
    }
  }

  /// REQUIRED. The type of the security scheme.
  OpenApiSecuritySchemeType get type;

  /// A short description for security scheme.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  @override
  String? get description;

  /// REQUIRED for apiKey. The name of the header, query or cookie parameter to be used.
  String? get name;

  /// REQUIRED for apiKey. The location of the API key.
  OpenApiParameterLocation? get location;

  /// REQUIRED for http. The name of the HTTP Authorization scheme to be used in the Authorization header as defined in RFC7235.
  ///
  /// The values used SHOULD be registered in the IANA Authentication Scheme registry.
  String? get scheme;

  /// A hint to the client to identify how the bearer token is formatted.
  ///
  /// Bearer tokens are usually generated by an authorization server, so this information is primarily for documentation purposes.
  String? get bearerFormat;

  /// REQUIRED for oauth2. An object containing configuration information for the flow types supported.
  OpenApiOAuthFlows? get flows;

  /// REQUIRED for openIdConnect. OpenId Connect URL to discover OAuth2 configuration values.
  ///
  /// This MUST be in the form of a URL.
  String? get openIdConnectUrl;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitSecurityScheme(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitSecurityScheme(this, arg);
}

/// The type of the security scheme.
final class OpenApiSecuritySchemeType extends EnumClass {
  const OpenApiSecuritySchemeType._(super.name);

  /// API key in header, query or cookie
  static const OpenApiSecuritySchemeType apiKey = _$apiKey;

  /// HTTP authentication
  static const OpenApiSecuritySchemeType http = _$http;

  /// OAuth2 authentication
  static const OpenApiSecuritySchemeType oauth2 = _$oauth2;

  /// OpenID Connect authentication
  static const OpenApiSecuritySchemeType openIdConnect = _$openIdConnect;

  static BuiltSet<OpenApiSecuritySchemeType> get values =>
      _$OpenApiSecuritySchemeTypeValues;
  static OpenApiSecuritySchemeType valueOf(String name) =>
      _$OpenApiSecuritySchemeTypeValueOf(name);
}

/// Allows configuration of the supported OAuth Flows.
///
/// https://spec.openapis.org/oas/v3.1.0#oauth-flows-object
abstract class OpenApiOAuthFlows
    implements Built<OpenApiOAuthFlows, OpenApiOAuthFlowsBuilder>, OpenApiNode {
  factory OpenApiOAuthFlows({
    OpenApiOAuthFlow? implicit,
    OpenApiOAuthFlow? password,
    OpenApiOAuthFlow? clientCredentials,
    OpenApiOAuthFlow? authorizationCode,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiOAuthFlows._(
      implicit: implicit,
      password: password,
      clientCredentials: clientCredentials,
      authorizationCode: authorizationCode,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiOAuthFlows.build(
    void Function(OpenApiOAuthFlowsBuilder) updates,
  ) = _$OpenApiOAuthFlows;

  OpenApiOAuthFlows._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OpenApiOAuthFlowsBuilder b) {
    if (b._implicit case final implicit?) {
      if (implicit.authorizationUrl == null) {
        throw ArgumentError.value(
          b,
          'oauthFlows',
          'authorizationUrl is required for implicit flow',
        );
      }
    }
    if (b._password case final password?) {
      if (password.tokenUrl == null) {
        throw ArgumentError.value(
          b,
          'oauthFlows',
          'tokenUrl is required for password flow',
        );
      }
    }
    if (b._clientCredentials case final clientCredentials?) {
      if (clientCredentials.tokenUrl == null) {
        throw ArgumentError.value(
          b,
          'oauthFlows',
          'tokenUrl is required for clientCredentials flow',
        );
      }
    }
    if (b._authorizationCode case final authorizationCode?) {
      if (authorizationCode.authorizationUrl == null ||
          authorizationCode.tokenUrl == null) {
        throw ArgumentError.value(
          b,
          'oauthFlows',
          'authorizationUrl and tokenUrl are required for authorizationCode flow',
        );
      }
    }
  }

  /// Configuration for the OAuth Implicit flow
  OpenApiOAuthFlow? get implicit;

  /// Configuration for the OAuth Resource Owner Password flow
  OpenApiOAuthFlow? get password;

  /// Configuration for the OAuth Client Credentials flow
  OpenApiOAuthFlow? get clientCredentials;

  /// Configuration for the OAuth Authorization Code flow
  OpenApiOAuthFlow? get authorizationCode;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitOAuthFlows(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitOAuthFlows(this, arg);
}

/// Configuration details for a supported OAuth Flow
///
/// https://spec.openapis.org/oas/v3.1.0#oauth-flow-object
abstract class OpenApiOAuthFlow
    implements Built<OpenApiOAuthFlow, OpenApiOAuthFlowBuilder>, OpenApiNode {
  factory OpenApiOAuthFlow({
    String? authorizationUrl,
    String? tokenUrl,
    String? refreshUrl,
    Map<String, String> scopes = const {},
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiOAuthFlow._(
      authorizationUrl: authorizationUrl,
      tokenUrl: tokenUrl,
      refreshUrl: refreshUrl,
      scopes: scopes.build(),
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiOAuthFlow.build(
    void Function(OpenApiOAuthFlowBuilder) updates,
  ) = _$OpenApiOAuthFlow;

  OpenApiOAuthFlow._();

  /// REQUIRED. The authorization URL to be used for this flow.
  ///
  /// This MUST be in the form of a URL.
  String? get authorizationUrl;

  /// REQUIRED. The token URL to be used for this flow.
  ///
  /// This MUST be in the form of a URL.
  String? get tokenUrl;

  /// The URL to be used for obtaining refresh tokens.
  ///
  /// This MUST be in the form of a URL.
  String? get refreshUrl;

  /// REQUIRED. The available scopes for the OAuth2 security scheme.
  ///
  /// A map between the scope name and a short description for it.
  BuiltMap<String, String> get scopes;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitOAuthFlow(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitOAuthFlow(this, arg);
}

/// Lists the required security schemes to execute this operation.
///
/// The name used for each property MUST correspond to a security scheme
/// declared in the Security Schemes under the Components Object.
///
/// Security Requirement Objects that contain multiple schemes require that
/// all schemes MUST be satisfied for a request to be authorized. This enables
/// support for scenarios where multiple query parameters or HTTP headers are
/// required to convey security information.
///
/// When a list of Security Requirement Objects is defined on the OpenAPI
/// Object or Operation Object, only one of the Security Requirement Objects
/// in the list needs to be satisfied to authorize the request.
///
/// https://spec.openapis.org/oas/v3.1.0#security-requirement-object
abstract class OpenApiSecurityRequirement
    implements
        Built<OpenApiSecurityRequirement, OpenApiSecurityRequirementBuilder>,
        OpenApiNode {
  factory OpenApiSecurityRequirement({
    Map<String, List<String>> schemes = const {},
  }) {
    return _$OpenApiSecurityRequirement._(
      schemes: schemes.map((k, v) => MapEntry(k, v.build())).build(),
    );
  }

  factory OpenApiSecurityRequirement.build(
    void Function(OpenApiSecurityRequirementBuilder) updates,
  ) = _$OpenApiSecurityRequirement;

  OpenApiSecurityRequirement._();

  /// Each name MUST correspond to a security scheme which is declared in the
  /// Security Schemes under the Components Object. If the security scheme is
  /// of type "oauth2" or "openIdConnect", then the value is a list of scope
  /// names required for the execution. For other security scheme types, the
  /// array MUST be empty.
  BuiltMap<String, BuiltList<String>> get schemes;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) =>
      visitor.visitSecurityRequirement(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitSecurityRequirement(this, arg);
}

/// Adds metadata to a single tag that is used by the Operation Object.
///
/// It is not mandatory to have a Tag Object per tag defined in the Operation Object instances.
///
/// https://spec.openapis.org/oas/v3.1.0#tag-object
abstract class OpenApiTag
    implements Built<OpenApiTag, OpenApiTagBuilder>, OpenApiNode {
  factory OpenApiTag({
    required String name,
    String? description,
    OpenApiExternalDocs? externalDocs,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiTag._(
      name: name,
      description: description,
      externalDocs: externalDocs,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiTag.build(
    void Function(OpenApiTagBuilder) updates,
  ) = _$OpenApiTag;

  OpenApiTag._();

  /// REQUIRED. The name of the tag.
  String get name;

  /// A description for the tag.
  ///
  /// CommonMark syntax MAY be used for rich text representation.
  String? get description;

  /// Additional external documentation for this tag.
  OpenApiExternalDocs? get externalDocs;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitTag(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitTag(this, arg);
}

/// Contact information for the exposed API.
///
/// https://spec.openapis.org/oas/v3.1.0#contact-object
abstract class OpenApiContact
    implements Built<OpenApiContact, OpenApiContactBuilder>, OpenApiNode {
  factory OpenApiContact({
    String? name,
    String? url,
    String? email,
    Map<String, Object?>? extensions,
  }) {
    return _$OpenApiContact._(
      name: name,
      url: url,
      email: email,
      extensions: extensions?.map((k, v) => MapEntry(k, JsonObject(v))).build(),
    );
  }

  factory OpenApiContact.build(
    void Function(OpenApiContactBuilder) updates,
  ) = _$OpenApiContact;

  OpenApiContact._();

  /// The identifying name of the contact person/organization.
  String? get name;

  /// The URL pointing to the contact information.
  ///
  /// This MUST be in the form of a URL.
  String? get url;

  /// The email address of the contact person/organization.
  ///
  /// This MUST be in the form of an email address.
  String? get email;

  @override
  R accept<R>(OpenApiVisitor<R> visitor) => visitor.visitContact(this);

  @override
  R acceptWithArg<R, A>(OpenApiVisitorWithArg<R, A> visitor, A arg) =>
      visitor.visitContact(this, arg);
}

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:celest_cli/openapi/model/openapi_v3.dart';
import 'package:celest_cli/openapi/type/openapi_type.dart';
import 'package:celest_cli/openapi/type/openapi_type_schema.dart';
import 'package:code_builder/code_builder.dart';

part 'openapi_service.g.dart';

abstract class OpenApiService
    implements Built<OpenApiService, OpenApiServiceBuilder> {
  factory OpenApiService.build([
    void Function(OpenApiServiceBuilder) updates,
  ]) = _$OpenApiService;

  OpenApiService._();

  /// The Dart type name prefix of the service.
  ///
  /// This is used as the prefix for all service-related types (typically,
  /// non-model types whose identity is intrinsically tied to the service).
  String get typePrefix;

  /// The Dart class name of the client.
  String get clientClassName;

  /// A description of the service, if provided.
  String? get description;

  /// Metadata about the service.
  ServiceInfo get info;

  /// The universe of model types in the service.
  BuiltMap<String, ServiceModel> get models;

  /// The root path (`/`) operations which are flattened into the client class.
  ServicePath get rootPath;
}

abstract class ServiceModel
    implements Built<ServiceModel, ServiceModelBuilder> {
  factory ServiceModel({
    required Spec spec,
    required OpenApiType type,
  }) {
    return _$ServiceModel._(
      spec: spec,
      type: type,
    );
  }

  factory ServiceModel.build([void Function(ServiceModelBuilder) updates]) =
      _$ServiceModel;

  ServiceModel._();

  /// The code-generated spec for the type.
  Spec get spec;

  // TODO: wireType

  /// The type of this model.
  OpenApiType get type;
}

/// An instantiated [ServiceModel], unique to its usage location.
abstract class ServiceModelElement
    implements Built<ServiceModelElement, ServiceModelElementBuilder> {
  factory ServiceModelElement({
    required TypeReference reference,
    required OpenApiType type,
    required OpenApiTypeSchema debugSchema,
  }) {
    return _$ServiceModelElement._(
      reference: reference,
      type: type,
      debugSchema: debugSchema,
    );
  }

  factory ServiceModelElement.build([
    void Function(ServiceModelElementBuilder) updates,
  ]) = _$ServiceModelElement;

  ServiceModelElement._();

  /// A reference to the type, it's location, and nullability.
  TypeReference get reference;

  // TODO: wireType

  /// The type of this element.
  OpenApiType get type;

  /// The schema used to instantiate this type.
  OpenApiTypeSchema get debugSchema;
}

abstract class ServiceInfo implements Built<ServiceInfo, ServiceInfoBuilder> {
  factory ServiceInfo.build([
    void Function(ServiceInfoBuilder) updates,
  ]) = _$ServiceInfo;

  ServiceInfo._();

  /// The name for the wrapper type over the service's [hosts].
  String get extensionTypeName;

  /// The name of the default host.
  String get defaultHost;

  /// The hosts for the service.
  ///
  /// This will always contain at least one host. If there is only one host,
  /// [defaultHost] will point to it.
  BuiltMap<String, ServiceHost> get hosts;
}

abstract class ServiceHost implements Built<ServiceHost, ServiceHostBuilder> {
  factory ServiceHost.build([void Function(ServiceHostBuilder) updates]) =
      _$ServiceHost;

  ServiceHost._();

  String get name;
  String? get description;

  /// A codegen-ready Dart string with variables replaced with interpolated
  /// Dart variables.
  String get mappedUrl;

  /// A map of variable Dart names to their spec.
  ServiceHostVariables? get variables;

  /// Whether the host has any variables associated with it.
  bool get hasVariables => variables != null;
}

abstract class ServiceHostVariables
    implements Built<ServiceHostVariables, ServiceHostVariablesBuilder> {
  factory ServiceHostVariables.build([
    void Function(ServiceHostVariablesBuilder) updates,
  ]) = _$ServiceHostVariables;

  ServiceHostVariables._();

  /// The name of the Dart class to represent
  String get className;

  /// The variables for this host.
  BuiltMap<String, ServiceHostVariable> get variables;
}

abstract class ServiceHostVariable
    implements Built<ServiceHostVariable, ServiceHostVariableBuilder> {
  factory ServiceHostVariable.build([
    void Function(ServiceHostVariableBuilder) updates,
  ]) = _$ServiceHostVariable;

  ServiceHostVariable._();

  /// If [values] are provided, the name for the wrapper over the variable's
  /// [values].
  String? get extensionTypeName;

  /// A mapping of Dart names to raw values.
  BuiltMap<String, String>? get enumValues;

  /// The description of the variable, if provided.
  String? get description;

  /// The Dart name of the default value
  String get defaultValue;
}

abstract class ServicePath implements Built<ServicePath, ServicePathBuilder> {
  factory ServicePath.build([void Function(ServicePathBuilder) updates]) =
      _$ServicePath;

  ServicePath._();

  /// The name of the Dart class which contains the interface defined by
  /// [methods] and [subpaths].
  ///
  /// Will be `null` for the root path.
  String? get className;

  /// The path in `lib` which contains this path's class.
  String? get libraryPath;

  /// The Dart variable name to use on the parent.
  ///
  /// Will be `null` for the root path.
  String? get variableName;

  BuiltMap<String, ServicePathParameter> get pathParameters;

  BuiltMap<String, ServiceMethod> get methods;

  /// Dart variable name -> subpath.
  BuiltMap<String, ServicePath> get subpaths;
}

abstract class ServicePathParameter
    implements Built<ServicePathParameter, ServicePathParameterBuilder> {
  factory ServicePathParameter({
    required String variableName,
    required OpenApiType type,
    bool inherited = false,
  }) {
    return _$ServicePathParameter._(
      variableName: variableName,
      type: type,
      inherited: inherited,
    );
  }

  factory ServicePathParameter.build([
    void Function(ServicePathParameterBuilder) updates,
  ]) = _$ServicePathParameter;

  ServicePathParameter._();

  String get variableName;
  OpenApiType get type;
  bool get inherited;
}

abstract class ServiceMethod
    implements Built<ServiceMethod, ServiceMethodBuilder> {
  // factory ServiceMethod({
  //   bool deprecated = false,
  //   String? summary,
  //   String? description,
  //   required String methodName,
  //   required OpenApiOperationType methodType,
  //   required String mappedPath,
  //   required List<ServicePathParameter> pathParameters,
  //   required List<HeaderOrQueryParameter> queryParameters,
  //   required List<HeaderOrQueryParameter> headers,
  //   OpenApiType? bodyType,
  //   required OpenApiType responseType,
  //   ServiceMethodResponse? defaultResponse,
  //   required Map<int, ServiceMethodResponse> responseCases,
  // }) {
  //   return _$ServiceMethod._(
  //     methodName: methodName,
  //     methodType: methodType,
  //     mappedPath: mappedPath,
  //     pathParameters: pathParameters.build(),
  //     queryParameters: queryParameters.build(),
  //     headers: headers.build(),
  //     deprecated: deprecated,
  //     summary: summary,
  //     description: description,
  //     bodyType: bodyType,
  //     responseType: responseType,
  //     defaultResponse: defaultResponse,
  //     responseCases: responseCases.build(),
  //   );
  // }

  factory ServiceMethod.build([void Function(ServiceMethodBuilder) updates]) =
      _$ServiceMethod;

  ServiceMethod._();

  bool get deprecated;
  String? get summary;
  String? get description;

  /// The Dart method name.
  String get methodName;
  OpenApiOperationType get methodType;

  String get mappedPath;

  BuiltList<ServicePathParameter> get pathParameters;
  BuiltList<HeaderOrQueryParameter> get queryParameters;
  BuiltList<HeaderOrQueryParameter> get headers;

  OpenApiType? get bodyType;

  OpenApiType get responseType;
  ServiceMethodResponse? get defaultResponse;
  BuiltMap<int, ServiceMethodResponse> get responseCases;
}

abstract class ServiceMethodResponse
    implements Built<ServiceMethodResponse, ServiceMethodResponseBuilder> {
  factory ServiceMethodResponse({
    required String description,
    required bool isError,
    required OpenApiType type,
  }) {
    return _$ServiceMethodResponse._(
      description: description,
      isError: isError,
      type: type,
    );
  }

  factory ServiceMethodResponse.build([
    void Function(ServiceMethodResponseBuilder) updates,
  ]) = _$ServiceMethodResponse;

  ServiceMethodResponse._();

  String get description;
  bool get isError;
  OpenApiType get type;
  // TODO: Headers
}

abstract class HeaderOrQueryParameter
    implements Built<HeaderOrQueryParameter, HeaderOrQueryParameterBuilder> {
  factory HeaderOrQueryParameter.build([
    void Function(HeaderOrQueryParameterBuilder) updates,
  ]) = _$HeaderOrQueryParameter;

  HeaderOrQueryParameter._();

  String get rawName;
  String get variableName;
  OpenApiType get type;
}

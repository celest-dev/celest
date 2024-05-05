// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'http://petstore.swagger.io:80/v2'));
}

class OpenApiPetstoreSchemasInQueryParamsAndResponses {
  OpenApiPetstoreSchemasInQueryParamsAndResponses({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<SchemasInQueryParamsResponse> schemasInQueryParams({
    required Object anyTypeNoPropertiesNoRequired,
    required TODO anyTypeHasPropertiesNoRequired,
    required Object anyTypeNoPropertiesHasRequired,
    required TODO anyTypeHasPropertiesHasRequired,
    required Object objectNoPropertiesNoRequired,
    required TODO objectHasPropertiesNoRequired,
    required Object objectNoPropertiesHasRequired,
    required TODO objectHasPropertiesHasRequired,
    required Object composedNoAllofPropsNoPropertiesNoRequired,
    required Object composedNoAllofPropsHasPropertiesNoRequired,
    required Object composedNoAllofPropsNoPropertiesHasRequired,
    required Object composedNoAllofPropsHasPropertiesHasRequired,
    required TODO composedHasAllofOptPropNoPropertiesNoRequired,
    required TODO composedHasAllofOptPropHasPropertiesNoRequired,
    required TODO composedHasAllofOptPropNoPropertiesHasRequired,
    required TODO composedHasAllofOptPropHasPropertiesHasRequired,
    required TODO composedHasAllofReqPropNoPropertiesNoRequired,
    required TODO composedHasAllofReqPropHasPropertiesNoRequired,
    required TODO composedHasAllofReqPropNoPropertiesHasRequired,
    required TODO composedHasAllofReqPropHasPropertiesHasRequired,
    required String body,
  }) async {
    final $queryParameters = <String, String>{};
    $queryParameters['AnyTypeNoPropertiesNoRequired'] =
        anyTypeNoPropertiesNoRequired.toString();
    $queryParameters['AnyTypeHasPropertiesNoRequired'] =
        anyTypeHasPropertiesNoRequired.toString();
    $queryParameters['AnyTypeNoPropertiesHasRequired'] =
        anyTypeNoPropertiesHasRequired.toString();
    $queryParameters['AnyTypeHasPropertiesHasRequired'] =
        anyTypeHasPropertiesHasRequired.toString();
    $queryParameters['ObjectNoPropertiesNoRequired'] =
        objectNoPropertiesNoRequired.toString();
    $queryParameters['ObjectHasPropertiesNoRequired'] =
        objectHasPropertiesNoRequired.toString();
    $queryParameters['ObjectNoPropertiesHasRequired'] =
        objectNoPropertiesHasRequired.toString();
    $queryParameters['ObjectHasPropertiesHasRequired'] =
        objectHasPropertiesHasRequired.toString();
    $queryParameters['ComposedNoAllofPropsNoPropertiesNoRequired'] =
        composedNoAllofPropsNoPropertiesNoRequired.toString();
    $queryParameters['ComposedNoAllofPropsHasPropertiesNoRequired'] =
        composedNoAllofPropsHasPropertiesNoRequired.toString();
    $queryParameters['ComposedNoAllofPropsNoPropertiesHasRequired'] =
        composedNoAllofPropsNoPropertiesHasRequired.toString();
    $queryParameters['ComposedNoAllofPropsHasPropertiesHasRequired'] =
        composedNoAllofPropsHasPropertiesHasRequired.toString();
    $queryParameters['ComposedHasAllofOptPropNoPropertiesNoRequired'] =
        composedHasAllofOptPropNoPropertiesNoRequired.toString();
    $queryParameters['ComposedHasAllofOptPropHasPropertiesNoRequired'] =
        composedHasAllofOptPropHasPropertiesNoRequired.toString();
    $queryParameters['ComposedHasAllofOptPropNoPropertiesHasRequired'] =
        composedHasAllofOptPropNoPropertiesHasRequired.toString();
    $queryParameters['ComposedHasAllofOptPropHasPropertiesHasRequired'] =
        composedHasAllofOptPropHasPropertiesHasRequired.toString();
    $queryParameters['ComposedHasAllofReqPropNoPropertiesNoRequired'] =
        composedHasAllofReqPropNoPropertiesNoRequired.toString();
    $queryParameters['ComposedHasAllofReqPropHasPropertiesNoRequired'] =
        composedHasAllofReqPropHasPropertiesNoRequired.toString();
    $queryParameters['ComposedHasAllofReqPropNoPropertiesHasRequired'] =
        composedHasAllofReqPropNoPropertiesHasRequired.toString();
    $queryParameters['ComposedHasAllofReqPropHasPropertiesHasRequired'] =
        composedHasAllofReqPropHasPropertiesHasRequired.toString();
    final $uri = Uri.parse('$_baseUri/schemasInQueryParamsAndResponses')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'POST',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    $request.body = _i2.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// AnyTypeNoPropertiesNoRequired
      case 200:
        return _decodeJson<Any$>($response);

      /// AnyTypeHasPropertiesNoRequired
      case 201:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// AnyTypeNoPropertiesHasRequired
      case 202:
        return _decodeJson<Any$>($response);

      /// AnyTypeHasPropertiesHasRequired
      case 203:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ObjectNoPropertiesNoRequired
      case 210:
        return _decodeJson<Any$>($response);

      /// ObjectHasPropertiesNoRequired
      case 211:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ObjectNoPropertiesHasRequired
      case 212:
        return _decodeJson<Any$>($response);

      /// ObjectHasPropertiesHasRequired
      case 213:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedNoAllofPropsNoPropertiesNoRequired
      case 220:
        return _decodeJson<Any$>($response);

      /// ComposedNoAllofPropsHasPropertiesNoRequired
      case 221:
        return _decodeJson<Any$>($response);

      /// ComposedNoAllofPropsNoPropertiesHasRequired
      case 222:
        return _decodeJson<Any$>($response);

      /// ComposedNoAllofPropsHasPropertiesHasRequired
      case 223:
        return _decodeJson<Any$>($response);

      /// ComposedHasAllofOptPropNoPropertiesNoRequired
      case 230:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedHasAllofOptPropHasPropertiesNoRequired
      case 231:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedHasAllofOptPropNoPropertiesHasRequired
      case 232:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedHasAllofOptPropHasPropertiesHasRequired
      case 233:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedHasAllofReqPropNoPropertiesNoRequired
      case 240:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedHasAllofReqPropHasPropertiesNoRequired
      case 241:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedHasAllofReqPropNoPropertiesHasRequired
      case 242:
        return _decodeJson<SchemasInQueryParamsResponse>($response);

      /// ComposedHasAllofReqPropHasPropertiesHasRequired
      case 243:
        return _decodeJson<SchemasInQueryParamsResponse>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

final class OpenApiPetstoreClient {
  OpenApiPetstoreClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? OpenApiPetstoreServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreSchemasInQueryParamsAndResponses
      get schemasInQueryParamsAndResponses =>
          OpenApiPetstoreSchemasInQueryParamsAndResponses(
            baseUri: _baseUri,
            httpClient: _httpClient,
          );
}

final class Any$ implements SchemasInQueryParamsResponse {
  const Any$(this.value);

  final Object value;
}

typedef EmptyObject = Any$;

final class String$ {
  const String$(this.value);

  final String value;
}

final class ObjectWithOptionalb {
  ObjectWithOptionalb({this.b});

  final String$? b;
}

final class ObjectWithRequiredb {
  ObjectWithRequiredb({required this.b});

  final String$ b;
}

typedef AnyTypeNoPropertiesNoRequired = Any$;

final class AnyTypeHasPropertiesNoRequired {
  AnyTypeHasPropertiesNoRequired({this.a});

  final String$? a;
}

typedef AnyTypeNoPropertiesHasRequired = Any$;

final class AnyTypeHasPropertiesHasRequired {
  AnyTypeHasPropertiesHasRequired({required this.a});

  final String$ a;
}

typedef ObjectNoPropertiesNoRequired = Any$;

final class ObjectHasPropertiesNoRequired {
  ObjectHasPropertiesNoRequired({this.a});

  final String$? a;
}

typedef ObjectNoPropertiesHasRequired = Any$;

final class ObjectHasPropertiesHasRequired {
  ObjectHasPropertiesHasRequired({required this.a});

  final String$ a;
}

typedef ComposedNoAllofPropsNoPropertiesNoRequired = Any$;
typedef ComposedNoAllofPropsHasPropertiesNoRequired = Any$;
typedef ComposedNoAllofPropsNoPropertiesHasRequired = Any$;
typedef ComposedNoAllofPropsHasPropertiesHasRequired = Any$;

final class ComposedHasAllofOptPropNoPropertiesNoRequired {
  ComposedHasAllofOptPropNoPropertiesNoRequired({this.b});

  final String$? b;
}

final class ComposedHasAllofOptPropHasPropertiesNoRequired {
  ComposedHasAllofOptPropHasPropertiesNoRequired({this.b});

  final String$? b;
}

final class ComposedHasAllofOptPropNoPropertiesHasRequired {
  ComposedHasAllofOptPropNoPropertiesHasRequired({this.b});

  final String$? b;
}

final class ComposedHasAllofOptPropHasPropertiesHasRequired {
  ComposedHasAllofOptPropHasPropertiesHasRequired({this.b});

  final String$? b;
}

final class ComposedHasAllofReqPropNoPropertiesNoRequired {
  ComposedHasAllofReqPropNoPropertiesNoRequired({required this.b});

  final String$ b;
}

final class ComposedHasAllofReqPropHasPropertiesNoRequired {
  ComposedHasAllofReqPropHasPropertiesNoRequired({required this.b});

  final String$ b;
}

final class ComposedHasAllofReqPropNoPropertiesHasRequired {
  ComposedHasAllofReqPropNoPropertiesHasRequired({required this.b});

  final String$ b;
}

final class ComposedHasAllofReqPropHasPropertiesHasRequired {
  ComposedHasAllofReqPropHasPropertiesHasRequired({required this.b});

  final String$ b;
}

final class CodegenPropertiesModel_AnyTypeHasPropertiesNoRequired {
  CodegenPropertiesModel_AnyTypeHasPropertiesNoRequired({this.a});

  final String$? a;
}

final class CodegenPropertiesModel_AnyTypeHasPropertiesHasRequired {
  CodegenPropertiesModel_AnyTypeHasPropertiesHasRequired({required this.a});

  final String$ a;
}

final class CodegenPropertiesModel_ObjectHasPropertiesNoRequired {
  CodegenPropertiesModel_ObjectHasPropertiesNoRequired({this.a});

  final String$? a;
}

final class CodegenPropertiesModel_ObjectHasPropertiesHasRequired {
  CodegenPropertiesModel_ObjectHasPropertiesHasRequired({required this.a});

  final String$ a;
}

final class CodegenPropertiesModel_ComposedHasAllofOptPropNoPropertiesNoRequired {
  CodegenPropertiesModel_ComposedHasAllofOptPropNoPropertiesNoRequired(
      {this.b});

  final String$? b;
}

final class CodegenPropertiesModel_ComposedHasAllofOptPropHasPropertiesNoRequired {
  CodegenPropertiesModel_ComposedHasAllofOptPropHasPropertiesNoRequired(
      {this.b});

  final String$? b;
}

final class CodegenPropertiesModel_ComposedHasAllofOptPropNoPropertiesHasRequired {
  CodegenPropertiesModel_ComposedHasAllofOptPropNoPropertiesHasRequired(
      {this.b});

  final String$? b;
}

final class CodegenPropertiesModel_ComposedHasAllofOptPropHasPropertiesHasRequired {
  CodegenPropertiesModel_ComposedHasAllofOptPropHasPropertiesHasRequired(
      {this.b});

  final String$? b;
}

final class CodegenPropertiesModel_ComposedHasAllofReqPropNoPropertiesNoRequired {
  CodegenPropertiesModel_ComposedHasAllofReqPropNoPropertiesNoRequired(
      {required this.b});

  final String$ b;
}

final class CodegenPropertiesModel_ComposedHasAllofReqPropHasPropertiesNoRequired {
  CodegenPropertiesModel_ComposedHasAllofReqPropHasPropertiesNoRequired(
      {required this.b});

  final String$ b;
}

final class CodegenPropertiesModel_ComposedHasAllofReqPropNoPropertiesHasRequired {
  CodegenPropertiesModel_ComposedHasAllofReqPropNoPropertiesHasRequired(
      {required this.b});

  final String$ b;
}

final class CodegenPropertiesModel_ComposedHasAllofReqPropHasPropertiesHasRequired {
  CodegenPropertiesModel_ComposedHasAllofReqPropHasPropertiesHasRequired(
      {required this.b});

  final String$ b;
}

final class CodegenPropertiesModel {
  CodegenPropertiesModel({
    this.anyTypeNoPropertiesNoRequired,
    this.anyTypeHasPropertiesNoRequired,
    this.anyTypeNoPropertiesHasRequired,
    this.anyTypeHasPropertiesHasRequired,
    this.objectNoPropertiesNoRequired,
    this.objectHasPropertiesNoRequired,
    this.objectNoPropertiesHasRequired,
    this.objectHasPropertiesHasRequired,
    this.composedNoAllofPropsNoPropertiesNoRequired,
    this.composedNoAllofPropsHasPropertiesNoRequired,
    this.composedNoAllofPropsNoPropertiesHasRequired,
    this.composedNoAllofPropsHasPropertiesHasRequired,
    this.composedHasAllofOptPropNoPropertiesNoRequired,
    this.composedHasAllofOptPropHasPropertiesNoRequired,
    this.composedHasAllofOptPropNoPropertiesHasRequired,
    this.composedHasAllofOptPropHasPropertiesHasRequired,
    this.composedHasAllofReqPropNoPropertiesNoRequired,
    this.composedHasAllofReqPropHasPropertiesNoRequired,
    this.composedHasAllofReqPropNoPropertiesHasRequired,
    this.composedHasAllofReqPropHasPropertiesHasRequired,
  });

  final Any$? anyTypeNoPropertiesNoRequired;

  final CodegenPropertiesModel_AnyTypeHasPropertiesNoRequired?
      anyTypeHasPropertiesNoRequired;

  final Any$? anyTypeNoPropertiesHasRequired;

  final CodegenPropertiesModel_AnyTypeHasPropertiesHasRequired?
      anyTypeHasPropertiesHasRequired;

  final Any$? objectNoPropertiesNoRequired;

  final CodegenPropertiesModel_ObjectHasPropertiesNoRequired?
      objectHasPropertiesNoRequired;

  final Any$? objectNoPropertiesHasRequired;

  final CodegenPropertiesModel_ObjectHasPropertiesHasRequired?
      objectHasPropertiesHasRequired;

  final Any$? composedNoAllofPropsNoPropertiesNoRequired;

  final Any$? composedNoAllofPropsHasPropertiesNoRequired;

  final Any$? composedNoAllofPropsNoPropertiesHasRequired;

  final Any$? composedNoAllofPropsHasPropertiesHasRequired;

  final CodegenPropertiesModel_ComposedHasAllofOptPropNoPropertiesNoRequired?
      composedHasAllofOptPropNoPropertiesNoRequired;

  final CodegenPropertiesModel_ComposedHasAllofOptPropHasPropertiesNoRequired?
      composedHasAllofOptPropHasPropertiesNoRequired;

  final CodegenPropertiesModel_ComposedHasAllofOptPropNoPropertiesHasRequired?
      composedHasAllofOptPropNoPropertiesHasRequired;

  final CodegenPropertiesModel_ComposedHasAllofOptPropHasPropertiesHasRequired?
      composedHasAllofOptPropHasPropertiesHasRequired;

  final CodegenPropertiesModel_ComposedHasAllofReqPropNoPropertiesNoRequired?
      composedHasAllofReqPropNoPropertiesNoRequired;

  final CodegenPropertiesModel_ComposedHasAllofReqPropHasPropertiesNoRequired?
      composedHasAllofReqPropHasPropertiesNoRequired;

  final CodegenPropertiesModel_ComposedHasAllofReqPropNoPropertiesHasRequired?
      composedHasAllofReqPropNoPropertiesHasRequired;

  final CodegenPropertiesModel_ComposedHasAllofReqPropHasPropertiesHasRequired?
      composedHasAllofReqPropHasPropertiesHasRequired;
}

final class TODO {
  TODO({this.a});

  final String$? a;
}

final class SchemasInQueryParamsResponse
    implements
        SchemasInQueryParamsResponse,
        SchemasInQueryParamsResponse,
        SchemasInQueryParamsResponse,
        SchemasInQueryParamsResponse {
  SchemasInQueryParamsResponse({this.a});

  final String$? a;
}

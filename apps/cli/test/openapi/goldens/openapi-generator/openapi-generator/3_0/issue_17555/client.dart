// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type OpenApiPetstoreServers(Uri _) implements Uri {
  static final OpenApiPetstoreServers defaultServer = server0;

  static final OpenApiPetstoreServers server0 =
      OpenApiPetstoreServers(Uri.parse(r'/'));
}

class OpenApiPetstoreTeams {
  OpenApiPetstoreTeams({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Find Department Teams
  /// Find Department Teams
  Future<FindDepartmentTeamsResponse> findDepartmentTeams({
    required String departmentId,
    required TeamCriteriaDTO filter,
  }) async {
    final $queryParameters = <String, String>{};
    $queryParameters['filter'] = filter.toString();
    final $uri = Uri.parse('$_baseUri/api/department/$departmentId/teams')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// OK
      case 200:
        return const Empty$._();
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

class OpenApiPetstoreDepartmentId {
  OpenApiPetstoreDepartmentId({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreTeams get teams => OpenApiPetstoreTeams(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class OpenApiPetstoreDepartment {
  OpenApiPetstoreDepartment({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreDepartmentId get departmentId => OpenApiPetstoreDepartmentId(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class OpenApiPetstoreApi {
  OpenApiPetstoreApi({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  OpenApiPetstoreDepartment get department => OpenApiPetstoreDepartment(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
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

  OpenApiPetstoreApi get api => OpenApiPetstoreApi(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class TeamCriteriaDto {
  TeamCriteriaDto({
    this.key,
    this.name,
  });

  final String? key;

  final String? name;
}

final class TeamCriteriaDTO {
  TeamCriteriaDTO({
    this.key,
    this.name,
  });

  final String? key;

  final String? name;
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [OpenApiPetstoreTeams.findDepartmentTeams].
typedef FindDepartmentTeamsResponse = Empty$;

// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type SampleApIsServers(Uri _) implements Uri {
  static final SampleApIsServers defaultServer = server0;

  static final SampleApIsServers server0 = SampleApIsServers(Uri.parse(r'/'));
}

class SampleApIsStuff {
  SampleApIsStuff({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Do stuff
  Future<Api01Response> api01({String? param1}) async {
    final $queryParameters = <String, String>{};
    if (param1 != null) {
      $queryParameters['param1'] = param1;
    }
    final $uri = Uri.parse('$_baseUri/api/stuff')
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
        return _decodeJson<List<API01_AbstractStuff>>($response);
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

class SampleApIsApi {
  SampleApIsApi({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  SampleApIsStuff get stuff => SampleApIsStuff(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class SampleApIsClient {
  SampleApIsClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? SampleApIsServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  SampleApIsApi get api => SampleApIsApi(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class Api01AbstractStuff {
  Api01AbstractStuff({this.dateCreated});

  final DateTime? dateCreated;
}

final class Api01FirstStuff {
  Api01FirstStuff({
    this.dateCreated,
    this.endTime,
  });

  final DateTime? dateCreated;

  final DateTime? endTime;
}

final class Api01SecondStuff {
  Api01SecondStuff({
    this.dateCreated,
    this.emissionDate,
  });

  final DateTime? dateCreated;

  final DateTime? emissionDate;
}

final class API01_AbstractStuff {
  API01_AbstractStuff({this.dateCreated});

  final DateTime? dateCreated;
}

final class Api01ListOfStuff extends _i4.DelegatingList<API01_AbstractStuff> {
  Api01ListOfStuff(super.base);
}

/// Response type for [SampleApIsStuff.api01].
typedef Api01Response = List<API01_AbstractStuff>;

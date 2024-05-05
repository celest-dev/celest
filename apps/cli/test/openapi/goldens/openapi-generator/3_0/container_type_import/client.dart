// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type ExampleApiServers(Uri _) implements Uri {
  static final ExampleApiServers defaultServer = server0;

  static final ExampleApiServers server0 = ExampleApiServers(Uri.parse(r'/'));
}

final class ExampleApiClient {
  ExampleApiClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExampleApiServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Empty Route
  Future<GetResponse> get() async {
    final $uri = Uri.parse('$_baseUri/');
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// Good Request.
      case 200:
        return _decodeJson<GetResponse>($response);

      /// Bad Request.
      case 400:
        return const Empty$._();

      /// Forbidden. Access denied.
      case 403:
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

final class String$ {
  const String$(this.value);

  final String value;
}

final class Integer$ {
  const Integer$(this.value);

  final int value;
}

final class SimpleModel {
  SimpleModel({
    this.id,
    required this.name,
  });

  final Integer$? id;

  final String$ name;
}

final class ModelWithSetProperty_set_property
    extends _i4.DelegatingSet<SimpleModel> {
  ModelWithSetProperty_set_property(super.base);
}

final class ModelWithSetProperty {
  ModelWithSetProperty({
    this.id,
    this.setProperty,
  });

  final String$? id;

  final ModelWithSetProperty_set_property? setProperty;
}

final class ModelWithArrayProperty_array_property
    extends _i4.DelegatingList<SimpleModel> {
  ModelWithArrayProperty_array_property(super.base);
}

final class ModelWithArrayProperty {
  ModelWithArrayProperty({
    this.id,
    this.arrayProperty,
  });

  final String$? id;

  final ModelWithArrayProperty_array_property? arrayProperty;
}

class ModelWithMapProperty_map_property
    extends _i4.DelegatingMap<String, SimpleModel> {
  ModelWithMapProperty_map_property(super.base);
}

final class ModelWithMapProperty {
  ModelWithMapProperty({
    this.id,
    this.mapProperty,
  });

  final String$? id;

  final ModelWithMapProperty_map_property? mapProperty;
}

final class GetResponse extends _i4.DelegatingSet<ModelWithArrayProperty>
    implements GetResponse {
  GetResponse(super.base);
}

final class Empty$ implements GetResponse {
  const Empty$._();
}

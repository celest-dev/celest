// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:http/http.dart' as _i1;

extension type EmailExampleServers(Uri _) implements Uri {
  static final EmailExampleServers defaultServer = server0;

  static final EmailExampleServers server0 =
      EmailExampleServers(Uri.parse(r'http://api.example.xyz/v1'));
}

class EmailExamplePerson {
  EmailExamplePerson({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  Future<PutPersonResponse> putPerson({personWithEmail? body}) async {
    final $uri = Uri.parse('$_baseUri/person');
    final $request = _i1.Request(
      'PUT',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _i2.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// No Content
      case 204:
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

final class EmailExampleClient {
  EmailExampleClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? EmailExampleServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  EmailExamplePerson get person => EmailExamplePerson(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class String$ {
  const String$(this.value);

  final String value;
}

final class PersonWithEmail {
  PersonWithEmail({
    this.name,
    this.email,
  });

  final String$? name;

  final String$? email;
}

final class personWithEmail {
  personWithEmail({
    this.name,
    this.email,
  });

  final String$? name;

  final String$? email;
}

final class Empty$ {
  const Empty$._();
}

/// Response type for [EmailExamplePerson.putPerson].
typedef PutPersonResponse = Empty$;

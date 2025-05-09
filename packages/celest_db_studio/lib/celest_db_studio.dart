import 'dart:convert';

import 'package:celest_core/_internal.dart';
import 'package:celest_db_studio/src/driver.dart';
import 'package:celest_db_studio/src/template.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

export 'package:celest_db_studio/src/driver.dart';

/// {@template celest_db_studio.celest_db_studio}
/// A simple server which serves an instance of Outerbase Studio as an embedded
/// iframe and responds to query requests from the iframe.
/// {@endtemplate}
final class CelestDbStudio {
  CelestDbStudio.from({this.pageTitle = defaultTitle, required Driver driver})
    : _driver = driver;

  /// {@macro celest_db_studio.celest_db_studio}
  ///
  /// The server connects to a database using the provided [databaseUri] and
  /// proxies requests from the iframe to the database.
  static Future<CelestDbStudio> create({
    String pageTitle = defaultTitle,
    required Uri databaseUri,
    String? authToken,
  }) async {
    final Driver driver = await Driver.connect(
      databaseUri,
      authToken: authToken,
    );
    return CelestDbStudio.from(pageTitle: pageTitle, driver: driver);
  }

  /// The default title of the page.
  static const String defaultTitle = 'DB Studio';

  /// The title of the page.
  ///
  /// If not provided, the [defaultTitle] will be used.
  final String pageTitle;

  final Driver _driver;

  /// The rendered HTML for the index page.
  late final String _indexHtml = indexHtml
      .replaceAll('{{ title }}', pageTitle)
      .replaceAll('{{ script }}', indexJs);

  late final Router _router =
      Router()
        ..get('/', (Request request) => _index(request, checkRedirect: true))
        ..get(
          '/index.html',
          (Request request) => _index(request, checkRedirect: false),
        )
        ..post('/query', _query);

  late final Handler _handler = (const Pipeline()
        ..addMiddleware(_corsMiddleware))
      .addHandler(_router.call);

  static Handler _corsMiddleware(Handler innerHandler) {
    const corsHeaders = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
      'Access-Control-Allow-Headers': '*',
      'Access-Control-Allow-Credentials': 'true',
    };
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok(null, headers: corsHeaders);
      }
      final Response response = await innerHandler(request);
      return response.change(headers: corsHeaders);
    };
  }

  /// Handles the given [request] if possible.
  Future<Response> call(Request request) async {
    return _handler(request);
  }

  Response _redirectToTrailingSlash(Request request) {
    return Response.movedPermanently(
      request.requestedUri.replace(path: '${request.requestedUri.path}/'),
    );
  }

  /// Serves the studio HTML.
  Future<Response> _index(
    Request request, {
    required bool checkRedirect,
  }) async {
    if (checkRedirect && !request.requestedUri.path.endsWith('/')) {
      // Redirect to the trailing slash version of the URL so that
      // relative paths work correctly.
      //
      // e.g. `./query` should resolve to `$basePath/query` instead of
      // `$basePath/../query`.
      return _redirectToTrailingSlash(request);
    }
    return Response.ok(_indexHtml, headers: {'Content-Type': 'text/html'});
  }

  /// Responds to query requests from the Outerbase Studio iframe.
  Future<Response> _query(Request request) async {
    final Object? json = await JsonUtf8.decodeStream(request.read());
    if (json
        case {
              'id': final int id,
              'type': final String type,
              'statements': [final String statement],
            } ||
            {
              'id': final int id,
              'type': final String type,
              'statement': final String statement,
            }) {
      try {
        final DriverResultSet result = await _driver.execute(statement);
        return Response.ok(
          jsonEncode({
            'type': type,
            'id': id,
            'data': type == 'transaction' ? [result.toJson()] : result.toJson(),
          }),
          headers: {'Content-Type': 'application/json'},
        );
      } on Object catch (e) {
        return Response.internalServerError(body: e.toString());
      }
    } else {
      return Response.badRequest(body: 'Invalid request format');
    }
  }
}

/// Middleware
@internal
library;

import 'dart:async';
import 'dart:math';

import 'package:celest/celest.dart';
import 'package:celest/src/runtime/http/middleware.dart';
import 'package:celest/src/runtime/json_utils.dart';
import 'package:celest_core/_internal.dart';
import 'package:cloud_http/cloud_http.dart';
import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart' as shelf show Middleware;
import 'package:shelf/shelf.dart' show Handler, Request, HijackException;

/// {@template celest.runtime.shelf_middleware}
/// A [Middleware] that wraps a [shelf.Middleware].
/// {@endtemplate}
final class ShelfMiddleware implements Middleware {
  /// {@macro celest.runtime.shelf_middleware}
  const ShelfMiddleware(this._middleware);

  final shelf.Middleware _middleware;

  @override
  Handler call(Handler inner) {
    return _middleware(inner);
  }
}

/// {@template celest.runtime.cors_middleware}
/// Serves CORS headers on the local server so that Web clients can access it.
/// {@endtemplate}
final class CorsMiddleware implements Middleware {
  /// {@macro celest.runtime.cors_middleware}
  const CorsMiddleware();

  @override
  Handler call(Handler inner) {
    return (request) async {
      final corsHeaders = {
        // TODO(dnys1): Restrict these in production
        'Access-Control-Allow-Origin': request.headers['origin'] ?? '*',
        // Needed when `Access-Control-Allow-Origin` is a specific domain,
        // e.g. not a wildcard.
        'Vary': 'Origin',

        'Access-Control-Allow-Methods': '*',
        'Access-Control-Allow-Headers':
            request.headers['access-control-request-headers'] ?? '*',
        'Access-Control-Expose-Headers': '*',
        'Access-Control-Allow-Credentials': 'true',
      };
      if (request.method == 'OPTIONS') {
        return Response.ok(
          null,
          headers: corsHeaders,
        );
      }
      final response = await inner(request);
      return response.change(
        headers: corsHeaders,
      );
    };
  }
}

/// {@template celest.runtime.cloud_exception_middleware}
/// Handles common exception types and maps exceptions to HTTP responses.
/// {@endtemplate}
final class CloudExceptionMiddleware implements Middleware {
  /// {@macro celest.runtime.cloud_exception_middleware}
  const CloudExceptionMiddleware();

  @override
  Handler call(Handler inner) {
    return (request) async {
      try {
        return await inner(request);
      } on CloudException catch (e, st) {
        context.logger.severe(e.message, e, st);
        return Response(
          e.code,
          headers: const {
            contentTypeHeader: jsonContentType,
          },
          body: JsonUtf8.encode({
            '@status': {
              'code': e.type,
              'message': e.message,
              'details': [
                {
                  '@type': e.type,
                  'value': Serializers.instance.serialize(e),
                },
                if (context.environment != Environment.production)
                  {
                    '@type': 'dart.core.StackTrace',
                    'value': st.toString(),
                  },
              ],
            },
          }),
        );
      } on Exception catch (e, st) {
        if (e is HijackException) rethrow;
        context.logger.severe('An unexpected exception occurred', e, st);
        return Response.badRequest(
          headers: const {
            contentTypeHeader: jsonContentType,
          },
          body: JsonUtf8.encode({
            '@status': {
              'code': HttpStatus.badRequest,
              'message': e.toString(),
              'details': [
                {
                  '@type': 'dart.core.Exception',
                  'value': Serializers.instance.serialize<Exception>(e),
                },
                if (context.environment != Environment.production)
                  {
                    '@type': 'dart.core.StackTrace',
                    'value': st.toString(),
                  },
              ],
            },
          }),
        );
      } on Error catch (e, st) {
        context.logger.shout('An unexpected error occurred', e, st);
        return Response.internalServerError(
          headers: const {
            contentTypeHeader: jsonContentType,
          },
          body: JsonUtf8.encode({
            '@status': {
              'code': HttpStatus.internalServerError,
              'message': e.toString(),
              'details': [
                {
                  '@type': 'dart.core.Error',
                  'value': Serializers.instance.serialize<Error>(e),
                },
                if (context.environment != Environment.production)
                  {
                    '@type': 'dart.core.StackTrace',
                    'value': st.toString(),
                  },
              ],
            },
          }),
        );
      }
    };
  }
}

/// {@template celest.runtime.root_middleware}
/// Configures the [Context] for each request.
///
/// Should be run before all other middleware.
/// {@endtemplate}
final class RootMiddleware implements Middleware {
  /// {@macro celest.runtime.root_middleware}
  const RootMiddleware();

  @override
  Handler call(Handler inner) {
    return (request) async {
      final completer = Completer<Response>.sync();

      final requestZone = Zone.current.fork(
        specification: ZoneSpecification(
          handleUncaughtError: (self, parent, zone, error, stackTrace) {
            if (error is HijackException) {
              completer.completeError(error, stackTrace);
              return;
            }
            Logger.root.shout(
              'An unexpected error occurred',
              error,
              stackTrace,
            );
            if (completer.isCompleted) {
              return;
            }
            completer.completeError(error, stackTrace);
          },
          print: (self, parent, zone, line) {
            final route = request.url.path;
            parent.print(zone, '[$route] $line');
          },
        ),
      );
      requestZone.runGuarded(
        () async {
          Context.current
            ..put(ContextKey.currentRequest, request)
            ..put(ContextKey.currentTrace, request.trace);
          final response = await inner(request);
          if (!completer.isCompleted) {
            completer.complete(response);
          }
        },
      );

      return completer.future;
    };
  }
}

/// Standard header used by
/// [Cloud Trace](https://cloud.google.com/trace/docs/setup).
const cloudTraceContextHeader = 'x-cloud-trace-context';

extension on Request {
  static final _random = Random.secure();

  /// The trace parent of the request.
  Traceparent get trace {
    final traceContext = TraceContext.fromHeaders(headersAll);
    if (traceContext.traceparent case final traceparent?) {
      return traceparent;
    }
    if (headers[cloudTraceContextHeader] case final traceHeader?) {
      final spanDelim = traceHeader.indexOf('/');
      final optsDelim = traceHeader.indexOf(';');
      if (spanDelim != -1 && optsDelim != -1) {
        final traceId = traceHeader.substring(0, spanDelim);
        final spanId = traceHeader.substring(spanDelim + 1, optsDelim);
        final flags = switch (traceHeader.substring(optsDelim + 1)) {
          'o=1' => 1,
          'o=0' => 0,
          _ => 0,
        };
        return Traceparent(
          traceId: traceId,
          parentId: Int64.parseInt(spanId).toHexString().toLowerCase(),
          traceFlags: flags,
          version: Traceparent.defaultVersion,
        );
      }
    }
    // A vendor receiving a request without a traceparent header SHOULD
    // generate traceparent headers for outbound requests, effectively
    // starting a new trace.
    return Traceparent.create(
      traceId: hex.encode(
        List<int>.generate(16, (_) => _random.nextInt(256)),
      ),
      parentId: hex.encode(
        List<int>.generate(8, (_) => _random.nextInt(256)),
      ),
      sampled: true,
      random: true,
    );
  }
}

@internal
library;

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:celest/celest.dart';
import 'package:celest/src/runtime/json_utils.dart';
import 'package:cloud_http/cloud_http.dart';
import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart';

/// Serves CORS headers on the local server so that Web clients can access it.
Handler corsMiddleware(Handler inner) {
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

/// Handles common exception types and maps exceptions to HTTP responses.
Handler cloudExceptionMiddleware(Handler inner) {
  return (request) async {
    try {
      return await inner(request);
    } on Exception catch (e) {
      if (e is HijackException) rethrow;
      return _badRequest(
        code: e.runtimeType.toString(),
      );
    } on Error catch (e) {
      return _internalServerError(
        code: e.runtimeType.toString(),
      );
    }
  };
}

Response _badRequest({
  required String code,
  Object? details,
}) {
  return Response.badRequest(
    headers: {
      contentTypeHeader: jsonContentType,
    },
    body: jsonEncode({
      'error': {
        'code': code,
        if (details != null) 'details': details,
      },
    }),
  );
}

Response _internalServerError({
  required String code,
  Object? details,
}) {
  return Response.internalServerError(
    headers: {
      contentTypeHeader: jsonContentType,
    },
    body: jsonEncode({
      'error': {
        'code': code,
        if (details != null) 'details': details,
      },
    }),
  );
}

/// Standard header used by
/// [Cloud Trace](https://cloud.google.com/trace/docs/setup).
const cloudTraceContextHeader = 'x-cloud-trace-context';

/// Configures the [Context] for each request.
///
/// Should be run before all other middleware.
Handler rootMiddleware(Handler inner) {
  return (request) async {
    final completer = Completer<Response>.sync();

    final requestZone = Zone.current.fork(
      specification: ZoneSpecification(
        handleUncaughtError: (self, parent, zone, error, stackTrace) {
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
          Logger.root.info(line);
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

    // TODO: Convert errors to response
    return completer.future;
  };
}

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

import 'dart:async';

import 'package:async/async.dart';
import 'package:celest_core/_internal.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

final class AuthenticatingGrpcChannel extends ClientChannel {
  AuthenticatingGrpcChannel(
    super.host, {
    required Authenticator authenticator,
    super.channelShutdownHandler,
    super.options,
    super.port,
  }) : _authenticator = authenticator;

  final Authenticator _authenticator;

  Future<void> _provider(Map<String, String> metadata, String uri) async {
    final token = await _authenticator.token;
    if (token != null) {
      metadata['authorization'] = 'Bearer $token';
    }
  }

  @override
  ClientCall<Q, R> createCall<Q, R>(
      ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options) {
    options = options.mergedWith(
      CallOptions(providers: [_provider]),
    );
    return super.createCall(method, requests, options);
  }
}

final class RevokingGrpcInterceptor implements ClientInterceptor {
  RevokingGrpcInterceptor({
    required Authenticator authenticator,
    this.logger,
  }) : _authenticator = authenticator;

  final Logger? logger;
  final Authenticator _authenticator;

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final response = invoker(method, requests, options);
    return _DelegatingResponseStream(
      response,
      response.handleError(
        (error, stackTrace) async {
          logger?.finer(
            'Revoking authentication due to error',
            error,
            stackTrace,
          );
          await _authenticator.revoke();
          Error.throwWithStackTrace(error, stackTrace);
        },
        test: (error) =>
            error is GrpcError && error.code == StatusCode.unauthenticated,
      ),
    );
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final response = invoker(method, request, options);
    return _DelegatingResponseFuture(
      response,
      response.onError<GrpcError>(
        (error, stackTrace) async {
          logger?.finer(
            'Revoking authentication due to error',
            error,
            stackTrace,
          );
          await _authenticator.revoke();
          Error.throwWithStackTrace(error, stackTrace);
        },
        test: (error) => error.code == StatusCode.unauthenticated,
      ),
    );
  }
}

class _DelegatingResponseFuture<R> extends DelegatingFuture<R>
    implements ResponseFuture<R> {
  _DelegatingResponseFuture(this._response, super._future);

  final ResponseFuture<R> _response;

  @override
  Future<void> cancel() => _response.cancel();

  @override
  Future<Map<String, String>> get headers => _response.headers;

  @override
  Future<Map<String, String>> get trailers => _response.trailers;
}

class _DelegatingResponseStream<R> extends StreamView<R>
    implements ResponseStream<R> {
  _DelegatingResponseStream(this._response, super.stream);

  final ResponseStream<R> _response;

  @override
  ResponseFuture<R> get single => _response.single;

  @override
  Future<void> cancel() => _response.cancel();

  @override
  Future<Map<String, String>> get headers => _response.headers;

  @override
  Future<Map<String, String>> get trailers => _response.trailers;
}

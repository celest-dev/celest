import 'dart:async';
import 'dart:convert';

import 'package:celest_auth/src/auth_impl.dart';
import 'package:celest_auth/src/flows/auth_flow.dart';
import 'package:celest_auth/src/model/cloud_interop.dart';
import 'package:celest_auth/src/state/auth_state.dart';
import 'package:celest_cloud/celest_cloud.dart' as cloud;
import 'package:celest_core/celest_core.dart';
import 'package:meta/meta.dart';
import 'package:native_authentication/native_authentication.dart';

extension type Idp(AuthImpl _hub) {
  Future<AuthState> authenticate({
    required cloud.IdentityProviderType provider,
    required Uri callbackUri,
  }) async {
    final AuthFlowController flowController = await _hub.requestFlow();
    final flow = IdpFlow._(_hub, flowController);
    return flow._authenticate(provider: provider, callbackUri: callbackUri);
  }
}

final class IdpFlow implements AuthFlow {
  IdpFlow._(this._hub, this._flowController);

  final AuthImpl _hub;
  final AuthFlowController _flowController;

  Future<AuthState> _authenticate({
    required cloud.IdentityProviderType provider,
    required Uri callbackUri,
  }) {
    return _flowController.capture(() async {
      final cloud.IdpSessionAuthorize startState = await _hub
          .cloud
          .authentication
          .idp
          .start(provider: provider, redirectUri: callbackUri);
      final CallbackSession session = _hub.nativeAuth.startCallback(
        uri: startState.uri,
        type: switch (callbackUri) {
          Uri(scheme: 'https', :final String host, :final String path) =>
            CallbackType.https(host: host, path: path),
          Uri(scheme: 'http', host: 'localhost', :final String path) =>
            CallbackType.localhost(
              port: callbackUri.hasPort ? callbackUri.port : 0,
              path: path,
            ),
          Uri(scheme: 'http') =>
            throw ArgumentError.value(
              callbackUri,
              'callbackUri',
              'Unsupported host. Only `localhost` is supported for http:// URIs.',
            ),
          Uri(:final String scheme, :final String host, :final String path) =>
            CallbackType.custom(scheme, host: host, path: path),
        },
      );
      // TODO(dnys1): Session storage
      _hub.localStorage.write('pendingSessionId', session.id.toString());
      await _hub.secureStorage.write(
        'session/${session.id}',
        jsonEncode(startState.toJson()),
      );
      final Uri redirect = await session.redirectUri.whenComplete(cleanUp);
      final cloud.IdpSessionResult postRedirectState = await _hub
          .cloud
          .authentication
          .idp
          .postRedirect(state: startState, redirectUri: redirect);
      switch (postRedirectState) {
        case cloud.IdpSessionSuccess(:final identityToken, :final user):
          await _hub.secureStorage.write('cork', identityToken);
          _hub.localStorage.write('userId', user.userId);
          return Authenticated(user: user.toCelest());
        case cloud.IdpSessionLinkUser(:final user):
          return _IdpLinkUser(
            user: user.toCelest(),
            flow: this,
            innerState: postRedirectState,
          );
        case cloud.IdpSessionRegisterUser(:final user):
          return _IdpRegisterUser(
            user: user.toCelest(),
            flow: this,
            innerState: postRedirectState,
          );
      }
    });
  }

  Future<Authenticated> _confirm({
    required cloud.IdpSessionNeedsConfirmation state,
  }) {
    return _flowController
        .capture(() async {
          final cloud.IdpSessionSuccess success = await _hub
              .cloud
              .authentication
              .idp
              .confirm(state: state);
          await _hub.secureStorage.write('cork', success.identityToken);
          _hub.localStorage.write('userId', success.user.userId);
          return Authenticated(user: success.user.toCelest());
        })
        .whenComplete(cleanUp);
  }

  @override
  void cancel() {
    cleanUp();
    _flowController.cancel(); // TODO(dnys1): Send cancel to cloud.
  }

  void cleanUp() {
    final String? sessionId = _hub.localStorage.delete('pendingSessionId');
    if (sessionId != null) {
      _hub.secureStorage.delete('session/$sessionId').ignore();
    }
  }
}

@internal
extension SocialLoginResultToCelest on cloud.IdpSessionResult {
  AuthState toCelest({
    required AuthImpl hub,
    required StreamSink<AuthState> sink,
    IdpFlow? flow,
  }) {
    final state = this;
    if (flow == null) {
      final flowController = AuthFlowController(sink);
      flow = IdpFlow._(hub, flowController);
    }
    return switch (state) {
      cloud.IdpSessionLinkUser(:final user) => _IdpLinkUser(
        user: user.toCelest(),
        innerState: state,
        flow: flow,
      ),
      cloud.IdpSessionRegisterUser(:final user) => _IdpRegisterUser(
        user: user.toCelest(),
        innerState: state,
        flow: flow,
      ),
      cloud.IdpSessionSuccess(:final user, :final identityToken) => () {
        hub.secureStorage.write('cork', identityToken);
        hub.localStorage.write('userId', user.userId);
        return Authenticated(user: user.toCelest());
      }(),
    };
  }
}

final class _IdpLinkUser extends AuthLinkUser {
  _IdpLinkUser({
    required super.user,
    required IdpFlow flow,
    required cloud.IdpSessionLinkUser innerState,
  }) : _flow = flow,
       _innerState = innerState;

  final IdpFlow _flow;
  final cloud.IdpSessionLinkUser _innerState;

  @override
  void cancel() => _flow.cancel();

  @override
  Future<User> confirm() async {
    final Authenticated authenticated = await _flow._confirm(
      state: _innerState,
    );
    return authenticated.user;
  }
}

final class _IdpRegisterUser extends AuthRegisterUser {
  _IdpRegisterUser({
    required super.user,
    required IdpFlow flow,
    required cloud.IdpSessionRegisterUser innerState,
  }) : _flow = flow,
       _innerState = innerState;

  final IdpFlow _flow;
  final cloud.IdpSessionRegisterUser _innerState;

  @override
  void cancel() => _flow.cancel();

  @override
  Future<User> confirm() async {
    final Authenticated authenticated = await _flow._confirm(
      state: _innerState,
    );
    return authenticated.user;
  }
}

import 'dart:async';
import 'dart:io' show HandshakeException, HttpClient, SocketException;

import 'package:celest/src/core/environment.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_core/_internal.dart';
// ignore: implementation_imports
import 'package:celest_core/src/auth/user.dart';
import 'package:cloud_http/cloud_http.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;
import 'package:http/retry.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:platform/platform.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_router/shelf_router.dart';

/// The [Context] for the current request.
Context get context => Context.current;

/// {@template celest.runtime.celest_context}
/// A per-request context object which propogates request information and common
/// accessors to the Celest server environment.
/// {@endtemplate}
extension type Context._(Zone _zone) {
  /// The [Context] for the given [zone].
  factory Context.of(Zone zone) {
    final context = Context._(zone);
    context._ensureData();
    return context;
  }

  /// All context objects by their [Zone].
  ///
  /// Contexts are attached to a zone such that they are disposed
  /// when the Zone in which they were created is disposed.
  static final Expando<_ContextData> _state = Expando('_zone_context_state');
  static final Object _nullSentinel = Object();
  static const Map<ContextKey<Object?>, Object> _emptyValues = {};

  /// The [Context] for the current [Zone].
  static Context get current {
    final context = Context._(Zone.current);
    context._ensureData();
    return context;
  }

  /// The [Context] attached to [Zone.root].
  static Context get root {
    final context = Context._(Zone.root);
    context._ensureData();
    return context;
  }

  /// Runs [body] within a child zone that inherits from [parent] and applies
  /// the provided [overrides].
  static FutureOr<R> run<R>({
    Context? parent,
    ContextOverrides overrides = const <ContextKey<Object?>, Object?>{},
    required FutureOr<R> Function(Context context) body,
  }) {
    final Context parentContext = parent ?? Context.current;
    final Zone childZone = parentContext._zone.fork();
    _state[childZone] = _ContextData(
      parent: parentContext,
      values: _normalize(overrides),
      callbacks: <PostRequestCallback>[],
    );
    return childZone.run(() => body(Context.current));
  }

  /// Installs the current zone as a root context for the duration of [body].
  static FutureOr<R> withCurrentZoneAsRoot<R>({
    ContextOverrides overrides = const <ContextKey<Object?>, Object?>{},
    required FutureOr<R> Function(Context root) body,
  }) {
    final Zone zone = Zone.current;
    final _ContextData? previous = _state[zone];
    final installed = _ContextData(
      parent: null,
      values: _normalize(overrides),
      callbacks: <PostRequestCallback>[],
    );
    _state[zone] = installed;
    try {
      final FutureOr<R> result = body(Context._(zone));
      if (result is Future<R>) {
        return result.whenComplete(() => _restoreState(zone, previous));
      }
      _restoreState(zone, previous);
      return result;
    } on Object {
      _restoreState(zone, previous);
      rethrow;
    }
  }

  static void _restoreState(Zone zone, _ContextData? previous) {
    if (previous != null) {
      _state[zone] = previous;
    } else {
      _state[zone] = null;
    }
  }

  static Map<ContextKey<Object?>, Object> _normalize(
    ContextOverrides overrides,
  ) {
    if (overrides.isEmpty) {
      return _emptyValues;
    }
    return Map<ContextKey<Object?>, Object>.unmodifiable({
      for (final MapEntry<ContextKey<Object?>, Object?> entry
          in overrides.entries)
        entry.key: entry.value ?? _nullSentinel,
    });
  }

  _ContextData get _data => _ensureData();

  _ContextData _ensureData() {
    final _ContextData? existing = _state[_zone];
    if (existing != null) {
      return existing;
    }
    final Context? inheritedParent = _nearestAncestorWithState(_zone);
    final data = _ContextData(
      parent: inheritedParent,
      values: _emptyValues,
      callbacks: <PostRequestCallback>[],
    );
    _state[_zone] = data;
    return data;
  }

  static Context? _nearestAncestorWithState(Zone zone) {
    Zone? cursor = zone.parent;
    while (cursor != null) {
      final _ContextData? parentData = _state[cursor];
      if (parentData != null) {
        return Context._(cursor);
      }
      cursor = cursor.parent;
    }
    return null;
  }

  /// The underlying [Zone].
  Zone get zone => _zone;

  /// The parent [Context], if any.
  Context? get parent => _data.parent;

  /// Whether this context wraps [Zone.root].
  bool get isRoot => identical(_zone, Zone.root);

  /// The platform for the current context.
  Platform get platform => get(ContextKey.platform) ?? const LocalPlatform();

  /// The file system for the current context.
  FileSystem get fileSystem =>
      get(ContextKey.fileSystem) ?? const LocalFileSystem();

  /// Whether the current context is running within Celest Cloud.
  bool get isRunningInCloud {
    final Environment? environmentValue = get(ContextKey.environment);
    if (environmentValue != null) {
      return environmentValue != Environment.local;
    }
    final String? environmentVariable =
        platform.environment['CELEST_ENVIRONMENT'];
    if (environmentVariable != null) {
      return environmentVariable != Environment.local;
    }
    return googleProjectId != null ||
        platform.environment.containsKey('K_SERVICE') ||
        platform.environment.containsKey('FUNCTION_TARGET') ||
        platform.environment.containsKey('CLOUD_RUN_JOB');
  }

  /// The Google Cloud project ID for the current context, if any.
  String? get googleProjectId {
    return get(ContextKey.googleProjectId) ??
        get(ContextKey.project)?.projectId ??
        platform.environment['CELEST_GOOGLE_PROJECT_ID'] ??
        platform.environment['GOOGLE_CLOUD_PROJECT'] ??
        platform.environment['GCLOUD_PROJECT'] ??
        platform.environment['GCP_PROJECT'];
  }

  /// The current request associated with this context.
  shelf.Request get currentRequest =>
      expect<shelf.Request>(ContextKey.currentRequest);

  /// The tracing information associated with the current request.
  Traceparent? get currentTrace => get(ContextKey.currentTrace);

  /// The Celest environment for the current context.
  Environment get environment => expect<Environment>(ContextKey.environment);

  /// The resolved project configuration for the current context.
  ResolvedProject get project => expect<ResolvedProject>(ContextKey.project);

  /// The HTTP client for the current context.
  http.Client get httpClient =>
      get(ContextKey.httpClient) ?? _defaultHttpClient;

  /// The logger for the current context.
  Logger get logger => get(ContextKey.logger) ?? Logger.root;

  /// Logs a message at the [Level.INFO] level using the current logger.
  void log(String message) {
    logger.info(message);
  }

  /// The router registered for the current context.
  Router get router => expect<Router>(ContextKey.router);

  /// Checks whether [key] is present in the current context only.
  bool containsLocal<V extends Object?>(ContextKey<V> key) {
    return _data.values.containsKey(key);
  }

  /// Checks whether [key] is present in this context or any ancestor.
  bool contains<V extends Object?>(ContextKey<V> key) {
    if (containsLocal(key)) {
      return true;
    }
    final Context? parentContext = parent;
    return parentContext?.contains(key) ?? false;
  }

  /// Retrieves the value for [key], traversing ancestors as needed.
  V? get<V extends Object?>(ContextKey<V> key) {
    final Map<ContextKey<Object?>, Object> local = _data.values;
    if (local.containsKey(key)) {
      final Object stored = local[key]!;
      return identical(stored, _nullSentinel) ? null : stored as V;
    }
    final Context? parentContext = parent;
    return parentContext?.get(key);
  }

  /// Retrieves the value for [key] or throws if it is absent.
  V expect<V extends Object?>(ContextKey<V> key) {
    final V? value = get(key);
    if (value == null) {
      throw StateError('Missing context value for key $key');
    }
    return value;
  }

  /// Returns the overrides applied in the current zone only.
  ContextOverrides snapshotLocal() {
    final Map<ContextKey<Object?>, Object> local = _data.values;
    if (local.isEmpty) {
      return const <ContextKey<Object?>, Object?>{};
    }
    return Map<ContextKey<Object?>, Object?>.unmodifiable({
      for (final MapEntry<ContextKey<Object?>, Object> entry in local.entries)
        entry.key: identical(entry.value, _nullSentinel) ? null : entry.value,
    });
  }

  /// Returns a snapshot of this context merged with its ancestors.
  ContextOverrides snapshot() {
    final Map<ContextKey<Object?>, Object?> result = {};
    final Context? parentContext = parent;
    if (parentContext != null) {
      result.addAll(parentContext.snapshot());
    }
    result.addAll(snapshotLocal());
    return Map<ContextKey<Object?>, Object?>.unmodifiable(result);
  }

  /// Creates a child context with [overrides] and runs [body] inside it.
  FutureOr<R> bind<R>({
    ContextOverrides overrides = const <ContextKey<Object?>, Object?>{},
    required FutureOr<R> Function(Context context) body,
  }) {
    return Context.run(parent: this, overrides: overrides, body: body);
  }

  /// Overrides a single [key] with [value] for the duration of [body].
  FutureOr<R> overrideValue<R, V extends Object?>(
    ContextKey<V> key,
    V? value,
    FutureOr<R> Function(Context context) body,
  ) {
    return bind(overrides: {key: value}, body: body);
  }

  /// Clears [key] locally for the duration of [body].
  FutureOr<R> clearValue<R, V extends Object?>(
    ContextKey<V> key,
    FutureOr<R> Function(Context context) body,
  ) {
    return bind(overrides: {key: null}, body: body);
  }

  /// Sets [key] to [value] in the current context without affecting parents.
  @Deprecated('Use setLocal instead')
  void put<V extends Object?>(ContextKey<V> key, V? value) {
    setLocal(key, value);
  }

  /// Sets [key] to [value] in the current context without affecting parents.
  void setLocal<V extends Object?>(ContextKey<V> key, V? value) {
    final _ContextData data = _data;
    final Map<ContextKey<Object?>, Object> current = data.values;
    final updated =
        identical(current, _emptyValues)
            ? <ContextKey<Object?>, Object>{}
            : Map<ContextKey<Object?>, Object>.from(current);
    updated[key] = value ?? _nullSentinel;
    _state[_zone] = _ContextData(
      parent: data.parent,
      values: Map<ContextKey<Object?>, Object>.unmodifiable(updated),
      callbacks: List<PostRequestCallback>.from(data.callbacks),
    );
  }

  /// Registers a callback to be run after the current context completes.
  void after(
    FutureOr<void> Function(shelf.Response) callback, {
    FutureOr<void> Function(Object e, StackTrace st)? onError,
  }) {
    final ZoneUnaryCallback<FutureOr<void>, shelf.Response> boundCallback =
        _zone.bindUnaryCallback(callback);
    final ZoneBinaryCallback<FutureOr<void>, Object, StackTrace>? boundOnError =
        onError == null ? null : _zone.bindBinaryCallback(onError);
    _data.callbacks.add((onResponse: boundCallback, onError: boundOnError));
  }

  /// Runs registered post-request callbacks in LIFO order.
  Future<void> runPostRequestCallbacks(shelf.Response response) async {
    final _ContextData data = _data;
    if (data.callbacks.isEmpty) {
      return;
    }
    final callbacks = List<PostRequestCallback>.from(data.callbacks);
    _state[_zone] = _ContextData(
      parent: data.parent,
      values: data.values,
      callbacks: <PostRequestCallback>[],
    );
    for (final PostRequestCallback callback in callbacks.reversed) {
      try {
        await callback.onResponse(response);
      } on Object catch (error, stackTrace) {
        logger.shout(
          'An error occurred while running a post-request callback',
          error,
          stackTrace,
        );
        final FutureOr<void> Function(Object e, StackTrace st)? handler =
            callback.onError;
        if (handler != null) {
          await handler(error, stackTrace);
        } else {
          Zone.current.handleUncaughtError(error, stackTrace);
        }
      }
    }
  }

  /// Runs registered post-request error callbacks in LIFO order.
  Future<void> runPostRequestErrorCallbacks(
    Object error,
    StackTrace stackTrace,
  ) async {
    final _ContextData data = _data;
    if (data.callbacks.isEmpty) {
      return;
    }
    final callbacks = List<PostRequestCallback>.from(data.callbacks);
    _state[_zone] = _ContextData(
      parent: data.parent,
      values: data.values,
      callbacks: <PostRequestCallback>[],
    );
    for (final PostRequestCallback callback in callbacks.reversed) {
      final FutureOr<void> Function(Object e, StackTrace st)? handler =
          callback.onError;
      if (handler == null) {
        continue;
      }
      try {
        await handler(error, stackTrace);
      } on Object catch (callbackError, callbackStackTrace) {
        logger.shout(
          'An error occurred while running a post-request callback',
          callbackError,
          callbackStackTrace,
        );
        Zone.current.handleUncaughtError(callbackError, callbackStackTrace);
      }
    }
  }
}

/// {@template celest.runtime.context_key}
/// A typed key used to store values inside a [Context].
/// {@endtemplate}
@immutable
class ContextKey<V extends Object?> {
  /// {@macro celest.runtime.context_key}
  const ContextKey([this.label]);

  /// The context key for the current [shelf.Request].
  static const ContextKey<shelf.Request> currentRequest = ContextKey(
    'current request',
  );

  /// The context key for the current [Traceparent].
  static const ContextKey<Traceparent> currentTrace = ContextKey(
    'current trace',
  );

  /// The context key for the current [User].
  static const ContextKey<User> principal = ContextKey('principal');

  /// The context key for the context [http.Client].
  static const ContextKey<http.Client> httpClient = ContextKey('http client');

  /// The context key for the context [Logger].
  static const ContextKey<Logger> logger = ContextKey('logger');

  /// The context key for the context [FileSystem].
  static const ContextKey<FileSystem> fileSystem = ContextKey('file system');

  /// The context key for the context [Platform].
  static const ContextKey<Platform> platform = ContextKey('platform');

  /// The context key for the context [ResolvedProject].
  static const ContextKey<ResolvedProject> project = ContextKey('project');

  /// The context key for the global [Router].
  ///
  /// This is used to register routes for the current service and can be used
  /// to dynamically add/remove routes at runtime.
  static const ContextKey<Router> router = ContextKey('router');

  /// The context key for the current [Environment].
  static const ContextKey<Environment> environment = ContextKey('environment');

  /// The context key for the current Google Cloud project ID, if available.
  static const ContextKey<String> googleProjectId = ContextKey(
    'google project id',
  );

  /// An optional label for debugging purposes.
  final String? label;

  @override
  String toString() {
    if (label case final label?) {
      return label;
    }
    return kReleaseMode ? '<removed>' : '<$V>';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ContextKey<V> && other.label == label;
  }

  @override
  int get hashCode => Object.hash(ContextKey, label);
}

/// Convenient alias for context overrides.
typedef ContextOverrides = Map<ContextKey<Object?>, Object?>;

final class _ContextData {
  _ContextData({
    required this.parent,
    required this.values,
    List<PostRequestCallback>? callbacks,
  }) : callbacks = callbacks ?? <PostRequestCallback>[];

  final Context? parent;
  final Map<ContextKey<Object?>, Object> values;
  final List<PostRequestCallback> callbacks;
}

/// A callback to be run after the current context completes.
typedef PostRequestCallback =
    ({
      FutureOr<void> Function(shelf.Response) onResponse,
      FutureOr<void> Function(Object e, StackTrace st)? onError,
    });

/// The default HTTP client used when no client is configured in the context.
final http.Client _defaultHttpClient = http.RetryClient(
  http.IOClient(
    HttpClient()
      ..idleTimeout = const Duration(seconds: 5)
      ..connectionTimeout = const Duration(seconds: 5),
  ),
  retries: 3,
  when: (response) {
    return switch (response.statusCode) {
      HttpStatus.gatewayTimeout ||
      HttpStatus.internalServerError ||
      HttpStatus.requestTimeout ||
      HttpStatus.serviceUnavailable => true,
      _ => false,
    };
  },
  whenError: (error, stackTrace) {
    Context.current.logger.warning('HTTP client error', error, stackTrace);
    return switch (error) {
      SocketException() || HandshakeException() || TimeoutException() => true,
      _ => false,
    };
  },
  onRetry: (request, response, retryCount) {
    Context.current.logger.warning(
      'Retrying request to ${request.url} (retry=$retryCount)',
    );
  },
);

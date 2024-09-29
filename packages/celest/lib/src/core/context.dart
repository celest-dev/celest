import 'dart:async';
import 'dart:io';

import 'package:celest/celest.dart';
import 'package:celest/src/runtime/gcp/gcp.dart';
import 'package:celest_core/_internal.dart';
import 'package:cloud_http/cloud_http.dart';
import 'package:meta/meta.dart';
import 'package:shelf/shelf.dart' as shelf;

/// The [Context] for the current request.
Context get context => Context.current;

/// {@template celest.runtime.celest_context}
/// A per-request context object which propogates request information and common accessors to the Celest server environment.
/// {@endtemplate}
final class Context {
  /// {@macro celest.runtime.celest_context}
  Context._(this._zone);

  /// The [Context] for the given [zone].
  factory Context.of(Zone zone) {
    return _contexts[zone] ??= Context._(zone);
  }

  /// All context objects by their [Zone].
  ///
  /// Contexts are attached to a zone such that they are disposed
  /// when the Zone in which they were created is disposed.
  static final Expando<Context> _contexts = Expando('contexts');

  /// The root [Context].
  static final Context root = Context.of(Zone.root);

  /// The [Context] for the current execution scope.
  static Context get current => Context.of(Zone.current);

  /// Context-specific values.
  final Map<ContextKey<Object>, Object> _values = {};

  /// The zone in which this context was created.
  final Zone _zone;

  /// Retrieves the value in this context for the given [key].
  Object? operator [](ContextKey<Object> key) {
    return _values[key];
  }

  /// Sets the value of the given [key] in this context.
  void operator []=(ContextKey<Object> key, Object? value) {
    if (value == null) {
      _values.remove(key);
    } else {
      _values[key] = value;
    }
  }

  /// The parent [Context] to `this`.
  Context? get parent {
    var parent = _zone.parent;
    while (parent != null) {
      if (_contexts[parent] case final parentContext?) {
        return parentContext;
      }
      parent = parent.parent;
    }
    return null;
  }

  /// Whether Celest is running in the cloud.
  bool get isRunningInCloud => root.get(googleCloudProjectKey) != null;

  /// The shelf [shelf.Request] object which triggered the current function invocation.
  shelf.Request get currentRequest => expect(ContextKey.currentRequest);

  /// The [Traceparent] for the current request.
  Traceparent get currentTrace => expect(ContextKey.currentTrace);

  /// The Celest [Environment] of the running service.
  Environment get environment {
    return Environment(Platform.environment['ENV']!);
  }

  (Context, V)? _get<V extends Object>(ContextKey<V> key) {
    if (key.read(this) case final value?) {
      return (this, value);
    }
    return parent?._get(key);
  }

  /// The value for the given [key] in the current [Context].
  V? get<V extends Object>(ContextKey<V> key) {
    return _get(key)?.$2;
  }

  /// Expects a value present in the given [context].
  ///
  /// Throws a [StateError] if the value is not present.
  V expect<V extends Object>(ContextKey<V> key) {
    final value = get(key);
    if (value == null) {
      throw StateError('Expected value for key "$key" in context');
    }
    return value;
  }

  /// Sets the value of [key] in the current [Context].
  void put<V extends Object>(ContextKey<V> key, V value) {
    key.set(this, value);
  }

  /// Updates the value of [key] in place.
  void update<V extends Object>(
    ContextKey<V> key,
    V Function(V? value) update,
  ) {
    final (context, value) = _get(key) ?? (this, null);
    final updated = update(value);
    context.put(key, updated);
  }
}

/// {@template celest.runtime.context_key}
/// A key for a typed value stored in a [Context].
/// {@endtemplate}
@immutable
abstract interface class ContextKey<V extends Object> {
  /// {@macro celest.runtime.context_key}
  const factory ContextKey([String? label]) = _ContextKey<V>;

  /// The context key for the current [shelf.Request].
  static const ContextKey<shelf.Request> currentRequest =
      ContextKey('current request');

  /// The context key for the current [Traceparent].
  static const ContextKey<Traceparent> currentTrace =
      ContextKey('current trace');

  /// The context key for the current [User].
  static const ContextKey<User> principal = _PrincipalContextKey();

  /// Reads the value for `this` from the given [context].
  V? read(Context context);

  /// Sets the value for `this` in the given [context].
  void set(Context context, V? value);
}

final class _ContextKey<V extends Object> implements ContextKey<V> {
  const _ContextKey([this.label]);

  final String? label;

  @override
  V? read(Context context) {
    return context[this] as V?;
  }

  @override
  void set(Context context, V? value) {
    context[this] = value;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _ContextKey<V> && other.label == label;
  }

  @override
  int get hashCode => Object.hash(_ContextKey<V>, label);

  @override
  String toString() {
    if (label case final label?) {
      return label;
    }
    if (kDebugMode || !context.environment.isProduction) {
      return '<$V>';
    }
    return '<removed>';
  }
}

final class _PrincipalContextKey extends _ContextKey<User> {
  const _PrincipalContextKey() : super('principal');
}

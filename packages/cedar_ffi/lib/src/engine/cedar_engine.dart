import 'dart:convert';
import 'dart:ffi';

import 'package:cedar/cedar.dart';
import 'package:cedar_ffi/src/ffi/cedar_bindings.dart';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

enum CedarLogLevel {
  off,
  error,
  warn,
  info,
  debug,
  trace,
}

final class CedarEngine implements CedarAuthorizer, Finalizable {
  factory CedarEngine({
    required CedarSchema schema,
    List<CedarEntity>? entities,
    CedarPolicySet? policies,
    CedarLogLevel logLevel = CedarLogLevel.off,
    @visibleForTesting bool validate = true,
  }) {
    final storeRef = using((arena) {
      final config = arena<CCedarConfig>();
      config.ref
        ..schema_json =
            jsonEncode(schema.toJson()).toNativeUtf8(allocator: arena).cast()
        ..policies_json = switch (policies) {
          final policies? =>
            jsonEncode(policies.toJson()).toNativeUtf8(allocator: arena).cast(),
          null => nullptr,
        }
        ..entities_json = switch (entities) {
          final entities? =>
            jsonEncode(entities.map((e) => e.toJson()).toList())
                .toNativeUtf8(allocator: arena)
                .cast(),
          null => nullptr,
        }
        ..validate = validate
        ..log_level = logLevel.name.toNativeUtf8(allocator: arena).cast();
      final initResult = bindings.cedar_init(config);
      if (initResult.error != nullptr) {
        throw StateError(
          'Error initializing Cedar: '
          '${initResult.error.cast<Utf8>().toDartString()}',
        );
      }
      assert(
        initResult.store != nullptr,
        'Should be non-null when errors is null',
      );
      return initResult.store;
    });
    final engine = CedarEngine._(ref: storeRef);
    _finalizer.attach(engine, storeRef, detach: engine);
    return engine;
  }

  CedarEngine._({
    required Pointer<CedarStore> ref,
  }) : _ref = ref;

  static final Finalizer<Pointer<CedarStore>> _finalizer = Finalizer(
    bindings.cedar_deinit,
  );

  var _closed = false;

  final Pointer<CedarStore> _ref;

  @override
  CedarAuthorizationResponse isAuthorized(
    CedarAuthorizationRequest request, {
    List<CedarEntity>? entities,
    CedarPolicySet? policies,
  }) {
    if (_closed) {
      throw StateError('Cedar engine is closed');
    }
    return using((arena) {
      final query = arena<CCedarQuery>();
      query.ref
        ..principal_str = switch (request.principal) {
          final principal? => principal.normalized
              .toString()
              .toNativeUtf8(allocator: arena)
              .cast(),
          null => nullptr,
        }
        ..resource_str = switch (request.resource) {
          final resource? => resource.normalized
              .toString()
              .toNativeUtf8(allocator: arena)
              .cast(),
          null => nullptr,
        }
        ..action_str = switch (request.action) {
          final action? =>
            action.normalized.toString().toNativeUtf8(allocator: arena).cast(),
          null => nullptr,
        }
        ..context_json = switch (request.context) {
          final context? =>
            jsonEncode(context).toNativeUtf8(allocator: arena).cast(),
          null => nullptr,
        }
        ..entities_json = switch (entities) {
          final entities? =>
            jsonEncode(entities.map((e) => e.toJson()).toList())
                .toNativeUtf8(allocator: arena)
                .cast(),
          null => nullptr,
        }
        ..policies_json = switch (policies) {
          final policies? =>
            jsonEncode(policies.toJson()).toNativeUtf8(allocator: arena).cast(),
          null => nullptr,
        };
      final cDecision = bindings.cedar_is_authorized(_ref, query);
      return switch (cDecision) {
        CAuthorizationDecision(:final completion_error)
            when completion_error != nullptr =>
          throw Exception(
            'Error performing authorization: '
            '${completion_error.cast<Utf8>().toDartString()}',
          ),
        CAuthorizationDecision(
          :final is_authorized,
          :final reasons,
          :final reasons_len,
          :final errors,
          :final errors_len,
        ) =>
          CedarAuthorizationResponse(
            decision: switch (is_authorized) {
              true => CedarAuthorizationDecision.allow,
              false => CedarAuthorizationDecision.deny,
            },
            reasons: reasons == nullptr || reasons_len == 0
                ? const []
                : [
                    for (var i = 0; i < reasons_len; i++)
                      reasons[i].cast<Utf8>().toDartString(),
                  ],
            errors: errors == nullptr || errors_len == 0
                ? const []
                : [
                    for (var i = 0; i < errors_len; i++)
                      errors[i].cast<Utf8>().toDartString(),
                  ],
          ),
      };
    });
  }

  /// Closes the Cedar engine.
  ///
  /// This should be called when the Cedar engine is no longer needed. After
  /// this method is called, the Cedar engine is no longer usable.
  void close() {
    if (_closed) {
      return;
    }
    _closed = true;
    _finalizer.detach(this);
    bindings.cedar_deinit(_ref);
  }
}

import 'dart:async';

import 'package:cedar/cedar.dart';
import 'package:celest/src/core/context.dart' as celest;
import 'package:celest_cloud_auth/src/authorization/cedar_interop.dart';
import 'package:celest_cloud_auth/src/email/email_provider.dart';
import 'package:celest_cloud_auth/src/email/resend_email_provider.dart';
import 'package:corks_cedar/corks_cedar.dart';

export 'package:celest/src/core/context.dart' show ContextKey;

Context get context => Context._(celest.context);

extension type Context._(celest.Context _context) implements celest.Context {
  Context.of(Zone zone) : this._(celest.Context.of(zone));

  static Context get root => Context._(celest.Context.root);

  String get hostname => '';

  EntityUid get rootEntity => project.uid;

  CedarCork? get cork => _context.get(contextKeyCork);

  EmailOtpProvider get email {
    if (get(contextKeyEmailOtpProvider) case final provider?) {
      return provider;
    }
    final apiKey = platform.environment['RESEND_API_KEY'];
    if (apiKey != null) {
      return ResendEmailProvider(apiKey: apiKey, client: httpClient);
    }
    return const EmailOtpProvider();
  }

  Map<String, String> get routeParameters =>
      _context.expect(contextKeyRouteParameters);
}

const celest.ContextKey<CedarCork> contextKeyCork = celest.ContextKey('cork');
const celest.ContextKey<EmailOtpProvider> contextKeyEmailOtpProvider =
    celest.ContextKey('EmailOtpProvider');

/// The context key for the current request's route parameters.
const celest.ContextKey<Map<String, String>> contextKeyRouteParameters =
    _RouteParametersContextKey();

final class _RouteParametersContextKey
    implements celest.ContextKey<Map<String, String>> {
  const _RouteParametersContextKey();

  @override
  Map<String, String>? read(celest.Context context) {
    return context[this] as Map<String, String>?;
  }

  @override
  void set(celest.Context context, Map<String, String>? value) {
    context[this] = value;
  }
}

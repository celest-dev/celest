// Generated by Celest. This file should not be modified manually, but
// it can be checked into version control.
// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import, deprecated_member_use, invalid_use_of_internal_member

library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:celest/src/core/context.dart' as _$celest;
import 'package:celest_backend/src/generated/config.celest.dart';

/// The interface to your Celest backend.
///
/// Similar to the `celest` global in the frontend, this
/// provides access to the backend environment and services
/// configured for your project.
const CelestCloud celest = CelestCloud._();

/// A per-request context object which propogates request information and common
/// accessors to the Celest server environment.
CelestContext get context => CelestContext._(_$celest.context);

/// The interface to your Celest backend.
///
/// Similar to the `Celest` class in the frontend, this class
/// provides access to the backend environment and services
/// configured for your project.
class CelestCloud {
  const CelestCloud._();

  /// The current environment of the Celest service.
  ///
  /// This is determined by the `CELEST_ENVIRONMENT` variable
  /// which is set for you by the deployment environment.
  CelestEnvironment get currentEnvironment =>
      (variables.currentEnvironment as CelestEnvironment);

  /// The variables of the Celest service.
  ///
  /// This class provides access to the values configured for the
  /// [currentEnvironment].
  CelestVariables get variables => const CelestVariables();
}

/// A per-request context object which propogates request information and common
/// accessors to the Celest server environment.
extension type CelestContext._(_$celest.Context _context)
    implements _$celest.Context {}

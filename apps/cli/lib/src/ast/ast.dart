import 'package:built_collection/built_collection.dart';
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/utils/reference.dart';

extension CloudFunctionExt on CloudFunction {
  bool get hasHttpBody {
    for (final parameter in parameters) {
      if (!parameter.includeInClient) continue;
      switch (parameter.references?.type) {
        case NodeType.httpHeader || NodeType.httpQuery || NodeType.httpLabel:
          continue;
        default:
          break;
      }
      return true;
    }
    return false;
  }
}

extension CloudFunctionParameterExt on CloudFunctionParameter {
  /// Whether to include this parameter in the generated client.
  bool get includeInClient {
    if (type.isFunctionContext) return false;
    switch (references?.type) {
      case NodeType.variable || NodeType.secret || NodeType.userContext:
        return false;
      default:
        break;
    }
    return true;
  }
}

extension AuthConfigurationValues on Auth {
  BuiltListMultimap<AuthProviderType, Variable> get variables {
    return BuiltListMultimap<AuthProviderType, Variable>.build((b) {
      for (final authProvider in providers) {
        switch (authProvider) {
          case EmailAuthProvider():
            break;
          case SmsAuthProvider():
            break;
          case GitHubAuthProvider():
            break;
          case GoogleAuthProvider():
            break;
          case AppleAuthProvider():
            break;
        }
      }
      for (final externalAuthProvider in externalProviders) {
        switch (externalAuthProvider) {
          case FirebaseExternalAuthProvider(:final projectId):
            b.add(FirebaseExternalAuthProvider.$type, projectId);
          case SupabaseExternalAuthProvider(:final projectUrl):
            b.add(SupabaseExternalAuthProvider.$type, projectUrl);
        }
      }
    });
  }

  BuiltListMultimap<AuthProviderType, Secret> get secrets {
    return BuiltListMultimap<AuthProviderType, Secret>.build((b) {
      for (final authProvider in providers) {
        switch (authProvider) {
          case EmailAuthProvider():
          case SmsAuthProvider():
            break;
          case GitHubAuthProvider(:final clientId, :final clientSecret):
            b.addValues(GitHubAuthProvider.$type, [clientId, clientSecret]);
          case GoogleAuthProvider(:final clientId, :final clientSecret):
            b.addValues(GoogleAuthProvider.$type, [clientId, clientSecret]);
          case AppleAuthProvider(
              :final clientId,
              :final teamId,
              :final keyId,
              :final privateKey,
            ):
            b.addValues(AppleAuthProvider.$type, [
              clientId,
              teamId,
              keyId,
              privateKey,
            ]);
        }
      }
      for (final externalAuthProvider in externalProviders) {
        switch (externalAuthProvider) {
          case FirebaseExternalAuthProvider():
            break;
          case SupabaseExternalAuthProvider():
            break;
        }
      }
    });
  }
}

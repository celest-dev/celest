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
      case NodeType.environmentVariable || NodeType.userContext:
        return false;
      default:
        break;
    }
    return true;
  }
}

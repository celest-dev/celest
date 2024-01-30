import 'package:celest_cli/src/utils/reference.dart';
import 'package:celest_proto/ast.dart';

extension CloudFunctionParameterExt on CloudFunctionParameter {
  /// Whether to include this parameter in the generated client.
  bool get includeInClient {
    if (type.isFunctionContext) return false;
    if (references != null) return false;
    return true;
  }
}

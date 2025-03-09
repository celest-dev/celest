import 'package:cedar/cedar.dart';
import 'package:celest_ast/celest_ast.dart';

extension ResolvedProjectUid on ResolvedProject {
  EntityUid get uid => EntityUid.of('Celest::Service', projectId);
}

extension ResolvedApiUid on ResolvedApi {
  EntityUid get uid => EntityUid.of('Celest::Api', apiId);
}

extension ResolvedCloudFunctionUid on ResolvedCloudFunction {
  EntityUid get uid => EntityUid.of('Celest::Function', '$apiId/$functionId');
}

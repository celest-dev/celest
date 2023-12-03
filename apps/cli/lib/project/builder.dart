import 'dart:isolate';

import 'package:celest_cli/ast/ast.dart';
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:celest_rpc/protos.dart' as proto;
import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;

final class ProjectBuilder {
  ProjectBuilder({
    required this.project,
    required this.projectPaths,
    required this.environmentName,
  });

  final Project project;
  final ProjectPaths projectPaths;
  final String environmentName;

  Future<proto.Project> build() async {
    final receivePort = ReceivePort();
    final errorPort = ReceivePort();
    final isolate = await Isolate.spawnUri(
      p.toUri(projectPaths.projectBuildDart),
      [
        project.name,
        projectPaths.projectRoot,
        projectPaths.outputsDir,
        environmentName,
      ],
      receivePort.sendPort,
      onError: errorPort.sendPort,
      automaticPackageResolution: true,
    );
    try {
      final result = await Future.any([
        receivePort.first,
        errorPort.first.then((error) {
          print('Error: $error');
          if (error != null) {
            throw '${error.runtimeType}: $error';
          }
        }),
      ]);
      if (result is! List<int>) {
        throw StateError('Bad result: $result');
      }
      final cloudAst = proto.Project.fromBuffer(result);
      final staticWidgetCollector = _StaticWidgetCollector(cloudAst: cloudAst);
      project.accept(staticWidgetCollector);
      return cloudAst;
    } finally {
      isolate.kill(priority: Isolate.immediate);
      receivePort.close();
      errorPort.close();
    }
  }
}

final class _StaticWidgetCollector extends AstVisitor<void> {
  _StaticWidgetCollector({
    required this.cloudAst,
  });

  final proto.Project cloudAst;

  @override
  void visitProject(Project project) {
    project.environments.values.forEach(visitEnvironment);
  }

  @override
  void visitEnvironment(Environment environment) {
    environment.apis.values.forEach(visitApi);
  }

  @override
  void visitApi(Api api) {
    // TODO: Should this be deny by default?
    if (api.metadata.whereType<ApiMetadataAuthenticated>().isNotEmpty) {
      final cloudApi = cloudAst.widgets.singleWhereOrNull((widget) {
        return widget.hasCloudApi() && widget.cloudApi.name == api.name;
      })?.cloudApi;
      assert(
        cloudApi != null,
        'Could not find API ${api.name} in cloud AST',
      );
      cloudApi!.policy = cloudApi.policy.rebuild((policy) {
        policy.statements.add(
          proto.PolicyStatement(
            grantee: 'Role::authenticated',
            actions: ['invoke'],
          ),
        );
      });
    }
    api.functions.values.forEach(visitFunction);
  }

  @override
  void visitApiAuthenticated(ApiMetadataAuthenticated annotation) {}

  @override
  void visitApiMiddleware(ApiMetadataMiddleware annotation) {}

  @override
  void visitFunction(CloudFunction function) {
    if (function.metadata.whereType<ApiMetadataAuthenticated>().isNotEmpty) {
      final functionProto = cloudAst.widgets.singleWhereOrNull((widget) {
        return widget.hasCloudFunction() &&
            widget.cloudFunction.apiName == function.apiName &&
            widget.cloudFunction.name == function.name;
      })?.cloudFunction;
      assert(
        functionProto != null,
        'Could not find function ${function.apiName}.${function.name} in '
        'cloud AST',
      );
      functionProto!.policy = functionProto.policy.rebuild((policy) {
        policy.statements.add(
          proto.PolicyStatement(
            grantee: 'Role::authenticated',
            actions: ['invoke'],
          ),
        );
      });
    }
  }

  @override
  void visitParameter(Parameter parameter) {}
}

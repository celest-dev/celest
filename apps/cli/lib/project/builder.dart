import 'dart:isolate';

import 'package:celest/celest.dart';
// ignore: implementation_imports
import 'package:celest/src/authz/policy.dart' as core;
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/project/paths.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_rpc/protos.dart' as proto;
import 'package:collection/collection.dart';

final class ProjectBuilder {
  ProjectBuilder({
    required this.project,
    required this.projectPaths,
    required this.environmentName,
  });

  final ast.Project project;
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
  void visitProject(ast.Project project) {
    project.environments.values.forEach(visitEnvironment);
  }

  @override
  void visitEnvironment(ast.Environment environment) {
    environment.apis.values.forEach(visitApi);
  }

  @override
  void visitApi(ast.Api api) {
    final apiAuth = api.metadata.whereType<ast.ApiAuth>().singleOrNull;
    if (apiAuth != null) {
      final cloudApi = cloudAst.widgets.singleWhereOrNull((widget) {
        return widget.hasCloudApi() && widget.cloudApi.name == api.name;
      })?.cloudApi;
      assert(
        cloudApi != null,
        'Could not find API ${api.name} in cloud AST',
      );
      cloudApi!.policy = cloudApi.policy.rebuild((policy) {
        policy.statements.add(
          core.PolicyStatement(
            grantee: switch (apiAuth) {
              ast.ApiAuthenticated() => const Role.authenticated(),
              ast.ApiAnonymous() => const Role.anonymous(),
            },
            actions: [CloudFunctionAction.invoke],
          ).toProto(),
        );
      });
    }
    api.functions.values.forEach(visitFunction);
  }

  @override
  void visitApiAuthenticated(ast.ApiAuthenticated annotation) {}

  @override
  void visitApiAnonymous(ast.ApiAnonymous annotation) {}

  @override
  void visitApiMiddleware(ast.ApiMiddleware annotation) {}

  @override
  void visitFunction(ast.CloudFunction function) {
    final functionAuth =
        function.metadata.whereType<ast.ApiAuth>().singleOrNull;
    if (functionAuth != null) {
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
          core.PolicyStatement(
            grantee: switch (functionAuth) {
              ast.ApiAuthenticated() => const Role.authenticated(),
              ast.ApiAnonymous() => const Role.anonymous(),
            },
            actions: [CloudFunctionAction.invoke],
          ).toProto(),
        );
      });
    }
  }

  @override
  void visitParameter(ast.CloudFunctionParameter parameter) {}

  @override
  void visitEnvironmentVariable(ast.EnvironmentVariable variable) {}
}

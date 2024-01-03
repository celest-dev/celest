import 'dart:convert';
import 'dart:io';

import 'package:celest/celest.dart';
// ignore: implementation_imports
import 'package:celest/src/authz/policy.dart' as core;
import 'package:celest_cli/ast/ast.dart' as ast;
import 'package:celest_cli/ast/visitor.dart';
import 'package:celest_cli/compiler/dart_sdk.dart';
import 'package:celest_cli/frontend/resident_compiler.dart';
import 'package:celest_cli/project/project_paths.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_core/protos.dart' as proto;
import 'package:collection/collection.dart';

final class ProjectBuilder {
  ProjectBuilder({
    required this.project,
    required this.projectPaths,
    required this.residentCompiler,
  });

  final ast.Project project;
  final ProjectPaths projectPaths;
  final ResidentCompiler? residentCompiler;

  Future<proto.Project> build() async {
    // Cannot use `Isolate.spawnUri` in AOT mode unless the URI is an AOT
    // snapshot compiled with the same SDK.
    final processResult = await Process.run(
      Sdk.current.dart,
      [
        '--enable-experiment=native-assets',
        'run',
        if (residentCompiler case final residentCompiler?) ...[
          '--resident',
          '--resident-server-info-file=${residentCompiler.infoFile.path}',
        ],
        projectPaths.projectBuildDart,
        project.name,
        projectPaths.projectRoot,
        projectPaths.outputsDir,
      ],
      stdoutEncoding: null,
      stderrEncoding: utf8,
    );
    if (processResult.exitCode != 0) {
      throw Exception(
        'Failed to build project: ${processResult.stderr}',
      );
    }
    final cloudAst = proto.Project.fromBuffer(
      processResult.stdout as List<int>,
    );
    final staticWidgetCollector = _StaticWidgetCollector(cloudAst: cloudAst);
    project.accept(staticWidgetCollector);
    return cloudAst;
  }
}

final class _StaticWidgetCollector extends AstVisitor<void> {
  _StaticWidgetCollector({
    required this.cloudAst,
  });

  final proto.Project cloudAst;

  @override
  void visitProject(ast.Project project) {
    project.apis.values.forEach(visitApi);
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
              ast.ApiPublic() => const Role.public(),
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
  void visitApiPublic(ast.ApiPublic annotation) {}

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
              ast.ApiPublic() => const Role.public(),
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
  void visitEnvironmentVariable(ast.EnvironmentVariable variable) {
    final envName = variable.envName;
    final envValue = projectPaths.envManager.get(envName);
    assert(envValue != null, 'Should have been caught before this');
    cloudAst.widgets.add(
      proto.CloudWidget(
        environmentVariable: proto.EnvironmentVariable(
          name: envName,
          value: envValue,
        ),
      ),
    );
  }
}

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:mustache_template/mustache_template.dart';

/// Generates a `Dockerfile` for the user's project so they can self-host it.
final class DockerfileGenerator {
  DockerfileGenerator({required this.project});

  final ast.ResolvedProject project;

  static final Template _dartTemplate = Template(r'''
# syntax=docker/dockerfile:1
FROM celestdev/dart-builder:{{version}} AS build

WORKDIR /app
COPY main.aot.dill .

RUN [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf", "--elf=/app/main.aot", "/app/main.aot.dill" ]

FROM celestdev/dart-runtime:{{version}}

WORKDIR /app
COPY --from=build /app/main.aot main.aot
COPY celest.json .

ENV PORT=8080
EXPOSE $PORT
''');

  // TODO(dnys1): Remove `--platform=linux/amd64` when Celest supports arm64.
  static final Template _flutterTemplate = Template(r'''
# syntax=docker/dockerfile:1
FROM --platform=linux/amd64 celestdev/flutter-builder:{{version}} AS build

WORKDIR /app
COPY main.aot.dill .

RUN [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf", "--elf=/app/main.aot", "/app/main.aot.dill" ]

FROM --platform=linux/amd64 celestdev/flutter-runtime:{{version}}

WORKDIR /app
COPY --from=build /app/main.aot main.aot
COPY flutter_assets/ ./flutter_assets/
COPY celest.json .

ENV PORT=8080
EXPOSE $PORT
''');

  String generate() {
    return switch (project.sdkConfig.targetSdk) {
      SdkType.flutter => _flutterTemplate.renderString({
          'version': project.sdkConfig.flutter!.version.canonicalizedVersion,
        }),
      SdkType.dart => _dartTemplate.renderString({
          'version': project.sdkConfig.dart.version.canonicalizedVersion,
        }),
      final unknown => unreachable('Unknown SDK: $unknown'),
    };
  }
}

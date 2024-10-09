import 'package:celest_ast/celest_ast.dart' as ast;

/// Generates a `Dockerfile` for the user's project so they can self-host it.
final class DockerfileGenerator {
  DockerfileGenerator({
    required this.project,
  });

  final ast.Project project;

  static const String _dartTemplate = r'''
FROM celestdev/dart-builder:{{version}} AS build

WORKDIR /app
COPY celest.aot.dill main.aot.dill

RUN [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf", "--elf=/app/main.aot", "/app/main.aot.dill" ]

FROM celestdev/dart-runtime:{{version}}

WORKDIR /app
COPY config.json .
COPY --from=build /app/main.aot .

ENV PORT=8080
EXPOSE 8080
''';

  static const String _flutterTemplate = r'''
FROM celestdev/flutter-builder:{{version}} AS build

WORKDIR /app
COPY celest.aot.dill main.aot.dill

RUN [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf", "--elf=/app/main.aot", "/app/main.aot.dill" ]

FROM celestdev/flutter-runtime:{{version}}

WORKDIR /app
COPY config.json .
COPY --from=build /app/main.aot .

ENV PORT=8080
EXPOSE 8080
''';

  String generate() {
    return switch (project.sdkInfo) {
      ast.SdkInfo(:final flutterSdkVersion?) => _flutterTemplate.replaceAll(
          '{{version}}',
          flutterSdkVersion.canonicalizedVersion,
        ),
      ast.SdkInfo(:final sdkVersion) => _dartTemplate.replaceAll(
          '{{version}}',
          sdkVersion.canonicalizedVersion,
        ),
    };
  }
}

import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/utils/error.dart';

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
COPY celest.json .
COPY --from=build /app/main.aot .

ENV PORT=8080
EXPOSE 8080
''';

  static const String _flutterTemplate = r'''
FROM celestdev/flutter-builder:{{version}} AS build

WORKDIR /app
COPY celest.aot.dill main.aot.dill

RUN [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf", "--elf=/app/main.aot", "/app/main.aot.dill" ]
RUN [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-assembly", "--assembly=main.S", "/app/main.aot" ]

FROM celestdev/flutter-runtime:{{version}}

WORKDIR /app
COPY celest.json .
COPY --from=build /app/main.aot .

ENV PORT=8080
EXPOSE 8080
''';

  String generate() {
    return switch (project.sdkConfig.targetSdk) {
      SdkType.flutter => _flutterTemplate.replaceAll(
          '{{version}}',
          project.sdkConfig.flutter!.version.canonicalizedVersion,
        ),
      SdkType.dart => _dartTemplate.replaceAll(
          '{{version}}',
          project.sdkConfig.dart.version.canonicalizedVersion,
        ),
      final unknown => unreachable('Unknown SDK: $unknown'),
    };
  }
}

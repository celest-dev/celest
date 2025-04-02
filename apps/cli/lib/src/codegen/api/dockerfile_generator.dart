import 'package:celest_ast/celest_ast.dart' as ast;
import 'package:celest_ast/celest_ast.dart';
import 'package:celest_cli/src/utils/error.dart';
import 'package:mustache_template/mustache_template.dart';

/// Generates a `Dockerfile` for the user's project so they can self-host it.
final class DockerfileGenerator {
  DockerfileGenerator({required this.project});

  final ast.Project project;

  static final Template _dartTemplate = Template(r'''
# syntax=docker/dockerfile:1
FROM dart:{{version}} AS build

WORKDIR /app
{{ #includes_data }}
# Add SQLite3
RUN apt update && apt install -y libsqlite3-0
RUN cp $(find / -name libsqlite3.so* -type f | head -n1) /app/libsqlite3.so
{{ /includes_data }}
COPY celest.aot.dill main.aot.dill

RUN [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf", "--elf=/app/main.aot", "/app/main.aot.dill" ]

FROM scratch

COPY --from=build /runtime /

WORKDIR /app
COPY --from=build /usr/lib/dart/bin/dartaotruntime .
COPY --from=build /app ./
COPY celest.json .

ENV PORT=8080
EXPOSE 8080

ENTRYPOINT [ "/app/dartaotruntime" ]
CMD [ "/app/main.aot" ]
''');

  static final Template _flutterTemplate = Template(r'''
# syntax=docker/dockerfile:1
ARG DEBIAN_VERSION=12

FROM debian:${DEBIAN_VERSION}-slim

ARG TARGETARCH

# Set up fonts for the Flutter engine
RUN apt update && apt install -y \
    fontconfig \
    fonts-cantarell \
    fonts-liberation2
RUN fc-cache -f

# Add CA certificates
RUN apt install -y ca-certificates

WORKDIR /celest
{{ #includes_data }}
# Add SQLite3
RUN apt install -y libsqlite3-0
RUN cp $(find / -name libsqlite3.so* -type f | head -n1) /celest/libsqlite3.so
{{ /includes_data }}
COPY --from=ghcr.io/cirruslabs/flutter:{{version}} /sdks/flutter/bin/cache/artifacts/engine/linux-${TARGETARCH/amd64/x64}/icudtl.dat .
COPY --from=ghcr.io/cirruslabs/flutter:{{version}} /sdks/flutter/bin/cache/artifacts/engine/linux-${TARGETARCH/amd64/x64}/*.so ./
COPY --from=ghcr.io/cirruslabs/flutter:{{version}} /sdks/flutter/bin/cache/artifacts/engine/linux-${TARGETARCH/amd64/x64}/*.so* ./
COPY --from=ghcr.io/cirruslabs/flutter:{{version}} /sdks/flutter/bin/cache/artifacts/engine/linux-${TARGETARCH/amd64/x64}/flutter_tester flutter_runner

# Clean up
RUN apt-get clean

WORKDIR /app
COPY flutter_assets/ ./
COPY celest.json .

ENV LD_LIBRARY_PATH="/app:/celest:${LD_LIBRARY_PATH}"
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT [ "/celest/flutter_runner", "--non-interactive", "--run-forever", "--disable-vm-service", "--icu-data-file-path=/celest/icudtl.dat", "--verbose-logging", "--enable-platform-isolates", "--force-multithreading", "--cache-dir-path=/tmp", "--flutter-assets-dir=/app", "--snapshot-asset-path=/app" ]
CMD [ "/app/kernel_blob.bin" ]
''');

  String generate() {
    return switch (project.sdkConfig.targetSdk) {
      SdkType.flutter => _flutterTemplate.renderString({
          'version': project.sdkConfig.flutter!.version.canonicalizedVersion,
          'includes_data': project.databases.isNotEmpty,
        }),
      SdkType.dart => _dartTemplate.renderString({
          'version': project.sdkConfig.dart.version.canonicalizedVersion,
          'includes_data': project.databases.isNotEmpty,
        }),
      final unknown => unreachable('Unknown SDK: $unknown'),
    };
  }
}

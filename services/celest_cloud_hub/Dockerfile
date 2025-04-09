FROM dart:stable AS build

# Set the dependency versions
ARG FLY_VERSION=0.3.98
ARG YQ_VERSION=4.45.1

# Download and install flyctl based on architecture
RUN arch=$(uname -m) && \
    if [ "$arch" = "x86_64" ]; then \
        curl -L "https://github.com/superfly/flyctl/releases/download/v${FLY_VERSION}/flyctl_${FLY_VERSION}_Linux_x86_64.tar.gz" -o flyctl.tar.gz; \
        curl -L "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64" -o /usr/local/bin/yq; \
    elif [ "$arch" = "aarch64" ]; then \
        curl -L "https://github.com/superfly/flyctl/releases/download/v${FLY_VERSION}/flyctl_${FLY_VERSION}_Linux_arm64.tar.gz" -o flyctl.tar.gz; \
        curl -L "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_arm64" -o /usr/local/bin/yq; \
    else \
        echo "Unsupported architecture: $arch" && exit 1; \
    fi && \
    mkdir -p /tmp/flyctl && \
    tar -xzf flyctl.tar.gz -C /tmp/flyctl && \
    mv /tmp/flyctl/flyctl /usr/local/bin/ && \
    chmod +x /usr/local/bin/flyctl && \
    chmod +x /usr/local/bin/yq && \
    rm -rf flyctl.tar.gz /tmp/flyctl

# Install sqlite3
WORKDIR /app
RUN apt update && apt install -y libsqlite3-0
RUN cp $(find / -name libsqlite3.so* -type f | head -n1) /app/libsqlite3.so

# Fix pub cache
WORKDIR /app
COPY tool tool
WORKDIR /app/tool
RUN dart pub get
RUN dart run fix_pub_cache.dart

# Copy repo
WORKDIR /app
COPY pubspec.* ./
COPY apps/cli apps/cli
COPY packages packages
COPY services services

WORKDIR /app/packages/celest_auth
RUN yq eval 'del(.environment.flutter)' -i pubspec.yaml
WORKDIR /app/packages/celest_core
RUN yq eval 'del(.environment.flutter)' -i pubspec.yaml
WORKDIR /app/packages/celest
RUN yq eval 'del(.environment.flutter)' -i pubspec.yaml

WORKDIR /app/services/celest_cloud_hub
RUN dart pub get
RUN dart compile exe bin/cloud_hub.dart -o /app/cloud_hub

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/cloud_hub /app/cloud_hub
COPY --from=build /app/libsqlite3.so /app/libsqlite3.so
COPY --from=build /usr/local/bin/flyctl /usr/local/bin/fly

ENV PORT=8080
EXPOSE $PORT

WORKDIR /tmp
CMD ["/app/cloud_hub"]

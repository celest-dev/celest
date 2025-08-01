FROM dart:3.9.0-333.3.beta AS build

# Set the dependency versions
ARG FLY_VERSION=0.3.164
ARG YQ_VERSION=4.46.1

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
RUN dart --enable-experiment=native-assets \
        build cli --target=bin/cloud_hub.dart --output=/dist

# Builds SQLite from Source
#
# The version shipped with apt is very outdated (3.40.1). This is the only way
# it seems to get anything newer.
FROM debian:12-slim AS sqlite

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    tcl-dev \
    libreadline-dev \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set up build directory
WORKDIR /sqlite_build

# Download the latest SQLite source
ARG SQLITE_VERSION=3500400
RUN wget https://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_VERSION}.tar.gz \
    && tar xzf sqlite-autoconf-${SQLITE_VERSION}.tar.gz \
    && cd sqlite-autoconf-${SQLITE_VERSION}

# Build SQLite with default options
WORKDIR /sqlite_build/sqlite-autoconf-${SQLITE_VERSION}
RUN CFLAGS='-DSQLITE_ENABLE_FTS5' \
    ./configure --prefix=/usr \
    --enable-threadsafe \
    && make -j$(nproc) \
    && make install DESTDIR=/sqlite_install

FROM gcr.io/distroless/cc-debian12

COPY --from=build /usr/share/ca-certificates /usr/share/ca-certificates
COPY --from=build /etc/ssl/certs /etc/ssl/certs
COPY --from=build /usr/local/bin/flyctl /usr/local/bin/flyctl
COPY --from=sqlite /sqlite_install /
COPY --from=build /dist/bundle /app

ENV PORT=8080
EXPOSE $PORT

WORKDIR /tmp

ENTRYPOINT ["/app/bin/cloud_hub"]

# syntax=docker/dockerfile:1
ARG DEBIAN_VERSION=12

## Builds the custom Flutter engine
FROM ubuntu:focal AS build-engine

ARG TARGETPLATFORM

# Fix warnings related to: https://github.com/moby/moby/issues/27988
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install download dependencies
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get install -y curl git python3 python3-pip pkg-config ninja-build

# Install Chrome depot tools
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV DEPOT_TOOLS_HOME="${PWD}/depot_tools"
ENV PATH="${PATH}:${PWD}/depot_tools"

# Copy custom CIPD wrapper which prevents errors on arm64
COPY cipd /usr/local/bin/cipd

ARG FLUTTER_VERSION

# Download the custom Flutter engine
WORKDIR /flutter
COPY sync.sh .
RUN ./sync.sh

# Patch the Flutter engine
WORKDIR /flutter/engine/src/flutter
COPY flutter_runner.patch .
RUN git apply --check flutter_runner.patch
RUN git apply flutter_runner.patch
# There's no good way to patch this since it's changed a lot
RUN sed -i 's/libdart_jit/libdart_aotruntime_product/g' shell/testing/BUILD.gn

# Build a patched version of the Flutter engine
WORKDIR /flutter/engine/src
COPY build.sh .
RUN ./build.sh

FROM gcr.io/distroless/cc-debian${DEBIAN_VERSION} AS engine

COPY --from=build-engine /flutter/engine/src/out/host_release /engine
ENV DART_SDK="/engine/dart-sdk"

WORKDIR /engine
ENV LD_LIBRARY_PATH="/engine"

FROM gcr.io/distroless/cc-debian${DEBIAN_VERSION} AS builder

COPY --from=engine /engine/dart-sdk/bin/utils/gen_snapshot /usr/lib/dart/bin/utils/gen_snapshot

ENTRYPOINT [ "/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf" ]
CMD [ "--elf=/app/main.aot", "/app/main.aot.dill" ]

# Builds SQLite from Source
#
# The version shipped with apt is very outdated (3.40.1). This is the only way
# it seems to get anything newer.
FROM debian:${DEBIAN_VERSION}-slim AS sqlite

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
ARG SQLITE_VERSION=3490100
RUN wget https://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_VERSION}.tar.gz \
    && tar xzf sqlite-autoconf-${SQLITE_VERSION}.tar.gz \
    && cd sqlite-autoconf-${SQLITE_VERSION}

# Build SQLite with default options
WORKDIR /sqlite_build/sqlite-autoconf-${SQLITE_VERSION}
RUN CFLAGS='-DSQLITE_ENABLE_FTS5 -DSQLITE_ENABLE_JSON1' \
    ./configure --prefix=/usr \
    --enable-threadsafe \
    && make -j$(nproc) \
    && make install DESTDIR=/sqlite_install

FROM debian:${DEBIAN_VERSION}-slim AS runtime

# Set up fonts for the Flutter engine
RUN apt update && apt install -y \
    fontconfig \
    fonts-cantarell \
    fonts-liberation2
RUN fc-cache -f

# Add CA certificates
RUN apt install -y ca-certificates

WORKDIR /celest
ENV LD_LIBRARY_PATH="/app:/celest:${LD_LIBRARY_PATH}"

# Clean up
RUN apt-get clean

COPY --from=sqlite /sqlite_install /
COPY --from=engine /engine/icudtl.dat .
COPY --from=engine /engine/*.so ./
COPY --from=engine /engine/*.so* ./
COPY --from=engine /engine/flutter_tester flutter_runner

WORKDIR /app
COPY flutter_assets .

ENTRYPOINT [ "/celest/flutter_runner", "--non-interactive", "--run-forever", "--disable-vm-service", "--icu-data-file-path=/celest/icudtl.dat", "--enable-platform-isolates", "--force-multithreading", "--cache-dir-path=/tmp", "--flutter-assets-dir=/app/flutter_assets" ]
CMD [ "/app/main.aot" ]

# syntax=docker/dockerfile:1
ARG DEBIAN_VERSION=12

FROM debian:${DEBIAN_VERSION}-slim AS sdk

ARG DART_VERSION
ARG DART_CHANNEL

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dnsutils \
        git \
        openssh-client \
        unzip \
    ; \
    rm -rf /var/lib/apt/lists/*

# Create a minimal runtime environment for executing AOT-compiled Dart code
# with the smallest possible image size.
# usage: COPY --from=dart:xxx /runtime/ /
# uses hard links here to save space
RUN set -eux; \
    case "$(dpkg --print-architecture)" in \
        amd64) \
            TRIPLET="x86_64-linux-gnu" ; \
            FILES="/lib64/ld-linux-x86-64.so.2" ;; \
        armhf) \
            TRIPLET="arm-linux-gnueabihf" ; \
            FILES="/lib/ld-linux-armhf.so.3 \
                /lib/arm-linux-gnueabihf/ld-linux-armhf.so.3";; \
        arm64) \
            TRIPLET="aarch64-linux-gnu" ; \
            FILES="/lib/ld-linux-aarch64.so.1 \
                /lib/aarch64-linux-gnu/ld-linux-aarch64.so.1" ;; \
        *) \
            echo "Unsupported architecture" ; \
            exit 5;; \
    esac; \
    FILES="$FILES \
        /etc/nsswitch.conf \
        /etc/ssl/certs \
        /usr/share/ca-certificates \
        /lib/$TRIPLET/libc.so.6 \
        /lib/$TRIPLET/libdl.so.2 \
        /lib/$TRIPLET/libm.so.6 \
        /lib/$TRIPLET/libnss_dns.so.2 \
        /lib/$TRIPLET/libpthread.so.0 \
        /lib/$TRIPLET/libresolv.so.2 \
        /lib/$TRIPLET/librt.so.1"; \
    for f in $FILES; do \
        dir=$(dirname "$f"); \
        mkdir -p "/runtime$dir"; \
        cp --archive --link --dereference --no-target-directory "$f" "/runtime$f"; \
    done

ENV DART_SDK=/usr/lib/dart
ENV PATH=$DART_SDK/bin:/root/.pub-cache/bin:$PATH

WORKDIR /root
RUN set -eux; \
    case "$(dpkg --print-architecture)" in \
        amd64) \
            SDK_ARCH="x64" ;; \
        armhf) \
            SDK_ARCH="arm" ;; \
        arm64) \
            SDK_ARCH="arm64" ;; \
        *) \
            echo "Unsupported architecture" ; \
            exit 5;; \
    esac; \
    SDK="dartsdk-linux-${SDK_ARCH}-release.zip"; \
    BASEURL="https://storage.googleapis.com/dart-archive/channels"; \
    URL="$BASEURL/$DART_CHANNEL/release/$DART_VERSION/sdk/$SDK"; \
    echo "SDK: $URL" >> dart_setup.log ; \
    SHA_URL="$URL.sha256sum"; \
    echo "SHA: $SHA_URL" >> dart_setup.log ; \
    curl -fLO "$URL"; \
    curl -fLO "$SHA_URL"; \
    cat $SDK.sha256sum | sha256sum --check --status --strict; \
    unzip "$SDK" && mv dart-sdk "$DART_SDK" && rm "$SDK" \
        && chmod 755 "$DART_SDK" && chmod 755 "$DART_SDK/bin";

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

# Copy just the parts of the Dart SDK we need to build an AOT snapshot
FROM gcr.io/distroless/static-debian${DEBIAN_VERSION} AS builder

COPY --from=sdk /runtime/ /
COPY --from=sdk /usr/lib/dart/bin/utils/gen_snapshot /usr/lib/dart/bin/utils/gen_snapshot
COPY --from=sdk /usr/lib/dart/bin/utils/gen_snapshot.sym /usr/lib/dart/bin/utils/gen_snapshot.sym

ENTRYPOINT ["/usr/lib/dart/bin/utils/gen_snapshot", "--snapshot_kind=app-aot-elf"]
CMD ["--elf=/app/main.aot", "/app/main.aot.dill"]

# Copy the Dart runtime and AOT runtime into a minimal runtime image
FROM gcr.io/distroless/base-debian${DEBIAN_VERSION} AS runtime

COPY --from=dart /runtime/ /
COPY --from=dart /usr/lib/dart/bin/dartaotruntime /usr/lib/dart/bin/dartaotruntime
COPY --from=sqlite /sqlite_install /

ENTRYPOINT ["/usr/lib/dart/bin/dartaotruntime"]
CMD ["/app/main.aot"]

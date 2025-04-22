# syntax=docker/dockerfile:1
ARG DEBIAN_VERSION=12

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

# Copy SQLite into a minimal runtime image
FROM gcr.io/distroless/base-debian${DEBIAN_VERSION}
COPY --from=sqlite /sqlite_install /

WORKDIR /tmp
CMD ["/app/main.exe"]

#!/usr/bin/env bash

# This script builds the Celest Cloud Hub Docker image.
#
# Usage:
#   ./build.sh [tag=latest] [--push]

set -e

REPO_ROOT=$(git rev-parse --show-toplevel)
TAG=${1:-latest}

docker build \
  --platform linux/amd64,linux/arm64 \
  -t cloud-hub:$TAG \
  -t celestdev/cloud-hub:$TAG \
  -f "$REPO_ROOT/services/celest_cloud_hub/Dockerfile" \
  "$REPO_ROOT"

if [[ "$2" == "--push" ]]; then
    docker push celestdev/cloud-hub:$TAG
fi

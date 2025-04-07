#!/usr/bin/env bash

# This script builds the Celest Cloud Hub Docker image.
#
# Usage:
#   ./build.sh [--push]

REPO_ROOT=$(git rev-parse --show-toplevel)

docker build \
  --platform linux/amd64,linux/arm64 \
  -t cloud-hub:latest \
  -t celestdev/cloud-hub:latest \
  -f "$REPO_ROOT/services/celest_cloud_hub/Dockerfile" \
  "$REPO_ROOT"

if [[ "$1" == "--push" ]]; then
    docker push celestdev/cloud-hub:latest
fi

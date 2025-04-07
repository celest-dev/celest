#!/usr/bin/env bash

# This script deploys the Celest Cloud Hub to Fly.io
#
# Usage:
#   ./deploy.sh [--build]

if [[ "$1" == "--build" ]]; then
    ./build.sh --push
fi

fly deploy \
    --update-only \
    --config ./fly.yaml

#!/usr/bin/env bash

set -e

# This script deploys the Celest Cloud Hub to Fly.io
#
# Usage:
#   ./deploy.dev.sh [--build]

if [[ "$1" == "--build" ]]; then
    ./build.sh dev --push
fi

fly deploy --config ./fly.dev.yaml

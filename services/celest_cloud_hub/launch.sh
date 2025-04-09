#!/usr/bin/env bash

# This script launches the Celest Cloud Hub to Fly.io
#
# Usage:
#   ./deploy.sh

fly launch \
    --yaml \
    --name cloud-hub \
    --org celest-809 \
    --image celestdev/cloud-hub:latest \
    --env "CLOUD_HUB_DATABASE_HOST=file::memory:" \
    --region lax \
    --regions lax,ord \
    --vm-size performance-8x

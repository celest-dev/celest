#!/usr/bin/env bash

set -eu

ID=$(LC_ALL=C tr -dc a-z0-9 </dev/urandom | head -c 6)
echo "ID: $ID"

# dart pub global activate -s path .

export CELEST_API_URI=http://localhost:50051
dart pub global run celest_cli:celest \
    organizations create \
    org-$ID \
    --display-name=TEST \
    --primary-region=NORTH_AMERICA \
    --wait $@

dart pub global run celest_cli:celest \
    projects create \
    prj-$ID \
    --parent organizations/org-$ID \
    --display-name=TEST \
    --wait $@

dart pub global run celest_cli:celest \
    projects environments create \
    env-$ID \
    --parent organizations/org-$ID/projects/prj-$ID \
    --display-name=TEST \
    --wait $@

dart pub global run celest_cli:celest \
    projects environments deploy \
    projects/prj-$ID/environments/env-$ID \
    --wait $@

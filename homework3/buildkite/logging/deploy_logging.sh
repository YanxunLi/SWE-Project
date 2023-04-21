#!/usr/bin/env bash

set -euo pipefail

manifest="$(mktemp)"
DOCKER_LOGGING_REPO=$DOCKER_LOGGING_REPO

echo '--- :kubernetes: Shipping'

APP="./homework3/logging/deployment.yaml"
export IMAGE_ID="$DOCKER_LOGGING_REPO:latest"
envsubst < $APP | kubectl apply -f -
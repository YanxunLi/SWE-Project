#!/usr/bin/env bash

set -euo pipefail

manifest="$(mktemp)"
DOCKER_API_REPO=$DOCKER_API_REPO

echo '--- :kubernetes: Shipping'

APP="./homework2/kubernetes/api/deployment.yaml"
export IMAGE_ID="$DOCKER_API_REPO:latest"
envsubst < $APP | kubectl apply -f -
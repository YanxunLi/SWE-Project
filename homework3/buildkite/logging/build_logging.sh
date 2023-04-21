#!/bin/bash

# get the docker repository
$DOCKER_LOGGING_REPO=$DOCKER_LOGGING_REPO
$DOCKER_USERNAME=$DOCKER_USERNAME
$DOCKER_PASSWORD=$DOCKER_PASSWORD

# build image
docker build -f ./homework3/logging/Dockerfile -t logging:latest ./homework3/logging

# tag image
docker tag logging:latest $DOCKER_LOGGING_REPO:latest

# docker login
docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

# publish image
docker push $DOCKER_LOGGING_REPO:latest
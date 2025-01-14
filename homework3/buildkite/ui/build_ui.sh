#!/bin/bash

# get the docker repository
$DOCKER_UI_REPO=$DOCKER_UI_REPO
$DOCKER_USERNAME=$DOCKER_USERNAME
$DOCKER_PASSWORD=$DOCKER_PASSWORD

# build image
docker build -f ./homework2/docker/ui.Dockerfile -t ui:latest ./homework1/ui

# tag image
docker tag ui:latest $DOCKER_UI_REPO:latest

# docker login
docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

# publish image
docker push $DOCKER_UI_REPO:latest
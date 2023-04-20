#!/bin/bash

# get the docker repository
$DOCKER_API_REPO=$DOCKER_API_REPO
$DOCKER_USERNAME=$DOCKER_USERNAME
$DOCKER_PASSWORD=$DOCKER_PASSWORD

# build image
docker build -f ./homework2/docker/api.Dockerfile -t api:latest ./homework1/api

# tag image
docker tag api:latest $DOCKER_API_REPO:latest

# docker login
docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD

# publish image
docker push $DOCKER_API_REPO:latest
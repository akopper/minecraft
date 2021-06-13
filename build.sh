#!/bin/bash

MINECRAFT_VERSION=1.17
MINECRAFT_MAX_MEMORY=2G

docker build --no-cache --build-arg MINECRAFT_VERSION=${MINECRAFT_VERSION} -t akopper/minecraft_server:${MINECRAFT_VERSION} .
docker tag akopper/minecraft:${MINECRAFT_VERSION} akopper/minecraft_server:latest
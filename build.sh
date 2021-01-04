#!/bin/bash

MINECRAFT_VERSION=1.16.4
MINECRAFT_MAX_MEMORY=2G

docker build --no-cache --build-arg MINECRAFT_VERSION=${MINECRAFT_VERSION} --build-arg MINECRAFT_MAX_MEMORY=${MINECRAFT_MAX_MEMORY} -t akopper/minecraft:${MINECRAFT_VERSION} .
docker tag akopper/minecraft:${MINECRAFT_VERSION} akopper/minecraft:latest
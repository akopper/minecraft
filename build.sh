#!/bin/bash

source config.sh
docker build --no-cache --build-arg MINECRAFT_VERSION=${MINECRAFT_VERSION} -t akopper/minecraft:${MINECRAFT_VERSION} .



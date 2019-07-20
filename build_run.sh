#!/bin/bash

MC_VERSION=1.14.3


docker build --build-arg MINECRAFT_VERSION=${MC_VERSION} -t akopper/minecraft:${MC_VERSION} .
docker run -p 25565:25565 --name mc_server akopper/minecraft:${MC_VERSION}


#!/bin/bash

source config.sh
docker run -p 25565:25565 --name mc_server --volume $(pwd)/data:/data:rw  akopper/minecraft:${MINECRAFT_VERSION}

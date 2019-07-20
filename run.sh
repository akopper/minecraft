#!/bin/bash

source config.sh
docker run -p 25565:25565 --name mc_server --volume ./data:/data:rw  akopper/minecraft:${MINECRAFT_VERSION}

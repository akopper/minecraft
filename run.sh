#!/bin/bash

docker run -it -d -p 25565:25565 --name mc_server --volume $(pwd)/data:/data:rw  akopper/minecraft_server:latest
docker logs -f mc_server
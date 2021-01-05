# Minecraft server for Docker

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/akopper/minecraft_server)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/akopper/minecraft_server)
![Docker Pulls](https://img.shields.io/docker/pulls/akopper/minecraft_server)

## Features
* Simple setup
* Configurable max memory
* Image automatically build on Dockerhub

## Run with single command
`docker run -it -d -p 25565:25565 --name mc_server --volume $(pwd)/data:/data:rw  akopper/minecraft_server:latest`

This will 
* Start the latest version in a container named `mc_server`
* bind the server to the port 25565 on the host
* save the game data into the subfolder `data` in your current working directory

To view the logs execute `docker logs -f mc_server`

## Run via docker compose

* Copy the file `docker-compose.yml` to your target directory 
* Edit the file and adapt it to your requirements. It's recommended to specify a version of the server image instead of latest.
* Start the services with `docker-compose up -d` (-d will start the container detached)

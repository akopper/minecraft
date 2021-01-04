# Minecraft 1.11 Dockerfile - Example with notes

# Use the offical Debian Docker image with a specified version tag, Stretch, so not all
# versions of Debian images are downloaded.
FROM openjdk:8-jre

LABEL author="Alexander Kopper <github@knospi.com>"

# Simple utility for download a specific version of the minecraft server.jar
ENV MINECRAFT_UTILITY https://github.com/marblenix/minecraft_downloader/releases/download/20190517-d23712d/minecraft_downloader_linux
# Version of minecraft to download
ARG MINECRAFT_VERSION=1.16.4
ENV MINECRAFT_VERSION=${MINECRAFT_VERSION}
ENV MINECRAFT_MAX_MEMORY=2G

# Use APT (Advanced Packaging Tool) built in the Linux distro to download Java, a dependency
# to run Minecraft.
# First, we need to ensure the right repo is available for JRE 8
# Then we update apt
# Then we pull in all of our dependencies, 
# Finally, we download the correct .jar file using wget
# .jar file fetched from the official page https://minecraft.net/en-us/download/server/
RUN apt update; \
    apt install -y curl; \
    curl -sL "${MINECRAFT_UTILITY}" -o minecraft_downloader; \
    chmod +x ./minecraft_downloader; \
    ./minecraft_downloader -o minecraft_server_${MINECRAFT_VERSION}.jar;
# We do the above in a single line to reduce the number of layers in our container

# Sets working directory for the CMD instruction (also works for RUN, ENTRYPOINT commands)
# Create mount point, and mark it as holding externally mounted volume
WORKDIR /data
VOLUME /data

# Automatically accept Minecraft EULA
RUN echo eula=true > /data/eula.txt

# Expose the container's network port: 25565 during runtime.
EXPOSE 25565

# Start Minecraft server
CMD java -Xmx${MINECRAFT_MAX_MEMORY} -Xms1024M -jar /minecraft_server_${MINECRAFT_VERSION}.jar

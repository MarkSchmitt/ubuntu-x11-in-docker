#!/bin/bash

echo "FROM ubuntu" > Dockerfile
echo "RUN apt-get update && apt-get install -y sudo" >> Dockerfile
#echo "RUN echo \"`whoami`:x:`id -u`:0:root:/home/`whoami`:/bin/bash\" >> /etc/passwd" >> Dockerfile
echo "RUN useradd --no-log-init --uid `id -u` `whoami`" >> Dockerfile
echo "RUN usermod -aG sudo `whoami`" >> Dockerfile
echo "ENV DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/`id -u`/bus" >> Dockerfile
echo "ENV DEBIAN_FRONTEND=noninteractive" >> Dockerfile
echo "RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers" >> Dockerfile

docker build -t ubuntu-x11-in-docker .

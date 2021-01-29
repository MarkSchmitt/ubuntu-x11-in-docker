#!/bin/bash

echo "FROM ubuntu:focal" > Dockerfile
echo "RUN echo \"`whoami`:x:`id -u`:0:root:/home/`whoami`:/bin/bash\" > /etc/passwd" >> Dockerfile
echo "ENV DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/`id -u`/bus" >> Dockerfile

docker build -t ubuntu-with-docker .

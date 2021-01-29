#!/bin/bash
docker run --rm -it --user `id -u` -v /run/user/`id -u`:/run/user/`id -u` -e DISPLAY=$DISPLAY -h ubuntu-x11-in-docker -v /home/`whoami`:/home/`whoami` -v /tmp:/tmp --workdir `pwd` ubuntu-x11-in-docker /bin/bash

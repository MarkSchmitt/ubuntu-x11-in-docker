#!/bin/bash

# /run/user/ will pass through some socket files, especiall for dbus, and /tmp passes through access to x11. DISPLAY makes sure your clients knows where to connect to
docker run --rm -it --user `id -u` -v /run/user/`id -u`:/run/user/`id -u` -e DISPLAY=$DISPLAY -h ubuntu-x11-in-docker -v /home/`whoami`:/home/`whoami` -v /tmp:/tmp --workdir `pwd` ubuntu-x11-in-docker /bin/bash

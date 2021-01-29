# Run x11 apps in docker

With the `generateDockerUbuntu.sh` you can generate a docker image, that fulfills some conditions necessary to start x11 applications within a docker image.

_This only works natively_ - if your x11 server is separated from docker with a virtual machine, like it is on: _Windows_ or _MacOS_ this will not succeed as it relies on socket files getting passed into the docker image. You might be able to adapt this and make this work via TCP/IP - albeit with a great performance impact. In that case, I would probably rather start a sshd inside docker and connect to that with x11 tunneling (`ssh -Y user@host`).

# Usage

Use the `generateDockerUbuntu.sh` script to generate an image for your current user. This might break if you use sudo to access docker, so add your user to the docker group or adapt the script to get your name and ids. This is important, because we'll tailor the docker file to support your user specifically and let x11 applications pass through.

Start the container with `./run.sh`. If you have exotic settings or if you need access to files outside your home directory, you'll need to adapt it.

You can use sudo without a password!

You might also want to pass in /dev .. but I have not, because this is potentially very dangerous.

To re-user containers, you could write a script that simply execs into an existing docker container .. that really depends on your usage.

# Why do it at all?

Sometimes you need to populate the system root with stuff you don't want to or cannot put on your host machine. This is a convenient alternative to running a full blown virtual machine and still have your root filesystem secured from harm. _Note_: It's not helping with securite (a root user in a container should be able to break out, so do not run nasty stuff inside).

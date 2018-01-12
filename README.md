[bristleurl]: https://bristle.io
[githuburl]: https://github.com/bristleio/atomweb
[app]: atomweb
[hub]: https://hub.docker.com/r/bristleio/atomweb/

[bristle.io][bristleurl]
======

The [bristle.io][bristleurl] team has created a fork of [LinuxServer.io][lsiorepo]'s container release of [Plexpy][appurl] and updated it to atomweb

bristleio/atomweb
======
[![Version](https://img.shields.io/github/tag/bristleio/atomweb.svg)][githuburl][![Docker Pulls](https://img.shields.io/docker/pulls/bristleio/atomweb.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/bristleio/atomweb.svg)][hub][![Build Automated](https://img.shields.io/docker/automated/bristleio/atomweb.svg)][hub][![Build Status](https://img.shields.io/docker/build/bristleio/atomweb.svg)][hub]

[atomweb][appurl] Is a Python-based Plex Usage tracker, that is currently in active development.


Usage
------

```
docker create \
  --name=atomweb \
  -v <path to atom config>:/nobody/.atom \
  -v <path to saved folders>:/saved \
  -e WIDTH=1280 \
  -e HEIGHT=720 \
  -e GROUP_ID=<gid> \
  -e USER_ID=<uid>  \
  -e TZ=<timezone> \
  -p 8080:8080 \
  -p 3389:3389 \
  bristleio/atomweb
```

Parameters
------

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 8080` - Port for webui
* `-p 3389` - Port for rdp
* `-v /nobody/.atom` Contains atomweb configs and packages
* `-v /saved` This is mapped to the folder directory you want Atom to have access to edit files.
* `-e GROUP_ID` for GroupID - see below for explanation
* `-e USER_ID` for UserID - see below for explanation
* `-e TZ` for setting timezone information, eg Europe/London
* `-e WIDTH` Width of screen resolution
* `-e HEIGHT` Height of screen resolution

This image is based off a base Ubuntu 14.04 image from phusion/baseimage and ported through hurricane/dockergui:xvnc to build this atomweb image.  For shell access whilst the container is running use `docker exec -it atomweb /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `USER_ID=99` and `GROUP_ID=100` are it's default values. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

Setting up the application
------
`IMPORTANT... THIS IS THE ARMHF VERSION`

Access the webui at `<your-ip>:8080`, for more information check out [atomweb][appurl].

Info
------

* To monitor the logs of the container in realtime `docker logs -f atomweb`.

* container version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' atomweb`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' bristleio/atomweb`


Versions
------

Versions are tagged and released whenever there is an update of the [Application Branch][appurl] that we watch. Please reach out to us if you see issues.

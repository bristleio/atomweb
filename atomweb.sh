#!/bin/bash

# Build the docker image
docker build . -t raph/atom

# Run the docker container
docker run \
  -d \
  --name=atomweb \
  -e EDGE=0 \
  -e WIDTH=1280 \
  -e HEIGHT=720 \
  -e PUID=1000 \
  -e PGID=1000 \
  -v /path/to/directory/of/files:/saved \
  -e TZ="America\/Los_Angeles" \
  -p 8100:8080 \
  -p 8200:3389 \
  raph/atom

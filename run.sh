#!/bin/bash

docker rm -f subcvt
docker build . -t subcvt --build-arg "HTTP_PROXY=http://192.168.31.87:19999" --build-arg "HTTPS_PROXY=http://192.168.31.87:19999" -f Dockerfile
docker run --name subcvt --restart=always -p 25500:25500 subcvt

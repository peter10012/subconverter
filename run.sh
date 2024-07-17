#!/bin/bash

shopt -s expand_aliases
which docker 2>&1 1>/dev/null && (echo "") || alias docker=podman

docker rm -f subconv
docker rmi -f subconv
docker build --build-arg "http_proxy=$http_proxy" --build-arg "https_proxy=$https_proxy" . -t subconv -f Dockerfile
docker run --rm --name subconv -p 25500:25500 subconv

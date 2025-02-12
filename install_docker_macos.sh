#!/bin/bash

set -e

curl -L https://desktop.docker.com/mac/main/arm64/Docker.dmg -o Docker.dmg


hdiutil attach Docker.dmg
sudo cp -R "/Volumes/Docker/Docker.app" /Applications
hdiutil detach "/Volumes/Docker"


open /Applications/Docker.app


docker version

docker info

#!/bin/bash

sudo rm -rf /Applications/Docker.app
sudo rm -rf ~/Library/Containers/com.docker.docker
sudo rm -rf ~/Library/Group\ Containers/group.com.docker
sudo rm -rf ~/Library/Application\ Support/Docker\ Desktop
sudo rm -f ~/Library/Preferences/com.docker.docker.plist
sudo rm -f ~/Library/Preferences/com.electron.docker-frontend.plist
sudo rm -rf ~/Library/Saved\ Application\ State/com.electron.docker-frontend.savedState
sudo rm -rf ~/.docker
sudo rm -f /usr/local/bin/docker
sudo rm -f /usr/local/bin/docker-compose
sudo rm -f /usr/local/bin/docker-compose-v1
sudo rm -f /usr/local/bin/docker-machine
sudo rm -f /usr/local/bin/docker-credential-desktop
sudo rm -rf /usr/local/lib/docker
sudo rm -r /usr/local/bin/docker-machine-driver*
sudo rm -f /usr/local/bin/hub-tool
sudo rm -f /usr/local/bin/hyperkit
sudo rm -f /usr/local/bin/kubectl.docker
sudo rm -rf ~/Library/Caches/Docker\ Desktop
rm -rf /usr/local/share/boot2docker
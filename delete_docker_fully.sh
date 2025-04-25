#!/bin/bash

echo "Uninstalling Docker and all related components from macOS..."

# Quit Docker if running
echo "Closing Docker Desktop if it is running..."
osascript -e 'quit app "Docker"'

# Remove Docker application
echo "Removing Docker.app..."
sudo rm -rf /Applications/Docker.app

# Remove user-related data and config
echo "Removing user Docker data and configuration..."
sudo rm -rf ~/.docker
sudo rm -rf ~/Library/Containers/com.docker.docker
sudo rm -rf ~/Library/Group\ Containers/group.com.docker
sudo rm -rf ~/Library/Application\ Support/Docker\ Desktop
sudo rm -rf ~/Library/Caches/Docker\ Desktop
sudo rm -f ~/Library/Preferences/com.docker.docker.plist
sudo rm -f ~/Library/Preferences/com.electron.docker-frontend.plist
sudo rm -rf ~/Library/Saved\ Application\ State/com.electron.docker-frontend.savedState
sudo rm -rf ~/Library/Logs/Docker\ Desktop

# Remove Docker binaries and CLI tools
echo "Removing Docker binaries and CLI tools..."
sudo rm -f /usr/local/bin/docker
sudo rm -f /usr/local/bin/docker-compose
sudo rm -f /usr/local/bin/docker-compose-v1
sudo rm -f /usr/local/bin/docker-machine
sudo rm -f /usr/local/bin/docker-credential-desktop
sudo rm -f /usr/local/bin/docker-credential-ecr-login
sudo rm -f /usr/local/bin/docker-credential-osxkeychain
sudo rm -f /usr/local/bin/hub-tool
sudo rm -f /usr/local/bin/hyperkit
sudo rm -f /usr/local/bin/kubectl.docker
sudo rm -rf /usr/local/lib/docker
sudo rm -rf /usr/local/share/boot2docker
sudo rm -rf ~/.docker/machine

# Remove Docker Machine drivers (if any)
echo "Removing Docker Machine drivers..."
sudo rm -f /usr/local/bin/docker-machine-driver*

# Remove system-level Docker services
echo "Removing system Docker services..."
sudo rm -rf /Library/PrivilegedHelperTools/com.docker.vmnetd
sudo rm -rf /Library/LaunchDaemons/com.docker.vmnetd.plist
sudo rm -f /var/run/docker.sock

echo "Docker has been completely removed from your Mac."

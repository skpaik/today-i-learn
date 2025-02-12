#!/bin/bash

echo "WARNING: This script will remove junk files, caches, and uninstall libraries you installed!"
read -p "Do you want to continue? (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
    echo "Aborting cleanup."
    exit 1
fi

echo "Cleaning system junk and temp files..."
sudo rm -rf ~/Library/Caches/*
sudo rm -rf ~/Library/Logs/*
sudo rm -rf ~/Library/Developer/CoreSimulator/*
sudo rm -rf /Library/Caches/*
sudo rm -rf /var/folders/*
sudo rm -rf /System/Library/Caches/*
sudo rm -rf /private/var/log/*
sudo rm -rf /private/var/tmp/*
sudo rm -rf /private/tmp/*

echo "Removing Homebrew if installed..."
if command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi

echo "Removing MacPorts if installed..."
if [ -d "/opt/local" ]; then
    sudo port -fp uninstall installed
    sudo rm -rf /opt/local
    sudo rm -rf /Applications/MacPorts
    sudo rm -rf /Library/Tcl/macports*
fi

echo "Removing Python, Node.js, and Ruby packages..."
sudo rm -rf ~/.npm ~/.nvm ~/.node-gyp ~/.cargo ~/.rustup
sudo rm -rf ~/.rvm ~/.gem ~/.bundle
sudo rm -rf ~/.pyenv ~/.virtualenvs
pip3 freeze | xargs pip3 uninstall -y
npm list -g --depth=0 | awk '{print $2}' | xargs npm -g uninstall

echo "Clearing user-installed scripts in /usr/local/bin..."
sudo rm -rf /usr/local/bin/*

echo "Clearing application caches..."
sudo rm -rf ~/Library/Application\ Support/*
sudo rm -rf ~/Library/Saved\ Application\ State/*
sudo rm -rf ~/Library/Preferences/*

echo "Cleaning completed. A reboot is recommended."

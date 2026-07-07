#!/usr/bin/env bash
set -e

echo "Welcome to kicx! We are preparing to talk to a Tang Nano 9k ..."

echo "Installing required packages..."

sudo apt update
sudo apt install -y \
    git \
    curl \
    unzip \
    virtualbox \
    vagrant

INSTALL_DIR="$PWD/kicx"

if [ ! -d "$INSTALL_DIR" ]; then
    git clone https://github.com/mongoq/kicx.git "$INSTALL_DIR"
else
    echo "Repository already exists. Updating..."
    cd "$INSTALL_DIR"
    git pull
fi

cd "$INSTALL_DIR"

echo "Starting virtual machine..."
vagrant up

echo
echo "Done!"
echo
echo "To connect:"
echo "cd $INSTALL_DIR"
echo "vagrant ssh"

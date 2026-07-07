#!/usr/bin/env bash
set -e

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
    git clone https://github.com/mongoq/tangnano9k.git "$INSTALL_DIR"
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

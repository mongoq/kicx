#!/usr/bin/env bash
set -e

echo "Welcome to kicx!"
echo "Setting up your FPGA development environment..."

echo "Installing required packages..."

sudo apt-get update
sudo apt-get install -y \
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

echo
echo "Starting virtual machine..."
vagrant up

echo "To connect later:"
echo "cd $INSTALL_DIR"
echo "vagrant ssh"

echo
echo "Connecting to the virtual machine..."
exec vagrant ssh

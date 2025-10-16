#!/bin/bash

# Auto-install script for Vagrant, libvirt, and QEMU on Ubuntu/Debian-based systems
# Run with: ./install.sh

set -e

echo "Installing required packages for repositories..."
sudo apt install -y curl software-properties-common lsb-release

echo "Adding HashiCorp GPG key..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "Adding HashiCorp repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "Updating package list..."
sudo apt update

echo "Installing Vagrant..."
sudo apt install -y vagrant

echo "Installing build dependencies for vagrant plugins..."
sudo apt install -y ruby-dev build-essential

echo "Installing vagrant-libvirt plugin..."
vagrant plugin install vagrant-libvirt

echo "Installing libvirt and QEMU..."
sudo apt install -y libvirt-daemon-system libvirt-clients qemu-kvm

echo "Adding current user to libvirt group..."
sudo usermod -a -G libvirt $(whoami)

echo "Installation complete!"
echo "Note: You may need to restart your session or run 'newgrp libvirt' for group changes to take effect."
echo "After that, proceed with cloning the repo and running 'vagrant up'."
#!/bin/bash

# Auto-install script for Vagrant and VirtualBox on Ubuntu/Debian-based systems
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

echo "Installing VirtualBox..."
sudo apt install -y virtualbox

echo "Installation complete!"
echo "Proceed with cloning the repo and running 'vagrant up'."
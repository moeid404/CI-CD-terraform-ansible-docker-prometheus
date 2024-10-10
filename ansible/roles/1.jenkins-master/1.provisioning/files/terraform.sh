#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package index
echo "Updating package index..."
sudo apt-get update

# Install required packages
echo "Installing required packages..."
sudo apt-get install -y gnupg software-properties-common

# Download the HashiCorp GPG key
echo "Downloading HashiCorp GPG key..."
wget -O /tmp/hashicorp.gpg https://apt.releases.hashicorp.com/gpg

# Import the GPG key
echo "Importing HashiCorp GPG key..."
gpg --dearmor /tmp/hashicorp.gpg

# Move the GPG key to the keyring location
echo "Moving GPG key to keyring..."
sudo mv /tmp/hashicorp.gpg /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the HashiCorp APT repository
echo "Adding HashiCorp APT repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update the package index again
echo "Updating package index again..."
sudo apt-get update

# Install Terraform
echo "Installing Terraform..."
sudo apt-get install -y terraform

# Clean up
echo "Cleaning up..."
rm /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "Terraform installation completed."
